from flask import Flask, request, jsonify
from flask_cors import CORS
import random
import pymysql
import cloudinary
import cloudinary.uploader
import cloudinary.api
from datetime import datetime
import logging
import sys
import requests

app = Flask(__name__)
CORS(app)

# -------------------------
# Configure Logging
# -------------------------
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s %(levelname)s: %(message)s',
    handlers=[
        logging.StreamHandler(sys.stdout)
    ]
)
logger = logging.getLogger(__name__)

# -------------------------
# Configure Cloudinary
# -------------------------
cloudinary.config(
    cloud_name='dwdzo5ldo',
    api_key='212348743953486',
    api_secret='1CKXr3RtOdRqrO0VogK5aX4ROtM'
)

# -------------------------
# MySQL Connection
# -------------------------
def create_db_connection():
    try:
        conn = pymysql.connect(
            host='localhost',
            user='root',
            password='',
            database='musicteam',
            cursorclass=pymysql.cursors.DictCursor
        )
        logger.debug("Database connection established successfully")
        return conn
    except pymysql.err.OperationalError as e:
        logger.error(f"Failed to connect to database: {str(e)}")
        return None

# Initialize database connection
db = create_db_connection()
if not db:
    logger.error("Application startup failed: Unable to connect to database")
    sys.exit(1)

# -------------------------
# Current detected emotion
# -------------------------
current_emotion = "sad"

# -------------------------
# Helper: Validate database connection
# -------------------------
def check_db_connection():
    global db
    if not db or not db.open:
        logger.warning("Database connection lost, attempting to reconnect")
        db = create_db_connection()
    return db is not None and db.open

# -------------------------
# Helper: Validate table existence
# -------------------------
def check_tables_exist():
    try:
        with db.cursor() as cursor:
            cursor.execute("SHOW TABLES LIKE 'all_songs'")
            if not cursor.fetchone():
                logger.error("Table 'all_songs' does not exist")
                return False
            cursor.execute("SHOW TABLES LIKE 'recently_played'")
            if not cursor.fetchone():
                logger.error("Table 'recently_played' does not exist")
                return False
            return True
    except Exception as e:
        logger.error(f"Error checking table existence: {str(e)}")
        return False

# -------------------------
# Helper: Get songs by emotion
# -------------------------
def get_songs_by_emotion(emotion):
    if not check_db_connection():
        return []
    if not check_tables_exist():
        return []
    
    try:
        with db.cursor() as cursor:
            cursor.execute("SELECT * FROM all_songs WHERE emotion = %s", (emotion,))
            rows = cursor.fetchall()
            logger.debug(f"Fetched {len(rows)} songs for emotion '{emotion}'")
            return rows
    except Exception as e:
        logger.error(f"Database error in get_songs_by_emotion (emotion={emotion}): {str(e)}")
        return []

# -------------------------
# Helper: Add to recently played (prevents duplicates)
# -------------------------
def add_to_recently_played(song_id, emotion):
    if not check_db_connection():
        return False
    if not check_tables_exist():
        return False
    
    try:
        with db.cursor() as cursor:
            # Check if song exists in all_songs
            cursor.execute("SELECT id FROM all_songs WHERE id = %s", (song_id,))
            if not cursor.fetchone():
                logger.error(f"Song ID {song_id} not found in all_songs")
                return False
            
            # Check if this song is already in recently played
            cursor.execute(
                "SELECT id FROM recently_played WHERE song_id = %s",
                (song_id,)
            )
            existing = cursor.fetchone()
            
            if existing:
                # Update the timestamp
                cursor.execute(
                    "UPDATE recently_played SET played_at = %s WHERE song_id = %s",
                    (datetime.now(), song_id)
                )
                logger.debug(f"Updated timestamp for song ID {song_id} in recently_played")
            else:
                # Insert new record
                cursor.execute(
                    "INSERT INTO recently_played (song_id, played_at) VALUES (%s, %s)",
                    (song_id, datetime.now())
                )
                logger.debug(f"Added song ID {song_id} to recently_played")
            
            # Keep only the 10 most recent songs
            cursor.execute("""
                DELETE FROM recently_played 
                WHERE id NOT IN (
                    SELECT id FROM (
                        SELECT id FROM recently_played 
                        ORDER BY played_at DESC 
                        LIMIT 10
                    ) AS temp
                )
            """)
            db.commit()
            logger.debug("Cleaned up recently_played table to keep latest 10 entries")
            return True
    except Exception as e:
        logger.error(f"Database error in add_to_recently_played (song_id={song_id}, emotion={emotion}): {str(e)}")
        db.rollback()
        return False

# -------------------------
# Routes
# -------------------------
@app.route("/")
def home():
    return jsonify({"message": "Emotion-based MySQL Song API is running!"})

@app.route("/update-emotion", methods=["POST"])
def update_emotion():
    global current_emotion
    data = request.get_json()
    emotion = data.get("emotion")
    
    if not emotion:
        logger.warning("No emotion provided in update-emotion request")
        return jsonify({"error": "No emotion provided"}), 400
    
    valid_emotions = ['happy', 'sad', 'angry', 'calm', 'energetic']
    if emotion not in valid_emotions:
        logger.warning(f"Invalid emotion provided: {emotion}")
        return jsonify({"error": f"Invalid emotion. Must be one of {valid_emotions}"}), 400
    
    current_emotion = emotion
    logger.info(f"Emotion updated to: {current_emotion}")
    return jsonify({"success": True, "emotion": current_emotion}), 200

@app.route("/play-song", methods=["GET"])
def play_song():
    if not check_db_connection():
        logger.error("Cannot play song: No database connection")
        return jsonify({"error": "Database connection unavailable"}), 500
    
    songs = get_songs_by_emotion(current_emotion)
    if not songs:
        logger.warning(f"No songs found for emotion {current_emotion}")
        return jsonify({"error": f"No songs found for emotion {current_emotion}"}), 404

    song = random.choice(songs)
    if add_to_recently_played(song['id'], current_emotion):
        logger.info(f"Playing song: {song['title']} (ID: {song['id']})")
        return jsonify({
            "id": song['id'],
            "title": song['title'],
            "artist": song.get('artist', ''),
            "url": song['cloud_url'],
            "thumbnail": song.get('thumbnail', 'default_album.png'),
            "emotion": song['emotion']
        }), 200
    else:
        logger.error("Failed to add song to recently played")
        return jsonify({"error": "Failed to play song"}), 500

@app.route("/play-specific-song", methods=["POST"])
def play_specific_song():
    if not check_db_connection():
        logger.error("Cannot play specific song: No database connection")
        return jsonify({"error": "Database connection unavailable"}), 500
    
    data = request.get_json()
    song_url = data.get("url")
    title = data.get("title", "")
    artist = data.get("artist", "")
    emotion = data.get("emotion", "")
    thumbnail = data.get("thumbnail", "default_album.png")
    
    if not song_url:
        logger.warning("No song URL provided in play-specific-song request")
        return jsonify({"error": "No song URL provided"}), 400
    
    try:
        with db.cursor() as cursor:
            cursor.execute("SELECT * FROM all_songs WHERE cloud_url = %s", (song_url,))
            song = cursor.fetchone()
            
            if not song:
                logger.warning(f"Song not found for URL: {song_url}")
                return jsonify({"error": "Song not found in database"}), 404
            
            if add_to_recently_played(song['id'], emotion if emotion else song['emotion']):
                logger.info(f"Playing specific song: {song['title']} (ID: {song['id']})")
                return jsonify({
                    "id": song['id'],
                    "title": song['title'],
                    "artist": song.get('artist', ''),
                    "url": song_url,
                    "thumbnail": song.get('thumbnail', 'default_album.png'),
                    "emotion": emotion if emotion else song['emotion']
                }), 200
            else:
                logger.error("Failed to add specific song to recently played")
                return jsonify({"error": "Failed to play song"}), 500
    except Exception as e:
        logger.error(f"Database error in play_specific_song (url={song_url}): {str(e)}")
        return jsonify({"error": f"Failed to find song: {str(e)}"}), 500

@app.route("/current-emotion", methods=["GET"])
def get_emotion():
    logger.debug(f"Returning current emotion: {current_emotion}")
    return jsonify({"emotion": current_emotion}), 200

@app.route("/like-song", methods=["POST"])
def like_song():
    if not check_db_connection():
        logger.error("Cannot like song: No database connection")
        return jsonify({"error": "Database connection unavailable"}), 500
    
    data = request.get_json()
    song_url = data.get("url")
    title = data.get("title")
    artist = data.get("artist", "")
    emotion = data.get("emotion", "")
    thumbnail = data.get("thumbnail", "default_album.png")

    if not song_url:
        logger.warning("No song URL provided in like-song request")
        return jsonify({"error": "No song URL provided"}), 400

    try:
        with db.cursor() as cursor:
            cursor.execute("SELECT id FROM all_songs WHERE cloud_url = %s", (song_url,))
            song = cursor.fetchone()
            
            if not song:
                logger.warning(f"Song not found for URL: {song_url}")
                return jsonify({"error": "Song not found in database"}), 404
            
            song_id = song['id']
            
            cursor.execute(
                "SELECT id FROM liked_songs WHERE song_id = %s",
                (song_id,)
            )
            existing = cursor.fetchone()
            
            if existing:
                cursor.execute(
                    "DELETE FROM liked_songs WHERE song_id = %s",
                    (song_id,)
                )
                db.commit()
                logger.info(f"Unliked song ID: {song_id}")
                return jsonify({"success": True, "action": "unliked"}), 200
            else:
                cursor.execute(
                    "INSERT INTO liked_songs (song_id, liked_at) VALUES (%s, %s)",
                    (song_id, datetime.now())
                )
                db.commit()
                logger.info(f"Liked song ID: {song_id}")
                return jsonify({"success": True, "action": "liked"}), 200
    except Exception as e:
        logger.error(f"Database error in like_song (song_url={song_url}): {str(e)}")
        db.rollback()
        return jsonify({"error": f"Failed to like/unlike song: {str(e)}"}), 500

@app.route("/liked-songs", methods=["GET"])
def liked_songs():
    if not check_db_connection():
        logger.error("Cannot fetch liked songs: No database connection")
        return jsonify({"error": "Database connection unavailable"}), 500
    
    try:
        with db.cursor() as cursor:
            cursor.execute("""
                SELECT s.*, ls.liked_at 
                FROM liked_songs ls 
                JOIN all_songs s ON ls.song_id = s.id 
                ORDER BY ls.liked_at DESC
            """)
            rows = cursor.fetchall()
            logger.debug(f"Fetched {len(rows)} liked songs")
            return jsonify(rows), 200
    except Exception as e:
        logger.error(f"Database error in liked_songs: {str(e)}")
        return jsonify({"error": f"Cannot fetch liked songs: {str(e)}"}), 500

@app.route("/current-playlist", methods=["GET"])
def current_playlist():
    if not check_db_connection():
        logger.error("Cannot fetch current playlist: No database connection")
        return jsonify({"error": "Database connection unavailable"}), 500
    
    try:
        songs = get_songs_by_emotion(current_emotion)
        logger.debug(f"Fetched {len(songs)} songs for current playlist (emotion={current_emotion})")
        return jsonify(songs), 200
    except Exception as e:
        logger.error(f"Database error in current_playlist: {str(e)}")
        return jsonify({"error": f"Cannot fetch current playlist: {str(e)}"}), 500

@app.route("/recently-played", methods=["GET"])
def recently_played():
    if not check_db_connection():
        logger.error("Cannot fetch recently played songs: No database connection")
        return jsonify({"error": "Database connection unavailable"}), 500
    
    if not check_tables_exist():
        logger.error("Required tables missing for recently-played endpoint")
        return jsonify({"error": "Required database tables are missing"}), 500
    
    emotion = request.args.get("emotion", current_emotion)
    valid_emotions = ['happy', 'sad', 'angry', 'calm', 'energetic']
    if emotion not in valid_emotions:
        logger.warning(f"Invalid emotion provided in recently-played: {emotion}")
        return jsonify({"error": f"Invalid emotion. Must be one of {valid_emotions}"}), 400
    
    try:
        with db.cursor() as cursor:
            cursor.execute("""
                SELECT s.*, rp.played_at 
                FROM recently_played rp 
                JOIN all_songs s ON rp.song_id = s.id 
                WHERE s.emotion = %s 
                ORDER BY rp.played_at DESC 
                LIMIT 10
            """, (emotion,))
            rows = cursor.fetchall()
            logger.debug(f"Fetched {len(rows)} recently played songs for emotion '{emotion}'")
            return jsonify(rows), 200
    except Exception as e:
        logger.error(f"Database error in recently_played (emotion={emotion}): {str(e)}")
        return jsonify({"error": f"Cannot fetch recently played songs: {str(e)}"}), 500

@app.route("/lyrics", methods=["POST"])
def get_lyrics():
    data = request.get_json()
    title = data.get("title")
    artist = data.get("artist", "")

    if not title:
        logger.warning("No song title provided in lyrics request")
        return jsonify({"error": "No song title provided"}), 400

    try:
        # Use lyrics.ovh API
        api_url = f"https://api.lyrics.ovh/v1/{artist}/{title}" if artist else f"https://api.lyrics.ovh/v1/{title}"
        response = requests.get(api_url, timeout=10)
        
        if response.status_code == 200:
            lyrics_data = response.json()
            if lyrics_data.get('lyrics'):
                logger.debug(f"Fetched lyrics for song: {title} by {artist or 'Unknown'}")
                return jsonify({"lyrics": lyrics_data['lyrics']}), 200
            else:
                logger.warning(f"No lyrics found for song: {title} by {artist or 'Unknown'}")
                return jsonify({"error": f"Lyrics not found for {title} by {artist or 'Unknown'}"}), 404
        else:
            logger.warning(f"API error for song: {title} by {artist or 'Unknown'}: {response.status_code}")
            return jsonify({"error": f"Lyrics not found for {title} by {artist or 'Unknown'}"}), 404
    except requests.exceptions.RequestException as e:
        logger.error(f"API request error in get_lyrics (title={title}, artist={artist}): {str(e)}")
        return jsonify({"error": f"Failed to fetch lyrics for {title} by {artist or 'Unknown'}: {str(e)}"}), 500

@app.route("/clear-recently-played", methods=["POST"])
def clear_recently_played():
    if not check_db_connection():
        logger.error("Cannot clear recently played: No database connection")
        return jsonify({"error": "Database connection unavailable"}), 500
    
    emotion = request.args.get("emotion")
    if not emotion:
        logger.warning("No emotion provided in clear-recently-played request")
        return jsonify({"error": "No emotion provided"}), 400
    
    valid_emotions = ['happy', 'sad', 'angry', 'calm', 'energetic']
    if emotion not in valid_emotions:
        logger.warning(f"Invalid emotion provided in clear-recently-played: {emotion}")
        return jsonify({"error": f"Invalid emotion. Must be one of {valid_emotions}"}), 400
    
    try:
        with db.cursor() as cursor:
            cursor.execute("""
                DELETE rp FROM recently_played rp
                JOIN all_songs s ON rp.song_id = s.id
                WHERE s.emotion = %s
            """, (emotion,))
            db.commit()
            logger.info(f"Cleared recently played songs for emotion: {emotion}")
            return jsonify({"success": True}), 200
    except Exception as e:
        logger.error(f"Database error in clear_recently_played (emotion={emotion}): {str(e)}")
        db.rollback()
        return jsonify({"error": f"Failed to clear recently played: {str(e)}"}), 500

# -------------------------
# Cleanup on shutdown
# -------------------------
@app.teardown_appcontext
def close_db_connection(exception):
    if db and db.open:
        db.close()
        logger.debug("Database connection closed")

if __name__ == "__main__":
    try:
        app.run(host="0.0.0.0", port=5001, debug=True)
    finally:
        if db and db.open:
            db.close()
            logger.debug("Application shutdown: Database connection closed")
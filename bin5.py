from flask import Flask, request, jsonify, g
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
from PIL import Image
from io import BytesIO
from collections import Counter
import math
import subprocess

app = Flask(__name__)
CORS(app)

# -------------------------
# 1. Configure Logging
# -------------------------
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s %(levelname)s: %(message)s',
    handlers=[logging.StreamHandler(sys.stdout)]
)
logger = logging.getLogger(__name__)

# -------------------------
# 2. Configure Cloudinary
# -------------------------
cloudinary.config(
    cloud_name='dwdzo5ldo',
    api_key='212348743953486',
    api_secret='1CKXr3RtOdRqrO0VogK5aX4ROtM'
)

# -------------------------
# 3. Database Setup
# -------------------------
def create_tables(db):
    try:
        with db.cursor() as cursor:
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS all_songs (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    title VARCHAR(255) NOT NULL,
                    artist VARCHAR(255),
                    cloud_url VARCHAR(512) NOT NULL,
                    thumbnail VARCHAR(512),
                    emotion ENUM('happy', 'sad', 'angry', 'calm', 'energetic') NOT NULL,
                    lyrics TEXT
                )
            """)
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS recently_played (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    song_id INT NOT NULL,
                    played_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    FOREIGN KEY (song_id) REFERENCES all_songs(id) ON DELETE CASCADE
                )
            """)
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS liked_songs (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    song_id INT NOT NULL,
                    liked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    FOREIGN KEY (song_id) REFERENCES all_songs(id) ON DELETE CASCADE
                )
            """)
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS liked_themes (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    user_id INT NOT NULL,
                    color VARCHAR(255) NOT NULL
                )
            """)
            db.commit()
    except Exception as e:
        logger.error(f"Failed to create tables: {str(e)}")
        db.rollback()

def get_db_connection():
    if 'db' not in g:
        try:
            g.db = pymysql.connect(
                host='localhost',
                user='root',
                password='',
                database='testing',
                cursorclass=pymysql.cursors.DictCursor,
                autocommit=False
            )
            create_tables(g.db)
        except pymysql.err.OperationalError as e:
            logger.error(f"Failed to connect to database: {e}")
            g.db = None
    return g.db

@app.teardown_appcontext
def close_db_connection(exception):
    db = g.pop('db', None)
    if db:
        try:
            db.close()
        except:
            pass

# -------------------------
# 4. Global State
# -------------------------
# Default emotion is 'calm' (neutral)
current_emotion = "calm"

# Camera process handle
camera_process = None

# -------------------------
# 5. API Routes
# -------------------------

@app.route("/")
def home():
    return jsonify({"message": "Emotion-based MySQL Song API is running on Port 5001!"})

# --- CRITICAL: Emotion Update & Mapping ---
@app.route("/update-emotion", methods=["POST"])
def update_emotion():
    global current_emotion
    data = request.get_json()
    incoming_emotion = data.get("emotion") # Expects: happy, sad, angry, neutral

    if not incoming_emotion:
        return jsonify({"error": "Invalid or missing emotion"}), 400

    # MAPPING LOGIC: Camera (Neutral) -> Database (Calm)
    emotion_map = {
        "happy": "happy",
        "sad": "sad",
        "angry": "angry",
        "neutral": "calm",     # Map Neutral -> Calm
        "surprise": "happy",   # Map Surprise -> Happy (fallback)
        "fear": "sad"          # Map Fear -> Sad (fallback)
    }

    # Get mapped emotion, default to 'calm'
    final_emotion = emotion_map.get(incoming_emotion, "calm")
    
    current_emotion = final_emotion
    logger.info(f"Camera sent: {incoming_emotion} -> System set to: {current_emotion}")
    
    return jsonify({"success": True, "emotion": current_emotion}), 200

@app.route("/current-emotion", methods=["GET"])
def get_emotion():
    return jsonify({"emotion": current_emotion}), 200

# --- Music Player Logic ---
@app.route("/play-song", methods=["GET"])
def play_song():
    db = get_db_connection()
    if not db: return jsonify({"error": "Database unavailable"}), 500
    
    try:
        with db.cursor() as cursor:
            # Fetch songs matching current emotion
            cursor.execute("SELECT * FROM all_songs WHERE emotion = %s", (current_emotion,))
            songs = cursor.fetchall()
            
            if not songs:
                return jsonify({"error": f"No songs found for emotion {current_emotion}"}), 404
            
            # Pick random song
            song = random.choice(songs)
            
            # Update History
            cursor.execute("INSERT INTO recently_played (song_id, played_at) VALUES (%s, %s)", (song['id'], datetime.now()))
            
            # Keep history limited to 10 items
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

            return jsonify({
                "id": song['id'],
                "title": song['title'],
                "artist": song.get('artist', ''),
                "url": song['cloud_url'],
                "thumbnail": song.get('thumbnail', 'default_album.png'),
                "emotion": song['emotion']
            }), 200
    except Exception as e:
        logger.error(f"Error playing song: {str(e)}")
        db.rollback()
        return jsonify({"error": "Failed to play song"}), 500

@app.route("/play-specific-song", methods=["POST"])
def play_specific_song():
    db = get_db_connection()
    if not db: return jsonify({"error": "Database unavailable"}), 500
    
    data = request.get_json()
    song_url = data.get("url")
    
    if not song_url: return jsonify({"error": "No URL provided"}), 400

    try:
        with db.cursor() as cursor:
            cursor.execute("SELECT * FROM all_songs WHERE cloud_url = %s", (song_url,))
            song = cursor.fetchone()
            
            if song:
                # Log to history
                cursor.execute("INSERT INTO recently_played (song_id, played_at) VALUES (%s, %s)", (song['id'], datetime.now()))
                db.commit()
                
                return jsonify({
                    "id": song['id'],
                    "title": song['title'],
                    "artist": song.get('artist', ''),
                    "url": song['cloud_url'],
                    "thumbnail": song.get('thumbnail', 'default_album.png'),
                    "emotion": song['emotion']
                }), 200
            else:
                return jsonify({"error": "Song not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# --- User Interactions (Likes, History) ---
@app.route("/like-song", methods=["POST"])
def like_song():
    db = get_db_connection()
    if not db: return jsonify({"error": "Database unavailable"}), 500
    
    data = request.get_json()
    song_url = data.get("url")
    
    try:
        with db.cursor() as cursor:
            cursor.execute("SELECT id FROM all_songs WHERE cloud_url = %s", (song_url,))
            song = cursor.fetchone()
            if not song: return jsonify({"error": "Song not found"}), 404
            
            song_id = song['id']
            cursor.execute("SELECT id FROM liked_songs WHERE song_id = %s", (song_id,))
            
            if cursor.fetchone():
                cursor.execute("DELETE FROM liked_songs WHERE song_id = %s", (song_id,))
                action = "unliked"
            else:
                cursor.execute("INSERT INTO liked_songs (song_id) VALUES (%s)", (song_id,))
                action = "liked"
            db.commit()
            return jsonify({"success": True, "action": action}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/liked-songs", methods=["GET"])
def liked_songs():
    db = get_db_connection()
    if not db: return jsonify({"error": "Database unavailable"}), 500
    try:
        with db.cursor() as cursor:
            cursor.execute("""
                SELECT s.*, ls.liked_at 
                FROM liked_songs ls 
                JOIN all_songs s ON ls.song_id = s.id 
                ORDER BY ls.liked_at DESC
            """)
            return jsonify(cursor.fetchall()), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/recently-played", methods=["GET"])
def recently_played():
    db = get_db_connection()
    if not db: return jsonify({"error": "Database unavailable"}), 500
    # Optional filter by emotion
    emotion = request.args.get("emotion") 
    
    try:
        with db.cursor() as cursor:
            if emotion:
                cursor.execute("""
                    SELECT s.*, rp.played_at FROM recently_played rp 
                    JOIN all_songs s ON rp.song_id = s.id 
                    WHERE s.emotion = %s
                    ORDER BY rp.played_at DESC LIMIT 10
                """, (emotion,))
            else:
                cursor.execute("""
                    SELECT s.*, rp.played_at FROM recently_played rp 
                    JOIN all_songs s ON rp.song_id = s.id 
                    ORDER BY rp.played_at DESC LIMIT 10
                """)
            return jsonify(cursor.fetchall()), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/clear-recently-played", methods=["POST"])
def clear_recently_played():
    db = get_db_connection()
    if not db: return jsonify({"error": "Database unavailable"}), 500
    try:
        with db.cursor() as cursor:
            cursor.execute("DELETE FROM recently_played")
            db.commit()
        return jsonify({"success": True}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/lyrics", methods=["POST"])
def get_lyrics():
    db = get_db_connection()
    if not db: return jsonify({"error": "Database unavailable"}), 500
    data = request.get_json()
    title = data.get("title")
    
    try:
        with db.cursor() as cursor:
            cursor.execute("SELECT lyrics FROM all_songs WHERE title = %s", (title,))
            res = cursor.fetchone()
            if res and res['lyrics']:
                return jsonify({"lyrics": res['lyrics']}), 200
            return jsonify({"error": "Lyrics not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# --- Visuals & Themes ---
@app.route("/thumbnail-color", methods=["POST"])
def thumbnail_color():
    data = request.get_json()
    img_url = data.get("img_url")
    if not img_url: return jsonify({"error": "No URL"}), 400
    
    def color_distance(c1, c2):
        return math.sqrt(sum((a - b) ** 2 for a, b in zip(c1, c2)))

    try:
        response = requests.get(img_url)
        img = Image.open(BytesIO(response.content)).convert('RGB').resize((150, 150))
        colors = Counter(img.getpixel((x, y)) for x in range(img.width) for y in range(img.height))
        most_common = colors.most_common()
        
        if not most_common: return jsonify({"error": "No colors"}), 500
        
        c1 = most_common[0][0]
        c2 = c1
        for col, _ in most_common[1:]:
            if color_distance(c1, col) > 50: # Ensure contrast
                c2 = col
                break
                
        hex1 = '#%02x%02x%02x' % c1
        hex2 = '#%02x%02x%02x' % c2
        return jsonify({"color1": hex1, "color2": hex2}), 200
    except Exception as e:
        logger.error(f"Color extraction error: {e}")
        return jsonify({"color1": "#000000", "color2": "#ffffff"}), 200

@app.route("/save-theme", methods=["POST"])
def save_theme():
    db = get_db_connection()
    if not db: return jsonify({"error": "Database unavailable"}), 500
    data = request.get_json()
    color = data.get("color")
    user_id = data.get("user_id", 1)
    
    try:
        with db.cursor() as cursor:
            cursor.execute("SELECT id FROM liked_themes WHERE user_id=%s AND color=%s", (user_id, color))
            if not cursor.fetchone():
                cursor.execute("INSERT INTO liked_themes (user_id, color) VALUES (%s, %s)", (user_id, color))
                db.commit()
        return jsonify({"success": True}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/get-themes", methods=["GET"])
def get_themes():
    db = get_db_connection()
    if not db: return jsonify({"error": "Database unavailable"}), 500
    try:
        with db.cursor() as cursor:
            cursor.execute("SELECT * FROM liked_themes ORDER BY id DESC")
            return jsonify(cursor.fetchall()), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/delete-theme/<int:theme_id>", methods=["DELETE"])
def delete_theme(theme_id):
    db = get_db_connection()
    if not db: return jsonify({"error": "Database unavailable"}), 500
    try:
        with db.cursor() as cursor:
            cursor.execute("DELETE FROM liked_themes WHERE id = %s", (theme_id,))
            db.commit()
        return jsonify({"success": True}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# --- Camera Process Control ---
@app.route("/start-camera", methods=["POST"])
def start_camera():
    global camera_process
    try:
        if camera_process is None or camera_process.poll() is not None:
            # IMPORTANT: Ensure emotion.py is in the same folder
            camera_process = subprocess.Popen(["python", "emotion.py"])
            logger.info("Started emotion.py subprocess")
            return jsonify({"success": True, "message": "Camera started"}), 200
        else:
            return jsonify({"success": True, "message": "Camera already running"}), 200
    except Exception as e:
        logger.error(f"Failed to start camera: {e}")
        return jsonify({"error": str(e)}), 500

@app.route("/stop-camera", methods=["POST"])
def stop_camera():
    global camera_process
    try:
        if camera_process and camera_process.poll() is None:
            camera_process.terminate()
            camera_process.wait()
            camera_process = None
            logger.info("Stopped emotion.py subprocess")
            return jsonify({"success": True, "message": "Camera stopped"}), 200
        else:
            return jsonify({"message": "Camera not running"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# -------------------------
# 6. Start Server
# -------------------------
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001, debug=True)
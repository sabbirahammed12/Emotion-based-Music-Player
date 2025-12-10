from flask import Flask, request, jsonify, redirect
from flask_cors import CORS
import pymysql
import hashlib
from flask_dance.contrib.google import make_google_blueprint, google
import os

app = Flask(__name__)
CORS(app)

# ----------------- GOOGLE LOGIN CONFIG -----------------
app.secret_key = "supersecretkey"
os.environ['OAUTHLIB_INSECURE_TRANSPORT'] = '1'  # Allow HTTP for testing

# Replace these with your actual Google API keys
google_bp = make_google_blueprint(
    client_id="PASTE_YOUR_CLIENT_ID_HERE",
    client_secret="PASTE_YOUR_CLIENT_SECRET_HERE",
    redirect_to="google_login"
)
app.register_blueprint(google_bp, url_prefix="/login")

# ----------------- MySQL CONFIG -----------------
db = pymysql.connect(
    host="localhost",
    user="root",
    password="",
    database="auth_system"  # Ensure this database exists
)

# ----------------- HELPER FUNCTIONS -----------------
def hash_password(password):
    """Return SHA256 hashed password."""
    return hashlib.sha256(password.encode()).hexdigest()

def get_user_by_email(email):
    cursor = db.cursor()
    cursor.execute("SELECT id, password, name FROM users WHERE email=%s", (email,))
    return cursor.fetchone()

def create_user(email, name=None, password=None):
    cursor = db.cursor()
    cursor.execute(
        "INSERT INTO users (email, name, password, created_at) VALUES (%s, %s, %s, NOW())",
        (email, name, password)
    )
    db.commit()

# ----------------- REGISTRATION (optional manual) -----------------
@app.route("/register", methods=["POST"])
def register():
    data = request.json
    email = data.get("email")
    password = data.get("password")
    re_password = data.get("re_password")

    if not email or not password or not re_password:
        return jsonify({"error": "Email and password required"}), 400

    if password != re_password:
        return jsonify({"error": "Passwords do not match"}), 400

    if get_user_by_email(email):
        return jsonify({"error": "Email already registered"}), 400

    hashed_password = hash_password(password)
    create_user(email, password=hashed_password)

    return jsonify({"success": True, "message": "Registration successful!"}), 201

# ----------------- LOGIN (manual) -----------------
@app.route("/login", methods=["POST"])
def login():
    data = request.json
    email = data.get("email")
    password = data.get("password")

    if not email or not password:
        return jsonify({"error": "Email and password required"}), 400

    user = get_user_by_email(email)
    if not user:
        return jsonify({"error": "Email not registered"}), 400

    user_id, stored_hash, name = user
    if hash_password(password) != stored_hash:
        return jsonify({"error": "Incorrect password"}), 400

    return jsonify({"success": True, "message": "Login successful!", "email": email, "name": name}), 200

# ----------------- GOOGLE LOGIN ROUTE -----------------
@app.route("/google_login")
def google_login():
    if not google.authorized:
        return redirect("/login/google")

    resp = google.get("/oauth2/v2/userinfo")
    info = resp.json()
    email = info["email"]
    name = info.get("name", "")

    # Check if user exists in DB
    user = get_user_by_email(email)
    if not user:
        create_user(email, name=name)

    return jsonify({
        "success": True,
        "email": email,
        "name": name,
        "message": "Google authentication successful!"
    })

# ----------------- RUN FLASK APP -----------------
if __name__ == "__main__":
    app.run(debug=True, port=5000)

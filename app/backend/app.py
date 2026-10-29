
from flask import Flask, jsonify, render_template
import os
import socket
import datetime
import psycopg

app = Flask(__name__)


###----HOME PAGE

@app.route("/")
def home():
    return render_template(
        "index.html",
        hostname=socket.gethostname(),
        timestamp=datetime.datetime.now(
            datetime.timezone.utc
        ).strftime("%Y-%m-%d %H:%M:%S UTC")
    )


###----APPLICATION HEALTH CHECK

@app.route("/health")
def health():
    return jsonify({
        "status": "healthy",
        "service": "cloudops-api"
    })


###----APPLICATION STATUS

@app.route("/api/status")
def status():
    return jsonify({
        "application": "CloudOps Platform",
        "status": "operational",
        "hostname": socket.gethostname(),
        "timestamp": datetime.datetime.now(
            datetime.timezone.utc
        ).isoformat()
    })


###----POSTGRESQL CONNECTION CHECK

@app.route("/api/db-check")
def db_check():
    try:
        with psycopg.connect(
            host=os.environ["DB_HOST"],
            port=int(os.getenv("DB_PORT", "5432")),
            dbname=os.environ["DB_NAME"],
            user=os.environ["DB_USERNAME"],
            password=os.environ["DB_PASSWORD"],
            connect_timeout=5,
            sslmode="require"
        ) as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT current_database()")
                database_name = cur.fetchone()[0]

        return jsonify({
            "status": "connected",
            "database": database_name
        }), 200

    except Exception:
        app.logger.exception("PostgreSQL connection failed")
        return jsonify({
            "status": "unavailable",
            "message": "Database connection failed"
        }), 503


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

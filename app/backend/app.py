from flask import Flask, jsonify, render_template
import socket
import datetime

app = Flask(__name__)


@app.route("/")
def home():
    return render_template(
        "index.html",
        hostname=socket.gethostname(),
        timestamp=datetime.datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S UTC")
    )


@app.route("/health")
def health():
    return jsonify({
        "status": "healthy",
        "service": "cloudops-api"
    })


@app.route("/api/status")
def status():
    return jsonify({
        "application": "CloudOps Platform",
        "status": "operational",
        "hostname": socket.gethostname(),
        "timestamp": datetime.datetime.utcnow().isoformat()
    })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
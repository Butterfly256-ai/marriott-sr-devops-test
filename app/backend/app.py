from flask import Flask, jsonify
import redis
import os
from datetime import datetime

app = Flask(__name__)

REDIS_HOST = os.getenv("REDIS_HOST", "redis")
REDIS_PORT = int(os.getenv("REDIS_PORT", 6379))

# 连接 Redis
redis_client = redis.Redis(
    host=REDIS_HOST,
    port=REDIS_PORT,
    db=0,
    decode_responses=True
)

@app.route("/api/health")
def health():
    """健康检查"""
    return jsonify({
        "status": "UP",
        "service": "backend-flask",
        "time": datetime.utcnow().isoformat()
    })

@app.route("/api/visit")
def visit():
    """访问计数 API"""
    count = redis_client.incr("visit_count")
    return jsonify({
        "message": "Hello from Flask API",
        "visit_count": count,
        "redis_host": REDIS_HOST
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)

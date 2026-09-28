from flask import Flask, jsonify
import psycopg2

app = Flask(__name__)

def get_db_connection():
    conn = psycopg2.connect(
        host="db",
        database="appdb",
        user="postgres",
        password="postgres"
    )
    return conn

@app.route("/api/users")
def users():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT 'Hello from Postgres!'")
    result = cur.fetchone()
    cur.close()
    conn.close()
    return jsonify(message=result[0])

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)


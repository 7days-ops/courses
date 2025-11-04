from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/api")
def api():
    return jsonify({"msg": "Hello"})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=7777)

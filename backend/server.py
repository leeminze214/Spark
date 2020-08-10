from flask import Flask, request
app = Flask(__name__)

@app.route("/upload-text", methods=["POST"])
def upload():
    if request.method == "POST":
        print(request.data)
        return request.data

@app.route("/test", methods=["GET", "POST"])
def test():
    if request.method == "GET":
        return "success"
    elif request.method == "POST":
        return request.data

if __name__ == "__main__":
    app.run(debug=True)
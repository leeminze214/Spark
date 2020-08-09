from flask import Flask, request
from flask_restful import reqparse, Api, Resource

app = Flask(__name__)
api = Api(app)

class upload(Resource):
    def post():
        print(request)

class test(Resource):
    def get():
        return "success"

    def post():
        return request.data
        
api.add_resource(upload,"/upload")
api.add_resource(test,"/test")

if __name__ == "__main__":
    app.run(debug=True)

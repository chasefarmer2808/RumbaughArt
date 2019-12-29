from flask import Flask
from flask_restful import Resource, Api
from config import app_config
from resources.photo import Photo, Photos
from models import db


def create_app(env_name):
    app = Flask(__name__)
    app.config.from_object(app_config[env_name])
    db.init_app(app)
    api = Api(app)
    api.add_resource(Photo, '/api/v1/photo/<string:id>')
    api.add_resource(Photos, '/api/v1/photo/')

    return app
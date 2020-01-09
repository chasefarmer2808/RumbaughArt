from flask import Flask
from flask_restful import Api
from flask_cors import CORS
from config import app_config
from resources.photo import Photo, Photos
from resources.album import Album, Albums
from models import db


def create_app(env_name):
    app = Flask(__name__)
    app.config.from_object(app_config[env_name])
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.init_app(app)
    api = Api(app)
    CORS(app)
    api.add_resource(Photo, '/api/v1/photo/<string:photo_id>')
    api.add_resource(Photos, '/api/v1/photo/')
    api.add_resource(Album, '/api/v1/album/<string:album_id>')
    api.add_resource(Albums, '/api/v1/album/')

    return app
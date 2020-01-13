from marshmallow import fields, Schema
from . import db


class PhotoModel(db.Model):
    __tablename__ = 'lychee_photos'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    album = db.Column(db.Integer, nullable=False)
    url = db.Column(db.String(100), nullable=False)
    thumbUrl = db.Column(db.String(37), nullable=False)

    def __init__(self, data):
        self.id = data.get('id')
        self.title = data.get('title')
        self.album = data.get('album')
        self.url = data.get('url')
        self.thumbUrl = data.get('thumbUrl')

    @staticmethod
    def get_all():
        return PhotoModel.query.all()

    @staticmethod
    def get(id):
        return PhotoModel.query.get(id)

    @staticmethod
    def get_all_by_album_id(album_id):
        return PhotoModel.query.filter_by(album=album_id)


class PhotoSchema(Schema):
    id = fields.Int(dump_only=True)
    title = fields.Str(required=True)
    album = fields.Int(required=True)
    url = fields.Str(required=True)
    thumbUrl = fields.Str(required=True)
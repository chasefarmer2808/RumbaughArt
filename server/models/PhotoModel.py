from marshmallow import fields, Schema
from . import db


class PhotoModel(db.Model):
    __tablename__ = 'lychee_photos'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    album = db.Column(db.Integer, nullable=False)
    url = db.Column(db.String(100), nullable=False)
    thumbUrl = db.Column(db.String(37), nullable=False)
    width = db.Column(db.Integer, nullable=False)
    height = db.Column(db.Integer, nullable=False)
    star = db.Column(db.Boolean, nullable=False)

    def __init__(self, data):
        self.id = data.get('id')
        self.title = data.get('title')
        self.album = data.get('album')
        self.url = data.get('url')
        self.thumbUrl = data.get('thumbUrl')
        self.width = data.get('width')
        self.height = data.get('height')
        self.star = data.get('star')

    @staticmethod
    def get_all():
        return PhotoModel.query.all()

    @staticmethod
    def get(id):
        return PhotoModel.query.get(id)

    @staticmethod
    def get_all_by_album_id(album_id):
        return PhotoModel.query.filter_by(album=album_id)

    @staticmethod
    def get_all_stared():
        return PhotoModel.query.filter_by(star=1)


class PhotoSchema(Schema):
    id = fields.Int(dump_only=True)
    title = fields.Str(required=True)
    album = fields.Int(required=True)
    url = fields.Str(required=True)
    thumbUrl = fields.Str(required=True)
    width = fields.Int(required=True)
    height = fields.Int(required=True)
    star = fields.Int(required=True)
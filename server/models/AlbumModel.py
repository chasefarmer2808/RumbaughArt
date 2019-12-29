from marshmallow import fields, Schema
from . import db


class AlbumModel(db.Model):
    __tablename__ = 'lychee_albums'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    public = db.Column(db.Boolean, nullable=False)

    def __init__(self, data):
        self.id = data.get('id')
        self.title = data.get('title')
        self.public = data.get('public')

    @staticmethod
    def get_all_public():
        return AlbumModel.query.filter_by(public=1)


class AlbumSchema(Schema):
    id = fields.Int(dump_only=True)
    title = fields.Str(required=True)
    public = fields.Bool(required=True)
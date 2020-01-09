from flask import Response, json
from flask_restful import Resource
from models.AlbumModel import AlbumModel, AlbumSchema

album_schema = AlbumSchema()


class Album(Resource):
    def get(self, album_id):
        pass


class Albums(Resource):
    def get(self):
        albums = AlbumModel.get_all_public()
        serialized_albums = album_schema.dump(albums, many=True)
        return Response(response=json.dumps(serialized_albums.data), status=200, mimetype='application/json')
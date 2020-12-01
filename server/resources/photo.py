from flask import Response, json
from flask_restful import Resource, reqparse
from models.PhotoModel import PhotoModel, PhotoSchema

photo_schema = PhotoSchema()

parser = reqparse.RequestParser()
parser.add_argument('album_id')
parser.add_argument('star')


class Photo(Resource):
    def get(self, photo_id):
        photo = PhotoModel.get(photo_id)
        serialized_photo = photo_schema.dump(photo)
        return Response(response=json.dumps(serialized_photo.data), status=200, mimetype='application/json')


class Photos(Resource):
    def get(self):
        args = parser.parse_args()
        photos = []

        if args['album_id'] is not None:
            photos = PhotoModel.get_all_by_album_id(args['album_id'])
        elif args['star'] is not None and args['star'] is '1':
            photos = PhotoModel.get_all_stared()
        else:
            photos = PhotoModel.get_all()

        serialized_photos = photo_schema.dump(photos, many=True)
        return Response(response=json.dumps(serialized_photos.data), status=200, mimetype='application/json')

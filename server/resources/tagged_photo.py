from flask import Response, json
from flask_restful import Resource, reqparse
from models.PhotoModel import PhotoModel, PhotoSchema

photo_schema = PhotoSchema()

parser = reqparse.RequestParser()
parser.add_argument('tags')


class TaggedPhotos(Resource):
    def get(self):
        args = parser.parse_args()
        photos = []

        if args['tags'] is not None:
            photos = PhotoModel.get_all_by_tag(args['tags'])

        serialized_photos = photo_schema.dump(photos, many=True)
        return Response(response=json.dumps(serialized_photos.data), status=200, mimetype='application/json')
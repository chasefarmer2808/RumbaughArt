from flask import Response, json
from flask_restful import Resource, request
from models.PhotoModel import PhotoModel, PhotoSchema

photo_schema = PhotoSchema()


class Photo(Resource):
    def get(self):
        photos = PhotoModel.get_all()
        serialized_photos = photo_schema.dump(photos, many=True)
        return Response(response=json.dumps(serialized_photos), status=200, mimetype='application/json')

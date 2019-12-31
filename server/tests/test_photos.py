import unittest
from app import create_app, db


class PhotosTestCase(unittest.TestCase):
    def setUp(self):
        self.app = create_app('testing')
        self.client = self.app.test_client_class

        self.photos = [
            {
                'id': '1',
                'title': 'Flower',
                'album': '1'
            }
        ]

        with self.app.app_context():
            db.create_all()

    def tearDown(self):
        db.session.remove()
        db.drop_all()
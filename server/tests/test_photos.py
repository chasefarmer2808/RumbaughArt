import unittest
from app import create_app, db


class PhotosTestCase(unittest.TestCase):
    def setUp(self):
        self.app = create_app('testing')
        self.client = self.app.test_client()

    def test_should_get_photo_by_id(self):
        res = self.client.get('/api/v1/photo/1')
        self.assertEqual(res.status_code, 200)
        self.assertEqual(res.json['id'], 1)

    def tearDown(self):
        db.session.remove()
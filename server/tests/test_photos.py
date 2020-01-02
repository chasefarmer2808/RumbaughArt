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

    def test_should_get_all_photos(self):
        res = self.client.get('/api/v1/photo/')
        self.assertEqual(res.status_code, 200)

    def test_should_get_all_photos_by_album_id(self):
        params = {'album_id': '1'}
        res = self.client.get('/api/v1/photo/', query_string=params)
        self.assertEqual(res.status_code, 200)

        for photo in res.json:
            self.assertEqual(photo['album'], 1)

    def tearDown(self):
        db.session.remove()
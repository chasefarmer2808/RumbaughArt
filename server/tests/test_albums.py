import unittest
from app import create_app, db


class AlbumsTestCase(unittest.TestCase):
    def setUp(self):
        self.app = create_app('testing')
        self.client = self.app.test_client()

    def test_should_get_all_public_albums(self):
        res = self.client.get('/api/v1/album/')
        self.assertEqual(res.status_code, 200)

        for album in res.json:
            self.assertTrue(album['public'])

    def tearDown(self):
        db.session.remove()
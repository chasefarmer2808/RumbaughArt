import os

from app import create_app


if __name__ == '__main__':
    env_name = os.getenv('FLASK_ENV', 'development')
    app = create_app(env_name)
    app.run(host='0.0.0.0')
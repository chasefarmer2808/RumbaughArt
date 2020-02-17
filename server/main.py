import os

from app import create_app

env_name = os.getenv('FLASK_ENV', 'development')
myapp = create_app(env_name)

if __name__ == '__main__':
    env_name = os.getenv('FLASK_ENV', 'development')
    myapp = create_app(env_name)
    myapp.run(host='0.0.0.0', port=80)
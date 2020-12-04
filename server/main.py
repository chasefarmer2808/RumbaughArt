import os

from app import create_app
from flask_cors import CORS

env_name = os.getenv('FLASK_ENV', 'development')
myapp = create_app(env_name)

if __name__ == '__main__':
    env_name = os.getenv('FLASK_ENV', 'development')
    myapp = create_app(env_name)

    if env_name == 'development':
        CORS(myapp)

    myapp.run(host='0.0.0.0', port=80)
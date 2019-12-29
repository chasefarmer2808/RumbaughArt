import os
from pathlib import Path
from dotenv import load_dotenv

env_path = Path('..') / '.env'
load_dotenv(dotenv_path=env_path)


class Development(object):
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:{}@localhost/lychee'.format(os.getenv('MYSQL_ROOT_PASSWORD'))
    MYSQL_ROOT_PASSWORD = os.getenv('MYSQL_ROOT_PASSWORD')


class Production(object):
    DEBUG = False
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:{}@{}/lychee'.format(os.getenv('MYSQL_ROOT_PASSWORD'), os.getenv('DATABASE_HOSTNAME'))
    MYSQL_ROOT_PASSWORD = os.getenv('MYSQL_ROOT_PASSWORD')


app_config = {
    'development': Development,
    'production': Production
}
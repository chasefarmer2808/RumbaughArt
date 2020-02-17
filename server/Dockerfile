FROM tiangolo/uwsgi-nginx-flask:python3.7

COPY . /app
WORKDIR /app
RUN pip install pipenv
RUN pipenv install --system --deploy
# CMD pipenv run python main.py
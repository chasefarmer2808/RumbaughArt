FROM nginx:alpine
RUN apk add python3 python3-dev py3-pip build-base libressl-dev musl-dev libffi-dev cargo
RUN pip3 install pip --upgrade
RUN pip3 install certbot-nginx
RUN mkdir /etc/letsencrypt
COPY nginx.conf /etc/nginx/conf.d/nginx.conf

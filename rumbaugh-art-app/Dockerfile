FROM tiangolo/node-frontend:10 as build-stage

COPY package*.json /app/
RUN npm install
COPY . /app
ARG configuration
RUN npm run build -- --build-optimizer=false --${configuration}

FROM nginx:1.15
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /app/dist/rumbaugh-art-app/ /usr/share/nginx/html
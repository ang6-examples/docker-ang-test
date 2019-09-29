FROM node:alpine AS build-stage
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build -- --output-path=./dist/out

FROM nginx
COPY --from=build-stage /app/dist/out/ /usr/share/nginx/html

# cd D:/Study/test/06-test-front-ang
# docker build -t mazhekin/docker-ang-test:prod .
# docker run -p 80:80 mazhekin/docker-ang-test:prod

# configuration
# https://medium.com/@tiangolo/angular-in-docker-with-nginx-supporting-environments-built-with-multi-stage-docker-builds-bb9f1724e984

# docker build -t sibintek-chatbot:prod --build-arg configuration="cc" .

# dev stage
FROM node:lts-alpine as dev-stage
RUN npm install -g http-server
WORKDIR /usr/app/
COPY package.json yarn.lock ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 8080
CMD [ "http-server", "dist" ]

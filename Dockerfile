# # dev stage
# FROM node:lts-alpine as dev-stage
# RUN npm install -g http-server
# WORKDIR /usr/app/
# COPY package.json yarn.lock ./
# RUN npm install
# COPY . .
# RUN npm run build
# EXPOSE 8080
# CMD [ "http-server", "dist" ]

# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package.json yarn.lock ./ 
RUN yarn
COPY . .
RUN yarn build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
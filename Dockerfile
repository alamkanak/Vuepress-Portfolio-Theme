FROM node:16.3-alpine3.13

# create destination directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# update and install dependency
RUN apk update && apk upgrade
RUN apk add git
COPY ./package.json /usr/src/app/package.json
RUN npm install --silent

# base image
FROM node:alpine AS builder

# set working directory
WORKDIR /Jenkins/workspace/demoapp

# add `/Jenkins/workspace/demoapp/node_modules/.bin` to $PATH
ENV PATH /Jenkins/workspace/demoapp/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /Jenkins/workspace/demoapp/package.json
RUN npm install
RUN npm install -g @angular/cli@7.3.9

# add app
COPY . /Jenkins/workspace/demoapp

# start app
CMD ng serve --host 0.0.0.0






















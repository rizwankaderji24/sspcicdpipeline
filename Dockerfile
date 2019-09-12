
# base image
FROM node:alpine AS builder

# set working directory
WORKDIR /var/lib/jenkins/workspace/ssp123

# add `/Jenkins/workspace/demoapp/node_modules/.bin` to $PATH
ENV PATH /var/lib/jenkins/workspace/ssp123/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /var/lib/jenkins/workspace/ssp123/package.json
RUN npm install
RUN npm install -g @angular/cli@7.3.9

# add app
COPY . /var/lib/jenkins/workspace/ssp123

# start app
CMD ng serve --host 0.0.0.0
























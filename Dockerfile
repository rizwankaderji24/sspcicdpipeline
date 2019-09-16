# base image
FROM node:latest as node

# set working directory
WORKDIR /home/aarti/rogers 

# add `/home/aarti/rogers/node_modules/.bin` to $PATH
ENV PATH /home/aarti/rogers/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /home/aarti/rogers/package.json
RUN npm install
RUN npm install -g @angular/cli@7.3.9


# add app
COPY . /home/aarti/rogers 

# start app
CMD ng serve --host 0.0.0.0

EXPOSE 8091

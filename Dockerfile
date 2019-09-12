# base image
FROM node:alpine AS builder

# set working directory
WORKDIR /home/pravin/rogers

# add `/home/pravin/rogers/node_modules/.bin` to $PATH
ENV PATH /home/pravin/rogers/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /home/pravin/rogers/package.json
RUN npm install
RUN npm install -g @angular/cli@7.3.9

# add app
COPY . /home/pravin/rogers

# start app
CMD ng serve --host 0.0.0.0











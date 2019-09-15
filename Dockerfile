FROM node:latest as node

WORKDIR /app

COPY . .

COPY package.json ./

COPY uid_entrypoint.sh /usr/local/bin/

RUN npm install

RUN npm install -g @angular/cli@7.3.9

RUN npm run build --prod

ENTRYPOINT [ "sh", "-c", "/usr/local/bin/uid_entrypoint.sh" ]

FROM nginx:stable

RUN sed -i.bak 's/listen\(.*\)80;/listen 8091;/' /etc/nginx/conf.d/default.conf



EXPOSE 8091

RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

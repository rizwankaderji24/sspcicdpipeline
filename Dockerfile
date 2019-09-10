FROM node:latest as node
WORKDIR /app
COPY . .
COPY package.json ./
COPY uid_entrypoint.sh /usr/local/bin/
RUN npm install
RUN npm install -g @angular/cli@7.3.9
RUN npm run build --prod
RUN chmod +x /usr/local/bin/uid_entrypoint.sh
RUN chmod g=u /etc/passwd
RUN ln -s /usr/local/bin/uid-entrypoint.sh  /
ENTRYPOINT [ "sh", "-c", "/usr/local/bin/uid_entrypoint.sh" ]
USER 1001
FROM nginx:stable
RUN chgrp -R root /var/cache/nginx /var/run /var/log/nginx && \
    chmod -R 770 /var/cache/nginx /var/run /var/log/nginx
RUN sed -i.bak 's/listen\(.*\)80;/listen 9051;/' /etc/nginx/conf.d/default.conf
COPY --from=node /app/dist/AngularTestApp /usr/share/nginx/html
EXPOSE 9051
RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]












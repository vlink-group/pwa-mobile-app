FROM nginx:perl

WORKDIR /app

RUN nginx -v
EXPOSE 80

COPY docker/app-startup.sh ./app-startup.sh
COPY docker/local/nginx.conf /etc/nginx/nginx.conf
COPY docker/local/default.conf /etc/nginx/conf.d/default.conf

COPY /dist .

RUN ["chmod", "+x", "./app-startup.sh"]
ENTRYPOINT ["./app-startup.sh"]
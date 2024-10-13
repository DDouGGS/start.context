FROM douggapp/php83:20240926A

LABEL maintainer="ddouggs"

RUN apt-get update

COPY ./docker/dougg.sh /usr/share/nginx/

RUN chmod +x /usr/share/nginx/dougg-init.sh \
  && ./../dougg-init.sh

COPY ./docker/default.conf /etc/nginx/sites-available/default

RUN nginx -t

WORKDIR /usr/share/nginx/html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

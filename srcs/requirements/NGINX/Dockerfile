FROM alpine:3.13

RUN apk update && apk add nginx openssl
RUN apk upgrade

# SSL CONFIG
RUN openssl req \
        -x509 \
        -newkey rsa:4096 \
        -sha256 \
        -nodes \
        -keyout /etc/nginx/nginx.key \
        -out /etc/nginx/nginx-certificate.crt \
        -days 3650 \
        -subj "/CN=FR/ST=Paris/L=Paris/O=42/OU=dchheang/CN=dchheang"

# CREATE USER
RUN adduser -D "user42" && echo "user42:user42" | chpasswd
RUN mkdir /var/www/html
RUN chown -R user42:user42 \
/var/lib/nginx \
/var/www/html
RUN mkdir /www

COPY default /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]

WORKDIR /etc/nginx

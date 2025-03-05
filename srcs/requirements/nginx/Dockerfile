
FROM alpine:3.20

RUN apk update && apk upgrade && apk add --no-cache nginx

# COPY /requirements/nginx/tools/clundber.42.fr.crt /etc/nginx/ssl/clundber.42.fr.crt
# COPY /requirements/nginx/tools/clundber.42.fr.key /etc/nginx/ssl/clundber.42.fr.key
# COPY /requirements/nginx/conf/nginx.conf /etc/nginx/nginx.conf


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]


FROM alpine:3.20

RUN apk update && apk upgrade && apk add --no-cache nginx

COPY requirements/nginx/fastcgi_params /etc/nginx/fastcgi_params

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

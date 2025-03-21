
FROM alpine:3.20

RUN apk update && apk upgrade && apk add --no-cache nginx

# Add a new user within the container
RUN adduser -D -H -s /sbin/nologin -g www-data -G www-data www-data

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

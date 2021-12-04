FROM martkcz/php-alpine:8.0.13

USER root

RUN apk add --no-cache \
    supervisor \
    nginx \
    nginx-mod-http-brotli

COPY conf/nginx /etc/nginx/
COPY conf/supervisor/supervisord.conf /etc/supervisor/conf.d/

RUN chown -R www-data.www-data /var/lib/nginx
RUN chown -R www-data.www-data /var/log/nginx

USER www-data

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

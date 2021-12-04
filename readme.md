# Nginx-1.20.2 PHP-8.0.13 alpine

## Production
```dockerfile
# PHP
USER root

RUN cp /examples/php/99_production.ini /etc/php8/conf.d/ && \
    rm /etc/php8/conf.d/98_development.ini
    
## PHP-fpm    
RUN cp /examples/php-fpm/www-production.ini /etc/php8/fpm-conf.d/www.ini

# Nginx
RUN cp /etc/nginx/includes/_nginx-http-brotli.conf /etc/nginx/includes/nginx-http-brotli.conf # enables brotli
RUN cp /etc/nginx/includes/_nginx-module-brotli.conf /etc/nginx/includes/nginx-module-brotli.conf # enables brotli

RUN cp /etc/nginx/includes/_nginx-http-gzip.conf /etc/nginx/includes/nginx-http-gzip.conf # enables gzip
RUN cp /etc/nginx/includes/_nginx-server-cache.conf /etc/nginx/includes/nginx-server-cache.conf # enables asset caching
RUN cp /etc/nginx/includes/_nginx-server-https.conf /etc/nginx/includes/nginx-server-https.conf # enables http -> https
RUN cp /etc/nginx/includes/_nginx-server-non-www.conf /etc/nginx/includes/nginx-server-non-www.conf # enables www ->

USER www-data
```

## Swoole uninstall

```dockerfile
USER root

RUN rm /usr/lib/php8/modules/swoole.so && \
    rm /etc/php8/conf.d/00_swoole.ini
    
USER www-data
```

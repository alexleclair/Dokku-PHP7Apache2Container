FROM gliderlabs/herokuish

RUN mkdir -p /app
ADD . /app
WORKDIR /app
RUN /build
EXPOSE 5000
ENV PATH="/app/.heroku/bin:/app/vendor/bin:/app/.heroku:/app/.heroku/php/bin:/app/.heroku/node/bin:/app/node_modules/.bin:${PATH}"
ENV PORT="5000"
RUN sh /app/pre-deploy.sh
ENTRYPOINT ["/exec", "vendor/bin/heroku-php-apache2", "-F", "php_fpm.conf", "-C", "apache_app.conf", "www/"]

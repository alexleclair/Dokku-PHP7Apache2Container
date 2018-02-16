# Sample `apache.conf` files

## Match any domain / subdomain to a subdirectory within your `storage` directory:
```
RewriteEngine on
RewriteCond %{HTTP_HOST} ^(.+)$
RewriteCond /app/www/%1 -d
RewriteRule ^(.*) /%1/$1 [L]
```
echo "### Deleting dummy certificate for $1 ..."
docker-compose run --rm --entrypoint "\
    rm -Rf /etc/letsencrypt/live/$1 && \
    rm -Rf /etc/letsencrypt/archive/$1 && \
    rm -Rf /etc/letsencrypt/renewal/$1.conf" certbot
echo
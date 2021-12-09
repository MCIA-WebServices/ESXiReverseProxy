echo "### Deleting all certificates ..."

source config.sh

for domain in ${domains[@]};
do
    docker-compose run --rm --entrypoint "\
        rm -Rf /etc/letsencrypt/live/domain && \
        rm -Rf /etc/letsencrypt/archive/domain && \
        rm -Rf /etc/letsencrypt/renewal/domain.conf" certbot
done

echo
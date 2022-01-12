read -p "Are you sure, care with letsencrypt limits? (Y/y)" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Dangerous stuff

    echo "### Deleting all certificates ..."

    source ../config.sh

    for domain in ${domains[@]};
    do
        docker-compose run --rm --entrypoint "\
            rm -Rf /etc/letsencrypt/live/$domain && \
            rm -Rf /etc/letsencrypt/archive/$domain && \
            rm -Rf /etc/letsencrypt/renewal/$domain.conf" certbot
    done
    echo

fi
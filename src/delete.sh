read -p "Are you sure, care with letsencrypt limits? (Y/y)" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Dangerous stuff
    echo "### Deleting certificate for $1 ..."
    docker-compose run --rm --entrypoint "\
        rm -Rf /etc/letsencrypt/live/$1 && \
        rm -Rf /etc/letsencrypt/archive/$1 && \
        rm -Rf /etc/letsencrypt/renewal/$1.conf" certbot
    echo

fi
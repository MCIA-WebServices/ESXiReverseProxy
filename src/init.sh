#!/bin/bash

if ! [ -x "$(command -v docker-compose)" ];
then
  echo 'Error: docker-compose is not installed.' >&2
  exit 1
fi

source config.sh

echo "List of domains(s) :"

for domain in ${domains[@]};
do
  echo " - $domain"
done

echo
echo "Your email : $email ..." 
echo

echo "### Starting nginx container ..."
docker-compose down
docker-compose up -d deployment
echo

for domain in ${domains[@]};
do

  path="$data_path/conf/renewal/$domain.conf"

  echo $path

  if [ -f "$path" ];
  then
    echo -e " --- Existing certificate ... \e[1;32m done \e[1;0m"
    echo
  else

    echo "### Generating args / parameters for $domain ..."
    domain_args=""
    #Join $domains to -d args
    domain_args="$domain_args -d $domain"

    # Select appropriate email arg
    case "$email" in
      "") email_arg="--register-unsafely-without-email" ;;
      *) email_arg="--email $email" ;;
    esac

    # Enable staging mode if needed
    if [ $staging != "0" ]; then staging_arg="--staging"; fi

    echo "### Requesting Let's Encrypt certificate for $domain ..."
    docker-compose run --rm --entrypoint " \
      certbot certonly --webroot -w /var/www/certbot \
        $staging_arg \
        $email_arg \
        $domain_args \
        --rsa-key-size $rsa_key_size \
        --agree-tos \
        --force-renewal" certbot
    echo
  fi
done

docker-compose down
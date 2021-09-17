# MCIA ESXi Server NGINX Reverse Proxy Settings

> This repository is basen on (https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71).

`init-letsencrypt.sh` has been adapted to work with multiple domains. Certificates created are stored in data/certbot/

> Required configuration

init-letsencrypt.sh has to be modified with the required secure domains.

data/nginx/app.conf has to be modified with the required services

## TODOs

Create configuration file for init-letsencrypt.sh

Move to Traffik and implement automated deployment API


## License
All code in this repository is licensed under the terms of the `MIT License`. For further information please refer to the `LICENSE` file.
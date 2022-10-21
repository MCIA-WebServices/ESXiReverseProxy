# Domains, separated by space.
domains=(
    mciawebserver.upc.edu
    granta.api.ecobulk.upc.edu
    eushp.backend.ecobulk.upc.edu
    sso.ecobulk.upc.edu
    sso.backend.ecobulk.upc.edu 
    mps.ecobulk.upc.edu
    parallel.ecobulk.upc.edu
)

# Email account
email="angel.fernandez.sobrino@upc.edu"

# Set to 1 if you're testing your setup to avoid hitting request limits, set 0 for production env.
staging=0

rsa_key_size=4096
data_path="./data/certbot"
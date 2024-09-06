#!/usr/bin/env bash
set -e

NGINX_OUTPUT_CONFIG_FILE="/etc/nginx/conf.d/default.conf"

replaceVariables(){
    sed --expression "s|###DEPLOYMENT_NAME###|${DEPLOYMENT_NAME}|g" \
        --expression "s|###DNS_NAMESERVER###|${DNS_NAMESERVER}|g" \
        --expression "s|###LOCAL_DOMAIN###|${LOCAL_DOMAIN}|g" \
        --expression "s|###SSL_ENABLED###|${SSL_ENABLED}|g" \
        "$1"
}

cd /app/gamify-it/template

echo "Create nginx configuration"
replaceVariables header-main.conf > "$NGINX_OUTPUT_CONFIG_FILE"
if [[ "$SSL_ENABLED" == true ]]; then
    replaceVariables header-https.conf >> "$NGINX_OUTPUT_CONFIG_FILE"
else
    replaceVariables header-http.conf >> "$NGINX_OUTPUT_CONFIG_FILE"
fi
replaceVariables body-main.conf >> "$NGINX_OUTPUT_CONFIG_FILE"
for SERVICE in ${SERVICES}; do
    echo $SERVICE
    replaceVariables "body-${SERVICE}.conf" >> "$NGINX_OUTPUT_CONFIG_FILE"
done
replaceVariables footer.conf >> "$NGINX_OUTPUT_CONFIG_FILE"

exec "$@"

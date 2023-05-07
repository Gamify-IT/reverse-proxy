FROM nginx

WORKDIR /app/gamify-it/template

COPY nginx-templates .



ENV DEPLOYMENT_NAME="gamify-it"
# docker nameserver
ENV DNS_NAMESERVER="127.0.0.11"
# default and keycloak should always be present
ENV SERVICES="default keycloak bugfinder chickenshock crosswordpuzzle fileserver finitequiz memory regexgame towercrush"
ENV SSL_ENABLED="true"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["nginx", "-g", "daemon off;"]

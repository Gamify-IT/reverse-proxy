FROM nginx

WORKDIR /app/gamify-it/template

COPY nginx-templates .



ENV DEPLOYMENT_NAME="gamify-it"
# docker nameserver
ENV DNS_NAMESERVER="127.0.0.11"
ENV SERVICES="bugfinder chickenshock crosswordpuzzle default fileserver finitequiz keycloak memory regexgame towercrush"
ENV SSL_ENABLED="true"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["nginx", "-g", "daemon off;"]

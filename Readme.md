# Gamify-IT reverse-proxy image

This nginx image contains creates a Gamify-IT reverse-proxy accortdingly to
the environment vatiables on startup.


## Environment variables

- `DEPLOYMENT_NAME`:
    - the deployment name used as prefix for the containers, default: `gamify-it`
- `DNS_NAMESERVER`:
    - DNS nameserver used by nginx, default: `127.0.0.11`
- `SERVICES`:
    - The services to add to the config, default: `bugfinder chickenshock crosswordpuzzle default fileserver finitequiz keycloak memory regexgame towercrush`
- `SSL_ENABLED`:
    - true for https, false for http, default: `true`

## volumes

If ssl is enabled you need to mount the certificate and key to the following paths:
- `/etc/nginx/ssl-certs/ssl-cert.pem`
- `/etc/nginx/ssl-certs/ssl-certificate-key.pem`



## Development

To build and run for development run:
```bash
docker compose up --build
```

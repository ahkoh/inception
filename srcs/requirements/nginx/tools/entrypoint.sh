#!/bin/sh

SSL=/etc/nginx/http.d/ssl

if [ ! -e $SSL.key ] || [ ! -e $SSL.crt ]; then
	openssl req -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 \
		-subj "/CN=${SSL_DOMAIN}/O=${SSL_DOMAIN}/C=MY" -keyout $SSL.key -out $SSL.crt
fi

exec "$@"

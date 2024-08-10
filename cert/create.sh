#!/bin/bash

# CA証明書はbasicConstraint = critical,CA:TRUEである必要がある
openssl req -new -nodes -text -subj "/CN=tanoc.dev" -out ca.csr -keyout ca.key
openssl x509 -req -in ca.csr -text -days 36500 -signkey ca.key -extfile ./openssl.cnf -extensions v3_ca -out ca.crt
chmod og-rwx ca.key

openssl req -new -nodes -text -subj "/CN=db" -out server.csr -keyout server.key
openssl x509 -req -in server.csr -text -days 36500 -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt
chmod og-rwx server.key

openssl req -new -nodes -text -subj "/CN=root" -out client.csr -keyout client.key
openssl x509 -req -in client.csr -text -days 36500 -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt
chmod og-rwx client.key

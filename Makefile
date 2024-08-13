psql:
	psql "host=db sslmode=verify-ca user=root sslrootcert=cert/ca.crt sslcert=cert/client.crt sslkey=cert/client.key"

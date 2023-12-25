.PHONY: cert curl describe-cert start stop

cert:
	openssl req -nodes -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 365

describe-cert:
	openssl x509 -in cert.pem -text -noout

curl:
	curl -v --cacert cert.pem https://localhost:9443


start:
	docker compose -f docker-compose.yaml up

stop:
	docker compose -f docker-compose.yaml down
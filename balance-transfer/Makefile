start:
	docker-compose -f artifacts/docker-compose.yaml up

stop:
	docker-compose -f artifacts/docker-compose.yaml down

start-orderer:
	docker-compose -f artifacts/orderer.yaml up

stop-orderer:
	docker-compose -f artifacts/orderer.yaml down

crypto:
	cd artifacts/channel && cryptogen generate --config=./cryptogen.yaml

restart: stop start

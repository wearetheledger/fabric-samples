start:
	docker-compose -f artifacts/docker-compose.yaml up -d

stop:
	docker-compose -f artifacts/docker-compose.yaml down

start-orderer:
	docker-compose -f artifacts/orderer.yaml up -d

stop-orderer:
	docker-compose -f artifacts/orderer.yaml down

restart-orderer: stop-orderer start-orderer

crypto:
	cd artifacts/channel && cryptogen generate --config=./cryptogen.yaml

restart: stop start

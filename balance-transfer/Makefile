start:
	docker-compose -f artifacts/docker-compose.yaml up -d

stop:
	docker-compose -f artifacts/docker-compose.yaml down

restart: stop start

start-orderer:
	docker-compose -f artifacts/orderer.yaml up -d

stop-orderer:
	docker-compose -f artifacts/orderer.yaml down

restart-orderer: stop-orderer start-orderer

crypto:
	cd artifacts/channel && ./../bin/cryptogen generate --config=./cryptogen.yaml

txconfig:
	cd artifacts/channel && ./../bin/configtxgen -profile TwoOrgsOrdererGenesis -outputBlock ./genesis.block
	cd artifacts/channel && ./../bin/configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./mychannel.tx -channelID mychannel
	# TODO: create anchor peers config?

pull-binaries:
	cd artifacts && ./pull-binaries.sh 1.0.2
docker-build:
	docker build -t theledger/fabric-samples/balance-transfer .
docker-run:
	docker run -d --rm -p 4000:4000 --name=balance-transfer theledger/fabric-samples/balance-transfer
docker-stop:
	docker stop balance-transfer




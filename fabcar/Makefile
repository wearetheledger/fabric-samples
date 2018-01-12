pull-binaries:
	chmod +x ./../basic-network/pull-binaries.sh
	cd ./../basic-network/ && ./pull-binaries.sh 1.0.2

generate:
	cd ./../basic-network && ./bin/configtxgen -profile OneOrgOrdererGenesis -outputBlock ./config/genesis.block
	cd ./../basic-network && ./bin/configtxgen -profile OneOrgChannel -outputCreateChannelTx ./config/channel.tx -channelID mychannel

start:
	./startOrderer.sh
	sleep 5
	./startFabric.sh
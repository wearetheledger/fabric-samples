pull-binaries:
	chmod +x ./../basic-network/pull-binaries.sh
	cd ./../basic-network/ && ./pull-binaries.sh 1.0.2

generate:
	#export FABRIC_CFG_PATH=/home/ec2-user/projects/fabric-samples/basic-network
	cd ./../basic-network && ./bin/configtxgen -profile TwoOrgOrdererGenesis -outputBlock ./config/genesis.block
	cd ./../basic-network && ./bin/configtxgen -profile TwoOrgChannel -outputCreateChannelTx ./config/channel.tx -channelID mychannel

start-all:
	./startOrderer.sh
	sleep 5
	./startFabric.sh

start-orderer:
	./startOrderer.sh

start-peers:
	./startFabric.sh
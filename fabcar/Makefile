pull-binaries:
	chmod +x ./../basic-network/pull-binaries.sh
	cd ./../basic-network/ && ./pull-binaries.sh 1.0.2

generate:
	#export FABRIC_CFG_PATH=/home/ec2-user/projects/fabric-samples/basic-network
	#FABRIC_CFG_PATH=/home/ec2-user/projects/fabric-samples/basic-network cd ./../basic-network && ./bin/configtxgen -profile OneOrgOrdererGenesis -outputBlock ./config/genesis.block
	#FABRIC_CFG_PATH=/home/ec2-user/projects/fabric-samples/basic-network cd ./../basic-network && ./bin/configtxgen -profile OneOrgChannel -outputCreateChannelTx ./config/channel.tx -channelID mychannel
	cd ./../basic-network && ./generate.sh

start-all:
	./startOrderer.sh
	sleep 5
	./startFabric.sh

start-orderer:
	./startOrderer.sh

start-peers:
	./startFabric.sh
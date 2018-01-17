#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
# Exit on first error
set -e
set -x

# don't rewrite paths for Windows Git Bash users
export MSYS_NO_PATHCONV=1
export HOST_ORDERER=ec2-34-251-33-15.eu-west-1.compute.amazonaws.com
export PORT_ORDERER=7050

# Create the channel
docker exec -e "CORE_PEER_LOCALMSPID=Org2MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org2.example.com/msp" cli peer channel create -o ${HOST_ORDERER}:${PORT_ORDERER} -c mychannel -f /etc/hyperledger/configtx/channel.tx
# Join peer0.org1.example.com to the channel.
docker exec -e "CORE_PEER_ID=peer0.org1.example.com" -e "CORE_PEER_ADDRESS=ec2-34-241-181-15.eu-west-1.compute.amazonaws.com" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" cli peer channel join -b mychannel.block

docker exec -e "CORE_PEER_ID=peer0.org2.example.com" -e "CORE_PEER_ADDRESS=ec2-54-229-222-164.eu-west-1.compute.amazonaws.com" -e "CORE_PEER_LOCALMSPID=Org2MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org2.example.com/msp" cli peer channel join -b mychannel.block

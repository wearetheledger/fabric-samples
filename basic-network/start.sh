#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
# Exit on first error, print all commands.
set -ev

# don't rewrite paths for Windows Git Bash users
export MSYS_NO_PATHCONV=1
export HOST_ORDERER=ec2-34-251-33-15.eu-west-1.compute.amazonaws.com
export PORT_ORDERER=7050
# export HOST_ORDERER=ec2-34-251-33-15.eu-west-1.compute.amazonaws.com

# docker-compose -f docker-compose.yml down

# docker-compose -f docker-compose.yml up -d ca.amazonaws.com orderer.example.com peer0.org1.example.com couchdb
docker-compose -f docker-compose.yml up -d ca.amazonaws.com

# wait for Hyperledger Fabric to start
# incase of errors when running later commands, issue export FABRIC_START_TIMEOUT=<larger number>
#export FABRIC_START_TIMEOUT=10
#echo ${FABRIC_START_TIMEOUT}
#sleep ${FABRIC_START_TIMEOUT}

# # Create the channel
# docker exec -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel create -o ${HOST_ORDERER}:${PORT_ORDERER} -c mychannel -f /etc/hyperledger/configtx/channel.tx
# # Join peer0.org1.example.com to the channel.
# docker exec -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b mychannel.block

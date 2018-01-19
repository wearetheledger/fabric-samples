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


docker exec -e "CORE_PEER_ID=peer0.org1.example.com" -e "CORE_PEER_ADDRESS=ec2-34-241-181-15.eu-west-1.compute.amazonaws.com:7051" -e "CORE_PEER_LOCALMSPID=Org2MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp" cli peer chaincode query -o ${HOST_ORDERER}:${PORT_ORDERER} -C mychannel -n fabcar -c '{"function":"queryAllCars","Args":[""]}'
sleep 1
docker exec -e "CORE_PEER_ID=peer0.org1.example.com" -e "CORE_PEER_ADDRESS=ec2-34-241-181-15.eu-west-1.compute.amazonaws.com:7051" -e "CORE_PEER_LOCALMSPID=Org2MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp" cli peer chaincode invoke -o ${HOST_ORDERER}:${PORT_ORDERER} -C mychannel -n fabcar -c '{"function":"changeCarOwner","Args":["CAR0", "Jeroen De Prest"]}'
sleep 2
docker exec -e "CORE_PEER_ID=peer0.org1.example.com" -e "CORE_PEER_ADDRESS=ec2-34-241-181-15.eu-west-1.compute.amazonaws.com:7051" -e "CORE_PEER_LOCALMSPID=Org2MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp" cli peer chaincode query -o ${HOST_ORDERER}:${PORT_ORDERER} -C mychannel -n fabcar -c '{"function":"queryAllCars","Args":[""]}'
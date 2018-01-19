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


docker exec -e "CORE_PEER_ID=peer0.org1.example.com" -e "CORE_PEER_ADDRESS=ec2-34-241-181-15.eu-west-1.compute.amazonaws.com:7051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp" cli peer chaincode install -n fabcar -v 1.0 -p github.com/fabcar
docker exec -e "CORE_PEER_ID=peer0.org1.example.com" -e "CORE_PEER_ADDRESS=ec2-34-241-181-15.eu-west-1.compute.amazonaws.com:7051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp" cli peer chaincode instantiate -o ${HOST_ORDERER}:${PORT_ORDERER} -C mychannel -n fabcar -v 1.0 -c '{"Args":[""]}' -P "OR ('Org1MSP.member','Org2MSP.member')"
sleep 10
docker exec -e "CORE_PEER_ID=peer0.org1.example.com" -e "CORE_PEER_ADDRESS=ec2-34-241-181-15.eu-west-1.compute.amazonaws.com:7051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp" cli peer chaincode invoke -o ${HOST_ORDERER}:${PORT_ORDERER} -C mychannel -n fabcar -c '{"function":"initLedger","Args":[""]}'


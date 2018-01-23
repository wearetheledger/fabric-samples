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
export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/crypto/ordererOrganizations/amazonaws.com/orderers/ec2-34-251-33-15.eu-west-1.compute.amazonaws.com/msp/tlscacerts/tlsca.amazonaws.com-cert.pem
      

# Create the channel
docker exec -e ${ORDERER_CA} -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/amazonaws.com/users/Admin@amazonaws.com/msp" cli peer channel create -o ${HOST_ORDERER}:${PORT_ORDERER} -c mychannel -f /etc/hyperledger/configtx/channel.tx --tls true --cafile $ORDERER_CA
# Join peer0.org1.example.com to the channel.
docker exec -e ${ORDERER_CA} -e "CORE_PEER_ID=peer0.org1.example.com" -e "CORE_PEER_ADDRESS=ec2-34-241-181-15.eu-west-1.compute.amazonaws.com:7051" -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/amazonaws.com/users/Admin@amazonaws.com/msp" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/amazonaws.com/peers/ec2-34-241-181-15.eu-west-1.compute.amazonaws.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/amazonaws.com/peers/ec2-34-241-181-15.eu-west-1.compute.amazonaws.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/amazonaws.com/peers/ec2-34-241-181-15.eu-west-1.compute.amazonaws.com/tls/ca.crt" cli peer channel join -b mychannel.block --tls true --cafile $ORDERER_CA

docker exec -e ${ORDERER_CA} -e "CORE_PEER_ID=peer0.org2.example.com" -e "CORE_PEER_ADDRESS=ec2-54-229-222-164.eu-west-1.compute.amazonaws.com:7051" -e "CORE_PEER_LOCALMSPID=Org2MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/amazonaws.com/users/Admin@org2.example.com/msp" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/amazonaws.com/peers/ec2-54-229-222-164.eu-west-1.compute.amazonaws.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/amazonaws.com/peers/ec2-54-229-222-164.eu-west-1.compute.amazonaws.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/amazonaws.com/peers/ec2-54-229-222-164.eu-west-1.compute.amazonaws.com/tls/ca.crt" cli peer channel join -b mychannel.block --tls true --cafile $ORDERER_CA

docker exec -e /opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/amazonaws.com/ca/ca.amazonaws.com-cert.pem -e CORE_PEER_ID=peer0.org1.example.com -e CORE_PEER_ADDRESS=ec2-34-241-181-15.eu-west-1.compute.amazonaws.com:7051 -e CORE_PEER_LOCALMSPID=Org1MSP -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/amazonaws.com/users/Admin@amazonaws.com/msp -e CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/amazonaws.com/peers/ec2-34-241-181-15.eu-west-1.compute.amazonaws.com/tls/server.crt -e CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/amazonaws.com/peers/ec2-34-241-181-15.eu-west-1.compute.amazonaws.com/tls/server.key -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/amazonaws.com/peers/ec2-34-241-181-15.eu-west-1.compute.amazonaws.com/tls/ca.crt cli peer channel join -b mychannel.block --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/crypto/peerOrganizations/amazonaws.com/ca/ca.amazonaws.com-cert.pem
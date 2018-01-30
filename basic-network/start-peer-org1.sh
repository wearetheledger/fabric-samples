#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
# Exit on first error, print all commands.
set -ev
set -x

# don't rewrite paths for Windows Git Bash users
export MSYS_NO_PATHCONV=1

docker-compose -f docker-compose-peer0-org1.yml down peer0.org1.example.com couchdb

docker-compose -f docker-compose-peer0-org1.yml up -d peer0.org1.example.com couchdb


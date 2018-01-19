#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
# Exit on first error
set -e
set -x

# Make sure to boot the orderer first!

# don't rewrite paths for Windows Git Bash users
export MSYS_NO_PATHCONV=1
export HOST_ORDERER=ec2-34-251-33-15.eu-west-1.compute.amazonaws.com

starttime=$(date +%s)

cd ../basic-network
./start-cli.sh


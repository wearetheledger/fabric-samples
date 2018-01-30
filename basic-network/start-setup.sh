#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
# Exit on first error, print all commands.
set -ev

export MSYS_NO_PATHCONV=1

docker-compose -f docker-compose.yml up -d setup 


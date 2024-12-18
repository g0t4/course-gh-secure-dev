#!/usr/bin/env bash

./1-create-jwt.sh
# ./2-get-install-id.sh # do by hand to pick install id
# if no install id file tmp/install_id then bail
if [ ! -f tmp/install_id ]; then
    echo "missing tmp/install_id, use ./2-get-install-id.sh"
    exit 1
fi
./3-install-token.sh
./4-use-it.sh

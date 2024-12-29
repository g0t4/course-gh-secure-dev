#!/bin/bash

token=$(security find-generic-password -s github -a pat-test-audit -w)

curl -H "Authorization: token $token" \
    https://api.github.com/rate_limit

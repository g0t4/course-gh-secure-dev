#!/bin/bash

token=$(security find-generic-password -s github -a pat-test-audit -w)

enterprise=wes-enterprise

curl -H "Authorization: token $token" \
    https://api.github.com/enterprises/$enterprise/audit-log

#!/bin/bash

token=$(security find-generic-password -s github -a pat-test-audit -w)

# org=org-wes-dev
org=org-wes-sales

curl -H "Authorization: token $token" \
    https://api.github.com/orgs/$org/audit-log

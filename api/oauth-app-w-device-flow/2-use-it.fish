#!/usr/bin/env bash

# use the access token to make authenticated requests
access_token=$(cat tmp/access_token.json | jq .access_token -r)

curl -X GET https://api.github.com/user \
    -H "Authorization: token $access_token" \
    -H "Accept: application/json" 

#echo
#echo "repos:"
#curl -X GET https://api.github.com/user/repos \
#    -H "Authorization: token $access_token" \
#    -H "Accept: application/json"

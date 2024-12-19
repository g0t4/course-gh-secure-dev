#!/usr/bin/env bash 

client_id=$(cat tmp/client_id)

# https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps#device-flow

# 1 - request device flow codes
# scopes https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/scopes-for-oauth-apps
curl -sSL -X POST https://github.com/login/device/code \
    -d "client_id=$client_id" -d "scope=repo" \
    -H "Accept: application/json" >tmp/code_response.json

device_code=$(jq -r .device_code <tmp/code_response.json)
user_code=$(jq -r .user_code <tmp/code_response.json)
verification_uri=$(jq -r .verification_uri <tmp/code_response.json)

echo "Go to $verification_uri and enter $user_code to authorize the app."
echo "Press Enter when done."

read

# 2 - poll now for the access token (after user authorizes the app)
curl -sSL -X POST https://github.com/login/oauth/access_token \
    -d "client_id=$client_id" -d "device_code=$device_code" -d "grant_type=urn:ietf:params:oauth:grant-type:device_code" \
    -H "Accept: application/json" >tmp/access_token.json

echo "Access token response:"
cat tmp/access_token.json

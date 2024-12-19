#!/usr/bin/env bash

#  *** device flow w/ GH App ***
#  https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/generating-a-user-access-token-for-a-github-app#using-the-device-flow-to-generate-a-user-access-token
#  SAME STEPS as OAuth device flow, client_id just points to a GH App instead (note no use of gh-app private key b/c the user is authorizing in this case)
client_id=$(cat tmp/client_id)

curl -X POST https://github.com/login/device/code \
    -d "client_id=$client_id" -d "scope=repo" \
    -H "Accept: application/json" \
    --dump-header tmp/code_response_headers.txt >tmp/code_response.json

device_code=$(jq -r .device_code tmp/code_response.json)
user_code=$(jq -r .user_code tmp/code_response.json)
verification_uri=$(jq -r .verification_uri tmp/code_response.json)

echo "Go to $verification_uri and enter $user_code to authorize the gh app..."
echo "Press enter when done..."
read


# then request access token, will either return it or if user didn't authorize it yet, will return authorization_pending
curl -X POST https://github.com/login/oauth/access_token \
    -d "client_id=$client_id" -d "device_code=$device_code" -d "grant_type=urn:ietf:params:oauth:grant-type:device_code" \
    -H "Accept: application/json" \
    --dump-header tmp/access_token_headers.txt >tmp/access_token.json

echo "token response:"
cat tmp/access_token.json

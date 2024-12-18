#!/usr/bin/env bash



install_id=$(cat install_id.txt)

# Get Installation Access Token
# https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/generating-an-installation-access-token-for-a-github-app
#   note: expires, permissions, repos
curl -sSL --request POST \
    --header "Accept: application/vnd.github+json" \
    --header "Authorization: Bearer $(cat current.jwt)" \
    --header "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/app/installations/$install_id/access_tokens \
    | jq -r .token > install_token.txt




#!/usr/bin/env bash

# Get Install ID
curl -sSL --request GET \
    --header "Accept: application/vnd.github+json" \
    --header "Authorization: Bearer $(cat tmp/current.jwt)" \
    --header "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/app/installations \
    | jq ".[] | {id, app_slug}"

# review app installs
# save install_id to tmp/install_id
# pbpaste > tmp/install_id

## other things to try:
#
#     https://api.github.com/app
#
# # (optional) HEADERS for rate limit info
# curl -sSL -I --request GET \
#     --header "Accept: application/vnd.github+json" \
#     --header "Authorization: Bearer $(cat current.jwt)" \
#     --header "X-GitHub-Api-Version: 2022-11-28" \
#     https://api.github.com/app/installations

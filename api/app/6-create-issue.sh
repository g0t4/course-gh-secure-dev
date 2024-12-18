#!/usr/bin/env bash

install_token=$(cat tmp/install_access_token)

# list issues
curl -sSL --request POST \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    -H "Authorization: Bearer $install_token" \
    https://api.github.com/repos/course-prep/tmp-ghsec-private/issues \
        -d '{
               "title":"Found an issue 2",
               "body":"Created with curl via gh-app install token",
               "labels":["bug"]
           }'

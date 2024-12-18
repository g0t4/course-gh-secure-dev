#!/usr/bin/env bash



install_id=$(cat install_id.txt)

# Get Installation Access Token
# https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/generating-an-installation-access-token-for-a-github-app
#   note: expires, permissions, repos
curl -sSL --request POST \
    --header "Accept: application/vnd.github+json" \
    --header "Authorization: Bearer $(cat current.jwt)" \
    --header "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/app/installations/$install_id/access_tokens
install_token=$(pbpaste)



# USE TOKEN
# List Repos the Install Has Access To
curl -sSL --request GET \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    -H "Authorization: Bearer $install_token" \
    https://api.github.com/installation/repositories

# make sure one of repos is private to convey access isn't just to a public repo


# can use w/ GH cli
GH_TOKEN=(echo $install_token)  gh api graphql -f query='query { viewer { login } }'
GH_TOKEN=(echo $install_token)  gh auth status
echo $install_token | gh auth login --with-token





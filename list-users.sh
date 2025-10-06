#!/bin/bash
# Shebang - always placed at the very beginning of the script to specify which interpreter to execute the script

# Github API url - docs: https://docs.github.com/en/rest/pulls/pulls?apiVersion=2022-11-28
API_URL="https://api.github.com"

# github username and personal access token (PAT) - to be exported on the terminal as an env variable
USERNAME=$username
TOKEN=$token

# user and repository information using positional parameters
REPO_OWNER=$1
REPO_NAME=$2

# function to make a GET request to the Github API. This function only to create a reusable curl command
function github_api_get() {
    local endpoint=$1
    local url="${API_URL}/${endpoint}"

    # send a GET request using curl with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "${url}" 
}

# function to list users with READ access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # fetch all collaborators for the repo, filter those with read access, extract their usernames, and store them in the collaborators variable as a list
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with READ access found for the repo ${REPO_OWNER}/${REPO_NAME}."
    else 
        echo "Users with READ access to the repo ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

# the main script that calls above functions
echo "Listing users with READ access to the repo ${REPO_OWNER}/${REPO_NAME}:"
list_users_with_read_access

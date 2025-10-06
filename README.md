# Shell script to remotely manage access to a Github repository

This shell script requires GitHub integration <br>
To interact with any application, there are 2 ways:
1. API: Ex. We can use boto3 module to interact with AWS using python scripts
2. CLI: Ex. kubectl to talk to k8s clusters

Github can be integrated using both API and CLI

You can directly talk to API of Github and get required information.

Every API will have a API reference documentation.

Github API documentation: https://docs.github.com/en/rest?apiVersion=2022-11-28

If using Shell scripting, curl is the module to interact with the API's. Similarly, if Python - requests, etc.

Use shell script to list people who have access to repo: list-users.sh

The script is all about this command from the github api documentation:
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR-TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/OWNER/REPO/collaborators/USERNAME/permission

To make this re-usable and readable, I have used functions accordingly

Create an ec2 instance. SSH into it. Clone the shell script and run it against a repository to programmatically list users.

export username and token

Execute the script

$ ./list-users.sh PrakyathReddy Shell-script-GitHub-Integration<br>
Listing users with READ access to the repo PrakyathReddy/Shell-script-GitHub-Integration:<br>
Users with READ access to the repo PrakyathReddy/Shell-script-GitHub-Integration:<br>
PrakyathReddy<br>

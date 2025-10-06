# Shell script to remotely manage access to a Github repository

This shell script requires GitHub integration
To interact with any application, there are 2 ways:
1. API: Ex. We can use boto3 module to interact with AWS using python scripts
2. CLI: Ex. kubectl to talk to k8s clusters

Github can be integrated using both API and CLI

You can directly talk to API of Github and get required information.

Every API will have a API reference documentation.

Github API documentation: https://docs.github.com/en/rest?apiVersion=2022-11-28

If using Shell scripting, curl is the module to interact with the API's. Similarly, if Python - requests, etc.

Use shell script to list people who have access to repo

Create an ec2 instance. Clone the shell script and run it against a repository to programmatically list users.


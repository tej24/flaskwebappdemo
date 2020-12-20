# flask Web app demo
To demo a simple flask web app  by deploying it in Azure using terraform

## components
- Basic flask app written in python to say "Hello world" when the server is hit (app.py)
- Docker image of this flask app pushed to dockerhub registry (Dockerfile)
- Terraform file to deploy this docker image as an Azure app service in cloud (deploy.tf)
- Requirements file to install Flask python package in the dev environment (requirments.txt)
- Azure pipelines yaml which has the CI CD defintions to deploy the app in Azure app service (azure-pipelines.yaml) - Currently running from container only



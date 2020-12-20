# flask Web app demo
To demo a simple flask web app written in Python by deploying it in Azure using terraform

## components
- Basic **flask** app written in **python** to say "Hello world" when the server is hit (app.py)
- **Docker** image of this flask app pushed to **dockerhub registry** (Dockerfile)
- **Terraform** file to deploy this docker image as an **Azure app service** in cloud (deploy.tf)
- Requirements file to install Flask python package in the dev environment (requirments.txt)
- **Azure pipelines** yaml which has the CI CD defintions to deploy the app in Azure app service (azure-pipelines.yaml) - Currently running from container only and not from terraform

## how to run

- Launch the Azure shell from azure portal(your account)
- cd to folder /home/thejus/RSA/deploy
- For fresh deployment through terraform , run the below commands(uses deploy.tf file to deploy) -

 terraform init
 terraform plan
 terraform apply
 
- The above commands will create a eventually deploying the flask web app in azure cloud -
   
   resource group -> app service plan -> app service
   
  
 ## Output
 
 - Hit the UI shown in the App service URL section in Azure portal 
 
 https://flasktest-dockerapp.azurewebsites.net
 
- Shows a page with message **Hello from an Azure Web App running on Linux from thejus laptop!**

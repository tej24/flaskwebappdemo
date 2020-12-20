# Configure the Azure provider

terraform {
  required_version = "~> 0.14.2"
  required_providers {
    azurerm = "=2.41.0"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "flasktestrg" {
    name = "flasktestResourceGroup"
    location = "westus2"
}

resource "azurerm_app_service_plan" "flasktest" {
    name                = "flasktestAppServicePlan"
    location            = azurerm_resource_group.flasktestrg.location
    resource_group_name = azurerm_resource_group.flasktestrg.name

    # Define Linux as Host OS
    kind = "Linux"
    reserved = true

    sku {
        tier = "Standard"
        size = "S1"
    }

}


# Create an Azure Web App for Containers in that App Service Plan
resource "azurerm_app_service" "dockerapp" {
  name                = "flasktest-dockerapp"
  location            = azurerm_resource_group.flasktestrg.location
  resource_group_name = azurerm_resource_group.flasktestrg.name
  app_service_plan_id = azurerm_app_service_plan.flasktest.id


  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false


    # Settings for private Container Registires
    DOCKER_REGISTRY_SERVER_URL      = "https://index.docker.io"
    DOCKER_REGISTRY_SERVER_USERNAME = "thejus55"
    DOCKER_REGISTRY_SERVER_PASSWORD = "dockthej*2020"

  }

  # Configure Docker Image to load on start
  site_config {
    linux_fx_version = "DOCKER|thejus55/flaskwebapp:1.0"
    always_on        = "true"
  }

  identity {
    type = "SystemAssigned"
  }
}

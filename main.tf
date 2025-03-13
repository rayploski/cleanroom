# Configure the Azure provider
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }

    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = true
    }
  }
}

provider "random" {
}

# Generate a random name
resource "random_pet" "name" {
}

# Create the Azure esource group
# 
resource "azurerm_resource_group" "rg" {
  name     = "cbc-${random_pet.name.id}"
  location = var.location
}


# Manage the app service
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "cbc-asp-${random_pet.name.id}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "B1" 
}

# Create the web app, pass in the App Service Plan ID
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app
resource "azurerm_linux_web_app" "webapp" {
  name                = "webapp-${random_pet.name.id}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.appserviceplan.id
  depends_on          = [azurerm_service_plan.appserviceplan]
  https_only          = true
  site_config {
    minimum_tls_version = "1.2"
    application_stack {
      node_version = "16-lts"
    }
  }
}

#  Deploy code from a public GitHub repo
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_source_control
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id                 = azurerm_linux_web_app.webapp.id
  repo_url               = var.repository_url
  branch                 = "main"
  use_manual_integration = true
  use_mercurial          = false
}
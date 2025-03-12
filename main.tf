

# This allows us to get the tenant id
data "azapi_client_config" "current" {}

# Include the additional policies and override archetypes
provider "alz" {
  library_overwrite_enabled = true
  library_references = [
    {
      path = "platform/alz",
      ref  = "2025.03.12"
    },
    {
      custom_url = "${path.root}/lib"
    }
  ]
}

# Terraform module to deploy Azure Landing Zone. 
# See https://registry.terraform.io/modules/Azure/avm-ptn-alz/azurerm/latest for additional details 
# on the module. For more information on Azure Landing Zones see https://azure.github.io/Azure-Landing-Zones/accelerator/
module "alz_architecture" {
  source  = "azure/avm-ptn-alz/azurerm//examples/default"
  version = ">= 0.11.1"
}



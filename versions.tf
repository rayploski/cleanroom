terraform {
  required_version = ">= 1.9, < 2.0"

  required_providers {
    alz = {
      source  = "azure/alz"
      version = "~> 0.17"
    }

    azapi = {
      source  = "azure/azapi"
      version = "~> 2.0, >= 2.0.1"
    }

    modtm = {
      source  = "azure/modtm"
      version = ">= 0.3.5"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.6"
    }

    time = {
      source  = "hashicorp/time"
      version = ">= 0.9"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.21.1"
    }


  }
}
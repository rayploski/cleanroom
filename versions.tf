terraform {
  required_version = ">= 1.9, < 2.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.22.0"
    }


    random = {
      source  = "hashicorp/random"
      version = ">= 3.6"
    }

    time = {
      source  = "hashicorp/time"
      version = ">= 0.9"
    }

  }
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.14.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "RG-storageaccountsouthindia-dev"
    storage_account_name = "bluboiistorage"
    container_name       = "tfstate"
    key                  = "aks/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
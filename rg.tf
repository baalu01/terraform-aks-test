provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-${var.location}-${var.location}"
  location = var.location
  }

resource "azurerm_resource_group" "sa_rg" {
  name     = "RG-${var.stack}-${var.location}-${var.envname}"
  location = var.location
  }

resource "azurerm_storage_account" "tfstate" {
  name                     = "bluboiistorage"
  resource_group_name      = azurerm_resource_group.sa_rg.name
  location                 = azurerm_resource_group.sa_rg.location
  account_tier             = "Standard"
  access_tier              = "Cool"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}
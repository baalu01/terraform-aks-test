resource "azurerm_resource_group" "aks_rg" {
  name     = "RG-${var.stack}-${var.location}-${var.envname}"
  location = var.location
  }

  resource "azurerm_kubernetes_cluster" "aks" {
  name                = "1-${var.stack}${var.location}-${var.envname}"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "dev"
  }
}
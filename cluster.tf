provider "azurerm" {
  features {}
 
 
  subscription_id   = "94e82c16-35e8-4375-99f7-01c788dd9c3c"
  tenant_id         = "28c01656-58dc-4e93-a586-3233d63ffafe"
  client_id         = "6f86d558-a721-459c-a946-13e87cf329a4"
  client_secret     = "9307923c-6410-4fbd-b59a-b67d0312860a"
}

resource "azurerm_resource_group" "rsg" {
  name     = "KTJ"
  location = "Sweden Central"
}

resource "azurerm_kubernetes_cluster" "KTJ" {
  name                = "KTJ"
  location            = "East Asia"
  resource_group_name = azurerm_resource_group.rsg.name
  dns_prefix          = "akdnsprefix"
  kubernetes_version  = "1.25.6"

  default_node_pool {
    name       = "agentpool"
    node_count = 2
    vm_size    = "Standard_B2s"
    zones      = ["1"]
  }
  identity {
    type = "SystemAssigned"
  }
}

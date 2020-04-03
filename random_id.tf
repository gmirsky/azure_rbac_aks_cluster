resource "random_id" "workspace" {
  keepers = {
    group_name = azurerm_resource_group.k8s.name
  }
  byte_length = 8
}

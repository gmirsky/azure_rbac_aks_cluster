resource "azurerm_resource_group" "k8s" {
  name     = var.rg-name
  location = var.location
  tags = merge(
    var.common_tags,
    var.project_tags
  )
}
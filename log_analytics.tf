resource "azurerm_log_analytics_workspace" "main" {
  name                = "${var.clustername}-LogAnalyticsWorkspace-${random_id.workspace.hex}"
  count               = var.log_analytics_enabled ? 1 : 0
  location            = azurerm_resource_group.k8s.location
  resource_group_name = azurerm_resource_group.k8s.name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_retention_in_days
  tags = merge(
    var.common_tags,
    var.project_tags
  )
}

resource "azurerm_log_analytics_solution" "main" {
  solution_name         = "ContainerInsights"
  count                 = var.log_analytics_enabled ? 1 : 0
  location              = azurerm_resource_group.k8s.location
  resource_group_name   = azurerm_resource_group.k8s.name
  workspace_resource_id = azurerm_log_analytics_workspace.main[0].id
  workspace_name        = azurerm_log_analytics_workspace.main[0].name
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

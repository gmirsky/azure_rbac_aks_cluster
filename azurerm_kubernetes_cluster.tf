resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.clustername
  location            = var.location
  resource_group_name = var.rg-name
  dns_prefix          = var.clustername

  default_node_pool {
    name                = "default"
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = true
    node_count          = var.node_count
    max_count           = var.cluster_maximum_count
    min_count           = var.cluster_minimum_count
    vm_size             = var.virtual_machine_size
    os_disk_size_gb     = var.os_disk_size_gb
    max_pods            = var.maximum_pods_per_node
  }
  service_principal {
    client_id     = azuread_application.aks_sp.application_id
    client_secret = random_password.aks_sp_pwd.result
  }
  role_based_access_control {
    azure_active_directory {
      client_app_id     = azuread_application.aks-aad-client.application_id
      server_app_id     = azuread_application.aks-aad-srv.application_id
      server_app_secret = random_password.aks-aad-srv.result
      tenant_id         = data.azurerm_subscription.current.tenant_id
    }
    enabled = true
  }
  addon_profile {
    kube_dashboard {
      enabled = true
    }
    oms_agent {
      enabled                    = var.log_analytics_enabled
      log_analytics_workspace_id = var.log_analytics_enabled ? azurerm_log_analytics_workspace.main[0].id : null
    }
  }
  depends_on = [
    null_resource.delay,
    azuread_service_principal.aks-aad-srv,
    azurerm_role_assignment.aks_sp_role_assignment,
    azuread_service_principal_password.aks_sp_pwd
  ]
  tags = merge(
    var.common_tags,
    var.project_tags
  )
}


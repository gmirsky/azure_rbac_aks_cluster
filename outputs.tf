output "server-app-id" {
  value = azuread_application.aks-aad-srv.application_id
}

output "client-app-id" {
  value = azuread_application.aks-aad-client.application_id
}

output "host" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config.0.host
}

output "client_key" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_key
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_certificate
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config.0.cluster_ca_certificate
}

provider "azurerm" {
  # Pin to this version (1.38.0) of the azurerm provider.
  # seems that version 2.0 has issues with AKS and IAM interacting
  version = "=1.38.0"
}

provider "azuread" {
  version = "~> 0.3"
}

provider "random" {
  version = "~> 2.2"
}

provider "null" {
  version = "~> 2.1"
}

provider "kubernetes" {
  version                = "~> 1.11"
  load_config_file       = false
  host                   = azurerm_kubernetes_cluster.aks.kube_admin_config.0.host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_admin_config.0.cluster_ca_certificate)
}

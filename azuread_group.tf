resource "azuread_group" "aks-aad-clusteradmins" {
  name = "${var.clustername}clusteradmin"
}

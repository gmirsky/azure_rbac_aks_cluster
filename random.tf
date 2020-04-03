resource "random_password" "aks-aad-srv" {
  length  = var.password_length
  special = true
}

resource "random_password" "aks_sp_pwd" {
  length  = var.password_length
  special = true
}
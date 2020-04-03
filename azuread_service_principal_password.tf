resource "azuread_service_principal_password" "aks_sp_pwd" {
  service_principal_id = azuread_service_principal.aks_sp.id
  value                = random_password.aks_sp_pwd.result
  end_date_relative    = var.end_date_relative_in_hours
  lifecycle {
    ignore_changes = [end_date]
  }
}

resource "azuread_application_password" "aks-aad-srv" {
  application_object_id = azuread_application.aks-aad-srv.object_id
  value                 = random_password.aks-aad-srv.result
  end_date_relative     = var.end_date_relative_in_hours
  lifecycle {
    ignore_changes = [end_date]
  }
}

resource "azuread_service_principal" "aks-aad-srv" {
  application_id = azuread_application.aks-aad-srv.application_id
}

resource "azuread_service_principal" "aks-aad-client" {
  application_id = azuread_application.aks-aad-client.application_id
}

resource "azuread_service_principal" "aks_sp" {
  application_id = azuread_application.aks_sp.application_id
}

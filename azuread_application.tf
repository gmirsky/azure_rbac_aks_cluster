resource "azuread_application" "aks-aad-srv" {
  name                       = "${var.clustername}srv"
  homepage                   = "https://${var.clustername}srv"
  identifier_uris            = ["https://${var.clustername}srv"]
  reply_urls                 = ["https://${var.clustername}srv"]
  type                       = "webapp/api"
  group_membership_claims    = "All"
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = false
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id   = "7ab1d382-f21e-4acd-a863-ba3e13f7da61"
      type = "Role"
    }
    resource_access {
      id   = "06da0dbc-49e2-44d2-8312-53f166ab848a"
      type = "Scope"
    }
    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type = "Scope"
    }
  }
  required_resource_access {
    resource_app_id = "00000002-0000-0000-c000-000000000000"
    resource_access {
      id   = "311a71cc-e848-46a1-bdf8-97ff7156d8e6"
      type = "Scope"
    }
  }
}

resource "azuread_application" "aks-aad-client" {
  name       = "${var.clustername}client"
  homepage   = "https://${var.clustername}client"
  reply_urls = ["https://${var.clustername}client"]
  type       = "native"
  required_resource_access {
    resource_app_id = azuread_application.aks-aad-srv.application_id
    resource_access {
      id   = azuread_application.aks-aad-srv.oauth2_permissions.0.id
      type = "Scope"
    }
  }
}

resource "azuread_application" "aks_sp" {
  name                       = var.clustername
  homepage                   = "https://${var.clustername}"
  identifier_uris            = ["https://${var.clustername}"]
  reply_urls                 = ["https://${var.clustername}"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = false
}

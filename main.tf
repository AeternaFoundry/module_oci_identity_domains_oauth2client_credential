resource "oci_identity_domains_oauth2client_credential" "identity_domains_oauth2client_credentials" {
  for_each = var.identity_domains_oauth2client_credentials

  idcs_endpoint                = each.value.idcs_endpoint
  name                         = each.value.name
  schemas                      = each.value.schemas
  attribute_sets               = each.value.attribute_sets
  attributes                   = each.value.attributes
  authorization                = each.value.authorization
  description                  = each.value.description
  expires_on                   = each.value.expires_on
  is_reset_secret              = each.value.is_reset_secret
  ocid                         = each.value.ocid
  resource_type_schema_version = each.value.resource_type_schema_version
  status                       = each.value.status

  dynamic "scopes" {
    for_each = each.value.scopes
    content {
      audience = scopes.value.audience
      scope    = scopes.value.scope
    }
  }

  dynamic "tags" {
    for_each = each.value.tags != null ? each.value.tags : []
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "urnietfparamsscimschemasoracleidcsextensionself_change_user" {
    for_each = each.value.urnietfparamsscimschemasoracleidcsextensionself_change_user != null ? [each.value.urnietfparamsscimschemasoracleidcsextensionself_change_user] : []
    content {
      allow_self_change = urnietfparamsscimschemasoracleidcsextensionself_change_user.value.allow_self_change
    }
  }

  dynamic "user" {
    for_each = each.value.user != null ? [each.value.user] : []
    content {
      ocid  = user.value.ocid
      value = user.value.value
    }
  }
}


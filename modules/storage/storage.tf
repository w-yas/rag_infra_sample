resource "azurerm_storage_account" "this" {
  for_each = var.storage
  name     = replace("${var.common.prefix}-${each.value.name}", "-", "")
  location = var.common.location
  resource_group_name = var.resource_group.resource_group_01.name
  account_tier       = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  network_rules {
    default_action = each.value.network_rules.default_action
    ip_rules       = each.value.network_rules.ip_rules
  }
}


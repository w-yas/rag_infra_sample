resource "azurerm_storage_account" "this" {
  for_each = var.storage
  name     = each.value.name
  location = var.common.location
}
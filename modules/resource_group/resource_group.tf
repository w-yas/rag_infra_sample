resource "azurerm_resource_group" "this" {
  for_each = var.resource_group
  name     = "${var.common.prefix}-${each.value.name}"
  location = var.common.location
}
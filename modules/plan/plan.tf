resource "azurerm_service_plan" "this" {
  for_each            = var.plan
  name                = "${var.common.prefix}-${each.value.name}"
  resource_group_name = var.resource_group.resource_group_01.name
  location            = var.common.location
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
}
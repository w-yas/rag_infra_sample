resource "azurerm_service_plan" "this" {
  for_each            = var.plan
  name                = each.value.name
  resource_group_name = var.resource_group.name
  location            = var.common.location
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
}
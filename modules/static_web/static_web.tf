resource "azurerm_static_web_app" "this" {
  name                = "${var.common.prefix}-${var.static_web.name}"
  resource_group_name = var.resource_group.resource_group_01.name
  location            = var.common.location
  sku_tier            = var.static_web.sku_tier
}
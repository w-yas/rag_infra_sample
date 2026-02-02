resource "azurerm_search_service" "this" {
  name                = var.search.name
  resource_group_name = var.resource_group.resource_group_01.name
  location            = var.common.location
  sku                 = var.search.sku
  
  # using both Azure AD and API keys
  local_authentication_enabled = var.search.local_authentication_enabled
  authentication_failure_mode = var.search.authentication_failure_mode
}
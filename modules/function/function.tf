resource "azurerm_linux_function_app" "this" {
  name                = "${var.common.prefix}-${var.function.name}"
  location            = var.common.location
  resource_group_name = var.resource_group.resource_group_01.name
  service_plan_id     = var.plan[var.function.plan_name].id

  storage_account_name = var.storage[var.function.storage_name].name
  storage_account_access_key = var.storage[var.function.storage_name].primary_access_key

  site_config {
    application_stack {
      python_version = "3.12"
    }
  }
}
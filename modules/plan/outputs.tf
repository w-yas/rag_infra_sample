output "app-plan01" {
  description = "The ID of the App Service Plan"
  value       = azurerm_service_plan.this["app-plan01"]
}

output "func-plan01" {
  description = "The ID of the Function App Service Plan"
  value       = azurerm_service_plan.this["func-plan01"]
}
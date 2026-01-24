output "plan-01" {
  description = "The ID of the App Service Plan"
  value       = azurerm_service_plan.this["plan-01"]
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.1.0"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  # subscription_id = var.common.subscription_id
  features {}
}

module "resource_group" {
  source         = "../../modules/resource_group"
  common         = var.common
  resource_group = var.resource_group
}

module "plan" {
  source         = "../../modules/plan"
  common         = var.common
  resource_group = module.resource_group
  plan           = var.plan
}

module "app_service" {
  source         = "../../modules/app_service"
  common         = var.common
  plan           = module.plan
  app_service    = var.app_service
  resource_group = module.resource_group
}

# module "storage" {
#   source = "../../modules/storage"
#   common = var.common
#   storage = var.storage
# }


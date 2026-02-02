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

module "postgres" {
  source = "../../modules/postgresql"
  common         = var.common
  resource_group = module.resource_group
  postgresql     = var.postgresql
}

module "storage" {
  source         = "../../modules/storage"
  common         = var.common
  storage        = var.storage
  resource_group = module.resource_group
}

module "static_web" {
  source         = "../../modules/static_web"
  common         = var.common
  static_web     = var.static_web
  resource_group = module.resource_group
}

module "search" {
  source         = "../../modules/search"
  common         = var.common
  search         = var.search
  resource_group = module.resource_group
}

module "function" {
  source          = "../../modules/function"
  common         = var.common
  function       = var.function
  resource_group = module.resource_group
  storage        = module.storage.funcst01
  plan           = module.plan
}
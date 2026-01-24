
variable "common" {
  description = ""
  type        = object({
    prefix    = string
    location  = string
    env       = string
  })
  default = {
    prefix    = "dev-ys"
    location  = "japaneast"
    env       = "dev"
  }
}


variable "resource_group" {
  description = ""
  type        = map(object({
    name      = string
  }))
  default = {
    "rg-01" = {
      name      = "rg-01"
    }
  }
}

variable "plan" {
  description = ""
  type        = map(object({
    name      = string
    sku_name  = string
    os_type   = string
  }))
  default = {
    "plan-01" = {
      name      = "plan-01"
      sku_name  = "F1"
      os_type   = "Linux"
    }
  }
}

variable "app_service" {
  description = ""
  type          = map(object({
    name        = string
    plan_name   = string
    https_only  = bool
    ip_restriction = object({
      name       = string
      action     = string
      ip_address = string
      priority   = number
    })
    always_on  = bool
  }))
  default = {
    "app-service-01" = {
      name       = "app-service-01"
      plan_name  = "plan-01"
      https_only = true
      ip_restriction = {
        name       = "AllowSpecificIP"
        action     = "Allow"
        ip_address = "175.177.49.34"
        priority   = 100
      }
      always_on  = true
    }
  }
}

variable "static_web" {
  description = ""
  type       = object({
    name       = string
    sku_tier   = string
    basic_auth = object({
      password = string
      enviroments_to_apply = list(string)
    })
  })
  default = {
    name      = "static-web-01"
    sku_tier  = "Free"
    basic_auth = {
      password = "ChangeMe123!@#ieq"
      enviroments_to_apply = ["AllEnvironments"]
    }
  }
}

variable "storage" {
  description = ""
  type        = object({
    name         = string
    account_tier = string
    account_replication_type = string
  })
  default = {
    name         = "storageaccount01"
    account_tier = "Standard"
    account_replication_type = "LRS"
  }
}

variable "search" {
  description = ""
  type        = object({
    name = string
    sku  = string
    local_authentication_enabled = bool
  })
  default = {
    name = "search-01"
    sku  = "free"
    local_authentication_enabled = false
  }
}

variable "postgresql" {
  description = ""
  type        = object({
    name      = string
    administrator_login          = string
    administrator_login_password = string 

    sku_name   = string
    version    = string
    storage_mb = number

    backup_retention_days        = number
    geo_redundant_backup_enabled = bool
    auto_grow_enabled            = bool

    public_network_access_enabled = bool
    ssl_enforcement_enabled       = bool
    ssl_minimal_tls_version       = string
  })
  default = {
    name    = "postgresql-01"
    administrator_login          = "adminuser"
    administrator_login_password = "ChangeMe123!@#ieq"
    sku_name   = "B_Gen5_1"
    version    = "11"
    storage_mb = 5120

    backup_retention_days         = 7
    geo_redundant_backup_enabled  = false
    auto_grow_enabled             = true
    public_network_access_enabled = true
    ssl_enforcement_enabled       = true
    ssl_minimal_tls_version       = "TLS1_2"
  }
}
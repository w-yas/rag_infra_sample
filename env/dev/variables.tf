
variable "common" {
  description = ""
  type        = object({
    prefix    = string
    location  = string
    env       = string
  })
  default = {
    prefix    = "dev-ys"
    location  = "westus2"
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
      name      = "rg01"
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
    "app-plan01" = {
      name      = "app-plan01"
      sku_name  = "F1"
      os_type   = "Linux"
    }
    "func-plan01" = {
      name      = "func-plan01"
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
      name       = "app-service01"
      plan_name  = "app-plan01"
      https_only = true
      ip_restriction = {
        name       = "AllowSpecificIP"
        action     = "Allow"
        ip_address = "175.177.49.34/32"
        priority   = 100
      }
      always_on  = false
    }
  }
}

variable "static_web" {
  description = ""
  type       = object({
    name       = string
    sku_tier   = string
  })
  default = {
    name      = "static-web01"
    sku_tier  = "Free"
  }
}

variable "storage" {
  description = ""
  type        = map(object({
    name                            = string
    account_tier                    = string
    account_replication_type        = string
    min_tls_version                 = string
    allow_nested_items_to_be_public = bool
    shared_access_key_enabled       = bool
    default_to_oauth_authentication = bool
    network_rules = object({
      default_action = string
      ip_rules       = list(string) 
    })
  }))
  default = {
    "funcst01" = {
      name                            = "funcst01"
      account_tier                    = "Standard"
      account_replication_type        = "LRS"
      min_tls_version                 = "TLS1_3"
      allow_nested_items_to_be_public = false
      shared_access_key_enabled       = true
      default_to_oauth_authentication = true
      network_rules = {
        default_action = "Deny"
        ip_rules       = ["175.177.49.34"]
      }
    }
  }
}

variable "search" {
  description = ""
  type        = object({
    name = string
    sku  = string
    local_authentication_enabled = bool
    authentication_failure_mode  = string
  })
  default = {
    name = "search01"
    sku  = "free"
    local_authentication_enabled = true
    authentication_failure_mode  = "http403"
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
    database = object({
      name     = string
      collation = string
      charset  = string
    })
  })
  default = {
    name    = "postgresql01"
    administrator_login          = "psqladmin"
    administrator_login_password = "^qgTqS=O}(o&!L~:"
    sku_name   = "B_Standard_B1ms"
    version    = "12"
    storage_mb = 32768

    backup_retention_days         = 7
    geo_redundant_backup_enabled  = false
    auto_grow_enabled             = false
    public_network_access_enabled = true
    database = {
      name     = "appdb"
      collation = "en_US.utf8"
      charset  = "UTF8"
    }
  }
}

variable "function" {
  description = ""
  type = object({
    name       = string
    plan_name  = string
    https_only = bool
    storage_name = string
  })
  default = {
    name        = "func-app01"
    plan_name   = "func-plan01"
    https_only  = true
    storage_name = "funcst01"
  }
}
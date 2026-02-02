resource "azurerm_postgresql_flexible_server" "this" {
  name                = "${var.common.prefix}-${var.postgresql.name}"
  resource_group_name = var.resource_group.resource_group_01.name
  location            = var.common.location
  version             = var.postgresql.version
  administrator_login = var.postgresql.administrator_login
  administrator_password = var.postgresql.administrator_login_password
  storage_mb = var.postgresql.storage_mb
  sku_name   = var.postgresql.sku_name
  backup_retention_days = lookup(var.postgresql, "backup_retention_days", 7)
  geo_redundant_backup_enabled = lookup(var.postgresql, "geo_redundant_backup_enabled", false)
  auto_grow_enabled            = lookup(var.postgresql, "auto_grow_enabled", false)
  zone = lookup(var.postgresql, "zone", 1)
}


resource "azurerm_postgresql_flexible_server_database" "this" {
  name               = var.postgresql.database.name
  server_id         = azurerm_postgresql_flexible_server.this.id
  collation        = var.postgresql.database.collation
  charset          = var.postgresql.database.charset
  
  lifecycle{
    # prevent_destroy = true
  }
}


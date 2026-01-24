
resource "azurer_resource_group" "this" {
  for_each = var.resource_group
  name     = var.resource_group.name
  location = var.location
}
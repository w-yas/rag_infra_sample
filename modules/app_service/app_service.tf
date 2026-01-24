resource "azurerm_linux_web_app" "this" {
  for_each            = var.app_service
  name                = each.value.name
  resource_group_name = var.resource_group.resource_group_01.name
  location            = var.common.location
  service_plan_id     = var.plan[each.value.plan_name].id
  https_only          = each.value.https_only # 通信をhttpsに制限
  # custom_domain_verification_id = var.app_service.custom_domain_verification_id # カスタムドメインを使用する場合に必要


  app_settings = {
    
  }
  site_config {
    ip_restriction {
      action     = each.value.ip_restriction.action
      name       = each.value.ip_restriction.name
      ip_address = each.value.ip_restriction.ip_address
      priority   = each.value.ip_restriction.priority
    } # IP制限
    always_on = each.value.always_on # アプリの常時稼働
  }
}
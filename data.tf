data "azurerm_subscription" "current" {}

data "external" "cassandra" {
  program = ["bash", "${path.module}/scripts/cassandra_config.sh"]

  query = {
    resource_group = var.azurerm_resource_group
    subscription   = data.azurerm_subscription.current.display_name
    tenant_id      = data.azurerm_subscription.current.tenant_id
  }
}
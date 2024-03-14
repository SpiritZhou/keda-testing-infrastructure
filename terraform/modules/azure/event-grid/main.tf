provider "azurerm" {
  features {}
  skip_provider_registration = true
}

locals {
  event_grid_name = "${var.unique_project_name}-e2e-event-grid"
  event_grid_subscription_name = "${var.unique_project_name}-e2e-event-grid-subscription"
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_eventgrid_topic" "eventgrid" {
  name                = local.event_grid_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tags = var.tags
}

resource "azurerm_eventgrid_event_subscription" "eventsubscription" {
  name  = local.event_grid_subscription_name
  scope = data.azurerm_resource_group.rg.id

  service_bus_topic_endpoint_id = module.azurerm_servicebus_topic.id
}

resource "azurerm_role_assignment" "roles" {
  count                = length(var.event_grid_admin_identities)
  scope                = azurerm_eventgrid_topic.eventgrid.id
  role_definition_name = "Azure Event Grid Owner"
  principal_id         = var.event_grid_admin_identities[count.index].principal_id
}

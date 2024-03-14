output "connection_string" {
  value = azurerm_servicebus_namespace_authorization_rule.manage.primary_connection_string
}

output "receive_event_grid_id" {
  value = azurerm_servicebus_topic.topic.id
}
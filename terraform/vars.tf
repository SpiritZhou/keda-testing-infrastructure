variable "azure_resource_group_name" {
  default     = "keda-e2e-infrastructure-retry"
  type        = string
  description = "Resource group name where azure resources will be placed"
}

variable "unique_project_name" {
  default     = "kedaretry"
  type        = string
  description = "Value to make unique every resource name generated"
}

variable "repository" {
  default     = "SpiritZhou/keda"
  type        = string
  description = "Repository where secrets will be created/updated"
}

variable "performance_repository" {
  default     = "kedacore/keda-performance"
  type        = string
  description = "Repository where secrets will be created/updated"
}


variable "grafana_slug" {
  default     = "kedacore"
  type        = string
  description = "Grafana Cloud slug"
}
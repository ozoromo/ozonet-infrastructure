variable "scaleway_access_key" {
  description = "Scaleway API access key. Falls back to SCW_ACCESS_KEY when null."
  type        = string
  sensitive   = true
  default     = null
}

variable "scaleway_secret_key" {
  description = "Scaleway API secret key. Falls back to SCW_SECRET_KEY when null."
  type        = string
  sensitive   = true
  default     = null
}

variable "scaleway_project_id" {
  description = "Scaleway project ID. Falls back to SCW_DEFAULT_PROJECT_ID when null."
  type        = string
  default     = null
}

variable "scaleway_organization_id" {
  description = "Scaleway organization ID. Falls back to SCW_DEFAULT_ORGANIZATION_ID when null."
  type        = string
  default     = null
}

variable "scaleway_region" {
  description = "Default Scaleway region."
  type        = string
  default     = "fr-par"
}

variable "scaleway_zone" {
  description = "Default Scaleway zone."
  type        = string
  default     = "fr-par-2"
}

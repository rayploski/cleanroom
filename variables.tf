variable "location" {
  default     = "westus2"
  description = "The default location for resources in this management group. Used for policy managed identities."
}


variable "architecture_name" {
  default     = "CopperRooster"
  description = "The name of the architecture to create. This needs to be of the `*.alz_architecture_definition.[json|yaml|yml]` files."
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = "Enable telemetry for the module."
  nullable    = false
}

locals {
  subscription_id = data.azapi_client_config.current.subscription_id
}
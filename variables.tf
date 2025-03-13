variable "location" {
  default     = "westus2"
  description = "The default location for resources in this management group. Used for policy managed identities."
}

variable "repository_url" {
  default = "https://github.com/Azure-Samples/nodejs-docs-hello-world"
  description = "The Git repository for the application"
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = "Enable telemetry for the module."
  nullable    = false
}

variable "PANOS_HOSTNAME" {
  type        = string
  description = "Requires TF_VAR_PANOS_HOSTNAME environment variable to be set"
}

variable "PANOS_USERNAME" {
  type        = string
  description = "Requires TF_VAR_PANOS_USERNAME environment variable to be set"
}

variable "PANOS_API_KEY" {
  type        = string
  description = "Requires TF_VAR_PANOS_API_KEY environment variable to be set"
}

variable "pan_hostname" {
  type        = string
  description = "Palo Alto firewall hostname"
}

variable "pan_domain" {
  type        = string
  description = "Palo Alto firewall domain name"
}

variable "pan_timezone" {
  type        = string
  description = "Palo Alto firewall timezone"
}

variable "dns_primary" {
  type        = string
  description = "Primary DNS server"
}

variable "dns_secondary" {
  type        = string
  description = "Secondary DNS server"
}

variable "ntp_primary" {
  type        = string
  description = "Primary NTP server"
}

variable "ntp_primary_auth_type" {
  type        = string
  description = "Primary NTP authentication type"
}

variable "ntp_secondary" {
  type        = string
  description = "Secondary NTP server"
}

variable "ntp_secondary_auth_type" {
  type        = string
  description = "Secondary NTP authentication type"
}

variable "pan_mgmt_profile" {
  type        = map(any)
  description = "Palo Alto Management Profile"
}

variable "pan_tags" {
  type        = map(any)
  description = "Tags to apply to resources"
}

variable "pan_addresses" {
  type        = map(any)
  description = "Palo Alto address objects"
}

variable "pan_address_groups" {
  type        = map(any)
  description = "Palo Alto address groups"
}

variable "public_policies" {
  type        = map(any)
  description = "Palo Alto public firewall policies"
}
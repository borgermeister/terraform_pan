resource "panos_general_settings" "device" {
  hostname                = var.pan_hostname
  domain                  = var.pan_domain
  timezone                = var.pan_timezone
  dns_primary             = var.dns_primary
  dns_secondary           = var.dns_secondary
  ntp_primary_address     = var.ntp_primary
  ntp_primary_auth_type   = var.ntp_primary_auth_type
  ntp_secondary_address   = var.ntp_secondary
  ntp_secondary_auth_type = var.ntp_secondary_auth_type

  lifecycle {
    create_before_destroy = true
  }
}

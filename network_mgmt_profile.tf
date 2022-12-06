resource "panos_management_profile" "mgmt-terraform" {
  for_each = var.pan_mgmt_profile

  name          = each.key
  ping          = each.value.ping
  ssh           = each.value.ssh
  http          = each.value.http
  https         = each.value.https
  permitted_ips = each.value.permitted_ips

  lifecycle {
    create_before_destroy = true
  }
}

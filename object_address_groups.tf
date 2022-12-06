resource "panos_address_group" "address_groups" {
  for_each = var.pan_address_groups

  name             = each.key
  description      = each.value.description
  static_addresses = each.value.static_addresses
  tags             = each.value.tags

  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    panos_administrative_tag.tags,
    panos_address_objects.addresses
  ]

}
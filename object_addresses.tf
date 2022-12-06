resource "panos_address_objects" "addresses" {
  for_each = var.pan_addresses

  object {
    name        = each.key
    type        = each.value.type
    value       = each.value.value
    description = each.value.description
    tags        = each.value.tags
  }
  depends_on = [
    panos_administrative_tag.tags
  ]
}

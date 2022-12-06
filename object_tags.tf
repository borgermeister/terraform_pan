resource "panos_administrative_tag" "tags" {
  for_each = var.pan_tags

  name    = each.key
  color   = each.value.color
  comment = each.value.comment

  lifecycle {
    create_before_destroy = true
  }
}

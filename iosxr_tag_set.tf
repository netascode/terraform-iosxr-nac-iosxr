resource "iosxr_tag_set" "tag_set" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].tag_set, null) != null || try(local.defaults.iosxr.configuration.tag_set, null) != null }
  device   = each.value.name

  set_name    = try(local.device_config[each.value.name].tag_set.set_name, local.defaults.iosxr.configuration.tag_set.set_name, null)
  rpl_tag_set = try(local.device_config[each.value.name].tag_set.rpl_tag_set, local.defaults.iosxr.configuration.tag_set.rpl_tag_set, null)
}
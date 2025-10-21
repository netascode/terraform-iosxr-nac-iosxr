resource "iosxr_lacp" "lacp" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].lacp, null) != null || try(local.defaults.iosxr.configuration.lacp, null) != null }
  device   = each.value.name
  mac      = try(local.device_config[each.value.name].lacp.mac, local.defaults.iosxr.configuration.lacp.mac, null)
  priority = try(local.device_config[each.value.name].lacp.priority, local.defaults.iosxr.configuration.lacp.priority, null)
}

resource "iosxr_bgp_as_format" "bgp_as_format" {
  for_each  = { for device in local.devices : device.name => device if try(local.device_config[device.name].bgp_as_format, null) != null || try(local.defaults.iosxr.devices.configuration.bgp_as_format, null) != null }
  device    = each.value.name
  as_format = try(local.device_config[each.value.name].bgp_as_format.as_format, local.defaults.iosxr.devices.configuration.bgp_as_format.as_format, null)
}

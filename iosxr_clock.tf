resource "iosxr_clock" "clock" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].clock, null) != null || try(local.defaults.iosxr.devices.configuration.clock, null) != null }
  device   = each.value.name
  timezone = try(local.device_config[each.value.name].clock.timezone, local.defaults.iosxr.devices.configuration.clock.timezone, null)
}

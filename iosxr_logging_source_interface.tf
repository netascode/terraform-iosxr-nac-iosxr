resource "iosxr_logging_source_interface" "logging_source_interface" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].logging_source_interface, null) != null || try(local.defaults.iosxr.configuration.logging_source_interface, null) != null }
  device   = each.value.name

  name = try(local.device_config[each.value.name].logging_source_interface.name, local.defaults.iosxr.configuration.logging_source_interface.name, null)
  vrfs = try(local.device_config[each.value.name].logging_source_interface.vrfs, local.defaults.iosxr.configuration.logging_source_interface.vrfs, null)
}

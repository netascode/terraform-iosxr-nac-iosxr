resource "iosxr_fpd" "fpd" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].fpd, null) != null || try(local.defaults.iosxr.devices.configuration.fpd, null) != null }
  device   = each.value.name

  auto_upgrade_enable  = try(local.device_config[each.value.name].fpd.auto_upgrade_enable, local.defaults.iosxr.devices.configuration.fpd.auto_upgrade_enable, null)
  auto_upgrade_disable = try(local.device_config[each.value.name].fpd.auto_upgrade_disable, local.defaults.iosxr.devices.configuration.fpd.auto_upgrade_disable, null)
  auto_reload_enable   = try(local.device_config[each.value.name].fpd.auto_reload_enable, local.defaults.iosxr.devices.configuration.fpd.auto_reload_enable, null)
  auto_reload_disable  = try(local.device_config[each.value.name].fpd.auto_reload_disable, local.defaults.iosxr.devices.configuration.fpd.auto_reload_disable, null)
}

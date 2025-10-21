resource "iosxr_cdp" "cdp" {
  for_each              = { for device in local.devices : device.name => device if try(local.device_config[device.name].cdp, null) != null || try(local.defaults.iosxr.configuration.cdp, null) != null }
  device                = each.value.name
  enable                = try(local.device_config[each.value.name].cdp.enable, local.defaults.iosxr.configuration.cdp.enable, null)
  holdtime              = try(local.device_config[each.value.name].cdp.holdtime, local.defaults.iosxr.configuration.cdp.holdtime, null)
  timer                 = try(local.device_config[each.value.name].cdp.timer, local.defaults.iosxr.configuration.cdp.timer, null)
  advertise_v1          = try(local.device_config[each.value.name].cdp.advertise_v1, local.defaults.iosxr.configuration.cdp.advertise_v1, null)
  log_adjacency_changes = try(local.device_config[each.value.name].cdp.log_adjacency_changes, local.defaults.iosxr.configuration.cdp.log_adjacency_changes, null)
}

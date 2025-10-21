resource "iosxr_ipv4_access_list_options" "ipv4_access_list_options" {
  for_each             = { for device in local.devices : device.name => device if try(local.device_config[device.name].ipv4_access_list_options, null) != null || try(local.defaults.iosxr.configuration.ipv4_access_list_options, null) != null }
  device               = each.value.name
  log_update_rate      = try(local.device_config[each.value.name].ipv4_access_list_options.log_update_rate, local.defaults.iosxr.configuration.ipv4_access_list_options.log_update_rate, null)
  log_update_threshold = try(local.device_config[each.value.name].ipv4_access_list_options.log_update_threshold, local.defaults.iosxr.configuration.ipv4_access_list_options.log_update_threshold, null)
}
resource "iosxr_hostname" "hostname" {
  for_each            = { for device in local.devices : device.name => device if try(local.device_config[device.name].hostname, null) != null || try(local.defaults.iosxr.configuration.hostname, null) != null }
  device              = each.value.name
  system_network_name = try(local.device_config[each.value.name].hostname, local.defaults.iosxr.configuration.hostname, null)
}

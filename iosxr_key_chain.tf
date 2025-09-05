resource "iosxr_key_chain" "key_chain" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].key_chain, null) != null || try(local.defaults.iosxr.configuration.key_chain, null) != null }
  device   = each.value.name

  name = try(local.device_config[each.value.name].key_chain.name, local.defaults.iosxr.configuration.key_chain.name, null)
  keys = try(local.device_config[each.value.name].key_chain.keys, local.defaults.iosxr.configuration.key_chain.keys, [])
}

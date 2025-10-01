resource "iosxr_pce" "pce" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].pce, null) != null || try(local.defaults.iosxr.configuration.pce, null) != null }
  device   = each.value.name

  address_ipv4                 = try(local.device_config[each.value.name].pce.address_ipv4, local.defaults.iosxr.configuration.pce.address_ipv4, null)
  address_ipv6                 = try(local.device_config[each.value.name].pce.address_ipv6, local.defaults.iosxr.configuration.pce.address_ipv6, null)
  api_authentication_digest    = try(local.device_config[each.value.name].pce.api_authentication_digest, local.defaults.iosxr.configuration.pce.api_authentication_digest, null)
  api_sibling_ipv4             = try(local.device_config[each.value.name].pce.api_sibling_ipv4, local.defaults.iosxr.configuration.pce.api_sibling_ipv4, null)
  peer_filter_ipv4_access_list = try(local.device_config[each.value.name].pce.peer_filter_ipv4_access_list, local.defaults.iosxr.configuration.pce.peer_filter_ipv4_access_list, null)
  api_users                    = try(local.device_config[each.value.name].pce.api_users, local.defaults.iosxr.configuration.pce.api_users, [])
  state_sync_ipv4s             = try(local.device_config[each.value.name].pce.state_sync_ipv4s, local.defaults.iosxr.configuration.pce.state_sync_ipv4s, [])
}
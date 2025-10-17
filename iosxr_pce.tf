locals {
  device_pces = [
    for device in local.devices : {
      device_name                  = device.name
      key                          = device.name
      address_ipv4                 = try(local.device_config[device.name].pce.address_ipv4, local.defaults.iosxr.configuration.pce.address_ipv4, null)
      address_ipv6                 = try(local.device_config[device.name].pce.address_ipv6, local.defaults.iosxr.configuration.pce.address_ipv6, null)
      api_authentication_digest    = try(local.device_config[device.name].pce.api_authentication_digest, local.defaults.iosxr.configuration.pce.api_authentication_digest, null)
      api_sibling_ipv4             = try(local.device_config[device.name].pce.api_sibling_ipv4, local.defaults.iosxr.configuration.pce.api_sibling_ipv4, null)
      peer_filter_ipv4_access_list = try(local.device_config[device.name].pce.peer_filter_ipv4_access_list, local.defaults.iosxr.configuration.pce.peer_filter_ipv4_access_list, null)
      api_users = try(length(local.device_config[device.name].pce.api_users) == 0, true) ? null : [
        for api_user in try(local.device_config[device.name].pce.api_users, local.defaults.iosxr.configuration.pce.api_users, []) : {
          user_name          = try(api_user.user_name, null)
          password_encrypted = try(api_user.password_encrypted, null)
        }
      ]
      state_sync_ipv4s = try(length(local.device_config[device.name].pce.state_sync_ipv4s) == 0, true) ? null : [
        for state_sync_ipv4 in try(local.device_config[device.name].pce.state_sync_ipv4s, []) : {
          address = try(state_sync_ipv4.address, null)
        }
      ]
    }
    if try(local.device_config[device.name].pce, null) != null || try(local.defaults.iosxr.configuration.pce, null) != null
  ]
}

resource "iosxr_pce" "pce" {
  for_each = { for pce in local.device_pces : pce.key => pce }

  device                       = each.value.device_name
  address_ipv4                 = each.value.address_ipv4
  address_ipv6                 = each.value.address_ipv6
  api_authentication_digest    = each.value.api_authentication_digest
  api_sibling_ipv4             = each.value.api_sibling_ipv4
  peer_filter_ipv4_access_list = each.value.peer_filter_ipv4_access_list
  api_users                    = each.value.api_users
  state_sync_ipv4s             = each.value.state_sync_ipv4s
}

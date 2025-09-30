locals {
  device_pce = flatten([
    for device in local.devices : [
      {
        device_name                    = device.name
        key                            = "${device.name}-pce"
        address_ipv4                   = try(local.device_config[device.name].pce.address_ipv4, null)
        address_ipv6                   = try(local.device_config[device.name].pce.address_ipv6, null)
        api_authentication_digest      = try(local.device_config[device.name].pce.api_authentication_digest, null)
        api_sibling_ipv4               = try(local.device_config[device.name].pce.api_sibling_ipv4, null)
        peer_filter_ipv4_access_list   = try(local.device_config[device.name].pce.peer_filter_ipv4_access_list, null)
        delete_mode                    = try(local.device_config[device.name].pce.delete_mode, "all")
        api_users                      = try(local.device_config[device.name].pce.api_users, [])
        state_sync_ipv4s               = try(local.device_config[device.name].pce.state_sync_ipv4s, [])
      }
    ]
    if try(local.device_config[device.name].pce, null) != null
  ])
}

resource "iosxr_pce" "pce" {
  for_each = { for pce in local.device_pce : pce.key => pce }

  device                        = each.value.device_name
  address_ipv4                  = each.value.address_ipv4
  address_ipv6                  = each.value.address_ipv6
  api_authentication_digest     = each.value.api_authentication_digest
  api_sibling_ipv4              = each.value.api_sibling_ipv4
  peer_filter_ipv4_access_list  = each.value.peer_filter_ipv4_access_list
  delete_mode                   = each.value.delete_mode
  api_users                     = each.value.api_users
  state_sync_ipv4s              = each.value.state_sync_ipv4s
}
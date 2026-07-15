locals {
  telnet = flatten([
    for device in local.devices : [
      {
        key                          = device.name
        device_name                  = device.name
        ipv4_client_source_interface = try(local.device_config[device.name].telnet.source_interface_ipv4, local.defaults.iosxr.devices.configuration.telnet.source_interface_ipv4, null)
        ipv6_client_source_interface = try(local.device_config[device.name].telnet.source_interface_ipv6, local.defaults.iosxr.devices.configuration.telnet.source_interface_ipv6, null)
        vrfs = try(length(local.device_config[device.name].telnet.vrfs) == 0, true) ? null : [for vrf in try(local.device_config[device.name].telnet.vrfs, []) : {
          vrf_name                = try(vrf.name, local.defaults.iosxr.devices.configuration.telnet.vrfs.name, null)
          ipv4_server_max_servers = try(vrf.ipv4_max_servers, local.defaults.iosxr.devices.configuration.telnet.vrfs.ipv4_max_servers, null)
          ipv4_server_access_list = try(vrf.ipv4_access_list, local.defaults.iosxr.devices.configuration.telnet.vrfs.ipv4_access_list, null)
          ipv6_server_max_servers = try(vrf.ipv6_max_servers, local.defaults.iosxr.devices.configuration.telnet.vrfs.ipv6_max_servers, null)
          ipv6_server_access_list = try(vrf.ipv6_access_list, local.defaults.iosxr.devices.configuration.telnet.vrfs.ipv6_access_list, null)
          }
        ]
        vrfs_dscp = try(length([for vrf in local.device_config[device.name].telnet.vrfs : vrf if try(vrf.ipv4_dscp, null) != null]) == 0, true) ? null : [for vrf in local.device_config[device.name].telnet.vrfs : {
          vrf_name  = try(vrf.name, local.defaults.iosxr.devices.configuration.telnet.vrfs.name, null)
          ipv4_dscp = try(vrf.ipv4_dscp, local.defaults.iosxr.devices.configuration.telnet.vrfs.ipv4_dscp, null)
          } if try(vrf.ipv4_dscp, null) != null
        ]
      }
    ] if try(local.device_config[device.name].telnet, null) != null || try(local.defaults.iosxr.devices.configuration.telnet, null) != null
  ])
}

resource "iosxr_telnet" "telnet" {
  for_each                     = { for telnet in local.telnet : telnet.key => telnet }
  device                       = each.value.device_name
  ipv4_client_source_interface = each.value.ipv4_client_source_interface
  ipv6_client_source_interface = each.value.ipv6_client_source_interface
  vrfs                         = each.value.vrfs
  vrfs_dscp                    = each.value.vrfs_dscp
}

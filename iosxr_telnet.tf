locals {
  telnet = flatten([
    for device in local.devices : [
      {
        key                          = device.name
        device_name                  = device.name
        ipv4_client_source_interface = try(local.device_config[device.name].telnet.ipv4_client_source_interface, local.defaults.iosxr.devices.configuration.telnet.ipv4_client_source_interface, null)
        ipv6_client_source_interface = try(local.device_config[device.name].telnet.ipv6_client_source_interface, local.defaults.iosxr.devices.configuration.telnet.ipv6_client_source_interface, null)
        vrfs = try(length(local.device_config[device.name].telnet.vrfs) == 0, true) ? null : [for vrf in try(local.device_config[device.name].telnet.vrfs, []) : {
          vrf_name                = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.telnet_vrfs.vrf_name, null)
          ipv4_server_max_servers = try(vrf.ipv4_server_max_servers, local.defaults.iosxr.devices.configuration.telnet_vrfs.ipv4_server_max_servers, null)
          ipv4_server_access_list = try(vrf.ipv4_server_access_list, local.defaults.iosxr.devices.configuration.telnet_vrfs.ipv4_server_access_list, null)
          ipv6_server_max_servers = try(vrf.ipv6_server_max_servers, local.defaults.iosxr.devices.configuration.telnet_vrfs.ipv6_server_max_servers, null)
          ipv6_server_access_list = try(vrf.ipv6_server_access_list, local.defaults.iosxr.devices.configuration.telnet_vrfs.ipv6_server_access_list, null)
          }
        ]
        vrfs_dscp = try(length(local.device_config[device.name].telnet.vrfs_dscp) == 0, true) ? null : [for vrf_dscp in local.device_config[device.name].telnet.vrfs_dscp : {
          vrf_name  = try(vrf_dscp.vrf_name, local.defaults.iosxr.devices.configuration.telnet_vrfs_dscp.vrf_name, null)
          ipv4_dscp = try(vrf_dscp.ipv4_dscp, local.defaults.iosxr.devices.configuration.telnet_vrfs_dscp.ipv4_dscp, null)
          }
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

  depends_on = [
    # Future dependencies - uncomment when resource is created:
    #iosxr_vrf.vrf
  ]
}

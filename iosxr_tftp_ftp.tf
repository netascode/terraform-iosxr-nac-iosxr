##### TFTP Client #####

locals {
  tftp_client = flatten([
    for device in local.devices : [
      {
        key         = device.name
        device_name = device.name
        client_vrfs = try(length(local.device_config[device.name].tftp.client.vrfs) == 0, true) ? null : [for vrf in try(local.device_config[device.name].tftp.client.vrfs, []) : {
          vrf_name         = try(vrf.name, local.defaults.iosxr.devices.configuration.tftp.client.vrfs.name, null)
          source_interface = try(vrf.source_interface, local.defaults.iosxr.devices.configuration.tftp.client.vrfs.source_interface, null)
          retries          = try(vrf.retries, local.defaults.iosxr.devices.configuration.tftp.client.vrfs.retries, null)
          timeout          = try(vrf.timeout, local.defaults.iosxr.devices.configuration.tftp.client.vrfs.timeout, null)
          dscp = try(lookup(local.dscp_map,
            tostring(try(vrf.dscp, local.defaults.iosxr.devices.configuration.tftp.client.vrfs.dscp)),
            tostring(try(vrf.dscp, local.defaults.iosxr.devices.configuration.tftp.client.vrfs.dscp))
            ), null
          )
          }
        ]
      }
    ] if try(local.device_config[device.name].tftp.client, null) != null || try(local.defaults.iosxr.devices.configuration.tftp.client, null) != null
  ])
}

resource "iosxr_tftp_client" "tftp_client" {
  for_each    = { for v in local.tftp_client : v.key => v }
  device      = each.value.device_name
  client_vrfs = each.value.client_vrfs
}

##### TFTP Server #####

locals {
  tftp_server = flatten([
    for device in local.devices : [
      {
        key         = device.name
        device_name = device.name
        vrfs = try(length(local.device_config[device.name].tftp.server.vrfs) == 0, true) ? null : [for vrf in try(local.device_config[device.name].tftp.server.vrfs, []) : {
          vrf_name                = try(vrf.name, local.defaults.iosxr.devices.configuration.tftp.server.vrfs.name, null)
          ipv4_server_access_list = try(vrf.ipv4_access_list, local.defaults.iosxr.devices.configuration.tftp.server.vrfs.ipv4_access_list, null)
          ipv4_server_max_servers = try(vrf.ipv4_max_servers, local.defaults.iosxr.devices.configuration.tftp.server.vrfs.ipv4_max_servers, null)
          ipv4_server_homedir     = try(vrf.ipv4_homedir, local.defaults.iosxr.devices.configuration.tftp.server.vrfs.ipv4_homedir, null)
          ipv4_server_dscp = try(lookup(local.dscp_map,
            tostring(try(vrf.ipv4_dscp, local.defaults.iosxr.devices.configuration.tftp.server.vrfs.ipv4_dscp)),
            tostring(try(vrf.ipv4_dscp, local.defaults.iosxr.devices.configuration.tftp.server.vrfs.ipv4_dscp))
            ), null
          )
          ipv6_server_access_list = try(vrf.ipv6_access_list, local.defaults.iosxr.devices.configuration.tftp.server.vrfs.ipv6_access_list, null)
          ipv6_server_max_servers = try(vrf.ipv6_max_servers, local.defaults.iosxr.devices.configuration.tftp.server.vrfs.ipv6_max_servers, null)
          ipv6_server_homedir     = try(vrf.ipv6_homedir, local.defaults.iosxr.devices.configuration.tftp.server.vrfs.ipv6_homedir, null)
          ipv6_server_dscp = try(lookup(local.dscp_map,
            tostring(try(vrf.ipv6_dscp, local.defaults.iosxr.devices.configuration.tftp.server.vrfs.ipv6_dscp)),
            tostring(try(vrf.ipv6_dscp, local.defaults.iosxr.devices.configuration.tftp.server.vrfs.ipv6_dscp))
            ), null
          )
          }
        ]
      }
    ] if try(local.device_config[device.name].tftp.server, null) != null || try(local.defaults.iosxr.devices.configuration.tftp.server, null) != null
  ])
}

resource "iosxr_tftp_server" "tftp_server" {
  for_each = { for v in local.tftp_server : v.key => v }
  device   = each.value.device_name
  vrfs     = each.value.vrfs
}

##### FTP Client #####

locals {
  ftp = flatten([
    for device in local.devices : [
      {
        key         = device.name
        device_name = device.name
        client_vrfs = try(length(local.device_config[device.name].ftp.client.vrfs) == 0, true) ? null : [for vrf in try(local.device_config[device.name].ftp.client.vrfs, []) : {
          vrf_name           = try(vrf.name, local.defaults.iosxr.devices.configuration.ftp.client.vrfs.name, null)
          passive            = try(vrf.passive, local.defaults.iosxr.devices.configuration.ftp.client.vrfs.passive, null)
          source_interface   = try(vrf.source_interface, local.defaults.iosxr.devices.configuration.ftp.client.vrfs.source_interface, null)
          anonymous_password = try(vrf.anonymous_password, local.defaults.iosxr.devices.configuration.ftp.client.vrfs.anonymous_password, null)
          username           = try(vrf.username, local.defaults.iosxr.devices.configuration.ftp.client.vrfs.username, null)
          password           = try(vrf.password, local.defaults.iosxr.devices.configuration.ftp.client.vrfs.password, null)
          }
        ]
      }
    ] if try(local.device_config[device.name].ftp.client, null) != null || try(local.defaults.iosxr.devices.configuration.ftp.client, null) != null
  ])
}

resource "iosxr_ftp" "ftp" {
  for_each    = { for v in local.ftp : v.key => v }
  device      = each.value.device_name
  client_vrfs = each.value.client_vrfs
}

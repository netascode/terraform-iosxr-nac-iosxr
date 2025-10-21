locals {
  ssh = flatten([
    for device in local.devices : [
      {
        key                  = device.name
        device_name          = device.name
        server_dscp          = try(local.device_config[device.name].ssh.server_dscp, local.defaults.iosxr.configuration.ssh.server_dscp, null)
        server_logging       = try(local.device_config[device.name].ssh.server_logging, local.defaults.iosxr.configuration.ssh.server_logging, null)
        server_rate_limit    = try(local.device_config[device.name].ssh.server_rate_limit, local.defaults.iosxr.configuration.ssh.server_rate_limit, null)
        server_session_limit = try(local.device_config[device.name].ssh.server_session_limit, local.defaults.iosxr.configuration.ssh.server_session_limit, null)
        server_v2            = try(local.device_config[device.name].ssh.server_v2, local.defaults.iosxr.configuration.ssh.server_v2, null)
        server_vrfs = try(length(local.device_config[device.name].ssh.server_vrfs) == 0, true) ? null : [for vrf in local.device_config[device.name].ssh.server_vrfs : {
          vrf_name         = try(vrf.vrf_name, local.defaults.iosxr.configuration.ssh_server_vrfs.vrf_name, null)
          ipv4_access_list = try(vrf.ipv4_access_list, local.defaults.iosxr.configuration.ssh_server_vrfs.ipv4_access_list, null)
          ipv6_access_list = try(vrf.ipv6_access_list, local.defaults.iosxr.configuration.ssh_server_vrfs.ipv6_access_list, null)
          }
        ]
      }
    ] if try(local.device_config[device.name].ssh, null) != null || try(local.defaults.iosxr.configuration.ssh, null) != null
  ])
}

resource "iosxr_ssh" "ssh" {
  for_each             = { for ssh in local.ssh : ssh.key => ssh }
  device               = each.value.device_name
  server_dscp          = each.value.server_dscp
  server_logging       = each.value.server_logging
  server_rate_limit    = each.value.server_rate_limit
  server_session_limit = each.value.server_session_limit
  server_v2            = each.value.server_v2
  server_vrfs          = each.value.server_vrfs
}

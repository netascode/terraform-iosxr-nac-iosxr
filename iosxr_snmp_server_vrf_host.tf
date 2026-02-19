locals {
  snmp_server_vrf_hosts = flatten([
    for device in local.devices : [
      for host in try(local.device_config[device.name].snmp_server.vrfs, []) : {
        key         = format("%s/%s/%s", device.name, host.vrf_name, host.address)
        device_name = device.name
        vrf_name    = try(host.vrf_name, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.vrf_name, null)
        address     = try(host.address, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.address, null)
        traps_unencrypted_strings = try(length(host.traps_unencrypted_strings) == 0, true) ? null : [for trap in host.traps_unencrypted_strings : {
          community_string          = try(trap.community_string, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.traps_unencrypted_strings.community_string, null)
          udp_port                  = try(trap.udp_port, trap.community_string != null ? "default" : null, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.traps_unencrypted_strings.udp_port, null)
          version_v2c               = try(trap.version_v2c, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.traps_unencrypted_strings.version_v2c, null)
          version_v3_security_level = try(trap.version_v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.traps_unencrypted_strings.version_v3_security_level, null)
          }
        ]
        informs_unencrypted_strings = try(length(host.informs_unencrypted_strings) == 0, true) ? null : [for inform in host.informs_unencrypted_strings : {
          community_string          = try(inform.community_string, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.informs_unencrypted_strings.community_string, null)
          udp_port                  = try(inform.udp_port, inform.community_string != null ? "default" : null, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.informs_unencrypted_strings.udp_port, null)
          version_v2c               = try(inform.version_v2c, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.informs_unencrypted_strings.version_v2c, null)
          version_v3_security_level = try(inform.version_v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.informs_unencrypted_strings.version_v3_security_level, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_snmp_server_vrf_host" "snmp_server_vrf_host" {
  for_each                    = { for host in local.snmp_server_vrf_hosts : host.key => host }
  device                      = each.value.device_name
  vrf_name                    = each.value.vrf_name
  address                     = each.value.address
  traps_unencrypted_strings   = each.value.traps_unencrypted_strings
  informs_unencrypted_strings = each.value.informs_unencrypted_strings
}

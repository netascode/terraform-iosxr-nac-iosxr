resource "iosxr_tacacs_server" "tacacs_server" {
  for_each      = { for device in local.devices : device.name => device if try(local.device_config[device.name].tacacs_server, null) != null || try(local.defaults.iosxr.devices.configuration.tacacs_server, null) != null }
  device        = each.value.name
  key_type_6    = try(local.device_config[each.value.name].tacacs_server.key_type_6, local.defaults.iosxr.devices.configuration.tacacs_server.key_type_6, null)
  key_type_7    = try(local.device_config[each.value.name].tacacs_server.key_type_7, local.defaults.iosxr.devices.configuration.tacacs_server.key_type_7, null)
  timeout       = try(local.device_config[each.value.name].tacacs_server.timeout, local.defaults.iosxr.devices.configuration.tacacs_server.timeout, null)
  holddown_time = try(local.device_config[each.value.name].tacacs_server.holddown_time, local.defaults.iosxr.devices.configuration.tacacs_server.holddown_time, null)
  ipv4_dscp     = try(local.device_config[each.value.name].tacacs_server.ipv4_dscp, local.defaults.iosxr.devices.configuration.tacacs_server.ipv4_dscp, null)
  ipv6_dscp     = try(local.device_config[each.value.name].tacacs_server.ipv6_dscp, local.defaults.iosxr.devices.configuration.tacacs_server.ipv6_dscp, null)

  hosts = try(length(local.device_config[each.value.name].tacacs_server.hosts) == 0, true) ? null : [
    for idx, host in try(local.device_config[each.value.name].tacacs_server.hosts, []) : {
      ordering_index                 = idx
      address                        = try(host.address, local.defaults.iosxr.devices.configuration.tacacs_server.hosts_defaults.address, null)
      port                           = try(host.port, local.defaults.iosxr.devices.configuration.tacacs_server.hosts_defaults.port, null)
      timeout                        = try(host.timeout, local.defaults.iosxr.devices.configuration.tacacs_server.hosts_defaults.timeout, null)
      holddown_time                  = try(host.holddown_time, local.defaults.iosxr.devices.configuration.tacacs_server.hosts_defaults.holddown_time, null)
      key_type_6                     = try(host.key_type_6, local.defaults.iosxr.devices.configuration.tacacs_server.hosts_defaults.key_type_6, null)
      key_type_7                     = try(host.key_type_7, local.defaults.iosxr.devices.configuration.tacacs_server.hosts_defaults.key_type_7, null)
      single_connection              = try(host.single_connection, local.defaults.iosxr.devices.configuration.tacacs_server.hosts_defaults.single_connection, null)
      single_connection_idle_timeout = try(host.single_connection_idle_timeout, local.defaults.iosxr.devices.configuration.tacacs_server.hosts_defaults.single_connection_idle_timeout, null)
    }
  ]
}

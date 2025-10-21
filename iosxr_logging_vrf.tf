locals {
  logging_vrfs = flatten([
    for device in local.devices : [
      for logging_vrf in try(local.device_config[device.name].logging_vrf, []) : {
        key         = "${device.name}-${logging_vrf.vrf_name}"
        device_name = device.name
        vrf_name    = try(logging_vrf.vrf_name, local.defaults.iosxr.configuration.logging_vrf.vrf_name, null)
        host_ipv4_addresses = try(length(logging_vrf.host_ipv4_addresses) == 0, true) ? null : [for host in logging_vrf.host_ipv4_addresses : {
          ipv4_address = try(host.ipv4_address, local.defaults.iosxr.configuration.logging_vrf.host_ipv4_addresses.ipv4_address, null)
          severity     = try(host.severity, local.defaults.iosxr.configuration.logging_vrf.host_ipv4_addresses.severity, null)
          port         = try(host.port, local.defaults.iosxr.configuration.logging_vrf.host_ipv4_addresses.port, null)
          operator     = try(host.operator, local.defaults.iosxr.configuration.logging_vrf.host_ipv4_addresses.operator, null)
        }]
        host_ipv6_addresses = try(length(logging_vrf.host_ipv6_addresses) == 0, true) ? null : [for host in logging_vrf.host_ipv6_addresses : {
          ipv6_address = try(host.ipv6_address, local.defaults.iosxr.configuration.logging_vrf.host_ipv6_addresses.ipv6_address, null)
          severity     = try(host.severity, local.defaults.iosxr.configuration.logging_vrf.host_ipv6_addresses.severity, null)
          port         = try(host.port, local.defaults.iosxr.configuration.logging_vrf.host_ipv6_addresses.port, null)
          operator     = try(host.operator, local.defaults.iosxr.configuration.logging_vrf.host_ipv6_addresses.operator, null)
        }]
      }
    ]
  ])
}

resource "iosxr_logging_vrf" "logging_vrf" {
  for_each            = { for logging_vrf in local.logging_vrfs : logging_vrf.key => logging_vrf }
  device              = each.value.device_name
  vrf_name            = each.value.vrf_name
  host_ipv4_addresses = each.value.host_ipv4_addresses
  host_ipv6_addresses = each.value.host_ipv6_addresses
}

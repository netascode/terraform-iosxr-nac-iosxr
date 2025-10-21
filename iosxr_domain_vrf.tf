locals {
  device_domain_vrfs = flatten([
    for device in local.devices : [
      for domain_vrf in try(local.device_config[device.name].domain_vrf, []) : {
        key                     = "${device.name}-${domain_vrf.vrf_name}"
        device_name             = device.name
        vrf_name                = try(domain_vrf.vrf_name, null)
        name                    = try(domain_vrf.name, local.defaults.iosxr.configuration.domain_vrf.name, null)
        lookup_disable          = try(domain_vrf.lookup_disable, local.defaults.iosxr.configuration.domain_vrf.lookup_disable, null)
        lookup_source_interface = try(domain_vrf.lookup_source_interface, local.defaults.iosxr.configuration.domain_vrf.lookup_source_interface, null)
        multicast               = try(domain_vrf.multicast, local.defaults.iosxr.configuration.domain_vrf.multicast, null)
        domains = try(length(domain_vrf.domains) == 0, true) ? null : [for domain in domain_vrf.domains : {
          domain_name = try(domain.domain_name, local.defaults.iosxr.configuration.domain_vrf.domains.domain_name, null)
          order       = try(domain.order, local.defaults.iosxr.configuration.domain_vrf.domains.order, null)
          }
        ]
        name_servers = try(length(domain_vrf.name_servers) == 0, true) ? null : [for server in domain_vrf.name_servers : {
          address = try(server.address, local.defaults.iosxr.configuration.domain_vrf.name_servers.address, null)
          order   = try(server.order, local.defaults.iosxr.configuration.domain_vrf.name_servers.order, null)
          }
        ]
        ipv4_hosts = try(length(domain_vrf.ipv4_hosts) == 0, true) ? null : [for host in domain_vrf.ipv4_hosts : {
          host_name  = try(host.host_name, local.defaults.iosxr.configuration.domain_vrf.ipv4_hosts.host_name, null)
          ip_address = try(host.ip_address, local.defaults.iosxr.configuration.domain_vrf.ipv4_hosts.ip_address, null)
          }
        ]
        ipv6_hosts = try(length(domain_vrf.ipv6_hosts) == 0, true) ? null : [for host in domain_vrf.ipv6_hosts : {
          host_name    = try(host.host_name, local.defaults.iosxr.configuration.domain_vrf.ipv6_hosts.host_name, null)
          ipv6_address = try(host.ipv6_address, local.defaults.iosxr.configuration.domain_vrf.ipv6_hosts.ipv6_address, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_domain_vrf" "domain_vrf" {
  for_each                = { for domain_vrf in local.device_domain_vrfs : domain_vrf.key => domain_vrf }
  device                  = each.value.device_name
  vrf_name                = each.value.vrf_name
  name                    = each.value.name
  lookup_disable          = each.value.lookup_disable
  lookup_source_interface = each.value.lookup_source_interface
  multicast               = each.value.multicast
  domains                 = each.value.domains
  name_servers            = each.value.name_servers
  ipv4_hosts              = each.value.ipv4_hosts
  ipv6_hosts              = each.value.ipv6_hosts
}

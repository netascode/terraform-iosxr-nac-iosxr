##### DOMAIN #####

locals {
  domains = flatten([
    for device in local.devices : [
      {
        key                     = device.name
        device_name             = device.name
        name                    = try(local.device_config[device.name].domain.domain_name, local.defaults.iosxr.devices.configuration.domain.domain_name, null)
        lookup_disable          = try(local.device_config[device.name].domain.lookup_disable, local.defaults.iosxr.devices.configuration.domain.lookup_disable, null)
        lookup_source_interface = try(local.device_config[device.name].domain.lookup_source_interface, local.defaults.iosxr.devices.configuration.domain.lookup_source_interface, null)
        multicast               = try(local.device_config[device.name].domain.multicast, local.defaults.iosxr.devices.configuration.domain.multicast, null)
        default_flows_disable   = try(local.device_config[device.name].domain.default_flows_disable, local.defaults.iosxr.devices.configuration.domain.default_flows_disable, null)
        domains = try(length(local.device_config[device.name].domain.lists) == 0, true) ? null : [
          for idx, domain in try(local.device_config[device.name].domain.lists, []) : {
            domain_name = try(domain.domain_name, local.defaults.iosxr.devices.configuration.domain.lists.domain_name, null)
            order       = idx
          }
        ]
        name_servers = try(length(local.device_config[device.name].domain.name_servers) == 0, true) ? null : [
          for idx, server in try(local.device_config[device.name].domain.name_servers, []) : {
            address = try(server.address, local.defaults.iosxr.devices.configuration.domain.name_servers.address, null)
            order   = idx
          }
        ]
        ipv4_hosts = try(length(local.device_config[device.name].domain.ipv4_hosts) == 0, true) ? null : [for host in local.device_config[device.name].domain.ipv4_hosts : {
          host_name  = try(host.host_name, local.defaults.iosxr.devices.configuration.domain.ipv4_hosts.host_name, null)
          ip_address = try(host.ip_address, local.defaults.iosxr.devices.configuration.domain.ipv4_hosts.ip_address, null)
          }
        ]
        ipv6_hosts = try(length(local.device_config[device.name].domain.ipv6_hosts) == 0, true) ? null : [for host in local.device_config[device.name].domain.ipv6_hosts : {
          host_name    = try(host.host_name, local.defaults.iosxr.devices.configuration.domain.ipv6_hosts.host_name, null)
          ipv6_address = try(host.ipv6_address, local.defaults.iosxr.devices.configuration.domain.ipv6_hosts.ipv6_address, null)
          }
        ]
      }
    ] if try(local.device_config[device.name].domain, null) != null || try(local.defaults.iosxr.devices.configuration.domain, null) != null
  ])
}

resource "iosxr_domain" "domain" {
  for_each                = { for domain in local.domains : domain.key => domain }
  device                  = each.value.device_name
  name                    = each.value.name
  lookup_disable          = each.value.lookup_disable
  lookup_source_interface = each.value.lookup_source_interface
  multicast               = each.value.multicast
  default_flows_disable   = each.value.default_flows_disable
  domains                 = each.value.domains
  name_servers            = each.value.name_servers
  ipv4_hosts              = each.value.ipv4_hosts
  ipv6_hosts              = each.value.ipv6_hosts

  depends_on = [
    iosxr_vrf.vrf
  ]
}

##### DOMAIN VRF #####

locals {
  domain_vrfs = flatten([
    for device in local.devices : [
      for domain_vrf in try(local.device_config[device.name].domain.vrfs, []) : {
        key                     = format("%s/%s", device.name, domain_vrf.vrf_name)
        device_name             = device.name
        vrf_name                = try(domain_vrf.vrf_name, null)
        name                    = try(domain_vrf.domain_name, local.defaults.iosxr.devices.configuration.domain.vrfs.domain_name, null)
        lookup_disable          = try(domain_vrf.lookup_disable, local.defaults.iosxr.devices.configuration.domain.vrfs.lookup_disable, null)
        lookup_source_interface = try(domain_vrf.lookup_source_interface, local.defaults.iosxr.devices.configuration.domain.vrfs.lookup_source_interface, null)
        multicast               = try(domain_vrf.multicast, local.defaults.iosxr.devices.configuration.domain.vrfs.multicast, null)
        domains = try(length(domain_vrf.lists) == 0, true) ? null : [
          for idx, domain in try(domain_vrf.lists, []) : {
            domain_name = try(domain.domain_name, local.defaults.iosxr.devices.configuration.domain.vrfs.lists.domain_name, null)
            order       = idx
          }
        ]
        name_servers = try(length(domain_vrf.name_servers) == 0, true) ? null : [
          for idx, server in try(domain_vrf.name_servers, []) : {
            address = try(server.address, local.defaults.iosxr.devices.configuration.domain.vrfs.name_servers.address, null)
            order   = idx
          }
        ]
        ipv4_hosts = try(length(domain_vrf.ipv4_hosts) == 0, true) ? null : [for host in domain_vrf.ipv4_hosts : {
          host_name  = try(host.host_name, local.defaults.iosxr.devices.configuration.domain.vrfs.ipv4_hosts.host_name, null)
          ip_address = try(host.ip_address, local.defaults.iosxr.devices.configuration.domain.vrfs.ipv4_hosts.ip_address, null)
          }
        ]
        ipv6_hosts = try(length(domain_vrf.ipv6_hosts) == 0, true) ? null : [for host in domain_vrf.ipv6_hosts : {
          host_name    = try(host.host_name, local.defaults.iosxr.devices.configuration.domain.vrfs.ipv6_hosts.host_name, null)
          ipv6_address = try(host.ipv6_address, local.defaults.iosxr.devices.configuration.domain.vrfs.ipv6_hosts.ipv6_address, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_domain_vrf" "domain_vrf" {
  for_each                = { for domain_vrf in local.domain_vrfs : domain_vrf.key => domain_vrf }
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

  depends_on = [
    iosxr_vrf.vrf,
    iosxr_domain.domain
  ]
}

locals {
  device_domain_vrfs = flatten([
    for device in local.devices : [
      for domain_vrf in try(local.device_config[device.name].domain_vrf, local.defaults.iosxr.configuration.domain_vrf, []) : {
        device_name = device.name
        vrf_name    = try(domain_vrf.vrf_name, null)
        key         = "${device.name}_${domain_vrf.vrf_name}"

        name                    = try(domain_vrf.name, local.defaults.iosxr.configuration.domain_vrf.name, null)
        domains                 = try(domain_vrf.domains, local.defaults.iosxr.configuration.domain_vrf.domains, null)
        lookup_disable          = try(domain_vrf.lookup_disable, local.defaults.iosxr.configuration.domain_vrf.lookup_disable, null)
        lookup_source_interface = try(domain_vrf.lookup_source_interface, local.defaults.iosxr.configuration.domain_vrf.lookup_source_interface, null)
        name_servers            = try(domain_vrf.name_servers, local.defaults.iosxr.configuration.domain_vrf.name_servers, null)
        ipv4_hosts              = try(domain_vrf.ipv4_hosts, local.defaults.iosxr.configuration.domain_vrf.ipv4_hosts, null)
        ipv6_hosts              = try(domain_vrf.ipv6_hosts, local.defaults.iosxr.configuration.domain_vrf.ipv6_hosts, null)
        multicast               = try(domain_vrf.multicast, local.defaults.iosxr.configuration.domain_vrf.multicast, null)
      }
    ]
    if try(local.device_config[device.name].domain_vrf, null) != null || try(local.defaults.iosxr.configuration.domain_vrf, null) != null
  ])
}

resource "iosxr_domain_vrf" "domain_vrf" {
  for_each = { for domain_vrf in local.device_domain_vrfs : domain_vrf.key => domain_vrf }

  device   = each.value.device_name
  vrf_name = each.value.vrf_name

  name                    = each.value.name
  domains                 = each.value.domains
  lookup_disable          = each.value.lookup_disable
  lookup_source_interface = each.value.lookup_source_interface
  name_servers            = each.value.name_servers
  ipv4_hosts              = each.value.ipv4_hosts
  ipv6_hosts              = each.value.ipv6_hosts
  multicast               = each.value.multicast
}

resource "iosxr_domain" "domain" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].domain, null) != null || try(local.defaults.iosxr.configuration.domain, null) != null }
  device   = each.value.name

  name                    = try(local.device_config[each.value.name].domain.name, local.defaults.iosxr.configuration.domain.name, null)
  lookup_disable          = try(local.device_config[each.value.name].domain.lookup_disable, local.defaults.iosxr.configuration.domain.lookup_disable, null)
  lookup_source_interface = try(local.device_config[each.value.name].domain.lookup_source_interface, local.defaults.iosxr.configuration.domain.lookup_source_interface, null)
  multicast               = try(local.device_config[each.value.name].domain.multicast, local.defaults.iosxr.configuration.domain.multicast, null)
  default_flows_disable   = try(local.device_config[each.value.name].domain.default_flows_disable, local.defaults.iosxr.configuration.domain.default_flows_disable, null)
  domains                 = try(length(local.device_config[each.value.name].domain.domains) == 0, true) ? null : try(local.device_config[each.value.name].domain.domains, null)
  name_servers            = try(length(local.device_config[each.value.name].domain.name_servers) == 0, true) ? null : try(local.device_config[each.value.name].domain.name_servers, null)
  ipv4_hosts              = try(length(local.device_config[each.value.name].domain.ipv4_hosts) == 0, true) ? null : try(local.device_config[each.value.name].domain.ipv4_hosts, null)
  ipv6_hosts              = try(length(local.device_config[each.value.name].domain.ipv6_hosts) == 0, true) ? null : try(local.device_config[each.value.name].domain.ipv6_hosts, null)
}

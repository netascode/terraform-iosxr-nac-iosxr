resource "iosxr_domain" "domain" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].domain, null) != null || try(local.defaults.iosxr.configuration.domain, null) != null }
  device   = each.value.name

  name                    = try(local.device_config[each.value.name].domain.name, local.defaults.iosxr.configuration.domain.name, null)
  domains                 = try(local.device_config[each.value.name].domain.domains, local.defaults.iosxr.configuration.domain.domains, null)
  lookup_disable          = try(local.device_config[each.value.name].domain.lookup_disable, local.defaults.iosxr.configuration.domain.lookup_disable, null)
  lookup_source_interface = try(local.device_config[each.value.name].domain.lookup_source_interface, local.defaults.iosxr.configuration.domain.lookup_source_interface, null)
  name_servers            = try(local.device_config[each.value.name].domain.name_servers, local.defaults.iosxr.configuration.domain.name_servers, null)
  ipv4_hosts              = try(local.device_config[each.value.name].domain.ipv4_hosts, local.defaults.iosxr.configuration.domain.ipv4_hosts, null)
  ipv6_hosts              = try(local.device_config[each.value.name].domain.ipv6_hosts, local.defaults.iosxr.configuration.domain.ipv6_hosts, null)
  multicast               = try(local.device_config[each.value.name].domain.multicast, local.defaults.iosxr.configuration.domain.multicast, null)
  default_flows_disable   = try(local.device_config[each.value.name].domain.default_flows_disable, local.defaults.iosxr.configuration.domain.default_flows_disable, null)
  delete_mode             = try(local.device_config[each.value.name].domain.delete_mode, local.defaults.iosxr.configuration.domain.delete_mode, null)
}

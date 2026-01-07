resource "iosxr_evpn" "evpn" {
  for_each         = { for device in local.devices : device.name => device if try(local.device_config[device.name].evpn, null) != null || try(local.defaults.iosxr.devices.configuration.evpn, null) != null }
  device           = each.value.name
  source_interface = try(local.device_config[each.value.name].evpn.source_interface, local.defaults.iosxr.devices.configuration.evpn.source_interface, null)
  groups = try(length(local.device_config[each.value.name].evpn.groups) == 0, true) ? null : [for group in local.device_config[each.value.name].evpn.groups : {
    group_id = try(group.group_id, local.defaults.iosxr.devices.configuration.evpn.groups.group_id, null)
    core_interfaces = try(length(group.core_interfaces) == 0, true) ? null : [for core_interface in group.core_interfaces : {
      interface_name = try(core_interface.interface_name, local.defaults.iosxr.devices.configuration.evpn.groups.core_interfaces.interface_name, null)
    }]
  }]

  depends_on = [
    iosxr_route_policy.route_policy
  ]
}

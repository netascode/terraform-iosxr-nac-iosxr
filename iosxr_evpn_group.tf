locals {
  evpn_groups = flatten([
    for device in local.devices : [
      for evpn_group in try(local.device_config[device.name].evpn_group, []) : {
        key         = "${device.name}-${evpn_group.group_id}"
        device_name = device.name
        group_id    = try(evpn_group.group_id, local.defaults.iosxr.configuration.evpn_group.group_id, null)
        core_interfaces = try(length(evpn_group.core_interfaces) == 0, true) ? null : [for core_interface in evpn_group.core_interfaces : {
          interface_name = try(core_interface.interface_name, local.defaults.iosxr.configuration.evpn_group.core_interfaces.interface_name, null)
        }]
      }
    ]
  ])
}

resource "iosxr_evpn_group" "evpn_group" {
  for_each        = { for evpn_group in local.evpn_groups : evpn_group.key => evpn_group }
  device          = each.value.device_name
  group_id        = each.value.group_id
  core_interfaces = each.value.core_interfaces
}

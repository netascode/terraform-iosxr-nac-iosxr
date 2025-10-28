locals {
  device_evpn_interfaces = flatten([
    for device in local.devices : [
      for evpn_interface in try(local.device_config[device.name].evpn_interface, []) : {
        device_name    = device.name
        interface_name = evpn_interface.interface_name
        key            = "${device.name}-${evpn_interface.interface_name}"

        # Required attribute (no default fallback needed for required fields)
        ethernet_segment_identifier_type_zero_esi = evpn_interface.ethernet_segment_identifier_type_zero_esi

        # Optional attributes with defaults support
        core_isolation_group                                    = try(evpn_interface.core_isolation_group, local.defaults.iosxr.configuration.evpn_interface.core_isolation_group, null)
        ethernet_segment_load_balancing_mode_all_active         = try(evpn_interface.ethernet_segment_load_balancing_mode_all_active, local.defaults.iosxr.configuration.evpn_interface.ethernet_segment_load_balancing_mode_all_active, null)
        ethernet_segment_load_balancing_mode_port_active        = try(evpn_interface.ethernet_segment_load_balancing_mode_port_active, local.defaults.iosxr.configuration.evpn_interface.ethernet_segment_load_balancing_mode_port_active, null)
        ethernet_segment_load_balancing_mode_single_active      = try(evpn_interface.ethernet_segment_load_balancing_mode_single_active, local.defaults.iosxr.configuration.evpn_interface.ethernet_segment_load_balancing_mode_single_active, null)
        ethernet_segment_load_balancing_mode_single_flow_active = try(evpn_interface.ethernet_segment_load_balancing_mode_single_flow_active, local.defaults.iosxr.configuration.evpn_interface.ethernet_segment_load_balancing_mode_single_flow_active, null)
      }
    ]
  ])
}

resource "iosxr_evpn_interface" "evpn_interface" {
  for_each = { for evpn_interface in local.device_evpn_interfaces : evpn_interface.key => evpn_interface }

  device                                    = each.value.device_name
  interface_name                            = each.value.interface_name
  ethernet_segment_identifier_type_zero_esi = each.value.ethernet_segment_identifier_type_zero_esi

  core_isolation_group                                    = each.value.core_isolation_group
  ethernet_segment_load_balancing_mode_all_active         = each.value.ethernet_segment_load_balancing_mode_all_active
  ethernet_segment_load_balancing_mode_port_active        = each.value.ethernet_segment_load_balancing_mode_port_active
  ethernet_segment_load_balancing_mode_single_active      = each.value.ethernet_segment_load_balancing_mode_single_active
  ethernet_segment_load_balancing_mode_single_flow_active = each.value.ethernet_segment_load_balancing_mode_single_flow_active
}

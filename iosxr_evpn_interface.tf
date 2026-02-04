locals {
  device_evpn_interfaces = flatten([
    for device in local.devices : [
      for evpn_interface in try(local.device_config[device.name].evpn_interface, []) : {
        device_name    = device.name
        interface_name = evpn_interface.interface_name
        key            = "${device.name}-${evpn_interface.interface_name}"

        # Core attributes
        core_isolation_group = try(evpn_interface.core_isolation_group, local.defaults.iosxr.devices.configuration.evpn_interface.core_isolation_group, null)

        # Timers
        timers_peering     = try(evpn_interface.timers_peering, local.defaults.iosxr.devices.configuration.evpn_interface.timers_peering, null)
        timers_recovery    = try(evpn_interface.timers_recovery, local.defaults.iosxr.devices.configuration.evpn_interface.timers_recovery, null)
        timers_carving     = try(evpn_interface.timers_carving, local.defaults.iosxr.devices.configuration.evpn_interface.timers_carving, null)
        timers_ac_debounce = try(evpn_interface.timers_ac_debounce, local.defaults.iosxr.devices.configuration.evpn_interface.timers_ac_debounce, null)

        # Ethernet Segment Identifier
        ethernet_segment_esi_zero = try(evpn_interface.ethernet_segment_esi_zero, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_esi_zero, null)

        # Load Balancing Modes
        ethernet_segment_load_balancing_mode_all_active         = try(evpn_interface.ethernet_segment_load_balancing_mode_all_active, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_load_balancing_mode_all_active, null)
        ethernet_segment_load_balancing_mode_port_active        = try(evpn_interface.ethernet_segment_load_balancing_mode_port_active, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_load_balancing_mode_port_active, null)
        ethernet_segment_load_balancing_mode_single_active      = try(evpn_interface.ethernet_segment_load_balancing_mode_single_active, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_load_balancing_mode_single_active, null)
        ethernet_segment_load_balancing_mode_single_flow_active = try(evpn_interface.ethernet_segment_load_balancing_mode_single_flow_active, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_load_balancing_mode_single_flow_active, null)

        # Ethernet Segment Force Single Homed
        ethernet_segment_force_single_homed = try(evpn_interface.ethernet_segment_force_single_homed, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_force_single_homed, null)

        # Service Carving
        ethernet_segment_service_carving_hrw                            = try(evpn_interface.ethernet_segment_service_carving_hrw, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_service_carving_hrw, null)
        ethernet_segment_service_carving_manual_primary                 = try(evpn_interface.ethernet_segment_service_carving_manual_primary, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_service_carving_manual_primary, null)
        ethernet_segment_service_carving_manual_secondary               = try(evpn_interface.ethernet_segment_service_carving_manual_secondary, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_service_carving_manual_secondary, null)
        ethernet_segment_service_carving_multicast_hrw_g                = try(evpn_interface.ethernet_segment_service_carving_multicast_hrw_g, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_service_carving_multicast_hrw_g, null)
        ethernet_segment_service_carving_multicast_hrw_s_g              = try(evpn_interface.ethernet_segment_service_carving_multicast_hrw_s_g, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_service_carving_multicast_hrw_s_g, null)
        ethernet_segment_service_carving_preference_based_weight        = try(evpn_interface.ethernet_segment_service_carving_preference_based_weight, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_service_carving_preference_based_weight, null)
        ethernet_segment_service_carving_preference_based_access_driven = try(evpn_interface.ethernet_segment_service_carving_preference_based_access_driven, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_service_carving_preference_based_access_driven, null)

        # BGP Route Target
        ethernet_segment_bgp_rt = try(evpn_interface.ethernet_segment_bgp_rt, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_bgp_rt, null)

        # Convergence
        ethernet_segment_convergence_reroute          = try(evpn_interface.ethernet_segment_convergence_reroute, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_convergence_reroute, null)
        ethernet_segment_convergence_mac_mobility     = try(evpn_interface.ethernet_segment_convergence_mac_mobility, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_convergence_mac_mobility, null)
        ethernet_segment_convergence_nexthop_tracking = try(evpn_interface.ethernet_segment_convergence_nexthop_tracking, local.defaults.iosxr.devices.configuration.evpn_interface.ethernet_segment_convergence_nexthop_tracking, null)

        # Access Signal
        access_signal_bundle_down = try(evpn_interface.access_signal_bundle_down, local.defaults.iosxr.devices.configuration.evpn_interface.access_signal_bundle_down, null)
      }
    ]
  ])
}

resource "iosxr_evpn_interface" "evpn_interface" {
  for_each = { for evpn_interface in local.device_evpn_interfaces : evpn_interface.key => evpn_interface }

  device         = each.value.device_name
  interface_name = each.value.interface_name

  # Core attributes
  core_isolation_group = each.value.core_isolation_group

  # Timers
  timers_peering     = each.value.timers_peering
  timers_recovery    = each.value.timers_recovery
  timers_carving     = each.value.timers_carving
  timers_ac_debounce = each.value.timers_ac_debounce

  # Ethernet Segment Identifier
  ethernet_segment_esi_zero = each.value.ethernet_segment_esi_zero

  # Load Balancing Modes
  ethernet_segment_load_balancing_mode_all_active         = each.value.ethernet_segment_load_balancing_mode_all_active
  ethernet_segment_load_balancing_mode_port_active        = each.value.ethernet_segment_load_balancing_mode_port_active
  ethernet_segment_load_balancing_mode_single_active      = each.value.ethernet_segment_load_balancing_mode_single_active
  ethernet_segment_load_balancing_mode_single_flow_active = each.value.ethernet_segment_load_balancing_mode_single_flow_active

  # Ethernet Segment Force Single Homed
  ethernet_segment_force_single_homed = each.value.ethernet_segment_force_single_homed

  # Service Carving
  ethernet_segment_service_carving_hrw                            = each.value.ethernet_segment_service_carving_hrw
  ethernet_segment_service_carving_manual_primary                 = each.value.ethernet_segment_service_carving_manual_primary
  ethernet_segment_service_carving_manual_secondary               = each.value.ethernet_segment_service_carving_manual_secondary
  ethernet_segment_service_carving_multicast_hrw_g                = each.value.ethernet_segment_service_carving_multicast_hrw_g
  ethernet_segment_service_carving_multicast_hrw_s_g              = each.value.ethernet_segment_service_carving_multicast_hrw_s_g
  ethernet_segment_service_carving_preference_based_weight        = each.value.ethernet_segment_service_carving_preference_based_weight
  ethernet_segment_service_carving_preference_based_access_driven = each.value.ethernet_segment_service_carving_preference_based_access_driven

  # BGP Route Target
  ethernet_segment_bgp_rt = each.value.ethernet_segment_bgp_rt

  # Convergence
  ethernet_segment_convergence_reroute          = each.value.ethernet_segment_convergence_reroute
  ethernet_segment_convergence_mac_mobility     = each.value.ethernet_segment_convergence_mac_mobility
  ethernet_segment_convergence_nexthop_tracking = each.value.ethernet_segment_convergence_nexthop_tracking

  # Access Signal
  access_signal_bundle_down = each.value.access_signal_bundle_down
}

locals {
  device_router_ospf_area_interfaces = flatten([
    for device in local.devices : [
      for router_ospf_area_interface in try(local.device_config[device.name].router_ospf_area_interface, []) : {
        device_name    = device.name
        process_name   = router_ospf_area_interface.process_name
        area_id        = router_ospf_area_interface.area_id
        interface_name = router_ospf_area_interface.interface_name
        key            = "${device.name}-${router_ospf_area_interface.process_name}-${router_ospf_area_interface.area_id}-${router_ospf_area_interface.interface_name}"

        network_broadcast                                  = try(router_ospf_area_interface.network_broadcast, local.defaults.iosxr.configuration.router_ospf_area_interface.network_broadcast, null)
        network_non_broadcast                              = try(router_ospf_area_interface.network_non_broadcast, local.defaults.iosxr.configuration.router_ospf_area_interface.network_non_broadcast, null)
        network_point_to_point                             = try(router_ospf_area_interface.network_point_to_point, local.defaults.iosxr.configuration.router_ospf_area_interface.network_point_to_point, null)
        network_point_to_multipoint                        = try(router_ospf_area_interface.network_point_to_multipoint, local.defaults.iosxr.configuration.router_ospf_area_interface.network_point_to_multipoint, null)
        cost                                               = try(router_ospf_area_interface.cost, local.defaults.iosxr.configuration.router_ospf_area_interface.cost, null)
        priority                                           = try(router_ospf_area_interface.priority, local.defaults.iosxr.configuration.router_ospf_area_interface.priority, null)
        passive_enable                                     = try(router_ospf_area_interface.passive_enable, local.defaults.iosxr.configuration.router_ospf_area_interface.passive_enable, null)
        passive_disable                                    = try(router_ospf_area_interface.passive_disable, local.defaults.iosxr.configuration.router_ospf_area_interface.passive_disable, null)
        fast_reroute_per_prefix_ti_lfa                     = try(router_ospf_area_interface.fast_reroute_per_prefix_ti_lfa, local.defaults.iosxr.configuration.router_ospf_area_interface.fast_reroute_per_prefix_ti_lfa, null)
        fast_reroute_per_prefix_tiebreaker_srlg_disjoint   = try(router_ospf_area_interface.fast_reroute_per_prefix_tiebreaker_srlg_disjoint, local.defaults.iosxr.configuration.router_ospf_area_interface.fast_reroute_per_prefix_tiebreaker_srlg_disjoint, null)
        fast_reroute_per_prefix_tiebreaker_node_protecting = try(router_ospf_area_interface.fast_reroute_per_prefix_tiebreaker_node_protecting, local.defaults.iosxr.configuration.router_ospf_area_interface.fast_reroute_per_prefix_tiebreaker_node_protecting, null)
        prefix_sid_algorithms                              = try(router_ospf_area_interface.prefix_sid_algorithms, local.defaults.iosxr.configuration.router_ospf_area_interface.prefix_sid_algorithms, null)
        prefix_sid_strict_spf_index                        = try(router_ospf_area_interface.prefix_sid_strict_spf_index, local.defaults.iosxr.configuration.router_ospf_area_interface.prefix_sid_strict_spf_index, null)
      }
    ]
  ])
}

resource "iosxr_router_ospf_area_interface" "router_ospf_area_interface" {
  for_each = { for router_ospf_area_interface in local.device_router_ospf_area_interfaces : router_ospf_area_interface.key => router_ospf_area_interface }
  device   = each.value.device_name

  process_name   = each.value.process_name
  area_id        = each.value.area_id
  interface_name = each.value.interface_name

  network_broadcast                                  = each.value.network_broadcast
  network_non_broadcast                              = each.value.network_non_broadcast
  network_point_to_point                             = each.value.network_point_to_point
  network_point_to_multipoint                        = each.value.network_point_to_multipoint
  cost                                               = each.value.cost
  priority                                           = each.value.priority
  passive_enable                                     = each.value.passive_enable
  passive_disable                                    = each.value.passive_disable
  fast_reroute_per_prefix_ti_lfa                     = each.value.fast_reroute_per_prefix_ti_lfa
  fast_reroute_per_prefix_tiebreaker_srlg_disjoint   = each.value.fast_reroute_per_prefix_tiebreaker_srlg_disjoint
  fast_reroute_per_prefix_tiebreaker_node_protecting = each.value.fast_reroute_per_prefix_tiebreaker_node_protecting
  prefix_sid_algorithms                              = each.value.prefix_sid_algorithms
  prefix_sid_strict_spf_index                        = each.value.prefix_sid_strict_spf_index
}
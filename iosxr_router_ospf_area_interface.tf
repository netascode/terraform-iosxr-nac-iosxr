locals {
  router_ospf_area_interface = flatten([
    for device in local.devices : [
      for ospf_process in try(local.device_config[device.name].routing.ospf_processes, []) : [
        for area in try(ospf_process.areas, []) : [
          for interface in try(area.interfaces, []) : {
            key                                                      = format("%s/%s/%s/%s", device.name, ospf_process.id, area.area_id, interface.interface_id)
            device_name                                              = device.name
            process_name                                             = try(ospf_process.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.id, null)
            area_id                                                  = try(area.area_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.area_id, null)
            interface_name                                           = try(interface.interface_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.interface_id, null)
            cost                                                     = try(interface.cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.cost, null)
            fast_reroute_per_prefix_ti_lfa_enable                    = try(interface.fast_reroute_per_prefix_ti_lfa_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix_ti_lfa_enable, null)
            fast_reroute_per_prefix_tiebreaker_node_protecting_index = try(interface.fast_reroute_per_prefix_tiebreaker_node_protecting_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix_tiebreaker_node_protecting_index, null)
            fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index   = try(interface.fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index, null)
            network_broadcast                                        = try(interface.network_broadcast, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.network_broadcast, null)
            network_non_broadcast                                    = try(interface.network_non_broadcast, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.network_non_broadcast, null)
            network_point_to_multipoint                              = try(interface.network_point_to_multipoint, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.network_point_to_multipoint, null)
            network_point_to_point                                   = try(interface.network_point_to_point, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.network_point_to_point, null)
            passive_disable                                          = try(interface.passive_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.passive_disable, null)
            passive_enable                                           = try(interface.passive_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.passive_enable, null)
            prefix_sid_strict_spf_index                              = try(interface.prefix_sid_strict_spf_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_strict_spf_index, null)
            priority                                                 = try(interface.priority, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.priority, null)
            prefix_sid_algorithms = try(length(interface.prefix_sid_algorithms) == 0, true) ? null : [for algo in interface.prefix_sid_algorithms : {
              algorithm_number       = try(algo.algo_number, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_algorithms.algo_number, null)
              absolute_explicit_null = try(algo.absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_algorithms.absolute_explicit_null, null)
              absolute_n_flag_clear  = try(algo.absolute_n_flag_clear, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_algorithms.absolute_n_flag_clear, null)
              absolute_sid_label     = try(algo.absolute_sid_label, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_algorithms.absolute_sid_label, null)
              index_explicit_null    = try(algo.index_explicit_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_algorithms.index_explicit_null, null)
              index_n_flag_clear     = try(algo.index_n_flag_clear, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_algorithms.index_n_flag_clear, null)
              index_sid_index        = try(algo.index_sid_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_algorithms.index_sid_index, null)
              }
            ]
          }
        ]
      ]
    ]
  ])
}

resource "iosxr_router_ospf_area_interface" "router_ospf_area_interface" {
  for_each                                                 = { for interface in local.router_ospf_area_interface : interface.key => interface }
  device                                                   = each.value.device_name
  process_name                                             = each.value.process_name
  area_id                                                  = each.value.area_id
  interface_name                                           = each.value.interface_name
  cost                                                     = each.value.cost
  fast_reroute_per_prefix_ti_lfa_enable                    = each.value.fast_reroute_per_prefix_ti_lfa_enable
  fast_reroute_per_prefix_tiebreaker_node_protecting_index = each.value.fast_reroute_per_prefix_tiebreaker_node_protecting_index
  fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index   = each.value.fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index
  network_broadcast                                        = each.value.network_broadcast
  network_non_broadcast                                    = each.value.network_non_broadcast
  network_point_to_multipoint                              = each.value.network_point_to_multipoint
  network_point_to_point                                   = each.value.network_point_to_point
  passive_disable                                          = each.value.passive_disable
  passive_enable                                           = each.value.passive_enable
  prefix_sid_strict_spf_index                              = each.value.prefix_sid_strict_spf_index
  priority                                                 = each.value.priority
  prefix_sid_algorithms                                    = each.value.prefix_sid_algorithms

  depends_on = [
    iosxr_router_ospf.router_ospf
  ]
}

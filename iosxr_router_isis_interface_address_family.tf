locals {
  router_isis_interface_address_family = flatten([
    for device in local.devices : [
      for isis_process in try(local.device_config[device.name].routing.isis_processes, []) : [
        for interface in try(isis_process.interfaces, []) : [
          for af in try(interface.address_family, []) : {
            key                                                      = format("%s/%s/%s/%s/%s", device.name, isis_process.id, interface.interface_name, af.af_name, af.saf_name)
            device_name                                              = device.name
            process_id                                               = try(isis_process.id, local.defaults.iosxr.devices.configuration.routing.isis_processes.id, null)
            interface_name                                           = try(interface.interface_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.interface_name, null)
            af_name                                                  = try(af.af_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.af_name, null)
            saf_name                                                 = try(af.saf_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.saf_name, null)
            metric_maximum                                           = try(af.metric_maximum, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.metric_maximum, null)
            metric_default                                           = try(af.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.metric, null)
            te_metric_flex_algo                                      = try(af.te_metric_flex_algo, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.te_metric_flex_algo, null)
            bandwidth_metric_flex_algo                               = try(af.bandwidth_metric_flex_algo, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.bandwidth_metric_flex_algo, null)
            mpls_ldp_sync                                            = try(af.mpls_ldp_sync, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.mpls_ldp_sync, null)
            mpls_ldp_sync_level                                      = try(af.mpls_ldp_sync_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.mpls_ldp_sync_level, null)
            tag                                                      = try(af.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.tag, null)
            prefix_sid_strict_spf_index_id                           = try(af.prefix_sid_strict_spf_index_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_strict_spf_index_id, null)
            prefix_sid_strict_spf_index_php_disable                  = try(af.prefix_sid_strict_spf_index_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_strict_spf_index_php_disable, null)
            prefix_sid_strict_spf_index_explicit_null                = try(af.prefix_sid_strict_spf_index_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_strict_spf_index_explicit_null, null)
            prefix_sid_strict_spf_index_n_flag_clear                 = try(af.prefix_sid_strict_spf_index_n_flag_clear, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_strict_spf_index_n_flag_clear, null)
            prefix_sid_strict_spf_absolute_id                        = try(af.prefix_sid_strict_spf_absolute_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_strict_spf_absolute_id, null)
            prefix_sid_strict_spf_absolute_php_disable               = try(af.prefix_sid_strict_spf_absolute_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_strict_spf_absolute_php_disable, null)
            prefix_sid_strict_spf_absolute_explicit_null             = try(af.prefix_sid_strict_spf_absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_strict_spf_absolute_explicit_null, null)
            prefix_sid_strict_spf_absolute_n_flag_clear              = try(af.prefix_sid_strict_spf_absolute_n_flag_clear, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_strict_spf_absolute_n_flag_clear, null)
            prefix_sid_index_id                                      = try(af.prefix_sid_index_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_index_id, null)
            prefix_sid_index_php_disable                             = try(af.prefix_sid_index_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_index_php_disable, null)
            prefix_sid_index_explicit_null                           = try(af.prefix_sid_index_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_index_explicit_null, null)
            prefix_sid_index_n_flag_clear                            = try(af.prefix_sid_index_n_flag_clear, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_index_n_flag_clear, null)
            prefix_sid_absolute_id                                   = try(af.prefix_sid_absolute_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_absolute_id, null)
            prefix_sid_absolute_php_disable                          = try(af.prefix_sid_absolute_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_absolute_php_disable, null)
            prefix_sid_absolute_explicit_null                        = try(af.prefix_sid_absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_absolute_explicit_null, null)
            prefix_sid_absolute_n_flag_clear                         = try(af.prefix_sid_absolute_n_flag_clear, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_absolute_n_flag_clear, null)
            fast_reroute_per_prefix                                  = try(af.fast_reroute_per_prefix.enable, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.enable, null)
            fast_reroute_per_link                                    = try(af.fast_reroute_per_link.enable, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_link.enable, null)
            fast_reroute_per_prefix_tiebreaker_default               = try(af.fast_reroute_per_prefix.tiebreaker.default, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.tiebreaker.default, null)
            fast_reroute_per_prefix_tiebreaker_node_protecting_index = try(af.fast_reroute_per_prefix.tiebreaker.node_protecting_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.tiebreaker.node_protecting_index, null)
            fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index   = try(af.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, null)
            fast_reroute_per_prefix_tiebreaker_lc_disjoint_index     = try(af.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, null)
            fast_reroute_per_prefix_remote_lfa_maximum_metric        = try(af.fast_reroute_per_prefix.remote_lfa_maximum_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.remote_lfa_maximum_metric, null)
            fast_reroute_per_prefix_remote_lfa_tunnel_mpls_ldp       = try(af.fast_reroute_per_prefix.remote_lfa_tunnel_mpls_ldp, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.remote_lfa_tunnel_mpls_ldp, null)
            fast_reroute_per_prefix_ti_lfa                           = try(af.fast_reroute_per_prefix.ti_lfa, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.ti_lfa, null)
            link_group_name                                          = try(af.link_group_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.link_group_name, null)
            link_group_level                                         = try(af.link_group_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.link_group_level, null)
            weight                                                   = try(af.weight, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.weight, null)
            auto_metric_proactive_protect_metric                     = try(af.auto_metric_proactive_protect_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.auto_metric_proactive_protect_metric, null)
            advertise_prefix_route_policy                            = try(af.advertise_prefix_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.advertise_prefix_route_policy, null)
            metric_levels = try(length(af.metric_levels) == 0, true) ? null : [for level in af.metric_levels : {
              level_number   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.metric_levels.level_number, null)
              metric_default = try(level.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.metric_levels.metric, null)
              metric_maximum = try(level.metric_maximum, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.metric_levels.metric_maximum, null)
              }
            ]
            te_metric_flex_algo_levels = try(length(af.te_metric_flex_algo_levels) == 0, true) ? null : [for level in af.te_metric_flex_algo_levels : {
              level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.te_metric_flex_algo_levels.level_number, null)
              flex_algo    = try(level.flex_algo, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.te_metric_flex_algo_levels.flex_algo, null)
              }
            ]
            bandwidth_metric_flex_algo_levels = try(length(af.bandwidth_metric_flex_algo_levels) == 0, true) ? null : [for level in af.bandwidth_metric_flex_algo_levels : {
              level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.bandwidth_metric_flex_algo_levels.level_number, null)
              flex_algo    = try(level.flex_algo, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.bandwidth_metric_flex_algo_levels.flex_algo, null)
              }
            ]
            generic_metric_flex_algos = try(length(af.generic_metric_flex_algos) == 0, true) ? null : [for algo in af.generic_metric_flex_algos : {
              type   = try(algo.type, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.generic_metric_flex_algos.type, null)
              metric = try(algo.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.generic_metric_flex_algos.metric, null)
              }
            ]
            generic_metric_flex_algo_levels = try(length(af.generic_metric_flex_algo_levels) == 0, true) ? null : [for level in af.generic_metric_flex_algo_levels : {
              level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.generic_metric_flex_algo_levels.level_number, null)
              flex_algos_types = try(length(level.flex_algos_types) == 0, true) ? null : [for algo in level.flex_algos_types : {
                type   = try(algo.type, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.generic_metric_flex_algo_levels.flex_algos_types.type, null)
                metric = try(algo.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.generic_metric_flex_algo_levels.flex_algos_types.metric, null)
                }
              ]
              }
            ]
            tag_levels = try(length(af.tag_levels) == 0, true) ? null : [for level in af.tag_levels : {
              level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.tag_levels.level_number, null)
              tag          = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.tag_levels.tag, null)
              }
            ]
            prefix_sid_algorithms = try(length(af.prefix_sid_algorithms) == 0, true) ? null : [for algo in af.prefix_sid_algorithms : {
              algorithm              = try(algo.algorithm, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_algorithms.algorithm, null)
              index_id               = try(algo.index_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_algorithms.index_id, null)
              index_php_disable      = try(algo.index_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_algorithms.index_php_disable, null)
              index_explicit_null    = try(algo.index_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_algorithms.index_explicit_null, null)
              index_n_flag_clear     = try(algo.index_n_flag_clear, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_algorithms.index_n_flag_clear, null)
              absolute_id            = try(algo.absolute_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_algorithms.absolute_id, null)
              absolute_php_disable   = try(algo.absolute_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_algorithms.absolute_php_disable, null)
              absolute_explicit_null = try(algo.absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_algorithms.absolute_explicit_null, null)
              absolute_n_flag_clear  = try(algo.absolute_n_flag_clear, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.prefix_sid_algorithms.absolute_n_flag_clear, null)
              }
            ]
            adjacency_sid_indices = try(length(af.adjacency_sid_indices) == 0, true) ? null : [for sid in af.adjacency_sid_indices : {
              index_number = try(sid.index_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.adjacency_sid_indices.index_number, null)
              protected    = try(sid.protected, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.adjacency_sid_indices.protected, null)
              }
            ]
            adjacency_sid_absolutes = try(length(af.adjacency_sid_absolutes) == 0, true) ? null : [for sid in af.adjacency_sid_absolutes : {
              absolute_number = try(sid.absolute_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.adjacency_sid_absolutes.absolute_number, null)
              protected       = try(sid.protected, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.adjacency_sid_absolutes.protected, null)
              }
            ]
            fast_reroute_levels = try(length(af.fast_reroute_levels) == 0, true) ? null : [for level in af.fast_reroute_levels : {
              level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_levels.level_number, null)
              per_prefix   = try(level.per_prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_levels.per_prefix, null)
              per_link     = try(level.per_link, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_levels.per_link, null)
              }
            ]
            fast_reroute_per_prefix_tiebreaker_default_levels = try(length(af.fast_reroute_per_prefix.tiebreaker_default_levels) == 0, true) ? null : [for level in af.fast_reroute_per_prefix.tiebreaker_default_levels : {
              level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.tiebreaker_default_levels.level_number, null)
              }
            ]
            fast_reroute_per_prefix_tiebreaker_node_protecting_levels = try(length(af.fast_reroute_per_prefix.tiebreaker_node_protecting_levels) == 0, true) ? null : [for level in af.fast_reroute_per_prefix.tiebreaker_node_protecting_levels : {
              level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.tiebreaker_node_protecting_levels.level_number, null)
              index        = try(level.index, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.tiebreaker_node_protecting_levels.index, null)
              }
            ]
            fast_reroute_per_prefix_tiebreaker_srlg_disjoint_levels = try(length(af.fast_reroute_per_prefix.tiebreaker_srlg_disjoint_levels) == 0, true) ? null : [for level in af.fast_reroute_per_prefix.tiebreaker_srlg_disjoint_levels : {
              level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.tiebreaker_srlg_disjoint_levels.level_number, null)
              index        = try(level.index, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.tiebreaker_srlg_disjoint_levels.index, null)
              }
            ]
            fast_reroute_per_prefix_tiebreaker_lc_disjoint_levels = try(length(af.fast_reroute_per_prefix.tiebreaker_lc_disjoint_levels) == 0, true) ? null : [for level in af.fast_reroute_per_prefix.tiebreaker_lc_disjoint_levels : {
              level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.tiebreaker_lc_disjoint_levels.level_number, null)
              index        = try(level.index, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.tiebreaker_lc_disjoint_levels.index, null)
              }
            ]
            fast_reroute_per_prefix_remote_lfa_maximum_metric_levels = try(length(af.fast_reroute_per_prefix.remote_lfa_maximum_metric_levels) == 0, true) ? null : [for level in af.fast_reroute_per_prefix.remote_lfa_maximum_metric_levels : {
              level_number   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.remote_lfa_maximum_metric_levels.level_number, null)
              maximum_metric = try(level.maximum_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.remote_lfa_maximum_metric_levels.maximum_metric, null)
              }
            ]
            fast_reroute_per_prefix_remote_lfa_tunnel_mpls_ldp_levels = try(length(af.fast_reroute_per_prefix.remote_lfa_tunnel_mpls_ldp_levels) == 0, true) ? null : [for level in af.fast_reroute_per_prefix.remote_lfa_tunnel_mpls_ldp_levels : {
              level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.remote_lfa_tunnel_mpls_ldp_levels.level_number, null)
              }
            ]
            fast_reroute_per_prefix_ti_lfa_levels = try(length(af.fast_reroute_per_prefix.ti_lfa_levels) == 0, true) ? null : [for level in af.fast_reroute_per_prefix.ti_lfa_levels : {
              level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.ti_lfa_levels.level_number, null)
              }
            ]
            fast_reroute_per_prefix_exclude_interfaces = try(length(af.fast_reroute_per_prefix.exclude_interfaces) == 0, true) ? null : [for intf in af.fast_reroute_per_prefix.exclude_interfaces : {
              interface_name = try(intf.interface_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.exclude_interfaces.interface_name, null)
              level          = try(intf.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.exclude_interfaces.level_number, null)
              }
            ]
            fast_reroute_per_prefix_lfa_candidate_interfaces = try(length(af.fast_reroute_per_prefix.lfa_candidate_interfaces) == 0, true) ? null : [for intf in af.fast_reroute_per_prefix.lfa_candidate_interfaces : {
              interface_name = try(intf.interface_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.lfa_candidate_interfaces.interface_name, null)
              level          = try(intf.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix.lfa_candidate_interfaces.level_number, null)
              }
            ]
            fast_reroute_per_link_exclude_interfaces = try(length(af.fast_reroute_per_link.exclude_interfaces) == 0, true) ? null : [for intf in af.fast_reroute_per_link.exclude_interfaces : {
              interface_name = try(intf.interface_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_link.exclude_interfaces.interface_name, null)
              level          = try(intf.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_link.exclude_interfaces.level_number, null)
              }
            ]
            fast_reroute_per_link_lfa_candidate_interfaces = try(length(af.fast_reroute_per_link.lfa_candidate_interfaces) == 0, true) ? null : [for intf in af.fast_reroute_per_link.lfa_candidate_interfaces : {
              interface_name = try(intf.interface_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_link.lfa_candidate_interfaces.interface_name, null)
              level          = try(intf.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_link.lfa_candidate_interfaces.level_number, null)
              }
            ]
            weight_levels = try(length(af.weight_levels) == 0, true) ? null : [for level in af.weight_levels : {
              level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.weight_levels.level_number, null)
              weight       = try(level.weight, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.weight_levels.weight, null)
              }
            ]
            auto_metric_proactive_protect_metric_levels = try(length(af.auto_metric_proactive_protect_metric_levels) == 0, true) ? null : [for level in af.auto_metric_proactive_protect_metric_levels : {
              level_number      = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.auto_metric_proactive_protect_metric_levels.level_number, null)
              proactive_protect = try(level.proactive_protect, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.auto_metric_proactive_protect_metric_levels.proactive_protect, null)
              }
            ]
            advertise_prefix_route_policy_levels = try(length(af.advertise_prefix_route_policy_levels) == 0, true) ? null : [for level in af.advertise_prefix_route_policy_levels : {
              level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.advertise_prefix_route_policy_levels.level_number, null)
              route_policy = try(level.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.advertise_prefix_route_policy_levels.route_policy, null)
              }
            ]
          }
        ]
      ]
    ]
  ])
}

resource "iosxr_router_isis_interface_address_family" "router_isis_interface_address_family" {
  for_each                                                  = { for af in local.router_isis_interface_address_family : af.key => af }
  device                                                    = each.value.device_name
  process_id                                                = each.value.process_id
  interface_name                                            = each.value.interface_name
  af_name                                                   = each.value.af_name
  saf_name                                                  = each.value.saf_name
  metric_maximum                                            = each.value.metric_maximum
  metric_default                                            = each.value.metric_default
  te_metric_flex_algo                                       = each.value.te_metric_flex_algo
  bandwidth_metric_flex_algo                                = each.value.bandwidth_metric_flex_algo
  mpls_ldp_sync                                             = each.value.mpls_ldp_sync
  mpls_ldp_sync_level                                       = each.value.mpls_ldp_sync_level
  tag                                                       = each.value.tag
  prefix_sid_strict_spf_index_id                            = each.value.prefix_sid_strict_spf_index_id
  prefix_sid_strict_spf_index_php_disable                   = each.value.prefix_sid_strict_spf_index_php_disable
  prefix_sid_strict_spf_index_explicit_null                 = each.value.prefix_sid_strict_spf_index_explicit_null
  prefix_sid_strict_spf_index_n_flag_clear                  = each.value.prefix_sid_strict_spf_index_n_flag_clear
  prefix_sid_strict_spf_absolute_id                         = each.value.prefix_sid_strict_spf_absolute_id
  prefix_sid_strict_spf_absolute_php_disable                = each.value.prefix_sid_strict_spf_absolute_php_disable
  prefix_sid_strict_spf_absolute_explicit_null              = each.value.prefix_sid_strict_spf_absolute_explicit_null
  prefix_sid_strict_spf_absolute_n_flag_clear               = each.value.prefix_sid_strict_spf_absolute_n_flag_clear
  prefix_sid_index_id                                       = each.value.prefix_sid_index_id
  prefix_sid_index_php_disable                              = each.value.prefix_sid_index_php_disable
  prefix_sid_index_explicit_null                            = each.value.prefix_sid_index_explicit_null
  prefix_sid_index_n_flag_clear                             = each.value.prefix_sid_index_n_flag_clear
  prefix_sid_absolute_id                                    = each.value.prefix_sid_absolute_id
  prefix_sid_absolute_php_disable                           = each.value.prefix_sid_absolute_php_disable
  prefix_sid_absolute_explicit_null                         = each.value.prefix_sid_absolute_explicit_null
  prefix_sid_absolute_n_flag_clear                          = each.value.prefix_sid_absolute_n_flag_clear
  fast_reroute_per_prefix                                   = each.value.fast_reroute_per_prefix
  fast_reroute_per_link                                     = each.value.fast_reroute_per_link
  fast_reroute_per_prefix_tiebreaker_default                = each.value.fast_reroute_per_prefix_tiebreaker_default
  fast_reroute_per_prefix_tiebreaker_node_protecting_index  = each.value.fast_reroute_per_prefix_tiebreaker_node_protecting_index
  fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index    = each.value.fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index
  fast_reroute_per_prefix_tiebreaker_lc_disjoint_index      = each.value.fast_reroute_per_prefix_tiebreaker_lc_disjoint_index
  fast_reroute_per_prefix_remote_lfa_maximum_metric         = each.value.fast_reroute_per_prefix_remote_lfa_maximum_metric
  fast_reroute_per_prefix_remote_lfa_tunnel_mpls_ldp        = each.value.fast_reroute_per_prefix_remote_lfa_tunnel_mpls_ldp
  fast_reroute_per_prefix_ti_lfa                            = each.value.fast_reroute_per_prefix_ti_lfa
  link_group_name                                           = each.value.link_group_name
  link_group_level                                          = each.value.link_group_level
  weight                                                    = each.value.weight
  auto_metric_proactive_protect_metric                      = each.value.auto_metric_proactive_protect_metric
  advertise_prefix_route_policy                             = each.value.advertise_prefix_route_policy
  metric_levels                                             = each.value.metric_levels
  te_metric_flex_algo_levels                                = each.value.te_metric_flex_algo_levels
  bandwidth_metric_flex_algo_levels                         = each.value.bandwidth_metric_flex_algo_levels
  generic_metric_flex_algos                                 = each.value.generic_metric_flex_algos
  generic_metric_flex_algo_levels                           = each.value.generic_metric_flex_algo_levels
  tag_levels                                                = each.value.tag_levels
  prefix_sid_algorithms                                     = each.value.prefix_sid_algorithms
  adjacency_sid_indices                                     = each.value.adjacency_sid_indices
  adjacency_sid_absolutes                                   = each.value.adjacency_sid_absolutes
  fast_reroute_levels                                       = each.value.fast_reroute_levels
  fast_reroute_per_prefix_tiebreaker_default_levels         = each.value.fast_reroute_per_prefix_tiebreaker_default_levels
  fast_reroute_per_prefix_tiebreaker_node_protecting_levels = each.value.fast_reroute_per_prefix_tiebreaker_node_protecting_levels
  fast_reroute_per_prefix_tiebreaker_srlg_disjoint_levels   = each.value.fast_reroute_per_prefix_tiebreaker_srlg_disjoint_levels
  fast_reroute_per_prefix_tiebreaker_lc_disjoint_levels     = each.value.fast_reroute_per_prefix_tiebreaker_lc_disjoint_levels
  fast_reroute_per_prefix_remote_lfa_maximum_metric_levels  = each.value.fast_reroute_per_prefix_remote_lfa_maximum_metric_levels
  fast_reroute_per_prefix_remote_lfa_tunnel_mpls_ldp_levels = each.value.fast_reroute_per_prefix_remote_lfa_tunnel_mpls_ldp_levels
  fast_reroute_per_prefix_ti_lfa_levels                     = each.value.fast_reroute_per_prefix_ti_lfa_levels
  fast_reroute_per_prefix_exclude_interfaces                = each.value.fast_reroute_per_prefix_exclude_interfaces
  fast_reroute_per_prefix_lfa_candidate_interfaces          = each.value.fast_reroute_per_prefix_lfa_candidate_interfaces
  fast_reroute_per_link_exclude_interfaces                  = each.value.fast_reroute_per_link_exclude_interfaces
  fast_reroute_per_link_lfa_candidate_interfaces            = each.value.fast_reroute_per_link_lfa_candidate_interfaces
  weight_levels                                             = each.value.weight_levels
  auto_metric_proactive_protect_metric_levels               = each.value.auto_metric_proactive_protect_metric_levels
  advertise_prefix_route_policy_levels                      = each.value.advertise_prefix_route_policy_levels

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_isis_interface.router_isis_interface
  ]
}

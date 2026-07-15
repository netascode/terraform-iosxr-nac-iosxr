locals {
  router_ospf_vrf_area_interface = flatten([
    for device in local.devices : [
      for ospf_process in try(local.device_config[device.name].routing.ospf_processes, []) : [
        for vrf in try(ospf_process.vrfs, []) : [
          for area in try(vrf.areas, []) : [
            for interface in try(area.interfaces, []) : {
              key                                                             = format("%s/%s/%s/%s/%s", device.name, ospf_process.id, vrf.name, area.id, interface.name)
              device_name                                                     = device.name
              process_name                                                    = try(ospf_process.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.id, null)
              vrf_name                                                        = try(vrf.name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.name, null)
              area_id                                                         = try(area.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.id, null)
              interface_name                                                  = try(interface.name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.name, null)
              authentication_key_encrypted                                    = try(interface.authentication.key.password, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.authentication.key.password, null)
              authentication_message_digest                                   = try(interface.authentication.type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.authentication.type, null) == "message-digest" ? true : null
              authentication_keychain_name                                    = try(interface.authentication.keychain, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.authentication.keychain, null)
              authentication_keychain                                         = try(interface.authentication.type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.authentication.type, null) == "keychain" ? true : null
              authentication_null                                             = try(interface.authentication.type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.authentication.type, null) == "null" ? true : null
              network_broadcast                                               = try(interface.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.network, null) == "broadcast" ? true : null
              network_non_broadcast                                           = try(interface.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.network, null) == "non-broadcast" ? true : null
              network_point_to_point                                          = try(interface.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.network, null) == "point-to-point" ? true : null
              network_point_to_multipoint                                     = try(interface.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.network, null) == "point-to-multipoint" ? true : null
              mpls_ldp_sync                                                   = try(interface.mpls_ldp_sync, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.mpls_ldp_sync, null) == "enable" ? true : null
              mpls_ldp_sync_disable                                           = try(interface.mpls_ldp_sync, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.mpls_ldp_sync, null) == "disable" ? true : null
              cost                                                            = try(interface.cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.cost, null)
              cost_fallback                                                   = try(interface.cost_fallback.cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.cost_fallback.cost, null)
              cost_fallback_threshold                                         = try(interface.cost_fallback.threshold, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.cost_fallback.threshold, null)
              cost_fallback_anomaly_delay_igp_metric_increment                = try(interface.cost_fallback.anomaly_delay.igp_metric_increment, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.cost_fallback.anomaly_delay.igp_metric_increment, null)
              cost_fallback_anomaly_delay_igp_metric_multiplier               = try(interface.cost_fallback.anomaly_delay.igp_metric_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.cost_fallback.anomaly_delay.igp_metric_multiplier, null)
              cost_fallback_anomaly_delay_igp_metric_value                    = try(interface.cost_fallback.anomaly_delay.igp_metric_value, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.cost_fallback.anomaly_delay.igp_metric_value, null)
              cost_fallback_anomaly_delay_igp_metric_disable                  = try(interface.cost_fallback.anomaly_delay.igp_metric_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.cost_fallback.anomaly_delay.igp_metric_disable, null)
              cost_fallback_anomaly_delay_te_metric_increment                 = try(interface.cost_fallback.anomaly_delay.te_metric_increment, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.cost_fallback.anomaly_delay.te_metric_increment, null)
              cost_fallback_anomaly_delay_te_metric_multiplier                = try(interface.cost_fallback.anomaly_delay.te_metric_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.cost_fallback.anomaly_delay.te_metric_multiplier, null)
              cost_fallback_anomaly_delay_te_metric_value                     = try(interface.cost_fallback.anomaly_delay.te_metric_value, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.cost_fallback.anomaly_delay.te_metric_value, null)
              cost_fallback_anomaly_delay_te_metric_disable                   = try(interface.cost_fallback.anomaly_delay.te_metric_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.cost_fallback.anomaly_delay.te_metric_disable, null)
              hello_interval                                                  = try(interface.hello_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.hello_interval, null)
              dead_interval                                                   = try(interface.dead_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.dead_interval, null)
              priority                                                        = try(interface.priority, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.priority, null)
              retransmit_interval                                             = try(interface.retransmit_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.retransmit_interval, null)
              transmit_delay                                                  = try(interface.transmit_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.transmit_delay, null)
              flood_reduction_enable                                          = try(interface.flood_reduction, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.flood_reduction, null) == "enable" ? true : null
              flood_reduction_disable                                         = try(interface.flood_reduction, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.flood_reduction, null) == "disable" ? true : null
              demand_circuit_enable                                           = try(interface.demand_circuit, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.demand_circuit, null) == "enable" ? true : null
              demand_circuit_disable                                          = try(interface.demand_circuit, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.demand_circuit, null) == "disable" ? true : null
              mtu_ignore_enable                                               = try(interface.mtu_ignore, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.mtu_ignore, null) == "enable" ? true : null
              mtu_ignore_disable                                              = try(interface.mtu_ignore, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.mtu_ignore, null) == "disable" ? true : null
              database_filter_all_out_enable                                  = try(interface.database_filter_all_out, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.database_filter_all_out, null) == "enable" ? true : null
              database_filter_all_out_disable                                 = try(interface.database_filter_all_out, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.database_filter_all_out, null) == "disable" ? true : null
              passive_enable                                                  = try(interface.passive, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.passive, null) == "enable" ? true : null
              passive_disable                                                 = try(interface.passive, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.passive, null) == "disable" ? true : null
              distribute_list_in_acl                                          = try(interface.distribute_list_in_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.distribute_list_in_acl, null)
              distribute_list_in_route_policy                                 = try(interface.distribute_list_in_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.distribute_list_in_route_policy, null)
              packet_size                                                     = try(interface.packet_size, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.packet_size, null)
              bfd_fast_detect                                                 = try(interface.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.bfd_fast_detect, null) == "enable" ? true : null
              bfd_fast_detect_strict_mode                                     = try(interface.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.bfd_fast_detect, null) == "strict-mode" ? true : null
              bfd_fast_detect_disable                                         = try(interface.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.bfd_fast_detect, null) == "disable" ? true : null
              bfd_minimum_interval                                            = try(interface.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.bfd_minimum_interval, null)
              bfd_multiplier                                                  = try(interface.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.bfd_multiplier, null)
              security_ttl                                                    = try(interface.security_ttl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.security_ttl, null) == "enable" ? true : null
              security_ttl_hops                                               = try(interface.security_ttl_hops, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.security_ttl_hops, null)
              security_ttl_disable                                            = try(interface.security_ttl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.security_ttl, null) == "disable" ? true : null
              prefix_suppression                                              = try(interface.prefix_suppression, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_suppression, null) == "enable" ? true : null
              prefix_suppression_disable                                      = try(interface.prefix_suppression, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_suppression, null) == "disable" ? true : null
              fast_reroute_disable                                            = try(interface.fast_reroute_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_disable, null)
              fast_reroute_per_link                                           = try(interface.fast_reroute_per_link.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_link.enable, null)
              fast_reroute_per_link_use_candidate_only_enable                 = try(interface.fast_reroute_per_link.use_candidate_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_link.use_candidate_only, null) == "enable" ? true : null
              fast_reroute_per_link_use_candidate_only_disable                = try(interface.fast_reroute_per_link.use_candidate_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_link.use_candidate_only, null) == "disable" ? true : null
              fast_reroute_per_prefix                                         = try(interface.fast_reroute_per_prefix.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.enable, null)
              fast_reroute_per_prefix_use_candidate_only_enable               = try(interface.fast_reroute_per_prefix.use_candidate_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.use_candidate_only, null) == "enable" ? true : null
              fast_reroute_per_prefix_use_candidate_only_disable              = try(interface.fast_reroute_per_prefix.use_candidate_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.use_candidate_only, null) == "disable" ? true : null
              fast_reroute_per_prefix_tiebreaker_downstream_index             = try(interface.fast_reroute_per_prefix.tiebreaker.downstream_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.downstream_index, null)
              fast_reroute_per_prefix_tiebreaker_downstream_disable           = try(interface.fast_reroute_per_prefix.tiebreaker.downstream_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.downstream_disable, null)
              fast_reroute_per_prefix_tiebreaker_lc_disjoint_index            = try(interface.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, null)
              fast_reroute_per_prefix_tiebreaker_lc_disjoint_disable          = try(interface.fast_reroute_per_prefix.tiebreaker.lc_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.lc_disjoint_disable, null)
              fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index   = try(interface.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, null)
              fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_disable = try(interface.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_disable, null)
              fast_reroute_per_prefix_tiebreaker_node_protecting_index        = try(interface.fast_reroute_per_prefix.tiebreaker.node_protecting_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.node_protecting_index, null)
              fast_reroute_per_prefix_tiebreaker_node_protecting_disable      = try(interface.fast_reroute_per_prefix.tiebreaker.node_protecting_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.node_protecting_disable, null)
              fast_reroute_per_prefix_tiebreaker_primary_path_index           = try(interface.fast_reroute_per_prefix.tiebreaker.primary_path_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.primary_path_index, null)
              fast_reroute_per_prefix_tiebreaker_primary_path_disable         = try(interface.fast_reroute_per_prefix.tiebreaker.primary_path_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.primary_path_disable, null)
              fast_reroute_per_prefix_tiebreaker_secondary_path_index         = try(interface.fast_reroute_per_prefix.tiebreaker.secondary_path_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.secondary_path_index, null)
              fast_reroute_per_prefix_tiebreaker_secondary_path_disable       = try(interface.fast_reroute_per_prefix.tiebreaker.secondary_path_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.secondary_path_disable, null)
              fast_reroute_per_prefix_tiebreaker_interface_disjoint_index     = try(interface.fast_reroute_per_prefix.tiebreaker.interface_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.interface_disjoint_index, null)
              fast_reroute_per_prefix_tiebreaker_interface_disjoint_disable   = try(interface.fast_reroute_per_prefix.tiebreaker.interface_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.interface_disjoint_disable, null)
              fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index          = try(interface.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, null)
              fast_reroute_per_prefix_tiebreaker_srlg_disjoint_disable        = try(interface.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_disable, null)
              loopback_stub_network_enable                                    = try(interface.loopback_stub_network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.loopback_stub_network, null) == "enable" ? true : null
              loopback_stub_network_disable                                   = try(interface.loopback_stub_network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.loopback_stub_network, null) == "disable" ? true : null
              link_down_fast_detect                                           = try(interface.link_down_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.link_down_fast_detect, null)
              prefix_sid_index                                                = try(interface.prefix_sid.index.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid.index.id, null)
              prefix_sid_index_explicit_null                                  = try(interface.prefix_sid.index.explicit_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid.index.explicit_null, null)
              prefix_sid_index_n_flag_clear                                   = try(interface.prefix_sid.index.n_flag_clear, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid.index.n_flag_clear, null)
              prefix_sid_absolute                                             = try(interface.prefix_sid.absolute.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid.absolute.id, null)
              prefix_sid_absolute_explicit_null                               = try(interface.prefix_sid.absolute.explicit_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid.absolute.explicit_null, null)
              prefix_sid_absolute_n_flag_clear                                = try(interface.prefix_sid.absolute.n_flag_clear, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid.absolute.n_flag_clear, null)
              prefix_sid_strict_spf_index                                     = try(interface.prefix_sid_strict_spf.index.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid_strict_spf.index.id, null)
              prefix_sid_strict_spf_index_explicit_null                       = try(interface.prefix_sid_strict_spf.index.explicit_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid_strict_spf.index.explicit_null, null)
              prefix_sid_strict_spf_index_n_flag_clear                        = try(interface.prefix_sid_strict_spf.index.n_flag_clear, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid_strict_spf.index.n_flag_clear, null)
              prefix_sid_strict_spf_absolute                                  = try(interface.prefix_sid_strict_spf.absolute.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid_strict_spf.absolute.id, null)
              prefix_sid_strict_spf_absolute_explicit_null                    = try(interface.prefix_sid_strict_spf.absolute.explicit_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid_strict_spf.absolute.explicit_null, null)
              prefix_sid_strict_spf_absolute_n_flag_clear                     = try(interface.prefix_sid_strict_spf.absolute.n_flag_clear, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid_strict_spf.absolute.n_flag_clear, null)
              weight                                                          = try(interface.weight, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.weight, null)
              advertise_prefix_route_policy                                   = try(interface.advertise_prefix_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.advertise_prefix_route_policy, null)
              delay_normalize_interval                                        = try(interface.delay_normalize_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.delay_normalize_interval, null)
              delay_normalize_offset                                          = try(interface.delay_normalize_offset, interface.delay_normalize_interval != null ? 0 : null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.delay_normalize_offset, null)
              neighbors = try(length(interface.neighbors) == 0, true) ? null : [for neighbor in interface.neighbors : {
                address                 = try(neighbor.address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.neighbors.address, null)
                database_filter_all_out = try(neighbor.database_filter_all_out, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.neighbors.database_filter_all_out, null)
                priority                = try(neighbor.priority, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.neighbors.priority, null)
                poll_interval           = try(neighbor.poll_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.neighbors.poll_interval, null)
                cost                    = try(neighbor.cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.neighbors.cost, null)
              }]
              message_digest_keys = try(length(interface.authentication.message_digest_keys) == 0, true) ? null : [for key in interface.authentication.message_digest_keys : {
                key_id        = try(key.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.authentication.message_digest_keys.id, null)
                md5_encrypted = try(key.password, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.authentication.message_digest_keys.password, null)
              }]
              fast_reroute_per_link_exclude_interfaces = try(length(interface.fast_reroute_per_link.exclude_interfaces) == 0, true) ? null : [for iface in interface.fast_reroute_per_link.exclude_interfaces : {
                interface_name = try(iface.name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_link.exclude_interfaces.name, null)
              }]
              fast_reroute_per_link_lfa_candidate_interfaces = try(length(interface.fast_reroute_per_link.lfa_candidate_interfaces) == 0, true) ? null : [for iface in interface.fast_reroute_per_link.lfa_candidate_interfaces : {
                interface_name = try(iface.name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_link.lfa_candidate_interfaces.name, null)
              }]
              fast_reroute_per_prefix_exclude_interfaces = try(length(interface.fast_reroute_per_prefix.exclude_interfaces) == 0, true) ? null : [for iface in interface.fast_reroute_per_prefix.exclude_interfaces : {
                interface_name = try(iface.name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.exclude_interfaces.name, null)
              }]
              fast_reroute_per_prefix_lfa_candidate_interfaces = try(length(interface.fast_reroute_per_prefix.lfa_candidate_interfaces) == 0, true) ? null : [for iface in interface.fast_reroute_per_prefix.lfa_candidate_interfaces : {
                interface_name = try(iface.name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.fast_reroute_per_prefix.lfa_candidate_interfaces.name, null)
              }]
              prefix_sid_algorithms = try(length(interface.prefix_sid_algorithms) == 0, true) ? null : [for alg in interface.prefix_sid_algorithms : {
                algorithm_number       = try(alg.number, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid_algorithms.number, null)
                index                  = try(alg.index.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid_algorithms.index.id, null)
                index_explicit_null    = try(alg.index.explicit_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid_algorithms.index.explicit_null, null)
                index_n_flag_clear     = try(alg.index.n_flag_clear, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid_algorithms.index.n_flag_clear, null)
                absolute               = try(alg.absolute.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid_algorithms.absolute.id, null)
                absolute_explicit_null = try(alg.absolute.explicit_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid_algorithms.absolute.explicit_null, null)
                absolute_n_flag_clear  = try(alg.absolute.n_flag_clear, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.prefix_sid_algorithms.absolute.n_flag_clear, null)
              }]
              adjacency_sid_indexes = try(length(interface.adjacency_sids.index) == 0, true) ? null : [for idx in interface.adjacency_sids.index : {
                sid_index        = try(idx.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.adjacency_sids.index.id, null)
                protected        = try(idx.protected, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.adjacency_sids.index.protected, null)
                neighbor_address = try(idx.neighbor_address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.adjacency_sids.index.neighbor_address, null)
              }]
              adjacency_sid_absolutes = try(length(interface.adjacency_sids.absolute) == 0, true) ? null : [for abs in interface.adjacency_sids.absolute : {
                sid_label        = try(abs.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.adjacency_sids.absolute.id, null)
                protected        = try(abs.protected, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.adjacency_sids.absolute.protected, null)
                neighbor_address = try(abs.neighbor_address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.adjacency_sids.absolute.neighbor_address, null)
              }]
            }
          ]
        ]
      ]
    ]
  ])
}

resource "iosxr_router_ospf_vrf_area_interface" "router_ospf_vrf_area_interface" {
  for_each                                                        = { for interface in local.router_ospf_vrf_area_interface : interface.key => interface }
  device                                                          = each.value.device_name
  process_name                                                    = each.value.process_name
  vrf_name                                                        = each.value.vrf_name
  area_id                                                         = each.value.area_id
  interface_name                                                  = each.value.interface_name
  authentication_key_encrypted                                    = each.value.authentication_key_encrypted
  authentication_message_digest                                   = each.value.authentication_message_digest
  authentication_keychain_name                                    = each.value.authentication_keychain_name
  authentication_keychain                                         = each.value.authentication_keychain
  authentication_null                                             = each.value.authentication_null
  network_broadcast                                               = each.value.network_broadcast
  network_non_broadcast                                           = each.value.network_non_broadcast
  network_point_to_point                                          = each.value.network_point_to_point
  network_point_to_multipoint                                     = each.value.network_point_to_multipoint
  mpls_ldp_sync                                                   = each.value.mpls_ldp_sync
  mpls_ldp_sync_disable                                           = each.value.mpls_ldp_sync_disable
  cost                                                            = each.value.cost
  cost_fallback                                                   = each.value.cost_fallback
  cost_fallback_threshold                                         = each.value.cost_fallback_threshold
  cost_fallback_anomaly_delay_igp_metric_increment                = each.value.cost_fallback_anomaly_delay_igp_metric_increment
  cost_fallback_anomaly_delay_igp_metric_multiplier               = each.value.cost_fallback_anomaly_delay_igp_metric_multiplier
  cost_fallback_anomaly_delay_igp_metric_value                    = each.value.cost_fallback_anomaly_delay_igp_metric_value
  cost_fallback_anomaly_delay_igp_metric_disable                  = each.value.cost_fallback_anomaly_delay_igp_metric_disable
  cost_fallback_anomaly_delay_te_metric_increment                 = each.value.cost_fallback_anomaly_delay_te_metric_increment
  cost_fallback_anomaly_delay_te_metric_multiplier                = each.value.cost_fallback_anomaly_delay_te_metric_multiplier
  cost_fallback_anomaly_delay_te_metric_value                     = each.value.cost_fallback_anomaly_delay_te_metric_value
  cost_fallback_anomaly_delay_te_metric_disable                   = each.value.cost_fallback_anomaly_delay_te_metric_disable
  hello_interval                                                  = each.value.hello_interval
  dead_interval                                                   = each.value.dead_interval
  priority                                                        = each.value.priority
  retransmit_interval                                             = each.value.retransmit_interval
  transmit_delay                                                  = each.value.transmit_delay
  flood_reduction_enable                                          = each.value.flood_reduction_enable
  flood_reduction_disable                                         = each.value.flood_reduction_disable
  demand_circuit_enable                                           = each.value.demand_circuit_enable
  demand_circuit_disable                                          = each.value.demand_circuit_disable
  mtu_ignore_enable                                               = each.value.mtu_ignore_enable
  mtu_ignore_disable                                              = each.value.mtu_ignore_disable
  database_filter_all_out_enable                                  = each.value.database_filter_all_out_enable
  database_filter_all_out_disable                                 = each.value.database_filter_all_out_disable
  passive_enable                                                  = each.value.passive_enable
  passive_disable                                                 = each.value.passive_disable
  distribute_list_in_acl                                          = each.value.distribute_list_in_acl
  distribute_list_in_route_policy                                 = each.value.distribute_list_in_route_policy
  packet_size                                                     = each.value.packet_size
  bfd_fast_detect                                                 = each.value.bfd_fast_detect
  bfd_fast_detect_strict_mode                                     = each.value.bfd_fast_detect_strict_mode
  bfd_fast_detect_disable                                         = each.value.bfd_fast_detect_disable
  bfd_minimum_interval                                            = each.value.bfd_minimum_interval
  bfd_multiplier                                                  = each.value.bfd_multiplier
  security_ttl                                                    = each.value.security_ttl
  security_ttl_hops                                               = each.value.security_ttl_hops
  security_ttl_disable                                            = each.value.security_ttl_disable
  prefix_suppression                                              = each.value.prefix_suppression
  prefix_suppression_disable                                      = each.value.prefix_suppression_disable
  fast_reroute_disable                                            = each.value.fast_reroute_disable
  fast_reroute_per_link                                           = each.value.fast_reroute_per_link
  fast_reroute_per_link_use_candidate_only_enable                 = each.value.fast_reroute_per_link_use_candidate_only_enable
  fast_reroute_per_link_use_candidate_only_disable                = each.value.fast_reroute_per_link_use_candidate_only_disable
  fast_reroute_per_prefix                                         = each.value.fast_reroute_per_prefix
  fast_reroute_per_prefix_use_candidate_only_enable               = each.value.fast_reroute_per_prefix_use_candidate_only_enable
  fast_reroute_per_prefix_use_candidate_only_disable              = each.value.fast_reroute_per_prefix_use_candidate_only_disable
  fast_reroute_per_prefix_tiebreaker_downstream_index             = each.value.fast_reroute_per_prefix_tiebreaker_downstream_index
  fast_reroute_per_prefix_tiebreaker_downstream_disable           = each.value.fast_reroute_per_prefix_tiebreaker_downstream_disable
  fast_reroute_per_prefix_tiebreaker_lc_disjoint_index            = each.value.fast_reroute_per_prefix_tiebreaker_lc_disjoint_index
  fast_reroute_per_prefix_tiebreaker_lc_disjoint_disable          = each.value.fast_reroute_per_prefix_tiebreaker_lc_disjoint_disable
  fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index   = each.value.fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index
  fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_disable = each.value.fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_disable
  fast_reroute_per_prefix_tiebreaker_node_protecting_index        = each.value.fast_reroute_per_prefix_tiebreaker_node_protecting_index
  fast_reroute_per_prefix_tiebreaker_node_protecting_disable      = each.value.fast_reroute_per_prefix_tiebreaker_node_protecting_disable
  fast_reroute_per_prefix_tiebreaker_primary_path_index           = each.value.fast_reroute_per_prefix_tiebreaker_primary_path_index
  fast_reroute_per_prefix_tiebreaker_primary_path_disable         = each.value.fast_reroute_per_prefix_tiebreaker_primary_path_disable
  fast_reroute_per_prefix_tiebreaker_secondary_path_index         = each.value.fast_reroute_per_prefix_tiebreaker_secondary_path_index
  fast_reroute_per_prefix_tiebreaker_secondary_path_disable       = each.value.fast_reroute_per_prefix_tiebreaker_secondary_path_disable
  fast_reroute_per_prefix_tiebreaker_interface_disjoint_index     = each.value.fast_reroute_per_prefix_tiebreaker_interface_disjoint_index
  fast_reroute_per_prefix_tiebreaker_interface_disjoint_disable   = each.value.fast_reroute_per_prefix_tiebreaker_interface_disjoint_disable
  fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index          = each.value.fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index
  fast_reroute_per_prefix_tiebreaker_srlg_disjoint_disable        = each.value.fast_reroute_per_prefix_tiebreaker_srlg_disjoint_disable
  loopback_stub_network_enable                                    = each.value.loopback_stub_network_enable
  loopback_stub_network_disable                                   = each.value.loopback_stub_network_disable
  link_down_fast_detect                                           = each.value.link_down_fast_detect
  prefix_sid_index                                                = each.value.prefix_sid_index
  prefix_sid_index_explicit_null                                  = each.value.prefix_sid_index_explicit_null
  prefix_sid_index_n_flag_clear                                   = each.value.prefix_sid_index_n_flag_clear
  prefix_sid_absolute                                             = each.value.prefix_sid_absolute
  prefix_sid_absolute_explicit_null                               = each.value.prefix_sid_absolute_explicit_null
  prefix_sid_absolute_n_flag_clear                                = each.value.prefix_sid_absolute_n_flag_clear
  prefix_sid_strict_spf_index                                     = each.value.prefix_sid_strict_spf_index
  prefix_sid_strict_spf_index_explicit_null                       = each.value.prefix_sid_strict_spf_index_explicit_null
  prefix_sid_strict_spf_index_n_flag_clear                        = each.value.prefix_sid_strict_spf_index_n_flag_clear
  prefix_sid_strict_spf_absolute                                  = each.value.prefix_sid_strict_spf_absolute
  prefix_sid_strict_spf_absolute_explicit_null                    = each.value.prefix_sid_strict_spf_absolute_explicit_null
  prefix_sid_strict_spf_absolute_n_flag_clear                     = each.value.prefix_sid_strict_spf_absolute_n_flag_clear
  weight                                                          = each.value.weight
  advertise_prefix_route_policy                                   = each.value.advertise_prefix_route_policy
  delay_normalize_interval                                        = each.value.delay_normalize_interval
  delay_normalize_offset                                          = each.value.delay_normalize_offset
  neighbors                                                       = each.value.neighbors
  message_digest_keys                                             = each.value.message_digest_keys
  fast_reroute_per_link_exclude_interfaces                        = each.value.fast_reroute_per_link_exclude_interfaces
  fast_reroute_per_link_lfa_candidate_interfaces                  = each.value.fast_reroute_per_link_lfa_candidate_interfaces
  fast_reroute_per_prefix_exclude_interfaces                      = each.value.fast_reroute_per_prefix_exclude_interfaces
  fast_reroute_per_prefix_lfa_candidate_interfaces                = each.value.fast_reroute_per_prefix_lfa_candidate_interfaces
  prefix_sid_algorithms                                           = each.value.prefix_sid_algorithms
  adjacency_sid_indexes                                           = each.value.adjacency_sid_indexes
  adjacency_sid_absolutes                                         = each.value.adjacency_sid_absolutes

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_vrf.vrf,
    iosxr_router_ospf_vrf_area.router_ospf_vrf_area
  ]
}

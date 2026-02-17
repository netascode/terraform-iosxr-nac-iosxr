locals {
  router_ospf_area_interface = flatten([
    for device in local.devices : [
      for ospf_process in try(local.device_config[device.name].routing.ospf_processes, []) : [
        for area in try(ospf_process.areas, []) : [
          for interface in try(area.interfaces, []) : {
            key                                                             = format("%s/%s/%s/%s", device.name, ospf_process.id, area.area_id, interface.interface_name)
            device_name                                                     = device.name
            process_name                                                    = try(ospf_process.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.id, null)
            area_id                                                         = try(area.area_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.area_id, null)
            interface_name                                                  = try(interface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.interface_name, null)
            authentication_key_encrypted                                    = try(interface.authentication_key_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.authentication_key_encrypted, null)
            authentication_message_digest                                   = try(interface.authentication_message_digest, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.authentication_message_digest, null)
            authentication_keychain_name                                    = try(interface.authentication_keychain_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.authentication_keychain_name, null)
            authentication_keychain                                         = try(interface.authentication_keychain, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.authentication_keychain, null)
            authentication_null                                             = try(interface.authentication_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.authentication_null, null)
            network_broadcast                                               = try(interface.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.network, null) == "broadcast" ? true : null
            network_non_broadcast                                           = try(interface.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.network, null) == "non_broadcast" ? true : null
            network_point_to_point                                          = try(interface.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.network, null) == "point_to_point" ? true : null
            network_point_to_multipoint                                     = try(interface.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.network, null) == "point_to_multipoint" ? true : null
            mpls_ldp_sync                                                   = try(interface.mpls_ldp_sync, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.mpls_ldp_sync, null)
            mpls_ldp_sync_disable                                           = try(interface.mpls_ldp_sync_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.mpls_ldp_sync_disable, null)
            cost                                                            = try(interface.cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.cost, null)
            cost_fallback                                                   = try(interface.cost_fallback, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.cost_fallback, null)
            cost_fallback_threshold                                         = try(interface.cost_fallback_threshold, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.cost_fallback_threshold, null)
            cost_fallback_anomaly_delay_igp_metric_increment                = try(interface.cost_fallback_anomaly_delay_igp_metric_increment, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.cost_fallback_anomaly_delay_igp_metric_increment, null)
            cost_fallback_anomaly_delay_igp_metric_multiplier               = try(interface.cost_fallback_anomaly_delay_igp_metric_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.cost_fallback_anomaly_delay_igp_metric_multiplier, null)
            cost_fallback_anomaly_delay_igp_metric_value                    = try(interface.cost_fallback_anomaly_delay_igp_metric_value, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.cost_fallback_anomaly_delay_igp_metric_value, null)
            cost_fallback_anomaly_delay_igp_metric_disable                  = try(interface.cost_fallback_anomaly_delay_igp_metric_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.cost_fallback_anomaly_delay_igp_metric_disable, null)
            cost_fallback_anomaly_delay_te_metric_increment                 = try(interface.cost_fallback_anomaly_delay_te_metric_increment, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.cost_fallback_anomaly_delay_te_metric_increment, null)
            cost_fallback_anomaly_delay_te_metric_multiplier                = try(interface.cost_fallback_anomaly_delay_te_metric_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.cost_fallback_anomaly_delay_te_metric_multiplier, null)
            cost_fallback_anomaly_delay_te_metric_value                     = try(interface.cost_fallback_anomaly_delay_te_metric_value, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.cost_fallback_anomaly_delay_te_metric_value, null)
            cost_fallback_anomaly_delay_te_metric_disable                   = try(interface.cost_fallback_anomaly_delay_te_metric_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.cost_fallback_anomaly_delay_te_metric_disable, null)
            hello_interval                                                  = try(interface.hello_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.hello_interval, null)
            dead_interval                                                   = try(interface.dead_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.dead_interval, null)
            priority                                                        = try(interface.priority, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.priority, null)
            retransmit_interval                                             = try(interface.retransmit_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.retransmit_interval, null)
            transmit_delay                                                  = try(interface.transmit_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.transmit_delay, null)
            flood_reduction_enable                                          = try(interface.flood_reduction_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.flood_reduction_enable, null)
            flood_reduction_disable                                         = try(interface.flood_reduction_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.flood_reduction_disable, null)
            demand_circuit_enable                                           = try(interface.demand_circuit_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.demand_circuit_enable, null)
            demand_circuit_disable                                          = try(interface.demand_circuit_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.demand_circuit_disable, null)
            mtu_ignore_enable                                               = try(interface.mtu_ignore_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.mtu_ignore_enable, null)
            mtu_ignore_disable                                              = try(interface.mtu_ignore_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.mtu_ignore_disable, null)
            database_filter_all_out_enable                                  = try(interface.database_filter_all_out_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.database_filter_all_out_enable, null)
            database_filter_all_out_disable                                 = try(interface.database_filter_all_out_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.database_filter_all_out_disable, null)
            passive_enable                                                  = try(interface.passive_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.passive_enable, null)
            passive_disable                                                 = try(interface.passive_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.passive_disable, null)
            distribute_list_in_acl                                          = try(interface.distribute_list_in_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.distribute_list_in_acl, null)
            distribute_list_in_route_policy                                 = try(interface.distribute_list_in_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.distribute_list_in_route_policy, null)
            packet_size                                                     = try(interface.packet_size, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.packet_size, null)
            bfd_fast_detect                                                 = try(interface.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.bfd_fast_detect, null) == "enable" ? true : null
            bfd_fast_detect_strict_mode                                     = try(interface.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.bfd_fast_detect, null) == "strict_mode" ? true : null
            bfd_fast_detect_disable                                         = try(interface.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.bfd_fast_detect, null) == "disable" ? true : null
            bfd_minimum_interval                                            = try(interface.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.bfd_minimum_interval, null)
            bfd_multiplier                                                  = try(interface.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.bfd_multiplier, null)
            security_ttl                                                    = try(interface.security_ttl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.security_ttl, null)
            security_ttl_hops                                               = try(interface.security_ttl_hops, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.security_ttl_hops, null)
            security_ttl_disable                                            = try(interface.security_ttl_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.security_ttl_disable, null)
            prefix_suppression                                              = try(interface.prefix_suppression, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_suppression, null)
            prefix_suppression_disable                                      = try(interface.prefix_suppression_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_suppression_disable, null)
            fast_reroute_disable                                            = try(interface.fast_reroute_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_disable, null)
            fast_reroute_per_link                                           = try(interface.fast_reroute_per_link.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_link.enable, null)
            fast_reroute_per_link_use_candidate_only_enable                 = try(interface.fast_reroute_per_link.use_candidate_only_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_link.use_candidate_only_enable, null)
            fast_reroute_per_link_use_candidate_only_disable                = try(interface.fast_reroute_per_link.use_candidate_only_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_link.use_candidate_only_disable, null)
            fast_reroute_per_prefix                                         = try(interface.fast_reroute_per_prefix.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.enable, null)
            fast_reroute_per_prefix_use_candidate_only_enable               = try(interface.fast_reroute_per_prefix.use_candidate_only_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.use_candidate_only_enable, null)
            fast_reroute_per_prefix_use_candidate_only_disable              = try(interface.fast_reroute_per_prefix.use_candidate_only_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.use_candidate_only_disable, null)
            fast_reroute_per_prefix_remote_lfa_tunnel_mpls_ldp              = try(interface.fast_reroute_per_prefix.remote_lfa_tunnel_mpls_ldp, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.remote_lfa_tunnel_mpls_ldp, null)
            fast_reroute_per_prefix_remote_lfa_disable                      = try(interface.fast_reroute_per_prefix.remote_lfa_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.remote_lfa_disable, null)
            fast_reroute_per_prefix_remote_lfa_maximum_cost                 = try(interface.fast_reroute_per_prefix.remote_lfa_maximum_cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.remote_lfa_maximum_cost, null)
            fast_reroute_per_prefix_ti_lfa_enable                           = try(interface.fast_reroute_per_prefix.ti_lfa_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.ti_lfa_enable, null)
            fast_reroute_per_prefix_ti_lfa_disable                          = try(interface.fast_reroute_per_prefix.ti_lfa_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.ti_lfa_disable, null)
            fast_reroute_per_prefix_tiebreaker_downstream_index             = try(interface.fast_reroute_per_prefix.tiebreaker.downstream_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.downstream_index, null)
            fast_reroute_per_prefix_tiebreaker_downstream_disable           = try(interface.fast_reroute_per_prefix.tiebreaker.downstream_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.downstream_disable, null)
            fast_reroute_per_prefix_tiebreaker_lc_disjoint_index            = try(interface.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, null)
            fast_reroute_per_prefix_tiebreaker_lc_disjoint_disable          = try(interface.fast_reroute_per_prefix.tiebreaker.lc_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.lc_disjoint_disable, null)
            fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index   = try(interface.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, null)
            fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_disable = try(interface.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_disable, null)
            fast_reroute_per_prefix_tiebreaker_node_protecting_index        = try(interface.fast_reroute_per_prefix.tiebreaker.node_protecting_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.node_protecting_index, null)
            fast_reroute_per_prefix_tiebreaker_node_protecting_disable      = try(interface.fast_reroute_per_prefix.tiebreaker.node_protecting_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.node_protecting_disable, null)
            fast_reroute_per_prefix_tiebreaker_primary_path_index           = try(interface.fast_reroute_per_prefix.tiebreaker.primary_path_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.primary_path_index, null)
            fast_reroute_per_prefix_tiebreaker_primary_path_disable         = try(interface.fast_reroute_per_prefix.tiebreaker.primary_path_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.primary_path_disable, null)
            fast_reroute_per_prefix_tiebreaker_secondary_path_index         = try(interface.fast_reroute_per_prefix.tiebreaker.secondary_path_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.secondary_path_index, null)
            fast_reroute_per_prefix_tiebreaker_secondary_path_disable       = try(interface.fast_reroute_per_prefix.tiebreaker.secondary_path_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.secondary_path_disable, null)
            fast_reroute_per_prefix_tiebreaker_interface_disjoint_index     = try(interface.fast_reroute_per_prefix.tiebreaker.interface_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.interface_disjoint_index, null)
            fast_reroute_per_prefix_tiebreaker_interface_disjoint_disable   = try(interface.fast_reroute_per_prefix.tiebreaker.interface_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.interface_disjoint_disable, null)
            fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index          = try(interface.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, null)
            fast_reroute_per_prefix_tiebreaker_srlg_disjoint_disable        = try(interface.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_disable, null)
            loopback_stub_network_enable                                    = try(interface.loopback_stub_network_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.loopback_stub_network_enable, null)
            loopback_stub_network_disable                                   = try(interface.loopback_stub_network_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.loopback_stub_network_disable, null)
            link_down_fast_detect                                           = try(interface.link_down_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.link_down_fast_detect, null)
            prefix_sid_index                                                = try(interface.prefix_sid_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_index, null)
            prefix_sid_index_explicit_null                                  = try(interface.prefix_sid_index_explicit_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_index_explicit_null, null)
            prefix_sid_index_n_flag_clear                                   = try(interface.prefix_sid_index_n_flag_clear, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_index_n_flag_clear, null)
            prefix_sid_absolute                                             = try(interface.prefix_sid_absolute, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_absolute, null)
            prefix_sid_absolute_explicit_null                               = try(interface.prefix_sid_absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_absolute_explicit_null, null)
            prefix_sid_absolute_n_flag_clear                                = try(interface.prefix_sid_absolute_n_flag_clear, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_absolute_n_flag_clear, null)
            prefix_sid_strict_spf_index                                     = try(interface.prefix_sid_strict_spf_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_strict_spf_index, null)
            prefix_sid_strict_spf_index_explicit_null                       = try(interface.prefix_sid_strict_spf_index_explicit_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_strict_spf_index_explicit_null, null)
            prefix_sid_strict_spf_index_n_flag_clear                        = try(interface.prefix_sid_strict_spf_index_n_flag_clear, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_strict_spf_index_n_flag_clear, null)
            prefix_sid_strict_spf_absolute                                  = try(interface.prefix_sid_strict_spf_absolute, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_strict_spf_absolute, null)
            prefix_sid_strict_spf_absolute_explicit_null                    = try(interface.prefix_sid_strict_spf_absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_strict_spf_absolute_explicit_null, null)
            prefix_sid_strict_spf_absolute_n_flag_clear                     = try(interface.prefix_sid_strict_spf_absolute_n_flag_clear, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_strict_spf_absolute_n_flag_clear, null)
            segment_routing_forwarding_mpls                                 = try(interface.segment_routing_forwarding_mpls, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.segment_routing_forwarding_mpls, null)
            segment_routing_forwarding_disable                              = try(interface.segment_routing_forwarding_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.segment_routing_forwarding_disable, null)
            weight                                                          = try(interface.weight, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.weight, null)
            advertise_prefix_route_policy                                   = try(interface.advertise_prefix_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.advertise_prefix_route_policy, null)
            delay_normalize_interval                                        = try(interface.delay_normalize_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.delay_normalize_interval, null)
            delay_normalize_offset                                          = try(interface.delay_normalize_offset, interface.delay_normalize_interval != null ? 0 : null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.delay_normalize_offset, null)
            affinity_flex_algos = try(length(interface.affinity_flex_algos) == 0, true) ? null : [for affinity in interface.affinity_flex_algos : {
              affinity_name = try(affinity.affinity_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.affinity_flex_algos.affinity_name, null)
            }]
            neighbors = try(length(interface.neighbors) == 0, true) ? null : [for neighbor in interface.neighbors : {
              address                 = try(neighbor.address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.neighbors.address, null)
              database_filter_all_out = try(neighbor.database_filter_all_out, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.neighbors.database_filter_all_out, null)
              priority                = try(neighbor.priority, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.neighbors.priority, null)
              poll_interval           = try(neighbor.poll_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.neighbors.poll_interval, null)
              cost                    = try(neighbor.cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.neighbors.cost, null)
            }]
            message_digest_keys = try(length(interface.message_digest_keys) == 0, true) ? null : [for key in interface.message_digest_keys : {
              key_id        = try(key.key_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.message_digest_keys.key_id, null)
              md5_encrypted = try(key.md5_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.message_digest_keys.md5_encrypted, null)
            }]
            fast_reroute_per_link_exclude_interfaces = try(length(interface.fast_reroute_per_link.exclude_interfaces) == 0, true) ? null : [for iface in interface.fast_reroute_per_link.exclude_interfaces : {
              interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_link.exclude_interfaces.interface_name, null)
            }]
            fast_reroute_per_link_lfa_candidate_interfaces = try(length(interface.fast_reroute_per_link.lfa_candidate_interfaces) == 0, true) ? null : [for iface in interface.fast_reroute_per_link.lfa_candidate_interfaces : {
              interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_link.lfa_candidate_interfaces.interface_name, null)
            }]
            fast_reroute_per_prefix_exclude_interfaces = try(length(interface.fast_reroute_per_prefix.exclude_interfaces) == 0, true) ? null : [for iface in interface.fast_reroute_per_prefix.exclude_interfaces : {
              interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.exclude_interfaces.interface_name, null)
            }]
            fast_reroute_per_prefix_lfa_candidate_interfaces = try(length(interface.fast_reroute_per_prefix.lfa_candidate_interfaces) == 0, true) ? null : [for iface in interface.fast_reroute_per_prefix.lfa_candidate_interfaces : {
              interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.fast_reroute_per_prefix.lfa_candidate_interfaces.interface_name, null)
            }]
            prefix_sid_algorithms = try(length(interface.prefix_sid_algorithms) == 0, true) ? null : [for algo in interface.prefix_sid_algorithms : {
              number                 = try(algo.number, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_algorithms.number, null)
              index                  = try(algo.index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_algorithms.index, null)
              index_explicit_null    = try(algo.index_explicit_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_algorithms.index_explicit_null, null)
              index_n_flag_clear     = try(algo.index_n_flag_clear, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_algorithms.index_n_flag_clear, null)
              absolute               = try(algo.absolute, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_algorithms.absolute, null)
              absolute_explicit_null = try(algo.absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_algorithms.absolute_explicit_null, null)
              absolute_n_flag_clear  = try(algo.absolute_n_flag_clear, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.prefix_sid_algorithms.absolute_n_flag_clear, null)
            }]
            adjacency_sid_indexes = try(length(interface.adjacency_sid_indexes) == 0, true) ? null : [for idx in interface.adjacency_sid_indexes : {
              sid_index        = try(idx.sid_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.adjacency_sid_indexes.sid_index, null)
              protected        = try(idx.protected, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.adjacency_sid_indexes.protected, null)
              neighbor_address = try(idx.neighbor_address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.adjacency_sid_indexes.neighbor_address, null)
            }]
            adjacency_sid_absolutes = try(length(interface.adjacency_sid_absolutes) == 0, true) ? null : [for abs in interface.adjacency_sid_absolutes : {
              sid_value        = try(abs.sid_value, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.adjacency_sid_absolutes.sid_value, null)
              protected        = try(abs.protected, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.adjacency_sid_absolutes.protected, null)
              neighbor_address = try(abs.neighbor_address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.interfaces.adjacency_sid_absolutes.neighbor_address, null)
            }]
          }
        ]
      ]
    ]
  ])
}

resource "iosxr_router_ospf_area_interface" "router_ospf_area_interface" {
  for_each                                                        = { for interface in local.router_ospf_area_interface : interface.key => interface }
  device                                                          = each.value.device_name
  process_name                                                    = each.value.process_name
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
  fast_reroute_per_prefix_remote_lfa_tunnel_mpls_ldp              = each.value.fast_reroute_per_prefix_remote_lfa_tunnel_mpls_ldp
  fast_reroute_per_prefix_remote_lfa_disable                      = each.value.fast_reroute_per_prefix_remote_lfa_disable
  fast_reroute_per_prefix_remote_lfa_maximum_cost                 = each.value.fast_reroute_per_prefix_remote_lfa_maximum_cost
  fast_reroute_per_prefix_ti_lfa_enable                           = each.value.fast_reroute_per_prefix_ti_lfa_enable
  fast_reroute_per_prefix_ti_lfa_disable                          = each.value.fast_reroute_per_prefix_ti_lfa_disable
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
  segment_routing_forwarding_mpls                                 = each.value.segment_routing_forwarding_mpls
  segment_routing_forwarding_disable                              = each.value.segment_routing_forwarding_disable
  weight                                                          = each.value.weight
  advertise_prefix_route_policy                                   = each.value.advertise_prefix_route_policy
  delay_normalize_interval                                        = each.value.delay_normalize_interval
  delay_normalize_offset                                          = each.value.delay_normalize_offset
  affinity_flex_algos                                             = each.value.affinity_flex_algos
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
    iosxr_route_policy.route_policy,
    iosxr_key_chain.key_chain,
    iosxr_router_ospf_area.router_ospf_area
  ]
}

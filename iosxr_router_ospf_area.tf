locals {
  router_ospf_area = flatten([
    for device in local.devices : [
      for ospf_process in try(local.device_config[device.name].routing.ospf_processes, []) : [
        for area in try(ospf_process.areas, []) : {
          key                                                             = format("%s/%s/%s", device.name, ospf_process.id, area.area_id)
          device_name                                                     = device.name
          process_name                                                    = try(ospf_process.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.id, null)
          area_id                                                         = try(area.area_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.area_id, null)
          default_cost                                                    = try(area.default_cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.default_cost, null)
          stub                                                            = try(area.stub, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.stub, null)
          stub_no_summary                                                 = try(area.stub_no_summary, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.stub_no_summary, null)
          nssa                                                            = try(area.nssa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.nssa, null)
          nssa_no_redistribution                                          = try(area.nssa_no_redistribution, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.nssa_no_redistribution, null)
          nssa_default_information_originate                              = try(area.nssa_default_information_originate, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.nssa_default_information_originate, null)
          nssa_default_information_originate_metric                       = try(area.nssa_default_information_originate_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.nssa_default_information_originate_metric, null)
          nssa_default_information_originate_metric_type                  = try(area.nssa_default_information_originate_metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.nssa_default_information_originate_metric_type, null)
          nssa_no_summary                                                 = try(area.nssa_no_summary, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.nssa_no_summary, null)
          nssa_translate_type7_always                                     = try(area.nssa_translate_type7_always, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.nssa_translate_type7_always, null)
          mpls_traffic_eng                                                = try(area.mpls_traffic_eng, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.mpls_traffic_eng, null)
          mpls_ldp_sync                                                   = try(area.mpls_ldp_sync, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.mpls_ldp_sync, null)
          mpls_ldp_sync_disable                                           = try(area.mpls_ldp_sync_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.mpls_ldp_sync_disable, null)
          mpls_ldp_sync_igp_shortcuts                                     = try(area.mpls_ldp_sync_igp_shortcuts, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.mpls_ldp_sync_igp_shortcuts, null)
          mpls_ldp_sync_igp_shortcuts_disable                             = try(area.mpls_ldp_sync_igp_shortcuts_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.mpls_ldp_sync_igp_shortcuts_disable, null)
          mpls_ldp_auto_config                                            = try(area.mpls_ldp_auto_config, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.mpls_ldp_auto_config, null)
          route_policy_in                                                 = try(area.route_policy_in, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.route_policy_in, null)
          route_policy_out                                                = try(area.route_policy_out, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.route_policy_out, null)
          external_out_enable                                             = try(area.external_out_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.external_out_enable, null)
          external_out_disable                                            = try(area.external_out_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.external_out_disable, null)
          summary_in_enable                                               = try(area.summary_in_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.summary_in_enable, null)
          summary_in_disable                                              = try(area.summary_in_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.summary_in_disable, null)
          segment_routing_mpls                                            = try(area.segment_routing_mpls, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.segment_routing_mpls, null)
          segment_routing_disable                                         = try(area.segment_routing_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.segment_routing_disable, null)
          segment_routing_forwarding_mpls                                 = try(area.segment_routing_forwarding_mpls, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.segment_routing_forwarding_mpls, null)
          segment_routing_forwarding_disable                              = try(area.segment_routing_forwarding_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.segment_routing_forwarding_disable, null)
          distribute_link_state_disable                                   = try(area.distribute_link_state_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.distribute_link_state_disable, null)
          distribute_link_state_excl_nssa                                 = try(area.distribute_link_state_excl_nssa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.distribute_link_state_excl_nssa, null)
          distribute_link_state_excl_summary                              = try(area.distribute_link_state_excl_summary, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.distribute_link_state_excl_summary, null)
          authentication_key_encrypted                                    = try(area.authentication_key_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.authentication_key_encrypted, null)
          authentication_message_digest                                   = try(area.authentication_message_digest, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.authentication_message_digest, null)
          authentication_keychain                                         = try(area.authentication_keychain, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.authentication_keychain, null)
          authentication_keychain_name                                    = try(area.authentication_keychain_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.authentication_keychain_name, null)
          authentication_null                                             = try(area.authentication_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.authentication_null, null)
          network_broadcast                                               = try(area.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.network, null) == "broadcast" ? true : null
          network_non_broadcast                                           = try(area.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.network, null) == "non_broadcast" ? true : null
          network_point_to_point                                          = try(area.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.network, null) == "point_to_point" ? true : null
          network_point_to_multipoint                                     = try(area.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.network, null) == "point_to_multipoint" ? true : null
          cost                                                            = try(area.cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.cost, null)
          cost_fallback_anomaly_delay_igp_metric_increment                = try(area.cost_fallback_anomaly_delay_igp_metric_increment, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.cost_fallback_anomaly_delay_igp_metric_increment, null)
          cost_fallback_anomaly_delay_igp_metric_multiplier               = try(area.cost_fallback_anomaly_delay_igp_metric_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.cost_fallback_anomaly_delay_igp_metric_multiplier, null)
          cost_fallback_anomaly_delay_igp_metric_value                    = try(area.cost_fallback_anomaly_delay_igp_metric_value, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.cost_fallback_anomaly_delay_igp_metric_value, null)
          cost_fallback_anomaly_delay_igp_metric_disable                  = try(area.cost_fallback_anomaly_delay_igp_metric_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.cost_fallback_anomaly_delay_igp_metric_disable, null)
          cost_fallback_anomaly_delay_te_metric_increment                 = try(area.cost_fallback_anomaly_delay_te_metric_increment, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.cost_fallback_anomaly_delay_te_metric_increment, null)
          cost_fallback_anomaly_delay_te_metric_multiplier                = try(area.cost_fallback_anomaly_delay_te_metric_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.cost_fallback_anomaly_delay_te_metric_multiplier, null)
          cost_fallback_anomaly_delay_te_metric_value                     = try(area.cost_fallback_anomaly_delay_te_metric_value, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.cost_fallback_anomaly_delay_te_metric_value, null)
          cost_fallback_anomaly_delay_te_metric_disable                   = try(area.cost_fallback_anomaly_delay_te_metric_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.cost_fallback_anomaly_delay_te_metric_disable, null)
          hello_interval                                                  = try(area.hello_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.hello_interval, null)
          dead_interval                                                   = try(area.dead_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.dead_interval, null)
          priority                                                        = try(area.priority, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.priority, null)
          retransmit_interval                                             = try(area.retransmit_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.retransmit_interval, null)
          transmit_delay                                                  = try(area.transmit_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.transmit_delay, null)
          flood_reduction_enable                                          = try(area.flood_reduction_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.flood_reduction_enable, null)
          flood_reduction_disable                                         = try(area.flood_reduction_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.flood_reduction_disable, null)
          demand_circuit_enable                                           = try(area.demand_circuit_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.demand_circuit_enable, null)
          demand_circuit_disable                                          = try(area.demand_circuit_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.demand_circuit_disable, null)
          mtu_ignore_enable                                               = try(area.mtu_ignore_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.mtu_ignore_enable, null)
          mtu_ignore_disable                                              = try(area.mtu_ignore_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.mtu_ignore_disable, null)
          database_filter_all_out_enable                                  = try(area.database_filter_all_out_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.database_filter_all_out_enable, null)
          database_filter_all_out_disable                                 = try(area.database_filter_all_out_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.database_filter_all_out_disable, null)
          passive_enable                                                  = try(area.passive_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.passive_enable, null)
          passive_disable                                                 = try(area.passive_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.passive_disable, null)
          distribute_list_in_acl                                          = try(area.distribute_list_in_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.distribute_list_in_acl, null)
          distribute_list_in_route_policy                                 = try(area.distribute_list_in_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.distribute_list_in_route_policy, null)
          bfd_fast_detect                                                 = try(area.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.bfd_fast_detect, null) == "enable" ? true : null
          bfd_fast_detect_strict_mode                                     = try(area.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.bfd_fast_detect, null) == "strict_mode" ? true : null
          bfd_fast_detect_disable                                         = try(area.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.bfd_fast_detect, null) == "disable" ? true : null
          bfd_minimum_interval                                            = try(area.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.bfd_minimum_interval, null)
          bfd_multiplier                                                  = try(area.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.bfd_multiplier, null)
          security_ttl                                                    = try(area.security_ttl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.security_ttl, null)
          security_ttl_hops                                               = try(area.security_ttl_hops, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.security_ttl_hops, null)
          security_ttl_disable                                            = try(area.security_ttl_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.security_ttl_disable, null)
          prefix_suppression                                              = try(area.prefix_suppression, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.prefix_suppression, null)
          prefix_suppression_disable                                      = try(area.prefix_suppression_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.prefix_suppression_disable, null)
          fast_reroute_disable                                            = try(area.fast_reroute_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_disable, null)
          fast_reroute_per_link                                           = try(area.fast_reroute_per_link.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_link.enable, null)
          fast_reroute_per_link_use_candidate_only_enable                 = try(area.fast_reroute_per_link.use_candidate_only_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_link.use_candidate_only_enable, null)
          fast_reroute_per_link_use_candidate_only_disable                = try(area.fast_reroute_per_link.use_candidate_only_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_link.use_candidate_only_disable, null)
          fast_reroute_per_prefix                                         = try(area.fast_reroute_per_prefix.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.enable, null)
          fast_reroute_per_prefix_use_candidate_only_enable               = try(area.fast_reroute_per_prefix.use_candidate_only_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.use_candidate_only_enable, null)
          fast_reroute_per_prefix_use_candidate_only_disable              = try(area.fast_reroute_per_prefix.use_candidate_only_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.use_candidate_only_disable, null)
          fast_reroute_per_prefix_remote_lfa_tunnel_mpls_ldp              = try(area.fast_reroute_per_prefix.remote_lfa_tunnel_mpls_ldp, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.remote_lfa_tunnel_mpls_ldp, null)
          fast_reroute_per_prefix_remote_lfa_disable                      = try(area.fast_reroute_per_prefix.remote_lfa_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.remote_lfa_disable, null)
          fast_reroute_per_prefix_remote_lfa_maximum_cost                 = try(area.fast_reroute_per_prefix.remote_lfa_maximum_cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.remote_lfa_maximum_cost, null)
          fast_reroute_per_prefix_ti_lfa_enable                           = try(area.fast_reroute_per_prefix.ti_lfa_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.ti_lfa_enable, null)
          fast_reroute_per_prefix_ti_lfa_disable                          = try(area.fast_reroute_per_prefix.ti_lfa_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.ti_lfa_disable, null)
          fast_reroute_per_prefix_tiebreaker_downstream_index             = try(area.fast_reroute_per_prefix.tiebreaker.downstream_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.downstream_index, null)
          fast_reroute_per_prefix_tiebreaker_downstream_disable           = try(area.fast_reroute_per_prefix.tiebreaker.downstream_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.downstream_disable, null)
          fast_reroute_per_prefix_tiebreaker_lc_disjoint_index            = try(area.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, null)
          fast_reroute_per_prefix_tiebreaker_lc_disjoint_disable          = try(area.fast_reroute_per_prefix.tiebreaker.lc_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.lc_disjoint_disable, null)
          fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index   = try(area.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, null)
          fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_disable = try(area.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_disable, null)
          fast_reroute_per_prefix_tiebreaker_node_protecting_index        = try(area.fast_reroute_per_prefix.tiebreaker.node_protecting_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.node_protecting_index, null)
          fast_reroute_per_prefix_tiebreaker_node_protecting_disable      = try(area.fast_reroute_per_prefix.tiebreaker.node_protecting_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.node_protecting_disable, null)
          fast_reroute_per_prefix_tiebreaker_primary_path_index           = try(area.fast_reroute_per_prefix.tiebreaker.primary_path_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.primary_path_index, null)
          fast_reroute_per_prefix_tiebreaker_primary_path_disable         = try(area.fast_reroute_per_prefix.tiebreaker.primary_path_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.primary_path_disable, null)
          fast_reroute_per_prefix_tiebreaker_secondary_path_index         = try(area.fast_reroute_per_prefix.tiebreaker.secondary_path_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.secondary_path_index, null)
          fast_reroute_per_prefix_tiebreaker_secondary_path_disable       = try(area.fast_reroute_per_prefix.tiebreaker.secondary_path_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.secondary_path_disable, null)
          fast_reroute_per_prefix_tiebreaker_interface_disjoint_index     = try(area.fast_reroute_per_prefix.tiebreaker.interface_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.interface_disjoint_index, null)
          fast_reroute_per_prefix_tiebreaker_interface_disjoint_disable   = try(area.fast_reroute_per_prefix.tiebreaker.interface_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.interface_disjoint_disable, null)
          fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index          = try(area.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, null)
          fast_reroute_per_prefix_tiebreaker_srlg_disjoint_disable        = try(area.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_disable, null)
          loopback_stub_network_enable                                    = try(area.loopback_stub_network_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.loopback_stub_network_enable, null)
          loopback_stub_network_disable                                   = try(area.loopback_stub_network_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.loopback_stub_network_disable, null)
          link_down_fast_detect                                           = try(area.link_down_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.link_down_fast_detect, null)
          weight                                                          = try(area.weight, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.weight, null)
          delay_normalize_interval                                        = try(area.delay_normalize_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.delay_normalize_interval, null)
          delay_normalize_offset                                          = try(area.delay_normalize_offset, area.delay_normalize_interval != null ? 0 : null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.delay_normalize_offset, null)
          ranges = try(length(area.ranges) == 0, true) ? null : [for range in area.ranges : {
            address       = try(range.address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.ranges.address, null)
            mask          = try(range.mask, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.ranges.mask, null)
            advertise     = try(range.advertise, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.ranges.advertise, null)
            not_advertise = try(range.not_advertise, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.ranges.not_advertise, null)
          }]
          message_digest_keys = try(length(area.message_digest_keys) == 0, true) ? null : [for key in area.message_digest_keys : {
            key_id        = try(key.key_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.message_digest_keys.key_id, null)
            md5_encrypted = try(key.md5_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.message_digest_keys.md5_encrypted, null)
          }]
          fast_reroute_per_link_exclude_interfaces = try(length(area.fast_reroute_per_link.exclude_interfaces) == 0, true) ? null : [for iface in area.fast_reroute_per_link.exclude_interfaces : {
            interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_link.exclude_interfaces.interface_name, null)
          }]
          fast_reroute_per_link_lfa_candidate_interfaces = try(length(area.fast_reroute_per_link.lfa_candidate_interfaces) == 0, true) ? null : [for iface in area.fast_reroute_per_link.lfa_candidate_interfaces : {
            interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_link.lfa_candidate_interfaces.interface_name, null)
          }]
          fast_reroute_per_prefix_exclude_interfaces = try(length(area.fast_reroute_per_prefix.exclude_interfaces) == 0, true) ? null : [for iface in area.fast_reroute_per_prefix.exclude_interfaces : {
            interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.exclude_interfaces.interface_name, null)
          }]
          fast_reroute_per_prefix_lfa_candidate_interfaces = try(length(area.fast_reroute_per_prefix.lfa_candidate_interfaces) == 0, true) ? null : [for iface in area.fast_reroute_per_prefix.lfa_candidate_interfaces : {
            interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.fast_reroute_per_prefix.lfa_candidate_interfaces.interface_name, null)
          }]
          multi_area_interfaces = try(length(area.multi_area_interfaces) == 0, true) ? null : [for mai in area.multi_area_interfaces : {
            interface_name                                                  = try(mai.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.interface_name, null)
            authentication_key_encrypted                                    = try(mai.authentication_key_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.authentication_key_encrypted, null)
            authentication_message_digest                                   = try(mai.authentication_message_digest, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.authentication_message_digest, null)
            authentication_keychain                                         = try(mai.authentication_keychain, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.authentication_keychain, null)
            authentication_keychain_name                                    = try(mai.authentication_keychain_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.authentication_keychain_name, null)
            authentication_null                                             = try(mai.authentication_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.authentication_null, null)
            cost                                                            = try(mai.cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.cost, null)
            cost_fallback                                                   = try(mai.cost_fallback, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.cost_fallback, null)
            cost_fallback_threshold                                         = try(mai.cost_fallback_threshold, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.cost_fallback_threshold, null)
            hello_interval                                                  = try(mai.hello_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.hello_interval, null)
            dead_interval                                                   = try(mai.dead_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.dead_interval, null)
            retransmit_interval                                             = try(mai.retransmit_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.retransmit_interval, null)
            transmit_delay                                                  = try(mai.transmit_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.transmit_delay, null)
            mtu_ignore_enable                                               = try(mai.mtu_ignore_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.mtu_ignore_enable, null)
            mtu_ignore_disable                                              = try(mai.mtu_ignore_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.mtu_ignore_disable, null)
            database_filter_all_out_enable                                  = try(mai.database_filter_all_out_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.database_filter_all_out_enable, null)
            database_filter_all_out_disable                                 = try(mai.database_filter_all_out_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.database_filter_all_out_disable, null)
            distribute_list_in_acl                                          = try(mai.distribute_list_in_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.distribute_list_in_acl, null)
            distribute_list_in_route_policy                                 = try(mai.distribute_list_in_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.distribute_list_in_route_policy, null)
            packet_size                                                     = try(mai.packet_size, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.packet_size, null)
            fast_reroute_per_link                                           = try(mai.fast_reroute_per_link.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_link.enable, null)
            fast_reroute_per_link_use_candidate_only_enable                 = try(mai.fast_reroute_per_link.use_candidate_only_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_link.use_candidate_only_enable, null)
            fast_reroute_per_link_use_candidate_only_disable                = try(mai.fast_reroute_per_link.use_candidate_only_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_link.use_candidate_only_disable, null)
            fast_reroute_disable                                            = try(mai.fast_reroute_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_disable, null)
            fast_reroute_per_prefix                                         = try(mai.fast_reroute_per_prefix.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.enable, null)
            fast_reroute_per_prefix_use_candidate_only_enable               = try(mai.fast_reroute_per_prefix.use_candidate_only_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.use_candidate_only_enable, null)
            fast_reroute_per_prefix_use_candidate_only_disable              = try(mai.fast_reroute_per_prefix.use_candidate_only_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.use_candidate_only_disable, null)
            fast_reroute_per_prefix_remote_lfa_tunnel_mpls_ldp              = try(mai.fast_reroute_per_prefix.remote_lfa_tunnel_mpls_ldp, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.remote_lfa_tunnel_mpls_ldp, null)
            fast_reroute_per_prefix_remote_lfa_disable                      = try(mai.fast_reroute_per_prefix.remote_lfa_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.remote_lfa_disable, null)
            fast_reroute_per_prefix_remote_lfa_maximum_cost                 = try(mai.fast_reroute_per_prefix.remote_lfa_maximum_cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.remote_lfa_maximum_cost, null)
            fast_reroute_per_prefix_ti_lfa_enable                           = try(mai.fast_reroute_per_prefix.ti_lfa_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.ti_lfa_enable, null)
            fast_reroute_per_prefix_ti_lfa_disable                          = try(mai.fast_reroute_per_prefix.ti_lfa_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.ti_lfa_disable, null)
            fast_reroute_per_prefix_tiebreaker_downstream_index             = try(mai.fast_reroute_per_prefix.tiebreaker.downstream_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.downstream_index, null)
            fast_reroute_per_prefix_tiebreaker_downstream_disable           = try(mai.fast_reroute_per_prefix.tiebreaker.downstream_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.downstream_disable, null)
            fast_reroute_per_prefix_tiebreaker_lc_disjoint_index            = try(mai.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, null)
            fast_reroute_per_prefix_tiebreaker_lc_disjoint_disable          = try(mai.fast_reroute_per_prefix.tiebreaker.lc_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.lc_disjoint_disable, null)
            fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index   = try(mai.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, null)
            fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_disable = try(mai.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_disable, null)
            fast_reroute_per_prefix_tiebreaker_node_protecting_index        = try(mai.fast_reroute_per_prefix.tiebreaker.node_protecting_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.node_protecting_index, null)
            fast_reroute_per_prefix_tiebreaker_node_protecting_disable      = try(mai.fast_reroute_per_prefix.tiebreaker.node_protecting_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.node_protecting_disable, null)
            fast_reroute_per_prefix_tiebreaker_primary_path_index           = try(mai.fast_reroute_per_prefix.tiebreaker.primary_path_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.primary_path_index, null)
            fast_reroute_per_prefix_tiebreaker_primary_path_disable         = try(mai.fast_reroute_per_prefix.tiebreaker.primary_path_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.primary_path_disable, null)
            fast_reroute_per_prefix_tiebreaker_secondary_path_index         = try(mai.fast_reroute_per_prefix.tiebreaker.secondary_path_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.secondary_path_index, null)
            fast_reroute_per_prefix_tiebreaker_secondary_path_disable       = try(mai.fast_reroute_per_prefix.tiebreaker.secondary_path_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.secondary_path_disable, null)
            fast_reroute_per_prefix_tiebreaker_interface_disjoint_index     = try(mai.fast_reroute_per_prefix.tiebreaker.interface_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.interface_disjoint_index, null)
            fast_reroute_per_prefix_tiebreaker_interface_disjoint_disable   = try(mai.fast_reroute_per_prefix.tiebreaker.interface_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.interface_disjoint_disable, null)
            fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index          = try(mai.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, null)
            fast_reroute_per_prefix_tiebreaker_srlg_disjoint_disable        = try(mai.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_disable, null)
            passive_enable                                                  = try(mai.passive_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.passive_enable, null)
            passive_disable                                                 = try(mai.passive_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.passive_disable, null)
            delay_normalize_interval                                        = try(mai.delay_normalize_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.delay_normalize_interval, null)
            delay_normalize_offset                                          = try(mai.delay_normalize_offset, mai.delay_normalize_interval != null ? 0 : null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.delay_normalize_offset, null)
            neighbors = try(length(mai.neighbors) == 0, true) ? null : [for neighbor in mai.neighbors : {
              address                 = try(neighbor.address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.neighbors.address, null)
              database_filter_all_out = try(neighbor.database_filter_all_out, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.neighbors.database_filter_all_out, null)
              poll_interval           = try(neighbor.poll_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.neighbors.poll_interval, null)
              cost                    = try(neighbor.cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.neighbors.cost, null)
            }]
            message_digest_keys = try(length(mai.message_digest_keys) == 0, true) ? null : [for key in mai.message_digest_keys : {
              key_id        = try(key.key_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.message_digest_keys.key_id, null)
              md5_encrypted = try(key.md5_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.message_digest_keys.md5_encrypted, null)
            }]
            fast_reroute_per_link_exclude_interfaces = try(length(mai.fast_reroute_per_link.exclude_interfaces) == 0, true) ? null : [for iface in mai.fast_reroute_per_link.exclude_interfaces : {
              interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_link.exclude_interfaces.interface_name, null)
            }]
            fast_reroute_per_link_lfa_candidate_interfaces = try(length(mai.fast_reroute_per_link.lfa_candidate_interfaces) == 0, true) ? null : [for iface in mai.fast_reroute_per_link.lfa_candidate_interfaces : {
              interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_link.lfa_candidate_interfaces.interface_name, null)
            }]
            fast_reroute_per_prefix_exclude_interfaces = try(length(mai.fast_reroute_per_prefix.exclude_interfaces) == 0, true) ? null : [for iface in mai.fast_reroute_per_prefix.exclude_interfaces : {
              interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.exclude_interfaces.interface_name, null)
            }]
            fast_reroute_per_prefix_lfa_candidate_interfaces = try(length(mai.fast_reroute_per_prefix.lfa_candidate_interfaces) == 0, true) ? null : [for iface in mai.fast_reroute_per_prefix.lfa_candidate_interfaces : {
              interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.multi_area_interfaces.fast_reroute_per_prefix.lfa_candidate_interfaces.interface_name, null)
            }]
          }]
          virtual_links = try(length(area.virtual_links) == 0, true) ? null : [for vl in area.virtual_links : {
            address                       = try(vl.address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.virtual_links.address, null)
            hello_interval                = try(vl.hello_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.virtual_links.hello_interval, null)
            dead_interval                 = try(vl.dead_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.virtual_links.dead_interval, null)
            retransmit_interval           = try(vl.retransmit_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.virtual_links.retransmit_interval, null)
            transmit_delay                = try(vl.transmit_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.virtual_links.transmit_delay, null)
            authentication_key_encrypted  = try(vl.authentication_key_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.virtual_links.authentication_key_encrypted, null)
            authentication_message_digest = try(vl.authentication_message_digest, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.virtual_links.authentication_message_digest, null)
            authentication_keychain       = try(vl.authentication_keychain, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.virtual_links.authentication_keychain, null)
            authentication_keychain_name  = try(vl.authentication_keychain_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.virtual_links.authentication_keychain_name, null)
            authentication_null           = try(vl.authentication_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.virtual_links.authentication_null, null)
            message_digest_keys = try(length(vl.message_digest_keys) == 0, true) ? null : [for key in vl.message_digest_keys : {
              key_id        = try(key.key_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.virtual_links.message_digest_keys.key_id, null)
              md5_encrypted = try(key.md5_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.areas.virtual_links.message_digest_keys.md5_encrypted, null)
            }]
          }]
        }
      ]
    ]
  ])
}

resource "iosxr_router_ospf_area" "router_ospf_area" {
  for_each                                                        = { for area in local.router_ospf_area : area.key => area }
  device                                                          = each.value.device_name
  process_name                                                    = each.value.process_name
  area_id                                                         = each.value.area_id
  default_cost                                                    = each.value.default_cost
  stub                                                            = each.value.stub
  stub_no_summary                                                 = each.value.stub_no_summary
  nssa                                                            = each.value.nssa
  nssa_no_redistribution                                          = each.value.nssa_no_redistribution
  nssa_default_information_originate                              = each.value.nssa_default_information_originate
  nssa_default_information_originate_metric                       = each.value.nssa_default_information_originate_metric
  nssa_default_information_originate_metric_type                  = each.value.nssa_default_information_originate_metric_type
  nssa_no_summary                                                 = each.value.nssa_no_summary
  nssa_translate_type7_always                                     = each.value.nssa_translate_type7_always
  mpls_traffic_eng                                                = each.value.mpls_traffic_eng
  mpls_ldp_sync                                                   = each.value.mpls_ldp_sync
  mpls_ldp_sync_disable                                           = each.value.mpls_ldp_sync_disable
  mpls_ldp_sync_igp_shortcuts                                     = each.value.mpls_ldp_sync_igp_shortcuts
  mpls_ldp_sync_igp_shortcuts_disable                             = each.value.mpls_ldp_sync_igp_shortcuts_disable
  mpls_ldp_auto_config                                            = each.value.mpls_ldp_auto_config
  route_policy_in                                                 = each.value.route_policy_in
  route_policy_out                                                = each.value.route_policy_out
  external_out_enable                                             = each.value.external_out_enable
  external_out_disable                                            = each.value.external_out_disable
  summary_in_enable                                               = each.value.summary_in_enable
  summary_in_disable                                              = each.value.summary_in_disable
  segment_routing_mpls                                            = each.value.segment_routing_mpls
  segment_routing_disable                                         = each.value.segment_routing_disable
  segment_routing_forwarding_mpls                                 = each.value.segment_routing_forwarding_mpls
  segment_routing_forwarding_disable                              = each.value.segment_routing_forwarding_disable
  distribute_link_state_disable                                   = each.value.distribute_link_state_disable
  distribute_link_state_excl_nssa                                 = each.value.distribute_link_state_excl_nssa
  distribute_link_state_excl_summary                              = each.value.distribute_link_state_excl_summary
  authentication_key_encrypted                                    = each.value.authentication_key_encrypted
  authentication_message_digest                                   = each.value.authentication_message_digest
  authentication_keychain                                         = each.value.authentication_keychain
  authentication_keychain_name                                    = each.value.authentication_keychain_name
  authentication_null                                             = each.value.authentication_null
  network_broadcast                                               = each.value.network_broadcast
  network_non_broadcast                                           = each.value.network_non_broadcast
  network_point_to_point                                          = each.value.network_point_to_point
  network_point_to_multipoint                                     = each.value.network_point_to_multipoint
  cost                                                            = each.value.cost
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
  weight                                                          = each.value.weight
  delay_normalize_interval                                        = each.value.delay_normalize_interval
  delay_normalize_offset                                          = each.value.delay_normalize_offset
  ranges                                                          = each.value.ranges
  message_digest_keys                                             = each.value.message_digest_keys
  fast_reroute_per_link_exclude_interfaces                        = each.value.fast_reroute_per_link_exclude_interfaces
  fast_reroute_per_link_lfa_candidate_interfaces                  = each.value.fast_reroute_per_link_lfa_candidate_interfaces
  fast_reroute_per_prefix_exclude_interfaces                      = each.value.fast_reroute_per_prefix_exclude_interfaces
  fast_reroute_per_prefix_lfa_candidate_interfaces                = each.value.fast_reroute_per_prefix_lfa_candidate_interfaces
  multi_area_interfaces                                           = each.value.multi_area_interfaces
  virtual_links                                                   = each.value.virtual_links

  depends_on = [
    iosxr_route_policy.route_policy,
    iosxr_key_chain.key_chain,
    iosxr_router_ospf.router_ospf
  ]
}

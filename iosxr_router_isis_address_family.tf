locals {
  router_isis_address_family_ipv4_unicast = flatten([
    for device in local.devices : [
      for isis_process in try(local.device_config[device.name].routing.isis_processes, []) :
      contains(keys(try(isis_process.address_family, {})), "ipv4_unicast") ? [{
        key                                                             = format("%s/%s/ipv4-unicast", device.name, isis_process.id)
        device_name                                                     = device.name
        process_id                                                      = try(isis_process.id, local.defaults.iosxr.devices.configuration.routing.isis_processes.id, null)
        af_name                                                         = "ipv4"
        saf_name                                                        = "unicast"
        advertise_link_attributes                                       = try(isis_process.address_family.ipv4_unicast.advertise_link_attributes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.advertise_link_attributes, null)
        advertise_passive_only                                          = try(isis_process.address_family.ipv4_unicast.advertise_passive_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.advertise_passive_only, null)
        default_information_originate                                   = try(isis_process.address_family.ipv4_unicast.default_information_originate, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.default_information_originate, null)
        default_information_originate_route_policy                      = try(isis_process.address_family.ipv4_unicast.default_information_originate_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.default_information_originate_route_policy, null)
        fast_reroute_delay_interval                                     = try(isis_process.address_family.ipv4_unicast.fast_reroute_delay_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_delay_interval, null)
        fast_reroute_per_link_priority_limit                            = try(isis_process.address_family.ipv4_unicast.fast_reroute_per_link.priority_limit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_link.priority_limit, null)
        fast_reroute_per_link_use_candidate_only                        = try(isis_process.address_family.ipv4_unicast.fast_reroute_per_link.use_candidate_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_link.use_candidate_only, null)
        fast_reroute_per_prefix_load_sharing_disable                    = try(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.load_sharing_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.load_sharing_disable, null)
        fast_reroute_per_prefix_priority_limit                          = try(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.priority_limit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.priority_limit, null)
        fast_reroute_per_prefix_remote_lfa_prefix_list                  = try(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.remote_lfa_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.remote_lfa_prefix_list, null)
        fast_reroute_per_prefix_srlg_protection_weighted_global         = try(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.srlg_protection_weighted_global, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.srlg_protection_weighted_global, null)
        fast_reroute_per_prefix_tiebreaker_downstream_index             = try(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.tiebreaker.downstream_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.tiebreaker.downstream_index, null)
        fast_reroute_per_prefix_tiebreaker_lc_disjoint_index            = try(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, null)
        fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index   = try(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, null)
        fast_reroute_per_prefix_tiebreaker_node_protecting_index        = try(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.tiebreaker.node_protecting_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.tiebreaker.node_protecting_index, null)
        fast_reroute_per_prefix_tiebreaker_primary_path_index           = try(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.tiebreaker.primary_path_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.tiebreaker.primary_path_index, null)
        fast_reroute_per_prefix_tiebreaker_secondary_path_index         = try(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.tiebreaker.secondary_path_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.tiebreaker.secondary_path_index, null)
        fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index          = try(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, null)
        fast_reroute_per_prefix_use_candidate_only                      = try(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.use_candidate_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.use_candidate_only, null)
        maximum_redistributed_prefixes                                  = try(isis_process.address_family.ipv4_unicast.maximum_redistributed_prefixes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.maximum_redistributed_prefixes, null)
        metric_style_narrow                                             = try(isis_process.address_family.ipv4_unicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.metric_style, null) == "narrow" ? true : null
        metric_style_narrow_transition                                  = try(isis_process.address_family.ipv4_unicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.metric_style, null) == "narrow_transition" ? true : null
        metric_style_transition                                         = try(isis_process.address_family.ipv4_unicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.metric_style, null) == "transition" ? true : null
        metric_style_wide                                               = try(isis_process.address_family.ipv4_unicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.metric_style, null) == "wide" ? true : null
        metric_style_wide_transition                                    = try(isis_process.address_family.ipv4_unicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.metric_style, null) == "wide_transition" ? true : null
        microloop_avoidance                                             = try(isis_process.address_family.ipv4_unicast.microloop_avoidance, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.microloop_avoidance, null)
        microloop_avoidance_protected                                   = try(isis_process.address_family.ipv4_unicast.microloop_avoidance_protected, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.microloop_avoidance_protected, null)
        microloop_avoidance_rib_update_delay                            = try(isis_process.address_family.ipv4_unicast.microloop_avoidance_rib_update_delay, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.microloop_avoidance_rib_update_delay, null)
        microloop_avoidance_segment_routing_route_policy                = try(isis_process.address_family.ipv4_unicast.microloop_avoidance_segment_routing_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.microloop_avoidance_segment_routing_route_policy, null)
        mpls_ldp_auto_config                                            = try(isis_process.address_family.ipv4_unicast.mpls_ldp_auto_config, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.mpls_ldp_auto_config, null)
        mpls_traffic_eng_level_1                                        = try(isis_process.address_family.ipv4_unicast.mpls_traffic_eng_level_1, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.mpls_traffic_eng_level_1, null)
        mpls_traffic_eng_level_1_2                                      = try(isis_process.address_family.ipv4_unicast.mpls_traffic_eng_level_1_2, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.mpls_traffic_eng_level_1_2, null)
        mpls_traffic_eng_level_2_only                                   = try(isis_process.address_family.ipv4_unicast.mpls_traffic_eng_level_2_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.mpls_traffic_eng_level_2_only, null)
        mpls_traffic_eng_router_id_interface_name                       = try(isis_process.address_family.ipv4_unicast.mpls_traffic_eng_router_id_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.mpls_traffic_eng_router_id_interface, null)
        mpls_traffic_eng_router_id_ipv4_address                         = try(isis_process.address_family.ipv4_unicast.mpls_traffic_eng_router_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.mpls_traffic_eng_router_id, null)
        router_id_interface_name                                        = try(isis_process.address_family.ipv4_unicast.router_id_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.router_id_interface, null)
        router_id_ip_address                                            = try(isis_process.address_family.ipv4_unicast.router_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.router_id, null)
        segment_routing_mpls_enable                                     = try(isis_process.address_family.ipv4_unicast.segment_routing_mpls_enable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_enable, null)
        segment_routing_mpls_sr_prefer                                  = try(isis_process.address_family.ipv4_unicast.segment_routing_mpls_sr_prefer, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_sr_prefer, null)
        spf_interval_ietf                                               = try(isis_process.address_family.ipv4_unicast.spf_interval_ietf, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_ietf, null)
        spf_interval_ietf_holddown_interval                             = try(isis_process.address_family.ipv4_unicast.spf_interval_ietf_holddown_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_ietf_holddown_interval, null)
        spf_interval_ietf_initial_wait                                  = try(isis_process.address_family.ipv4_unicast.spf_interval_ietf_initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_ietf_initial_wait, null)
        spf_interval_ietf_learn_interval                                = try(isis_process.address_family.ipv4_unicast.spf_interval_ietf_learn_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_ietf_learn_interval, null)
        spf_interval_ietf_long_wait                                     = try(isis_process.address_family.ipv4_unicast.spf_interval_ietf_long_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_ietf_long_wait, null)
        spf_interval_ietf_short_wait                                    = try(isis_process.address_family.ipv4_unicast.spf_interval_ietf_short_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_ietf_short_wait, null)
        spf_interval_initial_wait                                       = try(isis_process.address_family.ipv4_unicast.spf_interval_initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_initial_wait, null)
        spf_interval_maximum_wait                                       = try(isis_process.address_family.ipv4_unicast.spf_interval_maximum_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_maximum_wait, null)
        spf_interval_secondary_wait                                     = try(isis_process.address_family.ipv4_unicast.spf_interval_secondary_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_secondary_wait, null)
        spf_prefix_priority_critical_prefix_list_name                   = try(isis_process.address_family.ipv4_unicast.spf_prefix_priority_critical_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_prefix_priority_critical_prefix_list, null)
        spf_prefix_priority_critical_tag                                = try(isis_process.address_family.ipv4_unicast.spf_prefix_priority_critical_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_prefix_priority_critical_tag, null)
        spf_prefix_priority_high_prefix_list_name                       = try(isis_process.address_family.ipv4_unicast.spf_prefix_priority_high_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_prefix_priority_high_prefix_list, null)
        spf_prefix_priority_high_tag                                    = try(isis_process.address_family.ipv4_unicast.spf_prefix_priority_high_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_prefix_priority_high_tag, null)
        spf_prefix_priority_medium_prefix_list_name                     = try(isis_process.address_family.ipv4_unicast.spf_prefix_priority_medium_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_prefix_priority_medium_prefix_list, null)
        spf_prefix_priority_medium_tag                                  = try(isis_process.address_family.ipv4_unicast.spf_prefix_priority_medium_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_prefix_priority_medium_tag, null)
        adjacency_check_disable                                         = try(isis_process.address_family.ipv4_unicast.adjacency_check_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.adjacency_check_disable, null)
        attached_bit_receive_ignore                                     = try(isis_process.address_family.ipv4_unicast.attached_bit_receive_ignore, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.attached_bit_receive_ignore, null)
        attached_bit_send                                               = try(isis_process.address_family.ipv4_unicast.attached_bit_send, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.attached_bit_send, null)
        distance                                                        = try(isis_process.address_family.ipv4_unicast.distance, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.distance, null)
        distribute_list_prefix_list_in                                  = try(isis_process.address_family.ipv4_unicast.distribute_list_prefix_list_in, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.distribute_list_prefix_list_in, null)
        distribute_list_route_policy_in                                 = try(isis_process.address_family.ipv4_unicast.distribute_list_route_policy_in, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.distribute_list_route_policy_in, null)
        maximum_paths                                                   = try(isis_process.address_family.ipv4_unicast.maximum_paths, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.maximum_paths, null)
        metric                                                          = try(isis_process.address_family.ipv4_unicast.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.metric, null)
        mpls_traffic_eng_igp_intact                                     = try(isis_process.address_family.ipv4_unicast.mpls_traffic_eng_igp_intact, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.mpls_traffic_eng_igp_intact, null)
        mpls_traffic_eng_multicast_intact                               = try(isis_process.address_family.ipv4_unicast.mpls_traffic_eng_multicast_intact, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.mpls_traffic_eng_multicast_intact, null)
        mpls_traffic_eng_tunnel_anycast_prefer_igp_cost                 = try(isis_process.address_family.ipv4_unicast.mpls_traffic_eng_tunnel_anycast_prefer_igp_cost, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.mpls_traffic_eng_tunnel_anycast_prefer_igp_cost, null)
        mpls_traffic_eng_tunnel_metric                                  = try(isis_process.address_family.ipv4_unicast.mpls_traffic_eng_tunnel_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.mpls_traffic_eng_tunnel_metric, null)
        mpls_traffic_eng_tunnel_preferred                               = try(isis_process.address_family.ipv4_unicast.mpls_traffic_eng_tunnel_preferred, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.mpls_traffic_eng_tunnel_preferred, null)
        mpls_traffic_eng_tunnel_restricted                              = try(isis_process.address_family.ipv4_unicast.mpls_traffic_eng_tunnel_restricted, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.mpls_traffic_eng_tunnel_restricted, null)
        partition_detect                                                = try(isis_process.address_family.ipv4_unicast.partition_detect, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.partition_detect, null)
        prefix_unreachable                                              = try(isis_process.address_family.ipv4_unicast.prefix_unreachable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.prefix_unreachable, null)
        prefix_unreachable_adv_lifetime                                 = try(isis_process.address_family.ipv4_unicast.prefix_unreachable_adv_lifetime, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.prefix_unreachable_adv_lifetime, null)
        prefix_unreachable_adv_maximum                                  = try(isis_process.address_family.ipv4_unicast.prefix_unreachable_adv_maximum, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.prefix_unreachable_adv_maximum, null)
        prefix_unreachable_adv_metric                                   = try(isis_process.address_family.ipv4_unicast.prefix_unreachable_adv_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.prefix_unreachable_adv_metric, null)
        prefix_unreachable_rx_process_enable                            = try(isis_process.address_family.ipv4_unicast.prefix_unreachable_rx_process_enable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.prefix_unreachable_rx_process_enable, null)
        redistribute_connected                                          = try(isis_process.address_family.ipv4_unicast.redistribute_connected, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_connected, null)
        redistribute_connected_level                                    = try(isis_process.address_family.ipv4_unicast.redistribute_connected_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_connected_level, null)
        redistribute_connected_metric                                   = try(isis_process.address_family.ipv4_unicast.redistribute_connected_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_connected_metric, null)
        redistribute_connected_metric_type                              = try(isis_process.address_family.ipv4_unicast.redistribute_connected_metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_connected_metric_type, null)
        redistribute_connected_route_policy                             = try(isis_process.address_family.ipv4_unicast.redistribute_connected_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_connected_route_policy, null)
        redistribute_static                                             = try(isis_process.address_family.ipv4_unicast.redistribute_static, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_static, null)
        redistribute_static_level                                       = try(isis_process.address_family.ipv4_unicast.redistribute_static_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_static_level, null)
        redistribute_static_metric                                      = try(isis_process.address_family.ipv4_unicast.redistribute_static_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_static_metric, null)
        redistribute_static_metric_type                                 = try(isis_process.address_family.ipv4_unicast.redistribute_static_metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_static_metric_type, null)
        redistribute_static_route_policy                                = try(isis_process.address_family.ipv4_unicast.redistribute_static_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_static_route_policy, null)
        route_source_first_hop                                          = try(isis_process.address_family.ipv4_unicast.route_source_first_hop, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.route_source_first_hop, null)
        segment_routing_bundle_member_adj_sid                           = try(isis_process.address_family.ipv4_unicast.segment_routing_bundle_member_adj_sid, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_bundle_member_adj_sid, null)
        segment_routing_labeled_only                                    = try(isis_process.address_family.ipv4_unicast.segment_routing_labeled_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_labeled_only, null)
        segment_routing_mpls_connected_prefix_sid_map                   = try(isis_process.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map, null)
        segment_routing_mpls_prefix_sid_map_advertise_local             = try(isis_process.address_family.ipv4_unicast.segment_routing_mpls_prefix_sid_map_advertise_local, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_prefix_sid_map_advertise_local, null)
        segment_routing_mpls_prefix_sid_map_advertise_local_domain_wide = try(isis_process.address_family.ipv4_unicast.segment_routing_mpls_prefix_sid_map_advertise_local_domain_wide, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_prefix_sid_map_advertise_local_domain_wide, null)
        segment_routing_mpls_prefix_sid_map_receive                     = try(isis_process.address_family.ipv4_unicast.segment_routing_mpls_prefix_sid_map_receive, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_prefix_sid_map_receive, null)
        segment_routing_mpls_prefix_sid_map_receive_disable             = try(isis_process.address_family.ipv4_unicast.segment_routing_mpls_prefix_sid_map_receive_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_prefix_sid_map_receive_disable, null)
        segment_routing_mpls_unlabeled_protection_disable               = try(isis_process.address_family.ipv4_unicast.segment_routing_mpls_unlabeled_protection_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_unlabeled_protection_disable, null)
        segment_routing_mpls_unlabeled_protection_prefix_list           = try(isis_process.address_family.ipv4_unicast.segment_routing_mpls_unlabeled_protection_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_unlabeled_protection_prefix_list, null)
        segment_routing_mpls_unlabeled_protection_route_policy          = try(isis_process.address_family.ipv4_unicast.segment_routing_mpls_unlabeled_protection_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_unlabeled_protection_route_policy, null)
        segment_routing_protected_adjacency_sid_delay                   = try(isis_process.address_family.ipv4_unicast.segment_routing_protected_adjacency_sid_delay, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_protected_adjacency_sid_delay, null)
        distance_sources = try(length(isis_process.address_family.ipv4_unicast.distance_sources) == 0, true) ? null : [for ds in isis_process.address_family.ipv4_unicast.distance_sources : {
          address      = try(ds.address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.distance_sources.address, null)
          prefix       = try(ds.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.distance_sources.prefix, null)
          distance     = try(ds.distance, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.distance_sources.distance, null)
          route_filter = try(ds.route_filter, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.distance_sources.route_filter, null)
          }
        ]
        fast_reroute_per_link_priority_limit_levels = try(length(isis_process.address_family.ipv4_unicast.fast_reroute_per_link.priority_limit_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_unicast.fast_reroute_per_link.priority_limit_levels : {
          level_number   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_link.priority_limit_levels.level_number, null)
          priority_limit = try(level.priority_limit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_link.priority_limit_levels.priority_limit, null)
          }
        ]
        fast_reroute_per_link_use_candidate_only_levels = try(length(isis_process.address_family.ipv4_unicast.fast_reroute_per_link.use_candidate_only_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_unicast.fast_reroute_per_link.use_candidate_only_levels : {
          level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_link.use_candidate_only_levels.level_number, null)
          }
        ]
        fast_reroute_per_prefix_load_sharing_disable_levels = try(length(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.load_sharing_disable_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.load_sharing_disable_levels : {
          level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.load_sharing_disable_levels.level_number, null)
          }
        ]
        fast_reroute_per_prefix_priority_limit_levels = try(length(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.priority_limit_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.priority_limit_levels : {
          level_number   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.priority_limit_levels.level_number, null)
          priority_limit = try(level.priority_limit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.priority_limit_levels.priority_limit, null)
          }
        ]
        fast_reroute_per_prefix_remote_lfa_prefix_list_levels = try(length(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.remote_lfa_prefix_list_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.remote_lfa_prefix_list_levels : {
          level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.remote_lfa_prefix_list_levels.level_number, null)
          prefix_list  = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.remote_lfa_prefix_list_levels.prefix_list, null)
          }
        ]
        fast_reroute_per_prefix_srlg_protection_weighted_global_levels = try(length(isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.srlg_protection_weighted_global_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_unicast.fast_reroute_per_prefix.srlg_protection_weighted_global_levels : {
          level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.fast_reroute_per_prefix.srlg_protection_weighted_global_levels.level_number, null)
          }
        ]
        maximum_redistributed_prefixes_levels = try(length(isis_process.address_family.ipv4_unicast.maximum_redistributed_prefixes_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_unicast.maximum_redistributed_prefixes_levels : {
          level_number                   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.maximum_redistributed_prefixes_levels.level_number, null)
          maximum_redistributed_prefixes = try(level.maximum_redistributed_prefixes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.maximum_redistributed_prefixes_levels.maximum_redistributed_prefixes, null)
          }
        ]
        metric_levels = try(length(isis_process.address_family.ipv4_unicast.metric_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_unicast.metric_levels : {
          level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.metric_levels.level_number, null)
          metric       = try(level.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.metric_levels.metric, null)
          }
        ]
        metric_style_levels = try(length(isis_process.address_family.ipv4_unicast.metric_style_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_unicast.metric_style_levels : {
          level_number      = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.metric_style_levels.level_number, null)
          narrow            = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.metric_style_levels.metric_style, null) == "narrow" ? true : null
          narrow_transition = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.metric_style_levels.metric_style, null) == "narrow_transition" ? true : null
          transition        = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.metric_style_levels.metric_style, null) == "transition" ? true : null
          wide              = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.metric_style_levels.metric_style, null) == "wide" ? true : null
          wide_transition   = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.metric_style_levels.metric_style, null) == "wide_transition" ? true : null
          }
        ]
        mpls_traffic_eng_tunnel_metric_levels = try(length(isis_process.address_family.ipv4_unicast.mpls_traffic_eng_tunnel_metric_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_unicast.mpls_traffic_eng_tunnel_metric_levels : {
          level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.mpls_traffic_eng_tunnel_metric_levels.level_number, null)
          metric       = try(level.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.mpls_traffic_eng_tunnel_metric_levels.metric, null)
          }
        ]
        partition_detect_external_address_tracks = try(length(isis_process.address_family.ipv4_unicast.partition_detect_tracks_external) == 0, true) ? null : [for track in isis_process.address_family.ipv4_unicast.partition_detect_tracks_external : {
          address          = try(track.address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.partition_detect_tracks_external.address, null)
          external_address = try(track.external_address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.partition_detect_tracks_external.external_address, null)
          }
        ]
        partition_detect_tracks = try(length(isis_process.address_family.ipv4_unicast.partition_detect_tracks) == 0, true) ? null : [for track in isis_process.address_family.ipv4_unicast.partition_detect_tracks : {
          address = try(track.address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.partition_detect_tracks.address, null)
          ipv4    = try(track.ipv4, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.partition_detect_tracks.ipv4, null)
          ipv6    = try(track.ipv6, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.partition_detect_tracks.ipv6, null)
          }
        ]
        propagate_levels = try(length(isis_process.address_family.ipv4_unicast.propagate_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_unicast.propagate_levels : {
          source_level      = try(level.source_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.propagate_levels.source_level, null)
          destination_level = try(level.destination_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.propagate_levels.destination_level, null)
          route_policy      = try(level.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.propagate_levels.route_policy, null)
          }
        ]
        redistribute_bgp = try(length(isis_process.address_family.ipv4_unicast.redistribute_bgp) == 0, true) ? null : [for redis in isis_process.address_family.ipv4_unicast.redistribute_bgp : {
          as_number    = try(redis.as_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_bgp.as_number, null)
          level        = try(redis.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_bgp.level, null)
          metric       = try(redis.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_bgp.metric, null)
          metric_type  = try(redis.metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_bgp.metric_type, null)
          route_policy = try(redis.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_bgp.route_policy, null)
          }
        ]
        redistribute_isis = try(length(isis_process.address_family.ipv4_unicast.redistribute_isis) == 0, true) ? null : [for redis in isis_process.address_family.ipv4_unicast.redistribute_isis : {
          instance_id     = try(redis.instance_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_isis.instance_id, null)
          down_flag_clear = try(redis.down_flag_clear, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_isis.down_flag_clear, null)
          level           = try(redis.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_isis.level, null)
          metric          = try(redis.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_isis.metric, null)
          metric_type     = try(redis.metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_isis.metric_type, null)
          route_policy    = try(redis.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_isis.route_policy, null)
          }
        ]
        redistribute_ospf = try(length(isis_process.address_family.ipv4_unicast.redistribute_ospf) == 0, true) ? null : [for redis in isis_process.address_family.ipv4_unicast.redistribute_ospf : {
          instance_id    = try(redis.instance_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_ospf.instance_id, null)
          match_external = try(redis.match_external, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_ospf.match_external, null)
          match_internal = try(redis.match_internal, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_ospf.match_internal, null)
          level          = try(redis.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_ospf.level, null)
          metric         = try(redis.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_ospf.metric, null)
          metric_type    = try(redis.metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_ospf.metric_type, null)
          route_policy   = try(redis.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.redistribute_ospf.route_policy, null)
          }
        ]
        segment_routing_mpls_connected_prefix_sid_map_addresses = try(length(isis_process.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses) == 0, true) ? null : [for addr in isis_process.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses : {
          ip_address             = try(addr.ip_address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.ip_address, null)
          prefix                 = try(addr.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.prefix, null)
          index_id               = try(addr.index_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.index_id, null)
          index_interface        = try(addr.index_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.index_interface, null)
          index_php_disable      = try(addr.index_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.index_php_disable, null)
          index_explicit_null    = try(addr.index_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.index_explicit_null, null)
          absolute_id            = try(addr.absolute_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.absolute_id, null)
          absolute_interface     = try(addr.absolute_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.absolute_interface, null)
          absolute_php_disable   = try(addr.absolute_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.absolute_php_disable, null)
          absolute_explicit_null = try(addr.absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.absolute_explicit_null, null)
          }
        ]
        segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses = try(length(isis_process.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses) == 0, true) ? null : [for addr in isis_process.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses : {
          ip_address             = try(addr.ip_address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.ip_address, null)
          prefix                 = try(addr.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.prefix, null)
          flex_algo              = try(addr.flex_algo, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.flex_algo, null)
          index_id               = try(addr.index_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.index_id, null)
          index_interface        = try(addr.index_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.index_interface, null)
          index_php_disable      = try(addr.index_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.index_php_disable, null)
          index_explicit_null    = try(addr.index_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.index_explicit_null, null)
          absolute_id            = try(addr.absolute_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.absolute_id, null)
          absolute_interface     = try(addr.absolute_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.absolute_interface, null)
          absolute_php_disable   = try(addr.absolute_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.absolute_php_disable, null)
          absolute_explicit_null = try(addr.absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.absolute_explicit_null, null)
          }
        ]
        segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses = try(length(isis_process.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses) == 0, true) ? null : [for addr in isis_process.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses : {
          ip_address             = try(addr.ip_address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.ip_address, null)
          prefix                 = try(addr.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.prefix, null)
          index_id               = try(addr.index_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.index_id, null)
          index_interface        = try(addr.index_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.index_interface, null)
          index_php_disable      = try(addr.index_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.index_php_disable, null)
          index_explicit_null    = try(addr.index_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.index_explicit_null, null)
          absolute_id            = try(addr.absolute_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.absolute_id, null)
          absolute_interface     = try(addr.absolute_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.absolute_interface, null)
          absolute_php_disable   = try(addr.absolute_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.absolute_php_disable, null)
          absolute_explicit_null = try(addr.absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.absolute_explicit_null, null)
          }
        ]
        spf_interval_levels = try(length(isis_process.address_family.ipv4_unicast.spf_interval_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_unicast.spf_interval_levels : {
          level_number           = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_levels.level_number, null)
          ietf                   = try(level.ietf, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_levels.ietf, null)
          ietf_holddown_interval = try(level.ietf_holddown_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_levels.ietf_holddown_interval, null)
          ietf_learn_interval    = try(level.ietf_learn_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_levels.ietf_learn_interval, null)
          ietf_long_wait         = try(level.ietf_long_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_levels.ietf_long_wait, null)
          ietf_short_wait        = try(level.ietf_short_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_levels.ietf_short_wait, null)
          initial_wait           = try(level.initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_levels.initial_wait, null)
          maximum_wait           = try(level.maximum_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_levels.maximum_wait, null)
          secondary_wait         = try(level.secondary_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_interval_levels.secondary_wait, null)
          }
        ]
        spf_prefix_priority_critical_levels = try(length(isis_process.address_family.ipv4_unicast.spf_prefix_priority_critical_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_unicast.spf_prefix_priority_critical_levels : {
          level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_prefix_priority_critical_levels.level_number, null)
          prefix_list_name = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_prefix_priority_critical_levels.prefix_list, null)
          tag              = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_prefix_priority_critical_levels.tag, null)
          }
        ]
        spf_prefix_priority_high_levels = try(length(isis_process.address_family.ipv4_unicast.spf_prefix_priority_high_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_unicast.spf_prefix_priority_high_levels : {
          level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_prefix_priority_high_levels.level_number, null)
          prefix_list_name = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_prefix_priority_high_levels.prefix_list, null)
          tag              = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_prefix_priority_high_levels.tag, null)
          }
        ]
        spf_prefix_priority_medium_levels = try(length(isis_process.address_family.ipv4_unicast.spf_prefix_priority_medium_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_unicast.spf_prefix_priority_medium_levels : {
          level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_prefix_priority_medium_levels.level_number, null)
          prefix_list_name = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_prefix_priority_medium_levels.prefix_list, null)
          tag              = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.spf_prefix_priority_medium_levels.tag, null)
          }
        ]
        summary_prefixes = try(length(isis_process.address_family.ipv4_unicast.summary_prefixes) == 0, true) ? null : [for sp in isis_process.address_family.ipv4_unicast.summary_prefixes : {
          address                          = try(sp.address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.summary_prefixes.address, null)
          prefix                           = try(sp.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.summary_prefixes.prefix, null)
          tag                              = try(sp.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.summary_prefixes.tag, null)
          level                            = try(sp.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.summary_prefixes.level_number, null)
          algorithm                        = try(sp.algorithm, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.summary_prefixes.algorithm, null)
          explicit                         = try(sp.explicit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.summary_prefixes.explicit, null)
          adv_unreachable                  = try(sp.adv_unreachable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.summary_prefixes.adv_unreachable, null)
          unreachable_tag                  = try(sp.unreachable_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.summary_prefixes.unreachable_tag, null)
          unreachable_tag_exclude_prefixes = try(sp.unreachable_tag_exclude_prefixes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.summary_prefixes.unreachable_tag_exclude_prefixes, null)
          partition_repair                 = try(sp.partition_repair, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_unicast.summary_prefixes.partition_repair, null)
          }
        ]
      }] : []
    ]
  ])
}

resource "iosxr_router_isis_address_family" "ipv4_unicast" {
  for_each                                                           = { for af in local.router_isis_address_family_ipv4_unicast : af.key => af }
  device                                                             = each.value.device_name
  process_id                                                         = each.value.process_id
  af_name                                                            = each.value.af_name
  saf_name                                                           = each.value.saf_name
  advertise_link_attributes                                          = each.value.advertise_link_attributes
  advertise_passive_only                                             = each.value.advertise_passive_only
  default_information_originate                                      = each.value.default_information_originate
  default_information_originate_route_policy                         = each.value.default_information_originate_route_policy
  fast_reroute_delay_interval                                        = each.value.fast_reroute_delay_interval
  fast_reroute_per_link_priority_limit                               = each.value.fast_reroute_per_link_priority_limit
  fast_reroute_per_link_use_candidate_only                           = each.value.fast_reroute_per_link_use_candidate_only
  fast_reroute_per_prefix_load_sharing_disable                       = each.value.fast_reroute_per_prefix_load_sharing_disable
  fast_reroute_per_prefix_priority_limit                             = each.value.fast_reroute_per_prefix_priority_limit
  fast_reroute_per_prefix_remote_lfa_prefix_list                     = each.value.fast_reroute_per_prefix_remote_lfa_prefix_list
  fast_reroute_per_prefix_srlg_protection_weighted_global            = each.value.fast_reroute_per_prefix_srlg_protection_weighted_global
  fast_reroute_per_prefix_tiebreaker_downstream_index                = each.value.fast_reroute_per_prefix_tiebreaker_downstream_index
  fast_reroute_per_prefix_tiebreaker_lc_disjoint_index               = each.value.fast_reroute_per_prefix_tiebreaker_lc_disjoint_index
  fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index      = each.value.fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index
  fast_reroute_per_prefix_tiebreaker_node_protecting_index           = each.value.fast_reroute_per_prefix_tiebreaker_node_protecting_index
  fast_reroute_per_prefix_tiebreaker_primary_path_index              = each.value.fast_reroute_per_prefix_tiebreaker_primary_path_index
  fast_reroute_per_prefix_tiebreaker_secondary_path_index            = each.value.fast_reroute_per_prefix_tiebreaker_secondary_path_index
  fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index             = each.value.fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index
  fast_reroute_per_prefix_use_candidate_only                         = each.value.fast_reroute_per_prefix_use_candidate_only
  maximum_redistributed_prefixes                                     = each.value.maximum_redistributed_prefixes
  metric_style_narrow                                                = each.value.metric_style_narrow
  metric_style_narrow_transition                                     = each.value.metric_style_narrow_transition
  metric_style_transition                                            = each.value.metric_style_transition
  metric_style_wide                                                  = each.value.metric_style_wide
  metric_style_wide_transition                                       = each.value.metric_style_wide_transition
  microloop_avoidance                                                = each.value.microloop_avoidance
  microloop_avoidance_protected                                      = each.value.microloop_avoidance_protected
  microloop_avoidance_rib_update_delay                               = each.value.microloop_avoidance_rib_update_delay
  microloop_avoidance_segment_routing_route_policy                   = each.value.microloop_avoidance_segment_routing_route_policy
  mpls_ldp_auto_config                                               = each.value.mpls_ldp_auto_config
  mpls_traffic_eng_level_1                                           = each.value.mpls_traffic_eng_level_1
  mpls_traffic_eng_level_1_2                                         = each.value.mpls_traffic_eng_level_1_2
  mpls_traffic_eng_level_2_only                                      = each.value.mpls_traffic_eng_level_2_only
  mpls_traffic_eng_router_id_interface_name                          = each.value.mpls_traffic_eng_router_id_interface_name
  mpls_traffic_eng_router_id_ipv4_address                            = each.value.mpls_traffic_eng_router_id_ipv4_address
  router_id_interface_name                                           = each.value.router_id_interface_name
  router_id_ip_address                                               = each.value.router_id_ip_address
  segment_routing_mpls_enable                                        = each.value.segment_routing_mpls_enable
  segment_routing_mpls_sr_prefer                                     = each.value.segment_routing_mpls_sr_prefer
  spf_interval_ietf                                                  = each.value.spf_interval_ietf
  spf_interval_ietf_holddown_interval                                = each.value.spf_interval_ietf_holddown_interval
  spf_interval_ietf_initial_wait                                     = each.value.spf_interval_ietf_initial_wait
  spf_interval_ietf_learn_interval                                   = each.value.spf_interval_ietf_learn_interval
  spf_interval_ietf_long_wait                                        = each.value.spf_interval_ietf_long_wait
  spf_interval_ietf_short_wait                                       = each.value.spf_interval_ietf_short_wait
  spf_interval_initial_wait                                          = each.value.spf_interval_initial_wait
  spf_interval_maximum_wait                                          = each.value.spf_interval_maximum_wait
  spf_interval_secondary_wait                                        = each.value.spf_interval_secondary_wait
  spf_prefix_priority_critical_prefix_list_name                      = each.value.spf_prefix_priority_critical_prefix_list_name
  spf_prefix_priority_critical_tag                                   = each.value.spf_prefix_priority_critical_tag
  spf_prefix_priority_high_prefix_list_name                          = each.value.spf_prefix_priority_high_prefix_list_name
  spf_prefix_priority_high_tag                                       = each.value.spf_prefix_priority_high_tag
  spf_prefix_priority_medium_prefix_list_name                        = each.value.spf_prefix_priority_medium_prefix_list_name
  spf_prefix_priority_medium_tag                                     = each.value.spf_prefix_priority_medium_tag
  adjacency_check_disable                                            = each.value.adjacency_check_disable
  attached_bit_receive_ignore                                        = each.value.attached_bit_receive_ignore
  attached_bit_send                                                  = each.value.attached_bit_send
  distance                                                           = each.value.distance
  distribute_list_prefix_list_in                                     = each.value.distribute_list_prefix_list_in
  distribute_list_route_policy_in                                    = each.value.distribute_list_route_policy_in
  maximum_paths                                                      = each.value.maximum_paths
  metric                                                             = each.value.metric
  mpls_traffic_eng_igp_intact                                        = each.value.mpls_traffic_eng_igp_intact
  mpls_traffic_eng_multicast_intact                                  = each.value.mpls_traffic_eng_multicast_intact
  mpls_traffic_eng_tunnel_anycast_prefer_igp_cost                    = each.value.mpls_traffic_eng_tunnel_anycast_prefer_igp_cost
  mpls_traffic_eng_tunnel_metric                                     = each.value.mpls_traffic_eng_tunnel_metric
  mpls_traffic_eng_tunnel_preferred                                  = each.value.mpls_traffic_eng_tunnel_preferred
  mpls_traffic_eng_tunnel_restricted                                 = each.value.mpls_traffic_eng_tunnel_restricted
  partition_detect                                                   = each.value.partition_detect
  prefix_unreachable                                                 = each.value.prefix_unreachable
  prefix_unreachable_adv_lifetime                                    = each.value.prefix_unreachable_adv_lifetime
  prefix_unreachable_adv_maximum                                     = each.value.prefix_unreachable_adv_maximum
  prefix_unreachable_adv_metric                                      = each.value.prefix_unreachable_adv_metric
  prefix_unreachable_rx_process_enable                               = each.value.prefix_unreachable_rx_process_enable
  redistribute_connected                                             = each.value.redistribute_connected
  redistribute_connected_level                                       = each.value.redistribute_connected_level
  redistribute_connected_metric                                      = each.value.redistribute_connected_metric
  redistribute_connected_metric_type                                 = each.value.redistribute_connected_metric_type
  redistribute_connected_route_policy                                = each.value.redistribute_connected_route_policy
  redistribute_static                                                = each.value.redistribute_static
  redistribute_static_level                                          = each.value.redistribute_static_level
  redistribute_static_metric                                         = each.value.redistribute_static_metric
  redistribute_static_metric_type                                    = each.value.redistribute_static_metric_type
  redistribute_static_route_policy                                   = each.value.redistribute_static_route_policy
  route_source_first_hop                                             = each.value.route_source_first_hop
  segment_routing_bundle_member_adj_sid                              = each.value.segment_routing_bundle_member_adj_sid
  segment_routing_labeled_only                                       = each.value.segment_routing_labeled_only
  segment_routing_mpls_connected_prefix_sid_map                      = each.value.segment_routing_mpls_connected_prefix_sid_map
  segment_routing_mpls_prefix_sid_map_advertise_local                = each.value.segment_routing_mpls_prefix_sid_map_advertise_local
  segment_routing_mpls_prefix_sid_map_advertise_local_domain_wide    = each.value.segment_routing_mpls_prefix_sid_map_advertise_local_domain_wide
  segment_routing_mpls_prefix_sid_map_receive                        = each.value.segment_routing_mpls_prefix_sid_map_receive
  segment_routing_mpls_prefix_sid_map_receive_disable                = each.value.segment_routing_mpls_prefix_sid_map_receive_disable
  segment_routing_mpls_unlabeled_protection_disable                  = each.value.segment_routing_mpls_unlabeled_protection_disable
  segment_routing_mpls_unlabeled_protection_prefix_list              = each.value.segment_routing_mpls_unlabeled_protection_prefix_list
  segment_routing_mpls_unlabeled_protection_route_policy             = each.value.segment_routing_mpls_unlabeled_protection_route_policy
  segment_routing_protected_adjacency_sid_delay                      = each.value.segment_routing_protected_adjacency_sid_delay
  distance_sources                                                   = each.value.distance_sources
  fast_reroute_per_link_priority_limit_levels                        = each.value.fast_reroute_per_link_priority_limit_levels
  fast_reroute_per_link_use_candidate_only_levels                    = each.value.fast_reroute_per_link_use_candidate_only_levels
  fast_reroute_per_prefix_load_sharing_disable_levels                = each.value.fast_reroute_per_prefix_load_sharing_disable_levels
  fast_reroute_per_prefix_priority_limit_levels                      = each.value.fast_reroute_per_prefix_priority_limit_levels
  fast_reroute_per_prefix_remote_lfa_prefix_list_levels              = each.value.fast_reroute_per_prefix_remote_lfa_prefix_list_levels
  fast_reroute_per_prefix_srlg_protection_weighted_global_levels     = each.value.fast_reroute_per_prefix_srlg_protection_weighted_global_levels
  maximum_redistributed_prefixes_levels                              = each.value.maximum_redistributed_prefixes_levels
  metric_levels                                                      = each.value.metric_levels
  metric_style_levels                                                = each.value.metric_style_levels
  mpls_traffic_eng_tunnel_metric_levels                              = each.value.mpls_traffic_eng_tunnel_metric_levels
  partition_detect_external_address_tracks                           = each.value.partition_detect_external_address_tracks
  partition_detect_tracks                                            = each.value.partition_detect_tracks
  propagate_levels                                                   = each.value.propagate_levels
  redistribute_bgp                                                   = each.value.redistribute_bgp
  redistribute_isis                                                  = each.value.redistribute_isis
  redistribute_ospf                                                  = each.value.redistribute_ospf
  segment_routing_mpls_connected_prefix_sid_map_addresses            = each.value.segment_routing_mpls_connected_prefix_sid_map_addresses
  segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses  = each.value.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses
  segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses = each.value.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses
  spf_interval_levels                                                = each.value.spf_interval_levels
  spf_prefix_priority_critical_levels                                = each.value.spf_prefix_priority_critical_levels
  spf_prefix_priority_high_levels                                    = each.value.spf_prefix_priority_high_levels
  spf_prefix_priority_medium_levels                                  = each.value.spf_prefix_priority_medium_levels
  summary_prefixes                                                   = each.value.summary_prefixes

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_segment_routing.segment_routing,
    iosxr_segment_routing_v6.segment_routing_v6,
    #iosxr_segment_routing_mapping_server.segment_routing_mapping_server
    iosxr_router_isis.router_isis
  ]
}

locals {
  router_isis_address_family_ipv6_unicast = flatten([
    for device in local.devices : [
      for isis_process in try(local.device_config[device.name].routing.isis_processes, []) :
      contains(keys(try(isis_process.address_family, {})), "ipv6_unicast") ? [{
        key                                                             = format("%s/%s/ipv6-unicast", device.name, isis_process.id)
        device_name                                                     = device.name
        process_id                                                      = try(isis_process.id, local.defaults.iosxr.devices.configuration.routing.isis_processes.id, null)
        af_name                                                         = "ipv6"
        saf_name                                                        = "unicast"
        advertise_link_attributes                                       = try(isis_process.address_family.ipv6_unicast.advertise_link_attributes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.advertise_link_attributes, null)
        advertise_passive_only                                          = try(isis_process.address_family.ipv6_unicast.advertise_passive_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.advertise_passive_only, null)
        default_information_originate                                   = try(isis_process.address_family.ipv6_unicast.default_information_originate, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.default_information_originate, null)
        default_information_originate_route_policy                      = try(isis_process.address_family.ipv6_unicast.default_information_originate_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.default_information_originate_route_policy, null)
        fast_reroute_delay_interval                                     = try(isis_process.address_family.ipv6_unicast.fast_reroute_delay_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_delay_interval, null)
        fast_reroute_per_link_priority_limit                            = try(isis_process.address_family.ipv6_unicast.fast_reroute_per_link.priority_limit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_link.priority_limit, null)
        fast_reroute_per_link_use_candidate_only                        = try(isis_process.address_family.ipv6_unicast.fast_reroute_per_link.use_candidate_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_link.use_candidate_only, null)
        fast_reroute_per_prefix_load_sharing_disable                    = try(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.load_sharing_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.load_sharing_disable, null)
        fast_reroute_per_prefix_priority_limit                          = try(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.priority_limit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.priority_limit, null)
        fast_reroute_per_prefix_remote_lfa_prefix_list                  = try(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.remote_lfa_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.remote_lfa_prefix_list, null)
        fast_reroute_per_prefix_srlg_protection_weighted_global         = try(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.srlg_protection_weighted_global, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.srlg_protection_weighted_global, null)
        fast_reroute_per_prefix_tiebreaker_downstream_index             = try(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.tiebreaker.downstream_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.tiebreaker.downstream_index, null)
        fast_reroute_per_prefix_tiebreaker_lc_disjoint_index            = try(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, null)
        fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index   = try(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, null)
        fast_reroute_per_prefix_tiebreaker_node_protecting_index        = try(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.tiebreaker.node_protecting_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.tiebreaker.node_protecting_index, null)
        fast_reroute_per_prefix_tiebreaker_primary_path_index           = try(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.tiebreaker.primary_path_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.tiebreaker.primary_path_index, null)
        fast_reroute_per_prefix_tiebreaker_secondary_path_index         = try(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.tiebreaker.secondary_path_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.tiebreaker.secondary_path_index, null)
        fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index          = try(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, null)
        fast_reroute_per_prefix_use_candidate_only                      = try(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.use_candidate_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.use_candidate_only, null)
        maximum_redistributed_prefixes                                  = try(isis_process.address_family.ipv6_unicast.maximum_redistributed_prefixes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.maximum_redistributed_prefixes, null)
        metric_style_narrow                                             = try(isis_process.address_family.ipv6_unicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.metric_style, null) == "narrow" ? true : null
        metric_style_narrow_transition                                  = try(isis_process.address_family.ipv6_unicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.metric_style, null) == "narrow_transition" ? true : null
        metric_style_transition                                         = try(isis_process.address_family.ipv6_unicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.metric_style, null) == "transition" ? true : null
        metric_style_wide                                               = try(isis_process.address_family.ipv6_unicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.metric_style, null) == "wide" ? true : null
        metric_style_wide_transition                                    = try(isis_process.address_family.ipv6_unicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.metric_style, null) == "wide_transition" ? true : null
        microloop_avoidance                                             = try(isis_process.address_family.ipv6_unicast.microloop_avoidance, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.microloop_avoidance, null)
        microloop_avoidance_protected                                   = try(isis_process.address_family.ipv6_unicast.microloop_avoidance_protected, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.microloop_avoidance_protected, null)
        microloop_avoidance_rib_update_delay                            = try(isis_process.address_family.ipv6_unicast.microloop_avoidance_rib_update_delay, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.microloop_avoidance_rib_update_delay, null)
        microloop_avoidance_segment_routing_route_policy                = try(isis_process.address_family.ipv6_unicast.microloop_avoidance_segment_routing_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.microloop_avoidance_segment_routing_route_policy, null)
        router_id_interface_name                                        = try(isis_process.address_family.ipv6_unicast.router_id_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.router_id_interface, null)
        router_id_ip_address                                            = try(isis_process.address_family.ipv6_unicast.router_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.router_id, null)
        segment_routing_mpls_connected_prefix_sid_map                   = try(isis_process.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map, null)
        segment_routing_mpls_enable                                     = try(isis_process.address_family.ipv6_unicast.segment_routing_mpls_enable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_enable, null)
        segment_routing_mpls_prefix_sid_map_advertise_local             = try(isis_process.address_family.ipv6_unicast.segment_routing_mpls_prefix_sid_map_advertise_local, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_prefix_sid_map_advertise_local, null)
        segment_routing_mpls_prefix_sid_map_advertise_local_domain_wide = try(isis_process.address_family.ipv6_unicast.segment_routing_mpls_prefix_sid_map_advertise_local_domain_wide, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_prefix_sid_map_advertise_local_domain_wide, null)
        segment_routing_mpls_prefix_sid_map_receive                     = try(isis_process.address_family.ipv6_unicast.segment_routing_mpls_prefix_sid_map_receive, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_prefix_sid_map_receive, null)
        segment_routing_mpls_prefix_sid_map_receive_disable             = try(isis_process.address_family.ipv6_unicast.segment_routing_mpls_prefix_sid_map_receive_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_prefix_sid_map_receive_disable, null)
        segment_routing_mpls_sr_prefer                                  = try(isis_process.address_family.ipv6_unicast.segment_routing_mpls_sr_prefer, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_sr_prefer, null)
        segment_routing_mpls_unlabeled_protection_disable               = try(isis_process.address_family.ipv6_unicast.segment_routing_mpls_unlabeled_protection_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_unlabeled_protection_disable, null)
        segment_routing_mpls_unlabeled_protection_prefix_list           = try(isis_process.address_family.ipv6_unicast.segment_routing_mpls_unlabeled_protection_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_unlabeled_protection_prefix_list, null)
        segment_routing_mpls_unlabeled_protection_route_policy          = try(isis_process.address_family.ipv6_unicast.segment_routing_mpls_unlabeled_protection_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_unlabeled_protection_route_policy, null)
        spf_interval_ietf                                               = try(isis_process.address_family.ipv6_unicast.spf_interval_ietf, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_ietf, null)
        spf_interval_ietf_holddown_interval                             = try(isis_process.address_family.ipv6_unicast.spf_interval_ietf_holddown_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_ietf_holddown_interval, null)
        spf_interval_ietf_initial_wait                                  = try(isis_process.address_family.ipv6_unicast.spf_interval_ietf_initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_ietf_initial_wait, null)
        spf_interval_ietf_learn_interval                                = try(isis_process.address_family.ipv6_unicast.spf_interval_ietf_learn_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_ietf_learn_interval, null)
        spf_interval_ietf_long_wait                                     = try(isis_process.address_family.ipv6_unicast.spf_interval_ietf_long_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_ietf_long_wait, null)
        spf_interval_ietf_short_wait                                    = try(isis_process.address_family.ipv6_unicast.spf_interval_ietf_short_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_ietf_short_wait, null)
        spf_interval_initial_wait                                       = try(isis_process.address_family.ipv6_unicast.spf_interval_initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_initial_wait, null)
        spf_interval_maximum_wait                                       = try(isis_process.address_family.ipv6_unicast.spf_interval_maximum_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_maximum_wait, null)
        spf_interval_secondary_wait                                     = try(isis_process.address_family.ipv6_unicast.spf_interval_secondary_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_secondary_wait, null)
        spf_prefix_priority_critical_prefix_list_name                   = try(isis_process.address_family.ipv6_unicast.spf_prefix_priority_critical_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_prefix_priority_critical_prefix_list, null)
        spf_prefix_priority_critical_tag                                = try(isis_process.address_family.ipv6_unicast.spf_prefix_priority_critical_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_prefix_priority_critical_tag, null)
        spf_prefix_priority_high_prefix_list_name                       = try(isis_process.address_family.ipv6_unicast.spf_prefix_priority_high_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_prefix_priority_high_prefix_list, null)
        spf_prefix_priority_high_tag                                    = try(isis_process.address_family.ipv6_unicast.spf_prefix_priority_high_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_prefix_priority_high_tag, null)
        spf_prefix_priority_medium_prefix_list_name                     = try(isis_process.address_family.ipv6_unicast.spf_prefix_priority_medium_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_prefix_priority_medium_prefix_list, null)
        spf_prefix_priority_medium_tag                                  = try(isis_process.address_family.ipv6_unicast.spf_prefix_priority_medium_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_prefix_priority_medium_tag, null)
        adjacency_check_disable                                         = try(isis_process.address_family.ipv6_unicast.adjacency_check_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.adjacency_check_disable, null)
        attached_bit_receive_ignore                                     = try(isis_process.address_family.ipv6_unicast.attached_bit_receive_ignore, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.attached_bit_receive_ignore, null)
        attached_bit_send                                               = try(isis_process.address_family.ipv6_unicast.attached_bit_send, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.attached_bit_send, null)
        distance                                                        = try(isis_process.address_family.ipv6_unicast.distance, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.distance, null)
        distribute_list_prefix_list_in                                  = try(isis_process.address_family.ipv6_unicast.distribute_list_prefix_list_in, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.distribute_list_prefix_list_in, null)
        distribute_list_route_policy_in                                 = try(isis_process.address_family.ipv6_unicast.distribute_list_route_policy_in, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.distribute_list_route_policy_in, null)
        maximum_paths                                                   = try(isis_process.address_family.ipv6_unicast.maximum_paths, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.maximum_paths, null)
        metric                                                          = try(isis_process.address_family.ipv6_unicast.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.metric, null)
        partition_detect                                                = try(isis_process.address_family.ipv6_unicast.partition_detect, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.partition_detect, null)
        prefix_unreachable                                              = try(isis_process.address_family.ipv6_unicast.prefix_unreachable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.prefix_unreachable, null)
        prefix_unreachable_adv_lifetime                                 = try(isis_process.address_family.ipv6_unicast.prefix_unreachable_adv_lifetime, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.prefix_unreachable_adv_lifetime, null)
        prefix_unreachable_adv_maximum                                  = try(isis_process.address_family.ipv6_unicast.prefix_unreachable_adv_maximum, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.prefix_unreachable_adv_maximum, null)
        prefix_unreachable_adv_metric                                   = try(isis_process.address_family.ipv6_unicast.prefix_unreachable_adv_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.prefix_unreachable_adv_metric, null)
        prefix_unreachable_rx_process_enable                            = try(isis_process.address_family.ipv6_unicast.prefix_unreachable_rx_process_enable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.prefix_unreachable_rx_process_enable, null)
        redistribute_connected                                          = try(isis_process.address_family.ipv6_unicast.redistribute_connected, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_connected, null)
        redistribute_connected_level                                    = try(isis_process.address_family.ipv6_unicast.redistribute_connected_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_connected_level, null)
        redistribute_connected_metric                                   = try(isis_process.address_family.ipv6_unicast.redistribute_connected_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_connected_metric, null)
        redistribute_connected_metric_type                              = try(isis_process.address_family.ipv6_unicast.redistribute_connected_metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_connected_metric_type, null)
        redistribute_connected_route_policy                             = try(isis_process.address_family.ipv6_unicast.redistribute_connected_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_connected_route_policy, null)
        redistribute_static                                             = try(isis_process.address_family.ipv6_unicast.redistribute_static, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_static, null)
        redistribute_static_level                                       = try(isis_process.address_family.ipv6_unicast.redistribute_static_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_static_level, null)
        redistribute_static_metric                                      = try(isis_process.address_family.ipv6_unicast.redistribute_static_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_static_metric, null)
        redistribute_static_metric_type                                 = try(isis_process.address_family.ipv6_unicast.redistribute_static_metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_static_metric_type, null)
        redistribute_static_route_policy                                = try(isis_process.address_family.ipv6_unicast.redistribute_static_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_static_route_policy, null)
        route_source_first_hop                                          = try(isis_process.address_family.ipv6_unicast.route_source_first_hop, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.route_source_first_hop, null)
        segment_routing_bundle_member_adj_sid                           = try(isis_process.address_family.ipv6_unicast.segment_routing_bundle_member_adj_sid, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_bundle_member_adj_sid, null)
        segment_routing_labeled_only                                    = try(isis_process.address_family.ipv6_unicast.segment_routing_labeled_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_labeled_only, null)
        segment_routing_protected_adjacency_sid_delay                   = try(isis_process.address_family.ipv6_unicast.segment_routing_protected_adjacency_sid_delay, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_protected_adjacency_sid_delay, null)
        distance_sources = try(length(isis_process.address_family.ipv6_unicast.distance_sources) == 0, true) ? null : [for ds in isis_process.address_family.ipv6_unicast.distance_sources : {
          address      = try(ds.address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.distance_sources.address, null)
          prefix       = try(ds.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.distance_sources.prefix, null)
          distance     = try(ds.distance, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.distance_sources.distance, null)
          route_filter = try(ds.route_filter, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.distance_sources.route_filter, null)
          }
        ]
        fast_reroute_per_link_priority_limit_levels = try(length(isis_process.address_family.ipv6_unicast.fast_reroute_per_link.priority_limit_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_unicast.fast_reroute_per_link.priority_limit_levels : {
          level_number   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_link.priority_limit_levels.level_number, null)
          priority_limit = try(level.priority_limit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_link.priority_limit_levels.priority_limit, null)
          }
        ]
        fast_reroute_per_link_use_candidate_only_levels = try(length(isis_process.address_family.ipv6_unicast.fast_reroute_per_link.use_candidate_only_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_unicast.fast_reroute_per_link.use_candidate_only_levels : {
          level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_link.use_candidate_only_levels.level_number, null)
          }
        ]
        fast_reroute_per_prefix_load_sharing_disable_levels = try(length(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.load_sharing_disable_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.load_sharing_disable_levels : {
          level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.load_sharing_disable_levels.level_number, null)
          }
        ]
        fast_reroute_per_prefix_priority_limit_levels = try(length(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.priority_limit_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.priority_limit_levels : {
          level_number   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.priority_limit_levels.level_number, null)
          priority_limit = try(level.priority_limit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.priority_limit_levels.priority_limit, null)
          }
        ]
        fast_reroute_per_prefix_remote_lfa_prefix_list_levels = try(length(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.remote_lfa_prefix_list_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.remote_lfa_prefix_list_levels : {
          level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.remote_lfa_prefix_list_levels.level_number, null)
          prefix_list  = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.remote_lfa_prefix_list_levels.prefix_list, null)
          }
        ]
        fast_reroute_per_prefix_srlg_protection_weighted_global_levels = try(length(isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.srlg_protection_weighted_global_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_unicast.fast_reroute_per_prefix.srlg_protection_weighted_global_levels : {
          level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.fast_reroute_per_prefix.srlg_protection_weighted_global_levels.level_number, null)
          }
        ]
        maximum_redistributed_prefixes_levels = try(length(isis_process.address_family.ipv6_unicast.maximum_redistributed_prefixes_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_unicast.maximum_redistributed_prefixes_levels : {
          level_number                   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.maximum_redistributed_prefixes_levels.level_number, null)
          maximum_redistributed_prefixes = try(level.maximum_redistributed_prefixes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.maximum_redistributed_prefixes_levels.maximum_redistributed_prefixes, null)
          }
        ]
        metric_levels = try(length(isis_process.address_family.ipv6_unicast.metric_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_unicast.metric_levels : {
          level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.metric_levels.level_number, null)
          metric       = try(level.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.metric_levels.metric, null)
          }
        ]
        metric_style_levels = try(length(isis_process.address_family.ipv6_unicast.metric_style_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_unicast.metric_style_levels : {
          level_number      = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.metric_style_levels.level_number, null)
          narrow            = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.metric_style_levels.metric_style, null) == "narrow" ? true : null
          narrow_transition = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.metric_style_levels.metric_style, null) == "narrow_transition" ? true : null
          transition        = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.metric_style_levels.metric_style, null) == "transition" ? true : null
          wide              = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.metric_style_levels.metric_style, null) == "wide" ? true : null
          wide_transition   = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.metric_style_levels.metric_style, null) == "wide_transition" ? true : null
          }
        ]
        partition_detect_external_address_tracks = try(length(isis_process.address_family.ipv6_unicast.partition_detect_tracks_external) == 0, true) ? null : [for track in isis_process.address_family.ipv6_unicast.partition_detect_tracks_external : {
          address          = try(track.address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.partition_detect_tracks_external.address, null)
          external_address = try(track.external_address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.partition_detect_tracks_external.external_address, null)
          }
        ]
        partition_detect_tracks = try(length(isis_process.address_family.ipv6_unicast.partition_detect_tracks) == 0, true) ? null : [for track in isis_process.address_family.ipv6_unicast.partition_detect_tracks : {
          address = try(track.address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.partition_detect_tracks.address, null)
          ipv4    = try(track.ipv4, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.partition_detect_tracks.ipv4, null)
          ipv6    = try(track.ipv6, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.partition_detect_tracks.ipv6, null)
          }
        ]
        propagate_levels = try(length(isis_process.address_family.ipv6_unicast.propagate_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_unicast.propagate_levels : {
          source_level      = try(level.source_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.propagate_levels.source_level, null)
          destination_level = try(level.destination_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.propagate_levels.destination_level, null)
          route_policy      = try(level.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.propagate_levels.route_policy, null)
          }
        ]
        redistribute_bgp = try(length(isis_process.address_family.ipv6_unicast.redistribute_bgp) == 0, true) ? null : [for redis in isis_process.address_family.ipv6_unicast.redistribute_bgp : {
          as_number    = try(redis.as_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_bgp.as_number, null)
          level        = try(redis.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_bgp.level, null)
          metric       = try(redis.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_bgp.metric, null)
          metric_type  = try(redis.metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_bgp.metric_type, null)
          route_policy = try(redis.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_bgp.route_policy, null)
          }
        ]
        redistribute_isis = try(length(isis_process.address_family.ipv6_unicast.redistribute_isis) == 0, true) ? null : [for redis in isis_process.address_family.ipv6_unicast.redistribute_isis : {
          instance_id     = try(redis.instance_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_isis.instance_id, null)
          down_flag_clear = try(redis.down_flag_clear, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_isis.down_flag_clear, null)
          level           = try(redis.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_isis.level, null)
          metric          = try(redis.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_isis.metric, null)
          metric_type     = try(redis.metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_isis.metric_type, null)
          route_policy    = try(redis.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_isis.route_policy, null)
          }
        ]
        redistribute_ospfv3 = try(length(isis_process.address_family.ipv6_unicast.redistribute_ospfv3) == 0, true) ? null : [for redis in isis_process.address_family.ipv6_unicast.redistribute_ospfv3 : {
          instance_id    = try(redis.instance_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_ospfv3.instance_id, null)
          match_external = try(redis.match_external, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_ospfv3.match_external, null)
          match_internal = try(redis.match_internal, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_ospfv3.match_internal, null)
          level          = try(redis.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_ospfv3.level, null)
          metric         = try(redis.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_ospfv3.metric, null)
          metric_type    = try(redis.metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_ospfv3.metric_type, null)
          route_policy   = try(redis.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.redistribute_ospfv3.route_policy, null)
          }
        ]
        segment_routing_srv6_locators = try(length(isis_process.address_family.ipv6_unicast.segment_routing_srv6_locators) == 0, true) ? null : [for locator in isis_process.address_family.ipv6_unicast.segment_routing_srv6_locators : {
          locator_name = try(locator.locator_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_srv6_locators.locator_name, null)
          level        = try(locator.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_srv6_locators.level, null)
          metric       = try(locator.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_srv6_locators.metric, null)
          tag          = try(locator.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_srv6_locators.tag, null)
          metric_levels = try(length(locator.metric_levels) == 0, true) ? null : [for ml in locator.metric_levels : {
            level_number = try(ml.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_srv6_locators.metric_levels.level_number, null)
            metric       = try(ml.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_srv6_locators.metric_levels.metric, null)
            }
          ]
          tag_levels = try(length(locator.tag_levels) == 0, true) ? null : [for tl in locator.tag_levels : {
            level_number = try(tl.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_srv6_locators.tag_levels.level_number, null)
            tag          = try(tl.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_srv6_locators.tag_levels.tag, null)
            }
          ]
          }
        ]
        segment_routing_mpls_connected_prefix_sid_map_addresses = try(length(isis_process.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses) == 0, true) ? null : [for addr in isis_process.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses : {
          ip_address             = try(addr.ip_address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.ip_address, null)
          prefix                 = try(addr.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.prefix, null)
          index_id               = try(addr.index_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.index_id, null)
          index_interface        = try(addr.index_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.index_interface, null)
          index_php_disable      = try(addr.index_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.index_php_disable, null)
          index_explicit_null    = try(addr.index_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.index_explicit_null, null)
          absolute_id            = try(addr.absolute_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.absolute_id, null)
          absolute_interface     = try(addr.absolute_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.absolute_interface, null)
          absolute_php_disable   = try(addr.absolute_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.absolute_php_disable, null)
          absolute_explicit_null = try(addr.absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_addresses.absolute_explicit_null, null)
          }
        ]
        segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses = try(length(isis_process.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses) == 0, true) ? null : [for addr in isis_process.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses : {
          ip_address             = try(addr.ip_address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.ip_address, null)
          prefix                 = try(addr.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.prefix, null)
          flex_algo              = try(addr.flex_algo, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.flex_algo, null)
          index_id               = try(addr.index_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.index_id, null)
          index_interface        = try(addr.index_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.index_interface, null)
          index_php_disable      = try(addr.index_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.index_php_disable, null)
          index_explicit_null    = try(addr.index_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.index_explicit_null, null)
          absolute_id            = try(addr.absolute_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.absolute_id, null)
          absolute_interface     = try(addr.absolute_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.absolute_interface, null)
          absolute_php_disable   = try(addr.absolute_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.absolute_php_disable, null)
          absolute_explicit_null = try(addr.absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.absolute_explicit_null, null)
          }
        ]
        segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses = try(length(isis_process.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses) == 0, true) ? null : [for addr in isis_process.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses : {
          ip_address             = try(addr.ip_address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.ip_address, null)
          prefix                 = try(addr.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.prefix, null)
          index_id               = try(addr.index_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.index_id, null)
          index_interface        = try(addr.index_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.index_interface, null)
          index_php_disable      = try(addr.index_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.index_php_disable, null)
          index_explicit_null    = try(addr.index_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.index_explicit_null, null)
          absolute_id            = try(addr.absolute_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.absolute_id, null)
          absolute_interface     = try(addr.absolute_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.absolute_interface, null)
          absolute_php_disable   = try(addr.absolute_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.absolute_php_disable, null)
          absolute_explicit_null = try(addr.absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.absolute_explicit_null, null)
          }
        ]
        spf_interval_levels = try(length(isis_process.address_family.ipv6_unicast.spf_interval_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_unicast.spf_interval_levels : {
          level_number           = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_levels.level_number, null)
          ietf                   = try(level.ietf, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_levels.ietf, null)
          ietf_holddown_interval = try(level.ietf_holddown_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_levels.ietf_holddown_interval, null)
          ietf_learn_interval    = try(level.ietf_learn_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_levels.ietf_learn_interval, null)
          ietf_long_wait         = try(level.ietf_long_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_levels.ietf_long_wait, null)
          ietf_short_wait        = try(level.ietf_short_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_levels.ietf_short_wait, null)
          initial_wait           = try(level.initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_levels.initial_wait, null)
          maximum_wait           = try(level.maximum_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_levels.maximum_wait, null)
          secondary_wait         = try(level.secondary_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_interval_levels.secondary_wait, null)
          }
        ]
        spf_prefix_priority_critical_levels = try(length(isis_process.address_family.ipv6_unicast.spf_prefix_priority_critical_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_unicast.spf_prefix_priority_critical_levels : {
          level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_prefix_priority_critical_levels.level_number, null)
          prefix_list_name = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_prefix_priority_critical_levels.prefix_list, null)
          tag              = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_prefix_priority_critical_levels.tag, null)
          }
        ]
        spf_prefix_priority_high_levels = try(length(isis_process.address_family.ipv6_unicast.spf_prefix_priority_high_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_unicast.spf_prefix_priority_high_levels : {
          level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_prefix_priority_high_levels.level_number, null)
          prefix_list_name = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_prefix_priority_high_levels.prefix_list, null)
          tag              = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_prefix_priority_high_levels.tag, null)
          }
        ]
        spf_prefix_priority_medium_levels = try(length(isis_process.address_family.ipv6_unicast.spf_prefix_priority_medium_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_unicast.spf_prefix_priority_medium_levels : {
          level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_prefix_priority_medium_levels.level_number, null)
          prefix_list_name = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_prefix_priority_medium_levels.prefix_list, null)
          tag              = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.spf_prefix_priority_medium_levels.tag, null)
          }
        ]
        summary_prefixes = try(length(isis_process.address_family.ipv6_unicast.summary_prefixes) == 0, true) ? null : [for sp in isis_process.address_family.ipv6_unicast.summary_prefixes : {
          address                          = try(sp.address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.summary_prefixes.address, null)
          prefix                           = try(sp.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.summary_prefixes.prefix, null)
          tag                              = try(sp.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.summary_prefixes.tag, null)
          level                            = try(sp.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.summary_prefixes.level_number, null)
          algorithm                        = try(sp.algorithm, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.summary_prefixes.algorithm, null)
          explicit                         = try(sp.explicit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.summary_prefixes.explicit, null)
          adv_unreachable                  = try(sp.adv_unreachable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.summary_prefixes.adv_unreachable, null)
          unreachable_tag                  = try(sp.unreachable_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.summary_prefixes.unreachable_tag, null)
          unreachable_tag_exclude_prefixes = try(sp.unreachable_tag_exclude_prefixes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.summary_prefixes.unreachable_tag_exclude_prefixes, null)
          partition_repair                 = try(sp.partition_repair, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_unicast.summary_prefixes.partition_repair, null)
          }
        ]
      }] : []
    ]
  ])
}

resource "iosxr_router_isis_address_family" "ipv6_unicast" {
  for_each                                                           = { for af in local.router_isis_address_family_ipv6_unicast : af.key => af }
  device                                                             = each.value.device_name
  process_id                                                         = each.value.process_id
  af_name                                                            = each.value.af_name
  saf_name                                                           = each.value.saf_name
  advertise_link_attributes                                          = each.value.advertise_link_attributes
  advertise_passive_only                                             = each.value.advertise_passive_only
  default_information_originate                                      = each.value.default_information_originate
  default_information_originate_route_policy                         = each.value.default_information_originate_route_policy
  fast_reroute_delay_interval                                        = each.value.fast_reroute_delay_interval
  fast_reroute_per_link_priority_limit                               = each.value.fast_reroute_per_link_priority_limit
  fast_reroute_per_link_use_candidate_only                           = each.value.fast_reroute_per_link_use_candidate_only
  fast_reroute_per_prefix_load_sharing_disable                       = each.value.fast_reroute_per_prefix_load_sharing_disable
  fast_reroute_per_prefix_priority_limit                             = each.value.fast_reroute_per_prefix_priority_limit
  fast_reroute_per_prefix_remote_lfa_prefix_list                     = each.value.fast_reroute_per_prefix_remote_lfa_prefix_list
  fast_reroute_per_prefix_srlg_protection_weighted_global            = each.value.fast_reroute_per_prefix_srlg_protection_weighted_global
  fast_reroute_per_prefix_tiebreaker_downstream_index                = each.value.fast_reroute_per_prefix_tiebreaker_downstream_index
  fast_reroute_per_prefix_tiebreaker_lc_disjoint_index               = each.value.fast_reroute_per_prefix_tiebreaker_lc_disjoint_index
  fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index      = each.value.fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index
  fast_reroute_per_prefix_tiebreaker_node_protecting_index           = each.value.fast_reroute_per_prefix_tiebreaker_node_protecting_index
  fast_reroute_per_prefix_tiebreaker_primary_path_index              = each.value.fast_reroute_per_prefix_tiebreaker_primary_path_index
  fast_reroute_per_prefix_tiebreaker_secondary_path_index            = each.value.fast_reroute_per_prefix_tiebreaker_secondary_path_index
  fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index             = each.value.fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index
  fast_reroute_per_prefix_use_candidate_only                         = each.value.fast_reroute_per_prefix_use_candidate_only
  maximum_redistributed_prefixes                                     = each.value.maximum_redistributed_prefixes
  metric_style_narrow                                                = each.value.metric_style_narrow
  metric_style_narrow_transition                                     = each.value.metric_style_narrow_transition
  metric_style_transition                                            = each.value.metric_style_transition
  metric_style_wide                                                  = each.value.metric_style_wide
  metric_style_wide_transition                                       = each.value.metric_style_wide_transition
  microloop_avoidance                                                = each.value.microloop_avoidance
  microloop_avoidance_protected                                      = each.value.microloop_avoidance_protected
  microloop_avoidance_rib_update_delay                               = each.value.microloop_avoidance_rib_update_delay
  microloop_avoidance_segment_routing_route_policy                   = each.value.microloop_avoidance_segment_routing_route_policy
  router_id_interface_name                                           = each.value.router_id_interface_name
  router_id_ip_address                                               = each.value.router_id_ip_address
  segment_routing_mpls_connected_prefix_sid_map                      = each.value.segment_routing_mpls_connected_prefix_sid_map
  segment_routing_mpls_enable                                        = each.value.segment_routing_mpls_enable
  segment_routing_mpls_prefix_sid_map_advertise_local                = each.value.segment_routing_mpls_prefix_sid_map_advertise_local
  segment_routing_mpls_prefix_sid_map_advertise_local_domain_wide    = each.value.segment_routing_mpls_prefix_sid_map_advertise_local_domain_wide
  segment_routing_mpls_prefix_sid_map_receive                        = each.value.segment_routing_mpls_prefix_sid_map_receive
  segment_routing_mpls_prefix_sid_map_receive_disable                = each.value.segment_routing_mpls_prefix_sid_map_receive_disable
  segment_routing_mpls_sr_prefer                                     = each.value.segment_routing_mpls_sr_prefer
  segment_routing_mpls_unlabeled_protection_disable                  = each.value.segment_routing_mpls_unlabeled_protection_disable
  segment_routing_mpls_unlabeled_protection_prefix_list              = each.value.segment_routing_mpls_unlabeled_protection_prefix_list
  segment_routing_mpls_unlabeled_protection_route_policy             = each.value.segment_routing_mpls_unlabeled_protection_route_policy
  spf_interval_ietf                                                  = each.value.spf_interval_ietf
  spf_interval_ietf_holddown_interval                                = each.value.spf_interval_ietf_holddown_interval
  spf_interval_ietf_initial_wait                                     = each.value.spf_interval_ietf_initial_wait
  spf_interval_ietf_learn_interval                                   = each.value.spf_interval_ietf_learn_interval
  spf_interval_ietf_long_wait                                        = each.value.spf_interval_ietf_long_wait
  spf_interval_ietf_short_wait                                       = each.value.spf_interval_ietf_short_wait
  spf_interval_initial_wait                                          = each.value.spf_interval_initial_wait
  spf_interval_maximum_wait                                          = each.value.spf_interval_maximum_wait
  spf_interval_secondary_wait                                        = each.value.spf_interval_secondary_wait
  spf_prefix_priority_critical_prefix_list_name                      = each.value.spf_prefix_priority_critical_prefix_list_name
  spf_prefix_priority_critical_tag                                   = each.value.spf_prefix_priority_critical_tag
  spf_prefix_priority_high_prefix_list_name                          = each.value.spf_prefix_priority_high_prefix_list_name
  spf_prefix_priority_high_tag                                       = each.value.spf_prefix_priority_high_tag
  spf_prefix_priority_medium_prefix_list_name                        = each.value.spf_prefix_priority_medium_prefix_list_name
  spf_prefix_priority_medium_tag                                     = each.value.spf_prefix_priority_medium_tag
  adjacency_check_disable                                            = each.value.adjacency_check_disable
  attached_bit_receive_ignore                                        = each.value.attached_bit_receive_ignore
  attached_bit_send                                                  = each.value.attached_bit_send
  distance                                                           = each.value.distance
  distribute_list_prefix_list_in                                     = each.value.distribute_list_prefix_list_in
  distribute_list_route_policy_in                                    = each.value.distribute_list_route_policy_in
  maximum_paths                                                      = each.value.maximum_paths
  metric                                                             = each.value.metric
  partition_detect                                                   = each.value.partition_detect
  prefix_unreachable                                                 = each.value.prefix_unreachable
  prefix_unreachable_adv_lifetime                                    = each.value.prefix_unreachable_adv_lifetime
  prefix_unreachable_adv_maximum                                     = each.value.prefix_unreachable_adv_maximum
  prefix_unreachable_adv_metric                                      = each.value.prefix_unreachable_adv_metric
  prefix_unreachable_rx_process_enable                               = each.value.prefix_unreachable_rx_process_enable
  redistribute_connected                                             = each.value.redistribute_connected
  redistribute_connected_level                                       = each.value.redistribute_connected_level
  redistribute_connected_metric                                      = each.value.redistribute_connected_metric
  redistribute_connected_metric_type                                 = each.value.redistribute_connected_metric_type
  redistribute_connected_route_policy                                = each.value.redistribute_connected_route_policy
  redistribute_static                                                = each.value.redistribute_static
  redistribute_static_level                                          = each.value.redistribute_static_level
  redistribute_static_metric                                         = each.value.redistribute_static_metric
  redistribute_static_metric_type                                    = each.value.redistribute_static_metric_type
  redistribute_static_route_policy                                   = each.value.redistribute_static_route_policy
  route_source_first_hop                                             = each.value.route_source_first_hop
  segment_routing_bundle_member_adj_sid                              = each.value.segment_routing_bundle_member_adj_sid
  segment_routing_labeled_only                                       = each.value.segment_routing_labeled_only
  segment_routing_protected_adjacency_sid_delay                      = each.value.segment_routing_protected_adjacency_sid_delay
  distance_sources                                                   = each.value.distance_sources
  fast_reroute_per_link_priority_limit_levels                        = each.value.fast_reroute_per_link_priority_limit_levels
  fast_reroute_per_link_use_candidate_only_levels                    = each.value.fast_reroute_per_link_use_candidate_only_levels
  fast_reroute_per_prefix_load_sharing_disable_levels                = each.value.fast_reroute_per_prefix_load_sharing_disable_levels
  fast_reroute_per_prefix_priority_limit_levels                      = each.value.fast_reroute_per_prefix_priority_limit_levels
  fast_reroute_per_prefix_remote_lfa_prefix_list_levels              = each.value.fast_reroute_per_prefix_remote_lfa_prefix_list_levels
  fast_reroute_per_prefix_srlg_protection_weighted_global_levels     = each.value.fast_reroute_per_prefix_srlg_protection_weighted_global_levels
  maximum_redistributed_prefixes_levels                              = each.value.maximum_redistributed_prefixes_levels
  metric_levels                                                      = each.value.metric_levels
  metric_style_levels                                                = each.value.metric_style_levels
  partition_detect_external_address_tracks                           = each.value.partition_detect_external_address_tracks
  partition_detect_tracks                                            = each.value.partition_detect_tracks
  propagate_levels                                                   = each.value.propagate_levels
  redistribute_bgp                                                   = each.value.redistribute_bgp
  redistribute_isis                                                  = each.value.redistribute_isis
  redistribute_ospfv3                                                = each.value.redistribute_ospfv3
  segment_routing_mpls_connected_prefix_sid_map_addresses            = each.value.segment_routing_mpls_connected_prefix_sid_map_addresses
  segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses  = each.value.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses
  segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses = each.value.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses
  segment_routing_srv6_locators                                      = each.value.segment_routing_srv6_locators
  spf_interval_levels                                                = each.value.spf_interval_levels
  spf_prefix_priority_critical_levels                                = each.value.spf_prefix_priority_critical_levels
  spf_prefix_priority_high_levels                                    = each.value.spf_prefix_priority_high_levels
  spf_prefix_priority_medium_levels                                  = each.value.spf_prefix_priority_medium_levels
  summary_prefixes                                                   = each.value.summary_prefixes

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_segment_routing.segment_routing,
    iosxr_segment_routing_v6.segment_routing_v6,
    #iosxr_segment_routing_mapping_server.segment_routing_mapping_server
    iosxr_router_isis.router_isis,
    iosxr_router_isis_address_family.ipv4_unicast
  ]
}

locals {
  router_isis_address_family_ipv4_multicast = flatten([
    for device in local.devices : [
      for isis_process in try(local.device_config[device.name].routing.isis_processes, []) :
      contains(keys(try(isis_process.address_family, {})), "ipv4_multicast") ? [{
        key                                              = format("%s/%s/ipv4-multicast", device.name, isis_process.id)
        device_name                                      = device.name
        process_id                                       = try(isis_process.id, local.defaults.iosxr.devices.configuration.routing.isis_processes.id, null)
        af_name                                          = "ipv4"
        saf_name                                         = "multicast"
        advertise_link_attributes                        = try(isis_process.address_family.ipv4_multicast.advertise_link_attributes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.advertise_link_attributes, null)
        advertise_passive_only                           = try(isis_process.address_family.ipv4_multicast.advertise_passive_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.advertise_passive_only, null)
        default_information_originate                    = try(isis_process.address_family.ipv4_multicast.default_information_originate, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.default_information_originate, null)
        default_information_originate_route_policy       = try(isis_process.address_family.ipv4_multicast.default_information_originate_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.default_information_originate_route_policy, null)
        maximum_redistributed_prefixes                   = try(isis_process.address_family.ipv4_multicast.maximum_redistributed_prefixes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.maximum_redistributed_prefixes, null)
        metric_style_narrow                              = try(isis_process.address_family.ipv4_multicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.metric_style, null) == "narrow" ? true : null
        metric_style_narrow_transition                   = try(isis_process.address_family.ipv4_multicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.metric_style, null) == "narrow_transition" ? true : null
        metric_style_transition                          = try(isis_process.address_family.ipv4_multicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.metric_style, null) == "transition" ? true : null
        metric_style_wide                                = try(isis_process.address_family.ipv4_multicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.metric_style, null) == "wide" ? true : null
        metric_style_wide_transition                     = try(isis_process.address_family.ipv4_multicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.metric_style, null) == "wide_transition" ? true : null
        microloop_avoidance                              = try(isis_process.address_family.ipv4_multicast.microloop_avoidance, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.microloop_avoidance, null)
        microloop_avoidance_protected                    = try(isis_process.address_family.ipv4_multicast.microloop_avoidance_protected, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.microloop_avoidance_protected, null)
        microloop_avoidance_rib_update_delay             = try(isis_process.address_family.ipv4_multicast.microloop_avoidance_rib_update_delay, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.microloop_avoidance_rib_update_delay, null)
        microloop_avoidance_segment_routing_route_policy = try(isis_process.address_family.ipv4_multicast.microloop_avoidance_segment_routing_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.microloop_avoidance_segment_routing_route_policy, null)
        spf_interval_ietf                                = try(isis_process.address_family.ipv4_multicast.spf_interval_ietf, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_ietf, null)
        spf_interval_ietf_holddown_interval              = try(isis_process.address_family.ipv4_multicast.spf_interval_ietf_holddown_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_ietf_holddown_interval, null)
        spf_interval_ietf_initial_wait                   = try(isis_process.address_family.ipv4_multicast.spf_interval_ietf_initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_ietf_initial_wait, null)
        spf_interval_ietf_learn_interval                 = try(isis_process.address_family.ipv4_multicast.spf_interval_ietf_learn_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_ietf_learn_interval, null)
        spf_interval_ietf_long_wait                      = try(isis_process.address_family.ipv4_multicast.spf_interval_ietf_long_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_ietf_long_wait, null)
        spf_interval_ietf_short_wait                     = try(isis_process.address_family.ipv4_multicast.spf_interval_ietf_short_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_ietf_short_wait, null)
        spf_interval_initial_wait                        = try(isis_process.address_family.ipv4_multicast.spf_interval_initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_initial_wait, null)
        spf_interval_maximum_wait                        = try(isis_process.address_family.ipv4_multicast.spf_interval_maximum_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_maximum_wait, null)
        spf_interval_secondary_wait                      = try(isis_process.address_family.ipv4_multicast.spf_interval_secondary_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_secondary_wait, null)
        spf_prefix_priority_critical_prefix_list_name    = try(isis_process.address_family.ipv4_multicast.spf_prefix_priority_critical_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_prefix_priority_critical_prefix_list, null)
        spf_prefix_priority_critical_tag                 = try(isis_process.address_family.ipv4_multicast.spf_prefix_priority_critical_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_prefix_priority_critical_tag, null)
        spf_prefix_priority_high_prefix_list_name        = try(isis_process.address_family.ipv4_multicast.spf_prefix_priority_high_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_prefix_priority_high_prefix_list, null)
        spf_prefix_priority_high_tag                     = try(isis_process.address_family.ipv4_multicast.spf_prefix_priority_high_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_prefix_priority_high_tag, null)
        spf_prefix_priority_medium_prefix_list_name      = try(isis_process.address_family.ipv4_multicast.spf_prefix_priority_medium_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_prefix_priority_medium_prefix_list, null)
        spf_prefix_priority_medium_tag                   = try(isis_process.address_family.ipv4_multicast.spf_prefix_priority_medium_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_prefix_priority_medium_tag, null)
        adjacency_check_disable                          = try(isis_process.address_family.ipv4_multicast.adjacency_check_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.adjacency_check_disable, null)
        attached_bit_receive_ignore                      = try(isis_process.address_family.ipv4_multicast.attached_bit_receive_ignore, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.attached_bit_receive_ignore, null)
        attached_bit_send                                = try(isis_process.address_family.ipv4_multicast.attached_bit_send, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.attached_bit_send, null)
        distance                                         = try(isis_process.address_family.ipv4_multicast.distance, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.distance, null)
        distribute_list_prefix_list_in                   = try(isis_process.address_family.ipv4_multicast.distribute_list_prefix_list_in, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.distribute_list_prefix_list_in, null)
        distribute_list_route_policy_in                  = try(isis_process.address_family.ipv4_multicast.distribute_list_route_policy_in, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.distribute_list_route_policy_in, null)
        maximum_paths                                    = try(isis_process.address_family.ipv4_multicast.maximum_paths, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.maximum_paths, null)
        metric                                           = try(isis_process.address_family.ipv4_multicast.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.metric, null)
        prefix_unreachable                               = try(isis_process.address_family.ipv4_multicast.prefix_unreachable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.prefix_unreachable, null)
        prefix_unreachable_adv_lifetime                  = try(isis_process.address_family.ipv4_multicast.prefix_unreachable_adv_lifetime, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.prefix_unreachable_adv_lifetime, null)
        prefix_unreachable_adv_maximum                   = try(isis_process.address_family.ipv4_multicast.prefix_unreachable_adv_maximum, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.prefix_unreachable_adv_maximum, null)
        prefix_unreachable_adv_metric                    = try(isis_process.address_family.ipv4_multicast.prefix_unreachable_adv_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.prefix_unreachable_adv_metric, null)
        prefix_unreachable_rx_process_enable             = try(isis_process.address_family.ipv4_multicast.prefix_unreachable_rx_process_enable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.prefix_unreachable_rx_process_enable, null)
        redistribute_connected                           = try(isis_process.address_family.ipv4_multicast.redistribute_connected, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_connected, null)
        redistribute_connected_level                     = try(isis_process.address_family.ipv4_multicast.redistribute_connected_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_connected_level, null)
        redistribute_connected_metric                    = try(isis_process.address_family.ipv4_multicast.redistribute_connected_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_connected_metric, null)
        redistribute_connected_metric_type               = try(isis_process.address_family.ipv4_multicast.redistribute_connected_metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_connected_metric_type, null)
        redistribute_connected_route_policy              = try(isis_process.address_family.ipv4_multicast.redistribute_connected_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_connected_route_policy, null)
        redistribute_static                              = try(isis_process.address_family.ipv4_multicast.redistribute_static, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_static, null)
        redistribute_static_level                        = try(isis_process.address_family.ipv4_multicast.redistribute_static_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_static_level, null)
        redistribute_static_metric                       = try(isis_process.address_family.ipv4_multicast.redistribute_static_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_static_metric, null)
        redistribute_static_metric_type                  = try(isis_process.address_family.ipv4_multicast.redistribute_static_metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_static_metric_type, null)
        redistribute_static_route_policy                 = try(isis_process.address_family.ipv4_multicast.redistribute_static_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_static_route_policy, null)
        route_source_first_hop                           = try(isis_process.address_family.ipv4_multicast.route_source_first_hop, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.route_source_first_hop, null)
        distance_sources = try(length(isis_process.address_family.ipv4_multicast.distance_sources) == 0, true) ? null : [for ds in isis_process.address_family.ipv4_multicast.distance_sources : {
          address      = try(ds.address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.distance_sources.address, null)
          prefix       = try(ds.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.distance_sources.prefix, null)
          distance     = try(ds.distance, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.distance_sources.distance, null)
          route_filter = try(ds.route_filter, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.distance_sources.route_filter, null)
          }
        ]
        maximum_redistributed_prefixes_levels = try(length(isis_process.address_family.ipv4_multicast.maximum_redistributed_prefixes_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_multicast.maximum_redistributed_prefixes_levels : {
          level_number                   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.maximum_redistributed_prefixes_levels.level_number, null)
          maximum_redistributed_prefixes = try(level.maximum_redistributed_prefixes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.maximum_redistributed_prefixes_levels.maximum_redistributed_prefixes, null)
          }
        ]
        metric_levels = try(length(isis_process.address_family.ipv4_multicast.metric_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_multicast.metric_levels : {
          level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.metric_levels.level_number, null)
          metric       = try(level.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.metric_levels.metric, null)
          }
        ]
        metric_style_levels = try(length(isis_process.address_family.ipv4_multicast.metric_style_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_multicast.metric_style_levels : {
          level_number      = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.metric_style_levels.level_number, null)
          narrow            = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.metric_style_levels.metric_style, null) == "narrow" ? true : null
          narrow_transition = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.metric_style_levels.metric_style, null) == "narrow_transition" ? true : null
          transition        = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.metric_style_levels.metric_style, null) == "transition" ? true : null
          wide              = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.metric_style_levels.metric_style, null) == "wide" ? true : null
          wide_transition   = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.metric_style_levels.metric_style, null) == "wide_transition" ? true : null
          }
        ]
        propagate_levels = try(length(isis_process.address_family.ipv4_multicast.propagate_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_multicast.propagate_levels : {
          source_level      = try(level.source_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.propagate_levels.source_level, null)
          destination_level = try(level.destination_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.propagate_levels.destination_level, null)
          route_policy      = try(level.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.propagate_levels.route_policy, null)
          }
        ]
        redistribute_bgp = try(length(isis_process.address_family.ipv4_multicast.redistribute_bgp) == 0, true) ? null : [for redis in isis_process.address_family.ipv4_multicast.redistribute_bgp : {
          as_number    = try(redis.as_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_bgp.as_number, null)
          level        = try(redis.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_bgp.level, null)
          metric       = try(redis.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_bgp.metric, null)
          metric_type  = try(redis.metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_bgp.metric_type, null)
          route_policy = try(redis.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_bgp.route_policy, null)
          }
        ]
        redistribute_isis = try(length(isis_process.address_family.ipv4_multicast.redistribute_isis) == 0, true) ? null : [for redis in isis_process.address_family.ipv4_multicast.redistribute_isis : {
          instance_id     = try(redis.instance_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_isis.instance_id, null)
          down_flag_clear = try(redis.down_flag_clear, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_isis.down_flag_clear, null)
          level           = try(redis.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_isis.level, null)
          metric          = try(redis.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_isis.metric, null)
          metric_type     = try(redis.metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_isis.metric_type, null)
          route_policy    = try(redis.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_isis.route_policy, null)
          }
        ]
        redistribute_ospf = try(length(isis_process.address_family.ipv4_multicast.redistribute_ospf) == 0, true) ? null : [for redis in isis_process.address_family.ipv4_multicast.redistribute_ospf : {
          instance_id    = try(redis.instance_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_ospf.instance_id, null)
          match_external = try(redis.match_external, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_ospf.match_external, null)
          match_internal = try(redis.match_internal, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_ospf.match_internal, null)
          level          = try(redis.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_ospf.level, null)
          metric         = try(redis.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_ospf.metric, null)
          metric_type    = try(redis.metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_ospf.metric_type, null)
          route_policy   = try(redis.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.redistribute_ospf.route_policy, null)
          }
        ]
        spf_interval_levels = try(length(isis_process.address_family.ipv4_multicast.spf_interval_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_multicast.spf_interval_levels : {
          level_number           = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_levels.level_number, null)
          ietf                   = try(level.ietf, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_levels.ietf, null)
          ietf_holddown_interval = try(level.ietf_holddown_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_levels.ietf_holddown_interval, null)
          ietf_learn_interval    = try(level.ietf_learn_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_levels.ietf_learn_interval, null)
          ietf_long_wait         = try(level.ietf_long_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_levels.ietf_long_wait, null)
          ietf_short_wait        = try(level.ietf_short_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_levels.ietf_short_wait, null)
          initial_wait           = try(level.initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_levels.initial_wait, null)
          maximum_wait           = try(level.maximum_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_levels.maximum_wait, null)
          secondary_wait         = try(level.secondary_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_interval_levels.secondary_wait, null)
          }
        ]
        spf_prefix_priority_critical_levels = try(length(isis_process.address_family.ipv4_multicast.spf_prefix_priority_critical_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_multicast.spf_prefix_priority_critical_levels : {
          level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_prefix_priority_critical_levels.level_number, null)
          prefix_list_name = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_prefix_priority_critical_levels.prefix_list, null)
          tag              = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_prefix_priority_critical_levels.tag, null)
          }
        ]
        spf_prefix_priority_high_levels = try(length(isis_process.address_family.ipv4_multicast.spf_prefix_priority_high_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_multicast.spf_prefix_priority_high_levels : {
          level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_prefix_priority_high_levels.level_number, null)
          prefix_list_name = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_prefix_priority_high_levels.prefix_list, null)
          tag              = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_prefix_priority_high_levels.tag, null)
          }
        ]
        spf_prefix_priority_medium_levels = try(length(isis_process.address_family.ipv4_multicast.spf_prefix_priority_medium_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv4_multicast.spf_prefix_priority_medium_levels : {
          level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_prefix_priority_medium_levels.level_number, null)
          prefix_list_name = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_prefix_priority_medium_levels.prefix_list, null)
          tag              = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.spf_prefix_priority_medium_levels.tag, null)
          }
        ]
        summary_prefixes = try(length(isis_process.address_family.ipv4_multicast.summary_prefixes) == 0, true) ? null : [for sp in isis_process.address_family.ipv4_multicast.summary_prefixes : {
          address                          = try(sp.address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.summary_prefixes.address, null)
          prefix                           = try(sp.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.summary_prefixes.prefix, null)
          tag                              = try(sp.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.summary_prefixes.tag, null)
          level                            = try(sp.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.summary_prefixes.level_number, null)
          algorithm                        = try(sp.algorithm, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.summary_prefixes.algorithm, null)
          explicit                         = try(sp.explicit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.summary_prefixes.explicit, null)
          adv_unreachable                  = try(sp.adv_unreachable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.summary_prefixes.adv_unreachable, null)
          unreachable_tag                  = try(sp.unreachable_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.summary_prefixes.unreachable_tag, null)
          unreachable_tag_exclude_prefixes = try(sp.unreachable_tag_exclude_prefixes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.summary_prefixes.unreachable_tag_exclude_prefixes, null)
          partition_repair                 = try(sp.partition_repair, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv4_multicast.summary_prefixes.partition_repair, null)
          }
        ]
      }] : []
    ]
  ])
}

resource "iosxr_router_isis_address_family" "ipv4_multicast" {
  for_each                                         = { for af in local.router_isis_address_family_ipv4_multicast : af.key => af }
  device                                           = each.value.device_name
  process_id                                       = each.value.process_id
  af_name                                          = each.value.af_name
  saf_name                                         = each.value.saf_name
  advertise_link_attributes                        = each.value.advertise_link_attributes
  advertise_passive_only                           = each.value.advertise_passive_only
  default_information_originate                    = each.value.default_information_originate
  default_information_originate_route_policy       = each.value.default_information_originate_route_policy
  maximum_redistributed_prefixes                   = each.value.maximum_redistributed_prefixes
  metric_style_narrow                              = each.value.metric_style_narrow
  metric_style_narrow_transition                   = each.value.metric_style_narrow_transition
  metric_style_transition                          = each.value.metric_style_transition
  metric_style_wide                                = each.value.metric_style_wide
  metric_style_wide_transition                     = each.value.metric_style_wide_transition
  microloop_avoidance                              = each.value.microloop_avoidance
  microloop_avoidance_protected                    = each.value.microloop_avoidance_protected
  microloop_avoidance_rib_update_delay             = each.value.microloop_avoidance_rib_update_delay
  microloop_avoidance_segment_routing_route_policy = each.value.microloop_avoidance_segment_routing_route_policy
  spf_interval_ietf                                = each.value.spf_interval_ietf
  spf_interval_ietf_holddown_interval              = each.value.spf_interval_ietf_holddown_interval
  spf_interval_ietf_initial_wait                   = each.value.spf_interval_ietf_initial_wait
  spf_interval_ietf_learn_interval                 = each.value.spf_interval_ietf_learn_interval
  spf_interval_ietf_long_wait                      = each.value.spf_interval_ietf_long_wait
  spf_interval_ietf_short_wait                     = each.value.spf_interval_ietf_short_wait
  spf_interval_initial_wait                        = each.value.spf_interval_initial_wait
  spf_interval_maximum_wait                        = each.value.spf_interval_maximum_wait
  spf_interval_secondary_wait                      = each.value.spf_interval_secondary_wait
  spf_prefix_priority_critical_prefix_list_name    = each.value.spf_prefix_priority_critical_prefix_list_name
  spf_prefix_priority_critical_tag                 = each.value.spf_prefix_priority_critical_tag
  spf_prefix_priority_high_prefix_list_name        = each.value.spf_prefix_priority_high_prefix_list_name
  spf_prefix_priority_high_tag                     = each.value.spf_prefix_priority_high_tag
  spf_prefix_priority_medium_prefix_list_name      = each.value.spf_prefix_priority_medium_prefix_list_name
  spf_prefix_priority_medium_tag                   = each.value.spf_prefix_priority_medium_tag
  adjacency_check_disable                          = each.value.adjacency_check_disable
  attached_bit_receive_ignore                      = each.value.attached_bit_receive_ignore
  attached_bit_send                                = each.value.attached_bit_send
  distance                                         = each.value.distance
  distribute_list_prefix_list_in                   = each.value.distribute_list_prefix_list_in
  distribute_list_route_policy_in                  = each.value.distribute_list_route_policy_in
  maximum_paths                                    = each.value.maximum_paths
  metric                                           = each.value.metric
  prefix_unreachable                               = each.value.prefix_unreachable
  prefix_unreachable_adv_lifetime                  = each.value.prefix_unreachable_adv_lifetime
  prefix_unreachable_adv_maximum                   = each.value.prefix_unreachable_adv_maximum
  prefix_unreachable_adv_metric                    = each.value.prefix_unreachable_adv_metric
  prefix_unreachable_rx_process_enable             = each.value.prefix_unreachable_rx_process_enable
  redistribute_connected                           = each.value.redistribute_connected
  redistribute_connected_level                     = each.value.redistribute_connected_level
  redistribute_connected_metric                    = each.value.redistribute_connected_metric
  redistribute_connected_metric_type               = each.value.redistribute_connected_metric_type
  redistribute_connected_route_policy              = each.value.redistribute_connected_route_policy
  redistribute_static                              = each.value.redistribute_static
  redistribute_static_level                        = each.value.redistribute_static_level
  redistribute_static_metric                       = each.value.redistribute_static_metric
  redistribute_static_metric_type                  = each.value.redistribute_static_metric_type
  redistribute_static_route_policy                 = each.value.redistribute_static_route_policy
  route_source_first_hop                           = each.value.route_source_first_hop
  distance_sources                                 = each.value.distance_sources
  maximum_redistributed_prefixes_levels            = each.value.maximum_redistributed_prefixes_levels
  metric_levels                                    = each.value.metric_levels
  metric_style_levels                              = each.value.metric_style_levels
  propagate_levels                                 = each.value.propagate_levels
  redistribute_bgp                                 = each.value.redistribute_bgp
  redistribute_isis                                = each.value.redistribute_isis
  redistribute_ospf                                = each.value.redistribute_ospf
  spf_interval_levels                              = each.value.spf_interval_levels
  spf_prefix_priority_critical_levels              = each.value.spf_prefix_priority_critical_levels
  spf_prefix_priority_high_levels                  = each.value.spf_prefix_priority_high_levels
  spf_prefix_priority_medium_levels                = each.value.spf_prefix_priority_medium_levels
  summary_prefixes                                 = each.value.summary_prefixes

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_segment_routing.segment_routing,
    iosxr_segment_routing_v6.segment_routing_v6,
    #iosxr_segment_routing_mapping_server.segment_routing_mapping_server
    iosxr_router_isis.router_isis,
    iosxr_router_isis_address_family.ipv6_unicast
  ]
}

locals {
  router_isis_address_family_ipv6_multicast = flatten([
    for device in local.devices : [
      for isis_process in try(local.device_config[device.name].routing.isis_processes, []) :
      contains(keys(try(isis_process.address_family, {})), "ipv6_multicast") ? [{
        key                                              = format("%s/%s/ipv6-multicast", device.name, isis_process.id)
        device_name                                      = device.name
        process_id                                       = try(isis_process.id, local.defaults.iosxr.devices.configuration.routing.isis_processes.id, null)
        af_name                                          = "ipv6"
        saf_name                                         = "multicast"
        advertise_link_attributes                        = try(isis_process.address_family.ipv6_multicast.advertise_link_attributes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.advertise_link_attributes, null)
        advertise_passive_only                           = try(isis_process.address_family.ipv6_multicast.advertise_passive_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.advertise_passive_only, null)
        default_information_originate                    = try(isis_process.address_family.ipv6_multicast.default_information_originate, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.default_information_originate, null)
        default_information_originate_route_policy       = try(isis_process.address_family.ipv6_multicast.default_information_originate_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.default_information_originate_route_policy, null)
        maximum_redistributed_prefixes                   = try(isis_process.address_family.ipv6_multicast.maximum_redistributed_prefixes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.maximum_redistributed_prefixes, null)
        metric_style_narrow                              = try(isis_process.address_family.ipv6_multicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.metric_style, null) == "narrow" ? true : null
        metric_style_narrow_transition                   = try(isis_process.address_family.ipv6_multicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.metric_style, null) == "narrow_transition" ? true : null
        metric_style_transition                          = try(isis_process.address_family.ipv6_multicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.metric_style, null) == "transition" ? true : null
        metric_style_wide                                = try(isis_process.address_family.ipv6_multicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.metric_style, null) == "wide" ? true : null
        metric_style_wide_transition                     = try(isis_process.address_family.ipv6_multicast.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.metric_style, null) == "wide_transition" ? true : null
        microloop_avoidance                              = try(isis_process.address_family.ipv6_multicast.microloop_avoidance, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.microloop_avoidance, null)
        microloop_avoidance_protected                    = try(isis_process.address_family.ipv6_multicast.microloop_avoidance_protected, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.microloop_avoidance_protected, null)
        microloop_avoidance_rib_update_delay             = try(isis_process.address_family.ipv6_multicast.microloop_avoidance_rib_update_delay, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.microloop_avoidance_rib_update_delay, null)
        microloop_avoidance_segment_routing_route_policy = try(isis_process.address_family.ipv6_multicast.microloop_avoidance_segment_routing_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.microloop_avoidance_segment_routing_route_policy, null)
        spf_interval_ietf                                = try(isis_process.address_family.ipv6_multicast.spf_interval_ietf, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_ietf, null)
        spf_interval_ietf_holddown_interval              = try(isis_process.address_family.ipv6_multicast.spf_interval_ietf_holddown_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_ietf_holddown_interval, null)
        spf_interval_ietf_initial_wait                   = try(isis_process.address_family.ipv6_multicast.spf_interval_ietf_initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_ietf_initial_wait, null)
        spf_interval_ietf_learn_interval                 = try(isis_process.address_family.ipv6_multicast.spf_interval_ietf_learn_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_ietf_learn_interval, null)
        spf_interval_ietf_long_wait                      = try(isis_process.address_family.ipv6_multicast.spf_interval_ietf_long_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_ietf_long_wait, null)
        spf_interval_ietf_short_wait                     = try(isis_process.address_family.ipv6_multicast.spf_interval_ietf_short_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_ietf_short_wait, null)
        spf_interval_initial_wait                        = try(isis_process.address_family.ipv6_multicast.spf_interval_initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_initial_wait, null)
        spf_interval_maximum_wait                        = try(isis_process.address_family.ipv6_multicast.spf_interval_maximum_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_maximum_wait, null)
        spf_interval_secondary_wait                      = try(isis_process.address_family.ipv6_multicast.spf_interval_secondary_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_secondary_wait, null)
        spf_prefix_priority_critical_prefix_list_name    = try(isis_process.address_family.ipv6_multicast.spf_prefix_priority_critical_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_prefix_priority_critical_prefix_list, null)
        spf_prefix_priority_critical_tag                 = try(isis_process.address_family.ipv6_multicast.spf_prefix_priority_critical_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_prefix_priority_critical_tag, null)
        spf_prefix_priority_high_prefix_list_name        = try(isis_process.address_family.ipv6_multicast.spf_prefix_priority_high_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_prefix_priority_high_prefix_list, null)
        spf_prefix_priority_high_tag                     = try(isis_process.address_family.ipv6_multicast.spf_prefix_priority_high_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_prefix_priority_high_tag, null)
        spf_prefix_priority_medium_prefix_list_name      = try(isis_process.address_family.ipv6_multicast.spf_prefix_priority_medium_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_prefix_priority_medium_prefix_list, null)
        spf_prefix_priority_medium_tag                   = try(isis_process.address_family.ipv6_multicast.spf_prefix_priority_medium_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_prefix_priority_medium_tag, null)
        adjacency_check_disable                          = try(isis_process.address_family.ipv6_multicast.adjacency_check_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.adjacency_check_disable, null)
        attached_bit_receive_ignore                      = try(isis_process.address_family.ipv6_multicast.attached_bit_receive_ignore, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.attached_bit_receive_ignore, null)
        attached_bit_send                                = try(isis_process.address_family.ipv6_multicast.attached_bit_send, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.attached_bit_send, null)
        distance                                         = try(isis_process.address_family.ipv6_multicast.distance, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.distance, null)
        distribute_list_prefix_list_in                   = try(isis_process.address_family.ipv6_multicast.distribute_list_prefix_list_in, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.distribute_list_prefix_list_in, null)
        distribute_list_route_policy_in                  = try(isis_process.address_family.ipv6_multicast.distribute_list_route_policy_in, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.distribute_list_route_policy_in, null)
        maximum_paths                                    = try(isis_process.address_family.ipv6_multicast.maximum_paths, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.maximum_paths, null)
        metric                                           = try(isis_process.address_family.ipv6_multicast.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.metric, null)
        prefix_unreachable                               = try(isis_process.address_family.ipv6_multicast.prefix_unreachable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.prefix_unreachable, null)
        prefix_unreachable_adv_lifetime                  = try(isis_process.address_family.ipv6_multicast.prefix_unreachable_adv_lifetime, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.prefix_unreachable_adv_lifetime, null)
        prefix_unreachable_adv_maximum                   = try(isis_process.address_family.ipv6_multicast.prefix_unreachable_adv_maximum, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.prefix_unreachable_adv_maximum, null)
        prefix_unreachable_adv_metric                    = try(isis_process.address_family.ipv6_multicast.prefix_unreachable_adv_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.prefix_unreachable_adv_metric, null)
        prefix_unreachable_rx_process_enable             = try(isis_process.address_family.ipv6_multicast.prefix_unreachable_rx_process_enable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.prefix_unreachable_rx_process_enable, null)
        redistribute_connected                           = try(isis_process.address_family.ipv6_multicast.redistribute_connected, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_connected, null)
        redistribute_connected_level                     = try(isis_process.address_family.ipv6_multicast.redistribute_connected_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_connected_level, null)
        redistribute_connected_metric                    = try(isis_process.address_family.ipv6_multicast.redistribute_connected_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_connected_metric, null)
        redistribute_connected_metric_type               = try(isis_process.address_family.ipv6_multicast.redistribute_connected_metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_connected_metric_type, null)
        redistribute_connected_route_policy              = try(isis_process.address_family.ipv6_multicast.redistribute_connected_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_connected_route_policy, null)
        redistribute_static                              = try(isis_process.address_family.ipv6_multicast.redistribute_static, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_static, null)
        redistribute_static_level                        = try(isis_process.address_family.ipv6_multicast.redistribute_static_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_static_level, null)
        redistribute_static_metric                       = try(isis_process.address_family.ipv6_multicast.redistribute_static_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_static_metric, null)
        redistribute_static_metric_type                  = try(isis_process.address_family.ipv6_multicast.redistribute_static_metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_static_metric_type, null)
        redistribute_static_route_policy                 = try(isis_process.address_family.ipv6_multicast.redistribute_static_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_static_route_policy, null)
        route_source_first_hop                           = try(isis_process.address_family.ipv6_multicast.route_source_first_hop, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.route_source_first_hop, null)
        distance_sources = try(length(isis_process.address_family.ipv6_multicast.distance_sources) == 0, true) ? null : [for ds in isis_process.address_family.ipv6_multicast.distance_sources : {
          address      = try(ds.address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.distance_sources.address, null)
          prefix       = try(ds.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.distance_sources.prefix, null)
          distance     = try(ds.distance, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.distance_sources.distance, null)
          route_filter = try(ds.route_filter, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.distance_sources.route_filter, null)
          }
        ]
        maximum_redistributed_prefixes_levels = try(length(isis_process.address_family.ipv6_multicast.maximum_redistributed_prefixes_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_multicast.maximum_redistributed_prefixes_levels : {
          level_number                   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.maximum_redistributed_prefixes_levels.level_number, null)
          maximum_redistributed_prefixes = try(level.maximum_redistributed_prefixes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.maximum_redistributed_prefixes_levels.maximum_redistributed_prefixes, null)
          }
        ]
        metric_levels = try(length(isis_process.address_family.ipv6_multicast.metric_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_multicast.metric_levels : {
          level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.metric_levels.level_number, null)
          metric       = try(level.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.metric_levels.metric, null)
          }
        ]
        metric_style_levels = try(length(isis_process.address_family.ipv6_multicast.metric_style_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_multicast.metric_style_levels : {
          level_number      = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.metric_style_levels.level_number, null)
          narrow            = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.metric_style_levels.metric_style, null) == "narrow" ? true : null
          narrow_transition = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.metric_style_levels.metric_style, null) == "narrow_transition" ? true : null
          transition        = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.metric_style_levels.metric_style, null) == "transition" ? true : null
          wide              = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.metric_style_levels.metric_style, null) == "wide" ? true : null
          wide_transition   = try(level.metric_style, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.metric_style_levels.metric_style, null) == "wide_transition" ? true : null
          }
        ]
        propagate_levels = try(length(isis_process.address_family.ipv6_multicast.propagate_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_multicast.propagate_levels : {
          source_level      = try(level.source_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.propagate_levels.source_level, null)
          destination_level = try(level.destination_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.propagate_levels.destination_level, null)
          route_policy      = try(level.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.propagate_levels.route_policy, null)
          }
        ]
        redistribute_bgp = try(length(isis_process.address_family.ipv6_multicast.redistribute_bgp) == 0, true) ? null : [for redis in isis_process.address_family.ipv6_multicast.redistribute_bgp : {
          as_number    = try(redis.as_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_bgp.as_number, null)
          level        = try(redis.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_bgp.level, null)
          metric       = try(redis.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_bgp.metric, null)
          metric_type  = try(redis.metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_bgp.metric_type, null)
          route_policy = try(redis.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_bgp.route_policy, null)
          }
        ]
        redistribute_isis = try(length(isis_process.address_family.ipv6_multicast.redistribute_isis) == 0, true) ? null : [for redis in isis_process.address_family.ipv6_multicast.redistribute_isis : {
          instance_id     = try(redis.instance_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_isis.instance_id, null)
          down_flag_clear = try(redis.down_flag_clear, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_isis.down_flag_clear, null)
          level           = try(redis.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_isis.level, null)
          metric          = try(redis.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_isis.metric, null)
          metric_type     = try(redis.metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_isis.metric_type, null)
          route_policy    = try(redis.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_isis.route_policy, null)
          }
        ]
        redistribute_ospfv3 = try(length(isis_process.address_family.ipv6_multicast.redistribute_ospfv3) == 0, true) ? null : [for redis in isis_process.address_family.ipv6_multicast.redistribute_ospfv3 : {
          instance_id    = try(redis.instance_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_ospfv3.instance_id, null)
          match_external = try(redis.match_external, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_ospfv3.match_external, null)
          match_internal = try(redis.match_internal, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_ospfv3.match_internal, null)
          level          = try(redis.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_ospfv3.level, null)
          metric         = try(redis.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_ospfv3.metric, null)
          metric_type    = try(redis.metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_ospfv3.metric_type, null)
          route_policy   = try(redis.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.redistribute_ospfv3.route_policy, null)
          }
        ]
        segment_routing_mpls_connected_prefix_sid_map_addresses = try(length(isis_process.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_addresses) == 0, true) ? null : [for addr in isis_process.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_addresses : {
          ip_address             = try(addr.ip_address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_addresses.ip_address, null)
          prefix                 = try(addr.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_addresses.prefix, null)
          index_id               = try(addr.index_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_addresses.index_id, null)
          index_interface        = try(addr.index_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_addresses.index_interface, null)
          index_php_disable      = try(addr.index_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_addresses.index_php_disable, null)
          index_explicit_null    = try(addr.index_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_addresses.index_explicit_null, null)
          absolute_id            = try(addr.absolute_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_addresses.absolute_id, null)
          absolute_interface     = try(addr.absolute_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_addresses.absolute_interface, null)
          absolute_php_disable   = try(addr.absolute_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_addresses.absolute_php_disable, null)
          absolute_explicit_null = try(addr.absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_addresses.absolute_explicit_null, null)
          }
        ]
        segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses = try(length(isis_process.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses) == 0, true) ? null : [for addr in isis_process.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses : {
          ip_address             = try(addr.ip_address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.ip_address, null)
          prefix                 = try(addr.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.prefix, null)
          flex_algo              = try(addr.flex_algo, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.flex_algo, null)
          index_id               = try(addr.index_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.index_id, null)
          index_interface        = try(addr.index_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.index_interface, null)
          index_php_disable      = try(addr.index_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.index_php_disable, null)
          index_explicit_null    = try(addr.index_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.index_explicit_null, null)
          absolute_id            = try(addr.absolute_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.absolute_id, null)
          absolute_interface     = try(addr.absolute_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.absolute_interface, null)
          absolute_php_disable   = try(addr.absolute_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.absolute_php_disable, null)
          absolute_explicit_null = try(addr.absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_flex_algo_addresses.absolute_explicit_null, null)
          }
        ]
        segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses = try(length(isis_process.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses) == 0, true) ? null : [for addr in isis_process.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses : {
          ip_address             = try(addr.ip_address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.ip_address, null)
          prefix                 = try(addr.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.prefix, null)
          index_id               = try(addr.index_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.index_id, null)
          index_interface        = try(addr.index_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.index_interface, null)
          index_php_disable      = try(addr.index_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.index_php_disable, null)
          index_explicit_null    = try(addr.index_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.index_explicit_null, null)
          absolute_id            = try(addr.absolute_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.absolute_id, null)
          absolute_interface     = try(addr.absolute_interface, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.absolute_interface, null)
          absolute_php_disable   = try(addr.absolute_php_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.absolute_php_disable, null)
          absolute_explicit_null = try(addr.absolute_explicit_null, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_mpls_connected_prefix_sid_map_strict_spf_addresses.absolute_explicit_null, null)
          }
        ]
        segment_routing_srv6_locators = try(length(isis_process.address_family.ipv6_multicast.segment_routing_srv6_locators) == 0, true) ? null : [for locator in isis_process.address_family.ipv6_multicast.segment_routing_srv6_locators : {
          locator_name = try(locator.locator_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_srv6_locators.locator_name, null)
          level        = try(locator.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_srv6_locators.level, null)
          metric       = try(locator.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_srv6_locators.metric, null)
          tag          = try(locator.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_srv6_locators.tag, null)
          metric_levels = try(length(locator.metric_levels) == 0, true) ? null : [for ml in locator.metric_levels : {
            level_number = try(ml.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_srv6_locators.metric_levels.level_number, null)
            metric       = try(ml.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_srv6_locators.metric_levels.metric, null)
            }
          ]
          tag_levels = try(length(locator.tag_levels) == 0, true) ? null : [for tl in locator.tag_levels : {
            level_number = try(tl.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_srv6_locators.tag_levels.level_number, null)
            tag          = try(tl.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.segment_routing_srv6_locators.tag_levels.tag, null)
            }
          ]
          }
        ]
        spf_interval_levels = try(length(isis_process.address_family.ipv6_multicast.spf_interval_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_multicast.spf_interval_levels : {
          level_number           = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_levels.level_number, null)
          ietf                   = try(level.ietf, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_levels.ietf, null)
          ietf_holddown_interval = try(level.ietf_holddown_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_levels.ietf_holddown_interval, null)
          ietf_learn_interval    = try(level.ietf_learn_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_levels.ietf_learn_interval, null)
          ietf_long_wait         = try(level.ietf_long_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_levels.ietf_long_wait, null)
          ietf_short_wait        = try(level.ietf_short_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_levels.ietf_short_wait, null)
          initial_wait           = try(level.initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_levels.initial_wait, null)
          maximum_wait           = try(level.maximum_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_levels.maximum_wait, null)
          secondary_wait         = try(level.secondary_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_interval_levels.secondary_wait, null)
          }
        ]
        spf_prefix_priority_critical_levels = try(length(isis_process.address_family.ipv6_multicast.spf_prefix_priority_critical_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_multicast.spf_prefix_priority_critical_levels : {
          level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_prefix_priority_critical_levels.level_number, null)
          prefix_list_name = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_prefix_priority_critical_levels.prefix_list, null)
          tag              = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_prefix_priority_critical_levels.tag, null)
          }
        ]
        spf_prefix_priority_high_levels = try(length(isis_process.address_family.ipv6_multicast.spf_prefix_priority_high_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_multicast.spf_prefix_priority_high_levels : {
          level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_prefix_priority_high_levels.level_number, null)
          prefix_list_name = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_prefix_priority_high_levels.prefix_list, null)
          tag              = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_prefix_priority_high_levels.tag, null)
          }
        ]
        spf_prefix_priority_medium_levels = try(length(isis_process.address_family.ipv6_multicast.spf_prefix_priority_medium_levels) == 0, true) ? null : [for level in isis_process.address_family.ipv6_multicast.spf_prefix_priority_medium_levels : {
          level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_prefix_priority_medium_levels.level_number, null)
          prefix_list_name = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_prefix_priority_medium_levels.prefix_list, null)
          tag              = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.spf_prefix_priority_medium_levels.tag, null)
          }
        ]
        summary_prefixes = try(length(isis_process.address_family.ipv6_multicast.summary_prefixes) == 0, true) ? null : [for sp in isis_process.address_family.ipv6_multicast.summary_prefixes : {
          address                          = try(sp.address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.summary_prefixes.address, null)
          prefix                           = try(sp.prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.summary_prefixes.prefix, null)
          tag                              = try(sp.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.summary_prefixes.tag, null)
          level                            = try(sp.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.summary_prefixes.level_number, null)
          algorithm                        = try(sp.algorithm, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.summary_prefixes.algorithm, null)
          explicit                         = try(sp.explicit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.summary_prefixes.explicit, null)
          adv_unreachable                  = try(sp.adv_unreachable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.summary_prefixes.adv_unreachable, null)
          unreachable_tag                  = try(sp.unreachable_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.summary_prefixes.unreachable_tag, null)
          unreachable_tag_exclude_prefixes = try(sp.unreachable_tag_exclude_prefixes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.summary_prefixes.unreachable_tag_exclude_prefixes, null)
          partition_repair                 = try(sp.partition_repair, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.ipv6_multicast.summary_prefixes.partition_repair, null)
          }
        ]
      }] : []
    ]
  ])
}

resource "iosxr_router_isis_address_family" "ipv6_multicast" {
  for_each                                         = { for af in local.router_isis_address_family_ipv6_multicast : af.key => af }
  device                                           = each.value.device_name
  process_id                                       = each.value.process_id
  af_name                                          = each.value.af_name
  saf_name                                         = each.value.saf_name
  advertise_link_attributes                        = each.value.advertise_link_attributes
  advertise_passive_only                           = each.value.advertise_passive_only
  default_information_originate                    = each.value.default_information_originate
  default_information_originate_route_policy       = each.value.default_information_originate_route_policy
  maximum_redistributed_prefixes                   = each.value.maximum_redistributed_prefixes
  metric_style_narrow                              = each.value.metric_style_narrow
  metric_style_narrow_transition                   = each.value.metric_style_narrow_transition
  metric_style_transition                          = each.value.metric_style_transition
  metric_style_wide                                = each.value.metric_style_wide
  metric_style_wide_transition                     = each.value.metric_style_wide_transition
  microloop_avoidance                              = each.value.microloop_avoidance
  microloop_avoidance_protected                    = each.value.microloop_avoidance_protected
  microloop_avoidance_rib_update_delay             = each.value.microloop_avoidance_rib_update_delay
  microloop_avoidance_segment_routing_route_policy = each.value.microloop_avoidance_segment_routing_route_policy
  spf_interval_ietf                                = each.value.spf_interval_ietf
  spf_interval_ietf_holddown_interval              = each.value.spf_interval_ietf_holddown_interval
  spf_interval_ietf_initial_wait                   = each.value.spf_interval_ietf_initial_wait
  spf_interval_ietf_learn_interval                 = each.value.spf_interval_ietf_learn_interval
  spf_interval_ietf_long_wait                      = each.value.spf_interval_ietf_long_wait
  spf_interval_ietf_short_wait                     = each.value.spf_interval_ietf_short_wait
  spf_interval_initial_wait                        = each.value.spf_interval_initial_wait
  spf_interval_maximum_wait                        = each.value.spf_interval_maximum_wait
  spf_interval_secondary_wait                      = each.value.spf_interval_secondary_wait
  spf_prefix_priority_critical_prefix_list_name    = each.value.spf_prefix_priority_critical_prefix_list_name
  spf_prefix_priority_critical_tag                 = each.value.spf_prefix_priority_critical_tag
  spf_prefix_priority_high_prefix_list_name        = each.value.spf_prefix_priority_high_prefix_list_name
  spf_prefix_priority_high_tag                     = each.value.spf_prefix_priority_high_tag
  spf_prefix_priority_medium_prefix_list_name      = each.value.spf_prefix_priority_medium_prefix_list_name
  spf_prefix_priority_medium_tag                   = each.value.spf_prefix_priority_medium_tag
  adjacency_check_disable                          = each.value.adjacency_check_disable
  attached_bit_receive_ignore                      = each.value.attached_bit_receive_ignore
  attached_bit_send                                = each.value.attached_bit_send
  distance                                         = each.value.distance
  distribute_list_prefix_list_in                   = each.value.distribute_list_prefix_list_in
  distribute_list_route_policy_in                  = each.value.distribute_list_route_policy_in
  maximum_paths                                    = each.value.maximum_paths
  metric                                           = each.value.metric
  prefix_unreachable                               = each.value.prefix_unreachable
  prefix_unreachable_adv_lifetime                  = each.value.prefix_unreachable_adv_lifetime
  prefix_unreachable_adv_maximum                   = each.value.prefix_unreachable_adv_maximum
  prefix_unreachable_adv_metric                    = each.value.prefix_unreachable_adv_metric
  prefix_unreachable_rx_process_enable             = each.value.prefix_unreachable_rx_process_enable
  redistribute_connected                           = each.value.redistribute_connected
  redistribute_connected_level                     = each.value.redistribute_connected_level
  redistribute_connected_metric                    = each.value.redistribute_connected_metric
  redistribute_connected_metric_type               = each.value.redistribute_connected_metric_type
  redistribute_connected_route_policy              = each.value.redistribute_connected_route_policy
  redistribute_static                              = each.value.redistribute_static
  redistribute_static_level                        = each.value.redistribute_static_level
  redistribute_static_metric                       = each.value.redistribute_static_metric
  redistribute_static_metric_type                  = each.value.redistribute_static_metric_type
  redistribute_static_route_policy                 = each.value.redistribute_static_route_policy
  route_source_first_hop                           = each.value.route_source_first_hop
  distance_sources                                 = each.value.distance_sources
  maximum_redistributed_prefixes_levels            = each.value.maximum_redistributed_prefixes_levels
  metric_levels                                    = each.value.metric_levels
  metric_style_levels                              = each.value.metric_style_levels
  propagate_levels                                 = each.value.propagate_levels
  redistribute_bgp                                 = each.value.redistribute_bgp
  redistribute_isis                                = each.value.redistribute_isis
  redistribute_ospfv3                              = each.value.redistribute_ospfv3
  spf_interval_levels                              = each.value.spf_interval_levels
  spf_prefix_priority_critical_levels              = each.value.spf_prefix_priority_critical_levels
  spf_prefix_priority_high_levels                  = each.value.spf_prefix_priority_high_levels
  spf_prefix_priority_medium_levels                = each.value.spf_prefix_priority_medium_levels
  summary_prefixes                                 = each.value.summary_prefixes

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_segment_routing.segment_routing,
    iosxr_segment_routing_v6.segment_routing_v6,
    #iosxr_segment_routing_mapping_server.segment_routing_mapping_server
    iosxr_router_isis.router_isis,
    iosxr_router_isis_address_family.ipv4_multicast
  ]
}

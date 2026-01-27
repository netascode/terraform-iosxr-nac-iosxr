locals {
  router_ospf = flatten([
    for device in local.devices : [
      for ospf_process in try(local.device_config[device.name].routing.ospf_processes, []) : {
        key                                               = format("%s/%s", device.name, ospf_process.id)
        device_name                                       = device.name
        process_name                                      = try(ospf_process.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.id, null)
        mpls_traffic_eng_router_id_ipv4_address           = try(ospf_process.mpls_traffic_eng_router_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.mpls_traffic_eng_router_id, null)
        mpls_traffic_eng_router_id_interface_name         = try(ospf_process.mpls_traffic_eng_router_id_interface, local.defaults.iosxr.devices.configuration.routing.ospf_processes.mpls_traffic_eng_router_id_interface, null)
        mpls_traffic_eng_multicast_intact                 = try(ospf_process.mpls_traffic_eng_multicast_intact, local.defaults.iosxr.devices.configuration.routing.ospf_processes.mpls_traffic_eng_multicast_intact, null)
        mpls_traffic_eng_autoroute_exclude_route_policy   = try(ospf_process.mpls_traffic_eng_autoroute_exclude_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.mpls_traffic_eng_autoroute_exclude_route_policy, null)
        mpls_traffic_eng_igp_intact                       = try(ospf_process.mpls_traffic_eng_igp_intact, local.defaults.iosxr.devices.configuration.routing.ospf_processes.mpls_traffic_eng_igp_intact, null)
        mpls_traffic_eng_ldp_sync_update                  = try(ospf_process.mpls_traffic_eng_ldp_sync_update, local.defaults.iosxr.devices.configuration.routing.ospf_processes.mpls_traffic_eng_ldp_sync_update, null)
        mpls_ldp_sync                                     = try(ospf_process.mpls_ldp_sync, local.defaults.iosxr.devices.configuration.routing.ospf_processes.mpls_ldp_sync, null)
        mpls_ldp_sync_igp_shortcuts                       = try(ospf_process.mpls_ldp_sync_igp_shortcuts, local.defaults.iosxr.devices.configuration.routing.ospf_processes.mpls_ldp_sync_igp_shortcuts, null)
        mpls_ldp_auto_config                              = try(ospf_process.mpls_ldp_auto_config, local.defaults.iosxr.devices.configuration.routing.ospf_processes.mpls_ldp_auto_config, null)
        cost                                              = try(ospf_process.cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.cost, null)
        cost_fallback_anomaly_delay_igp_metric_increment  = try(ospf_process.cost_fallback_anomaly_delay_igp_metric_increment, local.defaults.iosxr.devices.configuration.routing.ospf_processes.cost_fallback_anomaly_delay_igp_metric_increment, null)
        cost_fallback_anomaly_delay_igp_metric_multiplier = try(ospf_process.cost_fallback_anomaly_delay_igp_metric_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.cost_fallback_anomaly_delay_igp_metric_multiplier, null)
        cost_fallback_anomaly_delay_igp_metric_value      = try(ospf_process.cost_fallback_anomaly_delay_igp_metric_value, local.defaults.iosxr.devices.configuration.routing.ospf_processes.cost_fallback_anomaly_delay_igp_metric_value, null)
        cost_fallback_anomaly_delay_te_metric_increment   = try(ospf_process.cost_fallback_anomaly_delay_te_metric_increment, local.defaults.iosxr.devices.configuration.routing.ospf_processes.cost_fallback_anomaly_delay_te_metric_increment, null)
        cost_fallback_anomaly_delay_te_metric_multiplier  = try(ospf_process.cost_fallback_anomaly_delay_te_metric_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.cost_fallback_anomaly_delay_te_metric_multiplier, null)
        cost_fallback_anomaly_delay_te_metric_value       = try(ospf_process.cost_fallback_anomaly_delay_te_metric_value, local.defaults.iosxr.devices.configuration.routing.ospf_processes.cost_fallback_anomaly_delay_te_metric_value, null)
        hello_interval                                    = try(ospf_process.hello_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.hello_interval, null)
        dead_interval                                     = try(ospf_process.dead_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.dead_interval, null)
        priority                                          = try(ospf_process.priority, local.defaults.iosxr.devices.configuration.routing.ospf_processes.priority, null)
        retransmit_interval                               = try(ospf_process.retransmit_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.retransmit_interval, null)
        transmit_delay                                    = try(ospf_process.transmit_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.transmit_delay, null)
        flood_reduction_enable                            = try(ospf_process.flood_reduction_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.flood_reduction_enable, null)
        flood_reduction_disable                           = try(ospf_process.flood_reduction_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.flood_reduction_disable, null)
        demand_circuit_enable                             = try(ospf_process.demand_circuit_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.demand_circuit_enable, null)
        demand_circuit_disable                            = try(ospf_process.demand_circuit_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.demand_circuit_disable, null)
        mtu_ignore_enable                                 = try(ospf_process.mtu_ignore_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.mtu_ignore_enable, null)
        mtu_ignore_disable                                = try(ospf_process.mtu_ignore_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.mtu_ignore_disable, null)
        database_filter_all_out_enable                    = try(ospf_process.database_filter_all_out_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.database_filter_all_out_enable, null)
        database_filter_all_out_disable                   = try(ospf_process.database_filter_all_out_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.database_filter_all_out_disable, null)
        passive_enable                                    = try(ospf_process.passive_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.passive_enable, null)
        passive_disable                                   = try(ospf_process.passive_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.passive_disable, null)
        log_adjacency_changes_detail                      = try(ospf_process.log_adjacency_changes, local.defaults.iosxr.devices.configuration.routing.ospf_processes.log_adjacency_changes, null) == "detail" ? true : null
        log_adjacency_changes_disable                     = try(ospf_process.log_adjacency_changes, local.defaults.iosxr.devices.configuration.routing.ospf_processes.log_adjacency_changes, null) == "disable" ? true : null
        router_id                                         = try(ospf_process.router_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.router_id, null)
        redistribute_connected                            = try(ospf_process.redistribute_connected, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_connected, null)
        redistribute_connected_tag                        = try(ospf_process.redistribute_connected_tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_connected_tag, null)
        redistribute_connected_metric_type                = try(ospf_process.redistribute_connected_metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_connected_metric_type, null)
        redistribute_connected_route_policy               = try(ospf_process.redistribute_connected_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_connected_route_policy, null)
        redistribute_connected_metric                     = try(ospf_process.redistribute_connected_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_connected_metric, null)
        redistribute_connected_metric_use_rib_metric      = try(ospf_process.redistribute_connected_metric_use_rib_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_connected_metric_use_rib_metric, null)
        redistribute_connected_lsa_type_summary           = try(ospf_process.redistribute_connected_lsa_type_summary, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_connected_lsa_type_summary, null)
        redistribute_connected_nssa_only                  = try(ospf_process.redistribute_connected_nssa_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_connected_nssa_only, null)
        redistribute_static                               = try(ospf_process.redistribute_static, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_static, null)
        redistribute_static_tag                           = try(ospf_process.redistribute_static_tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_static_tag, null)
        redistribute_static_metric_type                   = try(ospf_process.redistribute_static_metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_static_metric_type, null)
        redistribute_static_route_policy                  = try(ospf_process.redistribute_static_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_static_route_policy, null)
        redistribute_static_metric                        = try(ospf_process.redistribute_static_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_static_metric, null)
        redistribute_static_metric_use_rib_metric         = try(ospf_process.redistribute_static_metric_use_rib_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_static_metric_use_rib_metric, null)
        redistribute_static_lsa_type_summary              = try(ospf_process.redistribute_static_lsa_type_summary, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_static_lsa_type_summary, null)
        redistribute_static_nssa_only                     = try(ospf_process.redistribute_static_nssa_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_static_nssa_only, null)
        redistribute_bgp = try(length(ospf_process.redistribute_bgp) == 0, true) ? null : [for bgp in ospf_process.redistribute_bgp : {
          as_number             = try(bgp.as_number, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_bgp.as_number, null)
          tag                   = try(bgp.tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_bgp.tag, null)
          metric_type           = try(bgp.metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_bgp.metric_type, null)
          route_policy          = try(bgp.route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_bgp.route_policy, null)
          preserve_med          = try(bgp.preserve_med, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_bgp.preserve_med, null)
          metric                = try(bgp.metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_bgp.metric, null)
          metric_use_rib_metric = try(bgp.metric_use_rib_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_bgp.metric_use_rib_metric, null)
          lsa_type_summary      = try(bgp.lsa_type_summary, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_bgp.lsa_type_summary, null)
          nssa_only             = try(bgp.nssa_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_bgp.nssa_only, null)
        }]
        redistribute_isis = try(length(ospf_process.redistribute_isis) == 0, true) ? null : [for isis in ospf_process.redistribute_isis : {
          instance_name         = try(isis.instance_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_isis.instance_id, null)
          level_1               = try(isis.level_1, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_isis.level_1, null)
          level_2               = try(isis.level_2, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_isis.level_2, null)
          level_1_2             = try(isis.level_1_2, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_isis.level_1_2, null)
          tag                   = try(isis.tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_isis.tag, null)
          metric_type           = try(isis.metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_isis.metric_type, null)
          route_policy          = try(isis.route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_isis.route_policy, null)
          metric                = try(isis.metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_isis.metric, null)
          metric_use_rib_metric = try(isis.metric_use_rib_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_isis.metric_use_rib_metric, null)
          lsa_type_summary      = try(isis.lsa_type_summary, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_isis.lsa_type_summary, null)
          nssa_only             = try(isis.nssa_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_isis.nssa_only, null)
        }]
        redistribute_ospf = try(length(ospf_process.redistribute_ospf) == 0, true) ? null : [for ospf in ospf_process.redistribute_ospf : {
          instance_name           = try(ospf.instance_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_ospf.instance_id, null)
          tag                     = try(ospf.tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_ospf.tag, null)
          metric_type             = try(ospf.metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_ospf.metric_type, null)
          route_policy            = try(ospf.route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_ospf.route_policy, null)
          match_internal          = try(ospf.match_internal, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_ospf.match_internal, null)
          match_external          = try(ospf.match_external, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_ospf.match_external, null)
          match_external_one      = try(ospf.match_external_one, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_ospf.match_external_one, null)
          match_external_two      = try(ospf.match_external_two, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_ospf.match_external_two, null)
          match_nssa_external     = try(ospf.match_nssa_external, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_ospf.match_nssa_external, null)
          match_nssa_external_one = try(ospf.match_nssa_external_one, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_ospf.match_nssa_external_one, null)
          match_nssa_external_two = try(ospf.match_nssa_external_two, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_ospf.match_nssa_external_two, null)
          metric                  = try(ospf.metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_ospf.metric, null)
          metric_use_rib_metric   = try(ospf.metric_use_rib_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_ospf.metric_use_rib_metric, null)
          lsa_type_summary        = try(ospf.lsa_type_summary, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_ospf.lsa_type_summary, null)
          nssa_only               = try(ospf.nssa_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.redistribute_ospf.nssa_only, null)
        }]
        distribute_list_in_acl                     = try(ospf_process.distribute_list_in_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distribute_list_in_acl, null)
        distribute_list_in_route_policy            = try(ospf_process.distribute_list_in_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distribute_list_in_route_policy, null)
        distribute_list_out_acl                    = try(ospf_process.distribute_list_out_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distribute_list_out_acl, null)
        distribute_list_out_connected_acl          = try(ospf_process.distribute_list_out_connected_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distribute_list_out_connected_acl, null)
        distribute_list_out_static_acl             = try(ospf_process.distribute_list_out_static_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distribute_list_out_static_acl, null)
        distribute_list_out_bgp_as                 = try(ospf_process.distribute_list_out_bgp_as, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distribute_list_out_bgp_as, null)
        distribute_list_out_bgp_acl                = try(ospf_process.distribute_list_out_bgp_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distribute_list_out_bgp_acl, null)
        distribute_list_out_ospf_instance_id       = try(ospf_process.distribute_list_out_ospf_instance_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distribute_list_out_ospf_instance_id, null)
        distribute_list_out_ospf_acl               = try(ospf_process.distribute_list_out_ospf_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distribute_list_out_ospf_acl, null)
        packet_size                                = try(ospf_process.packet_size, local.defaults.iosxr.devices.configuration.routing.ospf_processes.packet_size, null)
        bfd_fast_detect                            = try(ospf_process.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.bfd_fast_detect, null) == "enable" ? true : null
        bfd_fast_detect_strict_mode                = try(ospf_process.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.bfd_fast_detect, null) == "strict_mode" ? true : null
        bfd_minimum_interval                       = try(ospf_process.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.bfd_minimum_interval, null)
        bfd_multiplier                             = try(ospf_process.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.bfd_multiplier, null)
        security_ttl                               = try(ospf_process.security_ttl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.security_ttl, null)
        security_ttl_hops                          = try(ospf_process.security_ttl_hops, local.defaults.iosxr.devices.configuration.routing.ospf_processes.security_ttl_hops, null)
        prefix_suppression                         = try(ospf_process.prefix_suppression, local.defaults.iosxr.devices.configuration.routing.ospf_processes.prefix_suppression, null)
        default_information_originate              = try(ospf_process.default_information_originate, local.defaults.iosxr.devices.configuration.routing.ospf_processes.default_information_originate, null)
        default_information_originate_always       = try(ospf_process.default_information_originate_always, local.defaults.iosxr.devices.configuration.routing.ospf_processes.default_information_originate_always, null)
        default_information_originate_metric       = try(ospf_process.default_information_originate_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.default_information_originate_metric, null)
        default_information_originate_metric_type  = try(ospf_process.default_information_originate_metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.default_information_originate_metric_type, null)
        default_information_originate_route_policy = try(ospf_process.default_information_originate_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.default_information_originate_route_policy, null)
        default_metric                             = try(ospf_process.default_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.default_metric, null)
        distance_sources = try(length(ospf_process.distance_sources) == 0, true) ? null : [for src in ospf_process.distance_sources : {
          address  = try(src.address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distance_sources.address, null)
          wildcard = try(src.wildcard, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distance_sources.wildcard, null)
          distance = try(src.distance, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distance_sources.distance, null)
          acl      = try(src.acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distance_sources.acl, null)
        }]
        distance_ospf_intra_area                                  = try(ospf_process.distance_ospf_intra_area, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distance_ospf_intra_area, null)
        distance_ospf_inter_area                                  = try(ospf_process.distance_ospf_inter_area, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distance_ospf_inter_area, null)
        distance_ospf_external                                    = try(ospf_process.distance_ospf_external, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distance_ospf_external, null)
        auto_cost_reference_bandwidth                             = try(ospf_process.auto_cost_reference_bandwidth, local.defaults.iosxr.devices.configuration.routing.ospf_processes.auto_cost_reference_bandwidth, null)
        auto_cost_disable                                         = try(ospf_process.auto_cost_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.auto_cost_disable, null)
        ignore_lsa_mospf                                          = try(ospf_process.ignore_lsa_mospf, local.defaults.iosxr.devices.configuration.routing.ospf_processes.ignore_lsa_mospf, null)
        capability_opaque_disable                                 = try(ospf_process.capability_opaque_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.capability_opaque_disable, null)
        capability_lls_disable                                    = try(ospf_process.capability_lls_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.capability_lls_disable, null)
        capability_type7_prefer                                   = try(ospf_process.capability_type7_prefer, local.defaults.iosxr.devices.configuration.routing.ospf_processes.capability_type7_prefer, null)
        max_metric_router_lsa                                     = try(ospf_process.max_metric.router_lsa.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.enable, null)
        max_metric_router_lsa_include_stub                        = try(ospf_process.max_metric.router_lsa.include_stub, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.include_stub, null)
        max_metric_router_lsa_summary_lsa                         = try(ospf_process.max_metric.router_lsa.summary_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.summary_lsa, null)
        max_metric_router_lsa_summary_lsa_metric                  = try(ospf_process.max_metric.router_lsa.summary_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.summary_lsa_metric, null)
        max_metric_router_lsa_external_lsa                        = try(ospf_process.max_metric.router_lsa.external_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.external_lsa, null)
        max_metric_router_lsa_external_lsa_metric                 = try(ospf_process.max_metric.router_lsa.external_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.external_lsa_metric, null)
        max_metric_router_lsa_on_startup_time                     = try(ospf_process.max_metric.router_lsa.on_startup.time, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_startup.time, null)
        max_metric_router_lsa_on_startup_wait_for_bgp             = try(ospf_process.max_metric.router_lsa.on_startup.wait_for_bgp, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_startup.wait_for_bgp, null)
        max_metric_router_lsa_on_startup_include_stub             = try(ospf_process.max_metric.router_lsa.on_startup.include_stub, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_startup.include_stub, null)
        max_metric_router_lsa_on_startup_summary_lsa              = try(ospf_process.max_metric.router_lsa.on_startup.summary_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_startup.summary_lsa, null)
        max_metric_router_lsa_on_startup_summary_lsa_metric       = try(ospf_process.max_metric.router_lsa.on_startup.summary_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_startup.summary_lsa_metric, null)
        max_metric_router_lsa_on_startup_external_lsa             = try(ospf_process.max_metric.router_lsa.on_startup.external_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_startup.external_lsa, null)
        max_metric_router_lsa_on_startup_external_lsa_metric      = try(ospf_process.max_metric.router_lsa.on_startup.external_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_startup.external_lsa_metric, null)
        max_metric_router_lsa_on_switchover_time                  = try(ospf_process.max_metric.router_lsa.on_switchover.time, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_switchover.time, null)
        max_metric_router_lsa_on_switchover_wait_for_bgp          = try(ospf_process.max_metric.router_lsa.on_switchover.wait_for_bgp, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_switchover.wait_for_bgp, null)
        max_metric_router_lsa_on_switchover_include_stub          = try(ospf_process.max_metric.router_lsa.on_switchover.include_stub, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_switchover.include_stub, null)
        max_metric_router_lsa_on_switchover_summary_lsa           = try(ospf_process.max_metric.router_lsa.on_switchover.summary_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_switchover.summary_lsa, null)
        max_metric_router_lsa_on_switchover_summary_lsa_metric    = try(ospf_process.max_metric.router_lsa.on_switchover.summary_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_switchover.summary_lsa_metric, null)
        max_metric_router_lsa_on_switchover_external_lsa          = try(ospf_process.max_metric.router_lsa.on_switchover.external_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_switchover.external_lsa, null)
        max_metric_router_lsa_on_switchover_external_lsa_metric   = try(ospf_process.max_metric.router_lsa.on_switchover.external_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_switchover.external_lsa_metric, null)
        max_metric_router_lsa_on_proc_restart_time                = try(ospf_process.max_metric.router_lsa.on_proc_restart.time, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_proc_restart.time, null)
        max_metric_router_lsa_on_proc_restart_wait_for_bgp        = try(ospf_process.max_metric.router_lsa.on_proc_restart.wait_for_bgp, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_proc_restart.wait_for_bgp, null)
        max_metric_router_lsa_on_proc_restart_include_stub        = try(ospf_process.max_metric.router_lsa.on_proc_restart.include_stub, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_proc_restart.include_stub, null)
        max_metric_router_lsa_on_proc_restart_summary_lsa         = try(ospf_process.max_metric.router_lsa.on_proc_restart.summary_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_proc_restart.summary_lsa, null)
        max_metric_router_lsa_on_proc_restart_summary_lsa_metric  = try(ospf_process.max_metric.router_lsa.on_proc_restart.summary_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_proc_restart.summary_lsa_metric, null)
        max_metric_router_lsa_on_proc_restart_external_lsa        = try(ospf_process.max_metric.router_lsa.on_proc_restart.external_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_proc_restart.external_lsa, null)
        max_metric_router_lsa_on_proc_restart_external_lsa_metric = try(ospf_process.max_metric.router_lsa.on_proc_restart.external_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_metric.router_lsa.on_proc_restart.external_lsa_metric, null)
        max_lsa                                                   = try(ospf_process.max_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_lsa, null)
        max_lsa_threshold                                         = try(ospf_process.max_lsa_threshold, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_lsa_threshold, null)
        max_lsa_warning_only                                      = try(ospf_process.max_lsa_warning_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_lsa_warning_only, null)
        max_lsa_ignore_time                                       = try(ospf_process.max_lsa_ignore_time, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_lsa_ignore_time, null)
        max_lsa_ignore_count                                      = try(ospf_process.max_lsa_ignore_count, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_lsa_ignore_count, null)
        max_lsa_reset_time                                        = try(ospf_process.max_lsa_reset_time, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_lsa_reset_time, null)
        timers_throttle_spf_initial_delay                         = try(ospf_process.timers_throttle_spf_initial_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.timers_throttle_spf_initial_delay, null)
        timers_throttle_spf_second_delay                          = try(ospf_process.timers_throttle_spf_second_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.timers_throttle_spf_second_delay, null)
        timers_throttle_spf_maximum_delay                         = try(ospf_process.timers_throttle_spf_maximum_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.timers_throttle_spf_maximum_delay, null)
        timers_throttle_lsa_all_initial_delay                     = try(ospf_process.timers_throttle_lsa_all_initial_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.timers_throttle_lsa_all_initial_delay, null)
        timers_throttle_lsa_all_minimum_delay                     = try(ospf_process.timers_throttle_lsa_all_minimum_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.timers_throttle_lsa_all_minimum_delay, null)
        timers_throttle_lsa_all_maximum_delay                     = try(ospf_process.timers_throttle_lsa_all_maximum_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.timers_throttle_lsa_all_maximum_delay, null)
        timers_throttle_fast_reroute                              = try(ospf_process.timers_throttle_fast_reroute, local.defaults.iosxr.devices.configuration.routing.ospf_processes.timers_throttle_fast_reroute, null)
        timers_lsa_group_pacing                                   = try(ospf_process.timers_lsa_group_pacing, local.defaults.iosxr.devices.configuration.routing.ospf_processes.timers_lsa_group_pacing, null)
        timers_lsa_min_arrival                                    = try(ospf_process.timers_lsa_min_arrival, local.defaults.iosxr.devices.configuration.routing.ospf_processes.timers_lsa_min_arrival, null)
        timers_lsa_refresh                                        = try(ospf_process.timers_lsa_refresh, local.defaults.iosxr.devices.configuration.routing.ospf_processes.timers_lsa_refresh, null)
        timers_pacing_flood                                       = try(ospf_process.timers_pacing_flood, local.defaults.iosxr.devices.configuration.routing.ospf_processes.timers_pacing_flood, null)
        timers_graceful_shutdown_initial_delay                    = try(ospf_process.timers_graceful_shutdown_initial_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.timers_graceful_shutdown_initial_delay, null)
        timers_graceful_shutdown_retain_routes                    = try(ospf_process.timers_graceful_shutdown_retain_routes, local.defaults.iosxr.devices.configuration.routing.ospf_processes.timers_graceful_shutdown_retain_routes, null)
        nsf_interval                                              = try(ospf_process.nsf_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.nsf_interval, null)
        nsf_lifetime                                              = try(ospf_process.nsf_lifetime, local.defaults.iosxr.devices.configuration.routing.ospf_processes.nsf_lifetime, null)
        nsf_flush_delay_time                                      = try(ospf_process.nsf_flush_delay_time, local.defaults.iosxr.devices.configuration.routing.ospf_processes.nsf_flush_delay_time, null)
        nsf_cisco                                                 = try(ospf_process.nsf_cisco, local.defaults.iosxr.devices.configuration.routing.ospf_processes.nsf_cisco, null)
        nsf_cisco_enforce_global                                  = try(ospf_process.nsf_cisco_enforce_global, local.defaults.iosxr.devices.configuration.routing.ospf_processes.nsf_cisco_enforce_global, null)
        nsf_ietf                                                  = try(ospf_process.nsf_ietf, local.defaults.iosxr.devices.configuration.routing.ospf_processes.nsf_ietf, null)
        nsf_ietf_strict_lsa_checking                              = try(ospf_process.nsf_ietf_strict_lsa_checking, local.defaults.iosxr.devices.configuration.routing.ospf_processes.nsf_ietf_strict_lsa_checking, null)
        nsf_ietf_helper_disable                                   = try(ospf_process.nsf_ietf_helper_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.nsf_ietf_helper_disable, null)
        address_family_ipv4_unicast                               = try(ospf_process.address_family_ipv4_unicast, local.defaults.iosxr.devices.configuration.routing.ospf_processes.address_family_ipv4_unicast, null)
        maximum_interfaces                                        = try(ospf_process.maximum_interfaces, local.defaults.iosxr.devices.configuration.routing.ospf_processes.maximum_interfaces, null)
        maximum_paths                                             = try(ospf_process.maximum_paths, local.defaults.iosxr.devices.configuration.routing.ospf_processes.maximum_paths, null)
        maximum_redistributed_prefixes                            = try(ospf_process.maximum_redistributed_prefixes, local.defaults.iosxr.devices.configuration.routing.ospf_processes.maximum_redistributed_prefixes, null)
        maximum_redistributed_prefixes_threshold                  = try(ospf_process.maximum_redistributed_prefixes_threshold, local.defaults.iosxr.devices.configuration.routing.ospf_processes.maximum_redistributed_prefixes_threshold, null)
        maximum_redistributed_prefixes_warning_only               = try(ospf_process.maximum_redistributed_prefixes_warning_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.maximum_redistributed_prefixes_warning_only, null)
        queue_limit_high                                          = try(ospf_process.queue_limit_high, local.defaults.iosxr.devices.configuration.routing.ospf_processes.queue_limit_high, null)
        queue_limit_medium                                        = try(ospf_process.queue_limit_medium, local.defaults.iosxr.devices.configuration.routing.ospf_processes.queue_limit_medium, null)
        queue_limit_low                                           = try(ospf_process.queue_limit_low, local.defaults.iosxr.devices.configuration.routing.ospf_processes.queue_limit_low, null)
        queue_dispatch_incoming                                   = try(ospf_process.queue_dispatch_incoming, local.defaults.iosxr.devices.configuration.routing.ospf_processes.queue_dispatch_incoming, null)
        queue_dispatch_rate_limited_lsa                           = try(ospf_process.queue_dispatch_rate_limited_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.queue_dispatch_rate_limited_lsa, null)
        queue_dispatch_flush_lsa                                  = try(ospf_process.queue_dispatch_flush_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.queue_dispatch_flush_lsa, null)
        queue_dispatch_spf_lsa_limit                              = try(ospf_process.queue_dispatch_spf_lsa_limit, local.defaults.iosxr.devices.configuration.routing.ospf_processes.queue_dispatch_spf_lsa_limit, null)
        summary_prefixes = try(length(ospf_process.summary_prefixes) == 0, true) ? null : [for prefix in ospf_process.summary_prefixes : {
          address       = try(prefix.address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.summary_prefixes.address, null)
          mask          = try(prefix.mask, local.defaults.iosxr.devices.configuration.routing.ospf_processes.summary_prefixes.mask, null)
          not_advertise = try(prefix.not_advertise, local.defaults.iosxr.devices.configuration.routing.ospf_processes.summary_prefixes.not_advertise, null)
          tag           = try(prefix.tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.summary_prefixes.tag, null)
        }]
        spf_prefix_priority_route_policy                                = try(ospf_process.spf_prefix_priority_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.spf_prefix_priority_route_policy, null)
        fast_reroute_per_prefix                                         = try(ospf_process.fast_reroute_per_prefix.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.enable, null)
        fast_reroute_per_prefix_priority_limit_critical                 = try(ospf_process.fast_reroute_per_prefix.priority_limit_critical, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.priority_limit_critical, null)
        fast_reroute_per_prefix_priority_limit_high                     = try(ospf_process.fast_reroute_per_prefix.priority_limit_high, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.priority_limit_high, null)
        fast_reroute_per_prefix_priority_limit_medium                   = try(ospf_process.fast_reroute_per_prefix.priority_limit_medium, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.priority_limit_medium, null)
        fast_reroute_per_prefix_tiebreaker_downstream_index             = try(ospf_process.fast_reroute_per_prefix.tiebreaker.downstream_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.downstream_index, null)
        fast_reroute_per_prefix_tiebreaker_downstream_disable           = try(ospf_process.fast_reroute_per_prefix.tiebreaker.downstream_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.downstream_disable, null)
        fast_reroute_per_prefix_tiebreaker_lc_disjoint_index            = try(ospf_process.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, null)
        fast_reroute_per_prefix_tiebreaker_lc_disjoint_disable          = try(ospf_process.fast_reroute_per_prefix.tiebreaker.lc_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.lc_disjoint_disable, null)
        fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index   = try(ospf_process.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, null)
        fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_disable = try(ospf_process.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_disable, null)
        fast_reroute_per_prefix_tiebreaker_node_protecting_index        = try(ospf_process.fast_reroute_per_prefix.tiebreaker.node_protecting_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.node_protecting_index, null)
        fast_reroute_per_prefix_tiebreaker_node_protecting_disable      = try(ospf_process.fast_reroute_per_prefix.tiebreaker.node_protecting_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.node_protecting_disable, null)
        fast_reroute_per_prefix_tiebreaker_primary_path_index           = try(ospf_process.fast_reroute_per_prefix.tiebreaker.primary_path_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.primary_path_index, null)
        fast_reroute_per_prefix_tiebreaker_primary_path_disable         = try(ospf_process.fast_reroute_per_prefix.tiebreaker.primary_path_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.primary_path_disable, null)
        fast_reroute_per_prefix_tiebreaker_secondary_path_index         = try(ospf_process.fast_reroute_per_prefix.tiebreaker.secondary_path_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.secondary_path_index, null)
        fast_reroute_per_prefix_tiebreaker_secondary_path_disable       = try(ospf_process.fast_reroute_per_prefix.tiebreaker.secondary_path_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.secondary_path_disable, null)
        fast_reroute_per_prefix_tiebreaker_interface_disjoint_index     = try(ospf_process.fast_reroute_per_prefix.tiebreaker.interface_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.interface_disjoint_index, null)
        fast_reroute_per_prefix_tiebreaker_interface_disjoint_disable   = try(ospf_process.fast_reroute_per_prefix.tiebreaker.interface_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.interface_disjoint_disable, null)
        fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index          = try(ospf_process.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, null)
        fast_reroute_per_prefix_tiebreaker_srlg_disjoint_disable        = try(ospf_process.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_disable, null)
        fast_reroute_per_prefix_load_sharing_disable                    = try(ospf_process.fast_reroute_per_prefix.load_sharing_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.load_sharing_disable, null)
        fast_reroute_per_prefix_srlg_protection_weighted_global         = try(ospf_process.fast_reroute_per_prefix.srlg_protection_weighted_global, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.srlg_protection_weighted_global, null)
        fast_reroute_per_prefix_exclude_interfaces = try(length(ospf_process.fast_reroute_per_prefix.exclude_interfaces) == 0, true) ? null : [for iface in ospf_process.fast_reroute_per_prefix.exclude_interfaces : {
          interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.exclude_interfaces.interface_name, null)
        }]
        fast_reroute_per_prefix_lfa_candidate_interfaces = try(length(ospf_process.fast_reroute_per_prefix.lfa_candidate_interfaces) == 0, true) ? null : [for iface in ospf_process.fast_reroute_per_prefix.lfa_candidate_interfaces : {
          interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.lfa_candidate_interfaces.interface_name, null)
        }]
        fast_reroute_per_prefix_use_candidate_only_enable  = try(ospf_process.fast_reroute_per_prefix.use_candidate_only_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.use_candidate_only_enable, null)
        fast_reroute_per_prefix_use_candidate_only_disable = try(ospf_process.fast_reroute_per_prefix.use_candidate_only_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.use_candidate_only_disable, null)
        fast_reroute_per_prefix_remote_lfa_tunnel_mpls_ldp = try(ospf_process.fast_reroute_per_prefix.remote_lfa_tunnel_mpls_ldp, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.remote_lfa_tunnel_mpls_ldp, null)
        fast_reroute_per_prefix_remote_lfa_disable         = try(ospf_process.fast_reroute_per_prefix.remote_lfa_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.remote_lfa_disable, null)
        fast_reroute_per_prefix_remote_lfa_maximum_cost    = try(ospf_process.fast_reroute_per_prefix.remote_lfa_maximum_cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.remote_lfa_maximum_cost, null)
        fast_reroute_per_prefix_ti_lfa_enable              = try(ospf_process.fast_reroute_per_prefix.ti_lfa_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.ti_lfa_enable, null)
        fast_reroute_per_prefix_ti_lfa_disable             = try(ospf_process.fast_reroute_per_prefix.ti_lfa_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_prefix.ti_lfa_disable, null)
        fast_reroute_per_link                              = try(ospf_process.fast_reroute_per_link.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_link.enable, null)
        fast_reroute_per_link_priority_limit_critical      = try(ospf_process.fast_reroute_per_link.priority_limit_critical, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_link.priority_limit_critical, null)
        fast_reroute_per_link_priority_limit_high          = try(ospf_process.fast_reroute_per_link.priority_limit_high, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_link.priority_limit_high, null)
        fast_reroute_per_link_priority_limit_medium        = try(ospf_process.fast_reroute_per_link.priority_limit_medium, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_link.priority_limit_medium, null)
        fast_reroute_per_link_exclude_interfaces = try(length(ospf_process.fast_reroute_per_link.exclude_interfaces) == 0, true) ? null : [for iface in ospf_process.fast_reroute_per_link.exclude_interfaces : {
          interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_link.exclude_interfaces.interface_name, null)
        }]
        fast_reroute_per_link_lfa_candidate_interfaces = try(length(ospf_process.fast_reroute_per_link.lfa_candidate_interfaces) == 0, true) ? null : [for iface in ospf_process.fast_reroute_per_link.lfa_candidate_interfaces : {
          interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_link.lfa_candidate_interfaces.interface_name, null)
        }]
        fast_reroute_per_link_use_candidate_only_enable  = try(ospf_process.fast_reroute_per_link.use_candidate_only_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_link.use_candidate_only_enable, null)
        fast_reroute_per_link_use_candidate_only_disable = try(ospf_process.fast_reroute_per_link.use_candidate_only_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_per_link.use_candidate_only_disable, null)
        fast_reroute_disable                             = try(ospf_process.fast_reroute_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.fast_reroute_disable, null)
        loopback_stub_network_enable                     = try(ospf_process.loopback_stub_network_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.loopback_stub_network_enable, null)
        loopback_stub_network_disable                    = try(ospf_process.loopback_stub_network_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.loopback_stub_network_disable, null)
        link_down_fast_detect                            = try(ospf_process.link_down_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.link_down_fast_detect, null)
        weight                                           = try(ospf_process.weight, local.defaults.iosxr.devices.configuration.routing.ospf_processes.weight, null)
        delay_normalize_interval                         = try(ospf_process.delay_normalize_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.delay_normalize_interval, null)
        delay_normalize_offset                           = try(ospf_process.delay_normalize_offset, ospf_process.delay_normalize_interval != null ? 0 : null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.delay_normalize_offset, null)
        microloop_avoidance                              = try(ospf_process.microloop_avoidance, local.defaults.iosxr.devices.configuration.routing.ospf_processes.microloop_avoidance, null)
        microloop_avoidance_protected                    = try(ospf_process.microloop_avoidance_protected, local.defaults.iosxr.devices.configuration.routing.ospf_processes.microloop_avoidance_protected, null)
        microloop_avoidance_segment_routing              = try(ospf_process.microloop_avoidance_segment_routing, local.defaults.iosxr.devices.configuration.routing.ospf_processes.microloop_avoidance_segment_routing, null)
        microloop_avoidance_rib_update_delay             = try(ospf_process.microloop_avoidance_rib_update_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.microloop_avoidance_rib_update_delay, null)
        segment_routing_mpls                             = try(ospf_process.segment_routing_mpls, local.defaults.iosxr.devices.configuration.routing.ospf_processes.segment_routing_mpls, null)
        segment_routing_disable                          = try(ospf_process.segment_routing_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.segment_routing_disable, null)
        segment_routing_global_block_lower_bound         = try(ospf_process.segment_routing_global_block_lower_bound, local.defaults.iosxr.devices.configuration.routing.ospf_processes.segment_routing_global_block_lower_bound, null)
        segment_routing_global_block_upper_bound         = try(ospf_process.segment_routing_global_block_upper_bound, local.defaults.iosxr.devices.configuration.routing.ospf_processes.segment_routing_global_block_upper_bound, null)
        segment_routing_prefix_sid_map_advertise_local   = try(ospf_process.segment_routing_prefix_sid_map_advertise_local, local.defaults.iosxr.devices.configuration.routing.ospf_processes.segment_routing_prefix_sid_map_advertise_local, null)
        segment_routing_prefix_sid_map_receive_disable   = try(ospf_process.segment_routing_prefix_sid_map_receive_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.segment_routing_prefix_sid_map_receive_disable, null)
        segment_routing_sr_prefer                        = try(ospf_process.segment_routing_sr_prefer, local.defaults.iosxr.devices.configuration.routing.ospf_processes.segment_routing_sr_prefer, null)
        segment_routing_sr_prefer_prefix_list            = try(ospf_process.segment_routing_sr_prefer_prefix_list, local.defaults.iosxr.devices.configuration.routing.ospf_processes.segment_routing_sr_prefer_prefix_list, null)
        segment_routing_forwarding_mpls                  = try(ospf_process.segment_routing_forwarding_mpls, local.defaults.iosxr.devices.configuration.routing.ospf_processes.segment_routing_forwarding_mpls, null)
        segment_routing_forwarding_disable               = try(ospf_process.segment_routing_forwarding_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.segment_routing_forwarding_disable, null)
        affinity_maps = try(length(ospf_process.affinity_maps) == 0, true) ? null : [for aff in ospf_process.affinity_maps : {
          affinity_name = try(aff.affinity_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.affinity_maps.affinity_name, null)
          bit_position  = try(aff.bit_position, local.defaults.iosxr.devices.configuration.routing.ospf_processes.affinity_maps.bit_position, null)
        }]
        flex_algos = try(length(ospf_process.flex_algos) == 0, true) ? null : [for algo in ospf_process.flex_algos : {
          number                      = try(algo.number, local.defaults.iosxr.devices.configuration.routing.ospf_processes.flex_algos.number, null)
          priority                    = try(algo.priority, local.defaults.iosxr.devices.configuration.routing.ospf_processes.flex_algos.priority, null)
          microloop_avoidance_disable = try(algo.microloop_avoidance_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.flex_algos.microloop_avoidance_disable, null)
          prefix_metric               = try(algo.prefix_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.flex_algos.prefix_metric, null)
          metric_type_delay           = try(algo.metric_type_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.flex_algos.metric_type_delay, null)
          metric_type_te_metric       = try(algo.metric_type_te_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.flex_algos.metric_type_te_metric, null)
          advertise_definition        = try(algo.advertise_definition, local.defaults.iosxr.devices.configuration.routing.ospf_processes.flex_algos.advertise_definition, null)
          fast_reroute_disable        = try(algo.fast_reroute_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.flex_algos.fast_reroute_disable, null)
          affinity_exclude_any = try(length(algo.affinity_exclude_any) == 0, true) ? null : [for aff in algo.affinity_exclude_any : {
            affinity_name = try(aff.affinity_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.flex_algos.affinity_exclude_any.affinity_name, null)
          }]
          affinity_include_any = try(length(algo.affinity_include_any) == 0, true) ? null : [for aff in algo.affinity_include_any : {
            affinity_name = try(aff.affinity_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.flex_algos.affinity_include_any.affinity_name, null)
          }]
          affinity_include_all = try(length(algo.affinity_include_all) == 0, true) ? null : [for aff in algo.affinity_include_all : {
            affinity_name = try(aff.affinity_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.flex_algos.affinity_include_all.affinity_name, null)
          }]
          srlg_exclude_any = try(length(algo.srlg_exclude_any) == 0, true) ? null : [for srlg in algo.srlg_exclude_any : {
            srlg_name = try(srlg.srlg_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.flex_algos.srlg_exclude_any.srlg_name, null)
          }]
        }]
        authentication_key_encrypted = try(ospf_process.authentication_key_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.authentication_key_encrypted, null)
        message_digest_keys = try(length(ospf_process.message_digest_keys) == 0, true) ? null : [for key in ospf_process.message_digest_keys : {
          key_id        = try(key.key_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.message_digest_keys.key_id, null)
          md5_encrypted = try(key.md5_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.message_digest_keys.md5_encrypted, null)
        }]
        authentication_message_digest             = try(ospf_process.authentication_message_digest, local.defaults.iosxr.devices.configuration.routing.ospf_processes.authentication_message_digest, null)
        authentication_keychain                   = try(ospf_process.authentication_keychain, local.defaults.iosxr.devices.configuration.routing.ospf_processes.authentication_keychain, null)
        authentication_null                       = try(ospf_process.authentication_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.authentication_null, null)
        authentication_keychain_name              = try(ospf_process.authentication_keychain_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.authentication_keychain_name, null)
        network_broadcast                         = try(ospf_process.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.network, null) == "broadcast" ? true : null
        network_non_broadcast                     = try(ospf_process.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.network, null) == "non_broadcast" ? true : null
        network_point_to_point                    = try(ospf_process.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.network, null) == "point_to_point" ? true : null
        network_point_to_multipoint               = try(ospf_process.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.network, null) == "point_to_multipoint" ? true : null
        external_out_enable                       = try(ospf_process.external_out_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.external_out_enable, null)
        external_out_disable                      = try(ospf_process.external_out_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.external_out_disable, null)
        summary_in_enable                         = try(ospf_process.summary_in_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.summary_in_enable, null)
        summary_in_disable                        = try(ospf_process.summary_in_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.summary_in_disable, null)
        adjacency_stagger_disable                 = try(ospf_process.adjacency_stagger_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.adjacency_stagger_disable, null)
        adjacency_stagger_initial_neighbors       = try(ospf_process.adjacency_stagger_initial_neighbors, local.defaults.iosxr.devices.configuration.routing.ospf_processes.adjacency_stagger_initial_neighbors, null)
        adjacency_stagger_simultaneous_neighbors  = try(ospf_process.adjacency_stagger_simultaneous_neighbors, local.defaults.iosxr.devices.configuration.routing.ospf_processes.adjacency_stagger_simultaneous_neighbors, null)
        snmp_context                              = try(ospf_process.snmp_context, local.defaults.iosxr.devices.configuration.routing.ospf_processes.snmp_context, null)
        snmp_trap_rate_limit                      = try(ospf_process.snmp_trap_rate_limit, local.defaults.iosxr.devices.configuration.routing.ospf_processes.snmp_trap_rate_limit, null)
        snmp_trap_rate_limit_max                  = try(ospf_process.snmp_trap_rate_limit_max, local.defaults.iosxr.devices.configuration.routing.ospf_processes.snmp_trap_rate_limit_max, null)
        monitor_convergence                       = try(ospf_process.monitor_convergence, local.defaults.iosxr.devices.configuration.routing.ospf_processes.monitor_convergence, null)
        monitor_convergence_prefix_list           = try(ospf_process.monitor_convergence_prefix_list, local.defaults.iosxr.devices.configuration.routing.ospf_processes.monitor_convergence_prefix_list, null)
        monitor_convergence_track_summary_routes  = try(ospf_process.monitor_convergence_track_summary_routes, local.defaults.iosxr.devices.configuration.routing.ospf_processes.monitor_convergence_track_summary_routes, null)
        monitor_convergence_track_external_routes = try(ospf_process.monitor_convergence_track_external_routes, local.defaults.iosxr.devices.configuration.routing.ospf_processes.monitor_convergence_track_external_routes, null)
        monitor_convergence_track_ip_frr          = try(ospf_process.monitor_convergence_track_ip_frr, local.defaults.iosxr.devices.configuration.routing.ospf_processes.monitor_convergence_track_ip_frr, null)
        ucmp                                      = try(ospf_process.ucmp, local.defaults.iosxr.devices.configuration.routing.ospf_processes.ucmp, null)
        ucmp_variance                             = try(ospf_process.ucmp_variance, ospf_process.ucmp != null ? 200 : null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.ucmp_variance, null)
        ucmp_prefix_list                          = try(ospf_process.ucmp_prefix_list, local.defaults.iosxr.devices.configuration.routing.ospf_processes.ucmp_prefix_list, null)
        ucmp_exclude_interfaces = try(length(ospf_process.ucmp_exclude_interfaces) == 0, true) ? null : [for iface in ospf_process.ucmp_exclude_interfaces : {
          interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.ucmp_exclude_interfaces.interface_name, null)
        }]
        ucmp_delay_interval = try(ospf_process.ucmp_delay_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.ucmp_delay_interval, null)
        srlg_admin_weight   = try(ospf_process.srlg_admin_weight, local.defaults.iosxr.devices.configuration.routing.ospf_processes.srlg_admin_weight, null)
        srlg_names = try(length(ospf_process.srlg_names) == 0, true) ? null : [for name in ospf_process.srlg_names : {
          srlg_name    = try(name.srlg_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.srlg_names.srlg_name, null)
          admin_weight = try(name.admin_weight, local.defaults.iosxr.devices.configuration.routing.ospf_processes.srlg_names.admin_weight, null)
        }]
        max_external_lsa                                = try(ospf_process.max_external_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_external_lsa, null)
        max_external_lsa_threshold                      = try(ospf_process.max_external_lsa_threshold, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_external_lsa_threshold, null)
        max_external_lsa_suppress_neighbor              = try(ospf_process.max_external_lsa_suppress_neighbor, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_external_lsa_suppress_neighbor, null)
        max_external_lsa_warning_only                   = try(ospf_process.max_external_lsa_warning_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.max_external_lsa_warning_only, null)
        exchange_timer                                  = try(ospf_process.exchange_timer, local.defaults.iosxr.devices.configuration.routing.ospf_processes.exchange_timer, null)
        exchange_timer_hold_time                        = try(ospf_process.exchange_timer_hold_time, local.defaults.iosxr.devices.configuration.routing.ospf_processes.exchange_timer_hold_time, null)
        exchange_timer_recovery_count                   = try(ospf_process.exchange_timer_recovery_count, local.defaults.iosxr.devices.configuration.routing.ospf_processes.exchange_timer_recovery_count, null)
        distribute_link_state                           = try(ospf_process.distribute_link_state, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distribute_link_state, null)
        distribute_link_state_instance_id               = try(ospf_process.distribute_link_state_instance_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distribute_link_state_instance_id, null)
        distribute_link_state_throttle                  = try(ospf_process.distribute_link_state_throttle, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distribute_link_state_throttle, null)
        distribute_link_state_excl_external             = try(ospf_process.distribute_link_state_excl_external, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distribute_link_state_excl_external, null)
        distribute_link_state_allow_prefix_route_policy = try(ospf_process.distribute_link_state_allow_prefix_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distribute_link_state_allow_prefix_route_policy, null)
        distribute_link_state_follow_on                 = try(ospf_process.distribute_link_state_follow_on, local.defaults.iosxr.devices.configuration.routing.ospf_processes.distribute_link_state_follow_on, null)
        nsr                                             = try(ospf_process.nsr, local.defaults.iosxr.devices.configuration.routing.ospf_processes.nsr, null)
        nsr_disable                                     = try(ospf_process.nsr_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.nsr_disable, null)
        protocol_shutdown                               = try(ospf_process.protocol_shutdown, local.defaults.iosxr.devices.configuration.routing.ospf_processes.protocol_shutdown, null)
        protocol_shutdown_host_mode                     = try(ospf_process.protocol_shutdown_host_mode, local.defaults.iosxr.devices.configuration.routing.ospf_processes.protocol_shutdown_host_mode, null)
        protocol_shutdown_on_reload                     = try(ospf_process.protocol_shutdown_on_reload, local.defaults.iosxr.devices.configuration.routing.ospf_processes.protocol_shutdown_on_reload, null)
      }
    ]
  ])
}

resource "iosxr_router_ospf" "router_ospf" {
  for_each                                                        = { for ospf in local.router_ospf : ospf.key => ospf }
  device                                                          = each.value.device_name
  process_name                                                    = each.value.process_name
  mpls_traffic_eng_router_id_ipv4_address                         = each.value.mpls_traffic_eng_router_id_ipv4_address
  mpls_traffic_eng_router_id_interface_name                       = each.value.mpls_traffic_eng_router_id_interface_name
  mpls_traffic_eng_multicast_intact                               = each.value.mpls_traffic_eng_multicast_intact
  mpls_traffic_eng_autoroute_exclude_route_policy                 = each.value.mpls_traffic_eng_autoroute_exclude_route_policy
  mpls_traffic_eng_igp_intact                                     = each.value.mpls_traffic_eng_igp_intact
  mpls_traffic_eng_ldp_sync_update                                = each.value.mpls_traffic_eng_ldp_sync_update
  mpls_ldp_sync                                                   = each.value.mpls_ldp_sync
  mpls_ldp_sync_igp_shortcuts                                     = each.value.mpls_ldp_sync_igp_shortcuts
  mpls_ldp_auto_config                                            = each.value.mpls_ldp_auto_config
  cost                                                            = each.value.cost
  cost_fallback_anomaly_delay_igp_metric_increment                = each.value.cost_fallback_anomaly_delay_igp_metric_increment
  cost_fallback_anomaly_delay_igp_metric_multiplier               = each.value.cost_fallback_anomaly_delay_igp_metric_multiplier
  cost_fallback_anomaly_delay_igp_metric_value                    = each.value.cost_fallback_anomaly_delay_igp_metric_value
  cost_fallback_anomaly_delay_te_metric_increment                 = each.value.cost_fallback_anomaly_delay_te_metric_increment
  cost_fallback_anomaly_delay_te_metric_multiplier                = each.value.cost_fallback_anomaly_delay_te_metric_multiplier
  cost_fallback_anomaly_delay_te_metric_value                     = each.value.cost_fallback_anomaly_delay_te_metric_value
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
  log_adjacency_changes_detail                                    = each.value.log_adjacency_changes_detail
  log_adjacency_changes_disable                                   = each.value.log_adjacency_changes_disable
  router_id                                                       = each.value.router_id
  redistribute_connected                                          = each.value.redistribute_connected
  redistribute_connected_tag                                      = each.value.redistribute_connected_tag
  redistribute_connected_metric_type                              = each.value.redistribute_connected_metric_type
  redistribute_connected_route_policy                             = each.value.redistribute_connected_route_policy
  redistribute_connected_metric                                   = each.value.redistribute_connected_metric
  redistribute_connected_metric_use_rib_metric                    = each.value.redistribute_connected_metric_use_rib_metric
  redistribute_connected_lsa_type_summary                         = each.value.redistribute_connected_lsa_type_summary
  redistribute_connected_nssa_only                                = each.value.redistribute_connected_nssa_only
  redistribute_static                                             = each.value.redistribute_static
  redistribute_static_tag                                         = each.value.redistribute_static_tag
  redistribute_static_metric_type                                 = each.value.redistribute_static_metric_type
  redistribute_static_route_policy                                = each.value.redistribute_static_route_policy
  redistribute_static_metric                                      = each.value.redistribute_static_metric
  redistribute_static_metric_use_rib_metric                       = each.value.redistribute_static_metric_use_rib_metric
  redistribute_static_lsa_type_summary                            = each.value.redistribute_static_lsa_type_summary
  redistribute_static_nssa_only                                   = each.value.redistribute_static_nssa_only
  redistribute_bgp                                                = each.value.redistribute_bgp
  redistribute_isis                                               = each.value.redistribute_isis
  redistribute_ospf                                               = each.value.redistribute_ospf
  distribute_list_in_acl                                          = each.value.distribute_list_in_acl
  distribute_list_in_route_policy                                 = each.value.distribute_list_in_route_policy
  distribute_list_out_acl                                         = each.value.distribute_list_out_acl
  distribute_list_out_connected_acl                               = each.value.distribute_list_out_connected_acl
  distribute_list_out_static_acl                                  = each.value.distribute_list_out_static_acl
  distribute_list_out_bgp_as                                      = each.value.distribute_list_out_bgp_as
  distribute_list_out_bgp_acl                                     = each.value.distribute_list_out_bgp_acl
  distribute_list_out_ospf_instance_name                          = each.value.distribute_list_out_ospf_instance_id
  distribute_list_out_ospf_acl                                    = each.value.distribute_list_out_ospf_acl
  packet_size                                                     = each.value.packet_size
  bfd_fast_detect                                                 = each.value.bfd_fast_detect
  bfd_fast_detect_strict_mode                                     = each.value.bfd_fast_detect_strict_mode
  bfd_minimum_interval                                            = each.value.bfd_minimum_interval
  bfd_multiplier                                                  = each.value.bfd_multiplier
  security_ttl                                                    = each.value.security_ttl
  security_ttl_hops                                               = each.value.security_ttl_hops
  prefix_suppression                                              = each.value.prefix_suppression
  default_information_originate                                   = each.value.default_information_originate
  default_information_originate_always                            = each.value.default_information_originate_always
  default_information_originate_metric                            = each.value.default_information_originate_metric
  default_information_originate_metric_type                       = each.value.default_information_originate_metric_type
  default_information_originate_route_policy                      = each.value.default_information_originate_route_policy
  default_metric                                                  = each.value.default_metric
  distance_sources                                                = each.value.distance_sources
  distance_ospf_intra_area                                        = each.value.distance_ospf_intra_area
  distance_ospf_inter_area                                        = each.value.distance_ospf_inter_area
  distance_ospf_external                                          = each.value.distance_ospf_external
  auto_cost_reference_bandwidth                                   = each.value.auto_cost_reference_bandwidth
  auto_cost_disable                                               = each.value.auto_cost_disable
  ignore_lsa_mospf                                                = each.value.ignore_lsa_mospf
  capability_opaque_disable                                       = each.value.capability_opaque_disable
  capability_lls_disable                                          = each.value.capability_lls_disable
  capability_type7_prefer                                         = each.value.capability_type7_prefer
  max_metric_router_lsa                                           = each.value.max_metric_router_lsa
  max_metric_router_lsa_include_stub                              = each.value.max_metric_router_lsa_include_stub
  max_metric_router_lsa_summary_lsa                               = each.value.max_metric_router_lsa_summary_lsa
  max_metric_router_lsa_summary_lsa_metric                        = each.value.max_metric_router_lsa_summary_lsa_metric
  max_metric_router_lsa_external_lsa                              = each.value.max_metric_router_lsa_external_lsa
  max_metric_router_lsa_external_lsa_metric                       = each.value.max_metric_router_lsa_external_lsa_metric
  max_metric_router_lsa_on_startup_time                           = each.value.max_metric_router_lsa_on_startup_time
  max_metric_router_lsa_on_startup_wait_for_bgp                   = each.value.max_metric_router_lsa_on_startup_wait_for_bgp
  max_metric_router_lsa_on_startup_include_stub                   = each.value.max_metric_router_lsa_on_startup_include_stub
  max_metric_router_lsa_on_startup_summary_lsa                    = each.value.max_metric_router_lsa_on_startup_summary_lsa
  max_metric_router_lsa_on_startup_summary_lsa_metric             = each.value.max_metric_router_lsa_on_startup_summary_lsa_metric
  max_metric_router_lsa_on_startup_external_lsa                   = each.value.max_metric_router_lsa_on_startup_external_lsa
  max_metric_router_lsa_on_startup_external_lsa_metric            = each.value.max_metric_router_lsa_on_startup_external_lsa_metric
  max_metric_router_lsa_on_switchover_time                        = each.value.max_metric_router_lsa_on_switchover_time
  max_metric_router_lsa_on_switchover_wait_for_bgp                = each.value.max_metric_router_lsa_on_switchover_wait_for_bgp
  max_metric_router_lsa_on_switchover_include_stub                = each.value.max_metric_router_lsa_on_switchover_include_stub
  max_metric_router_lsa_on_switchover_summary_lsa                 = each.value.max_metric_router_lsa_on_switchover_summary_lsa
  max_metric_router_lsa_on_switchover_summary_lsa_metric          = each.value.max_metric_router_lsa_on_switchover_summary_lsa_metric
  max_metric_router_lsa_on_switchover_external_lsa                = each.value.max_metric_router_lsa_on_switchover_external_lsa
  max_metric_router_lsa_on_switchover_external_lsa_metric         = each.value.max_metric_router_lsa_on_switchover_external_lsa_metric
  max_metric_router_lsa_on_proc_restart_time                      = each.value.max_metric_router_lsa_on_proc_restart_time
  max_metric_router_lsa_on_proc_restart_wait_for_bgp              = each.value.max_metric_router_lsa_on_proc_restart_wait_for_bgp
  max_metric_router_lsa_on_proc_restart_include_stub              = each.value.max_metric_router_lsa_on_proc_restart_include_stub
  max_metric_router_lsa_on_proc_restart_summary_lsa               = each.value.max_metric_router_lsa_on_proc_restart_summary_lsa
  max_metric_router_lsa_on_proc_restart_summary_lsa_metric        = each.value.max_metric_router_lsa_on_proc_restart_summary_lsa_metric
  max_metric_router_lsa_on_proc_restart_external_lsa              = each.value.max_metric_router_lsa_on_proc_restart_external_lsa
  max_metric_router_lsa_on_proc_restart_external_lsa_metric       = each.value.max_metric_router_lsa_on_proc_restart_external_lsa_metric
  max_lsa                                                         = each.value.max_lsa
  max_lsa_threshold                                               = each.value.max_lsa_threshold
  max_lsa_warning_only                                            = each.value.max_lsa_warning_only
  max_lsa_ignore_time                                             = each.value.max_lsa_ignore_time
  max_lsa_ignore_count                                            = each.value.max_lsa_ignore_count
  max_lsa_reset_time                                              = each.value.max_lsa_reset_time
  timers_throttle_spf_initial_delay                               = each.value.timers_throttle_spf_initial_delay
  timers_throttle_spf_second_delay                                = each.value.timers_throttle_spf_second_delay
  timers_throttle_spf_maximum_delay                               = each.value.timers_throttle_spf_maximum_delay
  timers_throttle_lsa_all_initial_delay                           = each.value.timers_throttle_lsa_all_initial_delay
  timers_throttle_lsa_all_minimum_delay                           = each.value.timers_throttle_lsa_all_minimum_delay
  timers_throttle_lsa_all_maximum_delay                           = each.value.timers_throttle_lsa_all_maximum_delay
  timers_throttle_fast_reroute                                    = each.value.timers_throttle_fast_reroute
  timers_lsa_group_pacing                                         = each.value.timers_lsa_group_pacing
  timers_lsa_min_arrival                                          = each.value.timers_lsa_min_arrival
  timers_lsa_refresh                                              = each.value.timers_lsa_refresh
  timers_pacing_flood                                             = each.value.timers_pacing_flood
  timers_graceful_shutdown_initial_delay                          = each.value.timers_graceful_shutdown_initial_delay
  timers_graceful_shutdown_retain_routes                          = each.value.timers_graceful_shutdown_retain_routes
  nsf_interval                                                    = each.value.nsf_interval
  nsf_lifetime                                                    = each.value.nsf_lifetime
  nsf_flush_delay_time                                            = each.value.nsf_flush_delay_time
  nsf_cisco                                                       = each.value.nsf_cisco
  nsf_cisco_enforce_global                                        = each.value.nsf_cisco_enforce_global
  nsf_ietf                                                        = each.value.nsf_ietf
  nsf_ietf_strict_lsa_checking                                    = each.value.nsf_ietf_strict_lsa_checking
  nsf_ietf_helper_disable                                         = each.value.nsf_ietf_helper_disable
  address_family_ipv4_unicast                                     = each.value.address_family_ipv4_unicast
  maximum_interfaces                                              = each.value.maximum_interfaces
  maximum_paths                                                   = each.value.maximum_paths
  maximum_redistributed_prefixes                                  = each.value.maximum_redistributed_prefixes
  maximum_redistributed_prefixes_threshold                        = each.value.maximum_redistributed_prefixes_threshold
  maximum_redistributed_prefixes_warning_only                     = each.value.maximum_redistributed_prefixes_warning_only
  queue_limit_high                                                = each.value.queue_limit_high
  queue_limit_medium                                              = each.value.queue_limit_medium
  queue_limit_low                                                 = each.value.queue_limit_low
  queue_dispatch_incoming                                         = each.value.queue_dispatch_incoming
  queue_dispatch_rate_limited_lsa                                 = each.value.queue_dispatch_rate_limited_lsa
  queue_dispatch_flush_lsa                                        = each.value.queue_dispatch_flush_lsa
  queue_dispatch_spf_lsa_limit                                    = each.value.queue_dispatch_spf_lsa_limit
  summary_prefixes                                                = each.value.summary_prefixes
  spf_prefix_priority_route_policy                                = each.value.spf_prefix_priority_route_policy
  fast_reroute_per_prefix                                         = each.value.fast_reroute_per_prefix
  fast_reroute_per_prefix_priority_limit_critical                 = each.value.fast_reroute_per_prefix_priority_limit_critical
  fast_reroute_per_prefix_priority_limit_high                     = each.value.fast_reroute_per_prefix_priority_limit_high
  fast_reroute_per_prefix_priority_limit_medium                   = each.value.fast_reroute_per_prefix_priority_limit_medium
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
  fast_reroute_per_prefix_load_sharing_disable                    = each.value.fast_reroute_per_prefix_load_sharing_disable
  fast_reroute_per_prefix_srlg_protection_weighted_global         = each.value.fast_reroute_per_prefix_srlg_protection_weighted_global
  fast_reroute_per_prefix_exclude_interfaces                      = each.value.fast_reroute_per_prefix_exclude_interfaces
  fast_reroute_per_prefix_lfa_candidate_interfaces                = each.value.fast_reroute_per_prefix_lfa_candidate_interfaces
  fast_reroute_per_prefix_use_candidate_only_enable               = each.value.fast_reroute_per_prefix_use_candidate_only_enable
  fast_reroute_per_prefix_use_candidate_only_disable              = each.value.fast_reroute_per_prefix_use_candidate_only_disable
  fast_reroute_per_prefix_remote_lfa_tunnel_mpls_ldp              = each.value.fast_reroute_per_prefix_remote_lfa_tunnel_mpls_ldp
  fast_reroute_per_prefix_remote_lfa_disable                      = each.value.fast_reroute_per_prefix_remote_lfa_disable
  fast_reroute_per_prefix_remote_lfa_maximum_cost                 = each.value.fast_reroute_per_prefix_remote_lfa_maximum_cost
  fast_reroute_per_prefix_ti_lfa_enable                           = each.value.fast_reroute_per_prefix_ti_lfa_enable
  fast_reroute_per_prefix_ti_lfa_disable                          = each.value.fast_reroute_per_prefix_ti_lfa_disable
  fast_reroute_per_link                                           = each.value.fast_reroute_per_link
  fast_reroute_per_link_priority_limit_critical                   = each.value.fast_reroute_per_link_priority_limit_critical
  fast_reroute_per_link_priority_limit_high                       = each.value.fast_reroute_per_link_priority_limit_high
  fast_reroute_per_link_priority_limit_medium                     = each.value.fast_reroute_per_link_priority_limit_medium
  fast_reroute_per_link_exclude_interfaces                        = each.value.fast_reroute_per_link_exclude_interfaces
  fast_reroute_per_link_lfa_candidate_interfaces                  = each.value.fast_reroute_per_link_lfa_candidate_interfaces
  fast_reroute_per_link_use_candidate_only_enable                 = each.value.fast_reroute_per_link_use_candidate_only_enable
  fast_reroute_per_link_use_candidate_only_disable                = each.value.fast_reroute_per_link_use_candidate_only_disable
  fast_reroute_disable                                            = each.value.fast_reroute_disable
  loopback_stub_network_enable                                    = each.value.loopback_stub_network_enable
  loopback_stub_network_disable                                   = each.value.loopback_stub_network_disable
  link_down_fast_detect                                           = each.value.link_down_fast_detect
  weight                                                          = each.value.weight
  delay_normalize_interval                                        = each.value.delay_normalize_interval
  delay_normalize_offset                                          = each.value.delay_normalize_offset
  microloop_avoidance                                             = each.value.microloop_avoidance
  microloop_avoidance_protected                                   = each.value.microloop_avoidance_protected
  microloop_avoidance_segment_routing                             = each.value.microloop_avoidance_segment_routing
  microloop_avoidance_rib_update_delay                            = each.value.microloop_avoidance_rib_update_delay
  segment_routing_mpls                                            = each.value.segment_routing_mpls
  segment_routing_disable                                         = each.value.segment_routing_disable
  segment_routing_global_block_lower_bound                        = each.value.segment_routing_global_block_lower_bound
  segment_routing_global_block_upper_bound                        = each.value.segment_routing_global_block_upper_bound
  segment_routing_prefix_sid_map_advertise_local                  = each.value.segment_routing_prefix_sid_map_advertise_local
  segment_routing_prefix_sid_map_receive_disable                  = each.value.segment_routing_prefix_sid_map_receive_disable
  segment_routing_sr_prefer                                       = each.value.segment_routing_sr_prefer
  segment_routing_sr_prefer_prefix_list                           = each.value.segment_routing_sr_prefer_prefix_list
  segment_routing_forwarding_mpls                                 = each.value.segment_routing_forwarding_mpls
  segment_routing_forwarding_disable                              = each.value.segment_routing_forwarding_disable
  affinity_maps                                                   = each.value.affinity_maps
  flex_algos                                                      = each.value.flex_algos
  authentication_key_encrypted                                    = each.value.authentication_key_encrypted
  message_digest_keys                                             = each.value.message_digest_keys
  authentication_message_digest                                   = each.value.authentication_message_digest
  authentication_keychain                                         = each.value.authentication_keychain
  authentication_null                                             = each.value.authentication_null
  authentication_keychain_name                                    = each.value.authentication_keychain_name
  network_broadcast                                               = each.value.network_broadcast
  network_non_broadcast                                           = each.value.network_non_broadcast
  network_point_to_point                                          = each.value.network_point_to_point
  network_point_to_multipoint                                     = each.value.network_point_to_multipoint
  external_out_enable                                             = each.value.external_out_enable
  external_out_disable                                            = each.value.external_out_disable
  summary_in_enable                                               = each.value.summary_in_enable
  summary_in_disable                                              = each.value.summary_in_disable
  adjacency_stagger_disable                                       = each.value.adjacency_stagger_disable
  adjacency_stagger_initial_neighbors                             = each.value.adjacency_stagger_initial_neighbors
  adjacency_stagger_simultaneous_neighbors                        = each.value.adjacency_stagger_simultaneous_neighbors
  snmp_context                                                    = each.value.snmp_context
  snmp_trap_rate_limit                                            = each.value.snmp_trap_rate_limit
  snmp_trap_rate_limit_max                                        = each.value.snmp_trap_rate_limit_max
  monitor_convergence                                             = each.value.monitor_convergence
  monitor_convergence_prefix_list                                 = each.value.monitor_convergence_prefix_list
  monitor_convergence_track_summary_routes                        = each.value.monitor_convergence_track_summary_routes
  monitor_convergence_track_external_routes                       = each.value.monitor_convergence_track_external_routes
  monitor_convergence_track_ip_frr                                = each.value.monitor_convergence_track_ip_frr
  ucmp                                                            = each.value.ucmp
  ucmp_variance                                                   = each.value.ucmp_variance
  ucmp_prefix_list                                                = each.value.ucmp_prefix_list
  ucmp_exclude_interfaces                                         = each.value.ucmp_exclude_interfaces
  ucmp_delay_interval                                             = each.value.ucmp_delay_interval
  srlg_admin_weight                                               = each.value.srlg_admin_weight
  srlg_names                                                      = each.value.srlg_names
  max_external_lsa                                                = each.value.max_external_lsa
  max_external_lsa_threshold                                      = each.value.max_external_lsa_threshold
  max_external_lsa_suppress_neighbor                              = each.value.max_external_lsa_suppress_neighbor
  max_external_lsa_warning_only                                   = each.value.max_external_lsa_warning_only
  exchange_timer                                                  = each.value.exchange_timer
  exchange_timer_hold_time                                        = each.value.exchange_timer_hold_time
  exchange_timer_recovery_count                                   = each.value.exchange_timer_recovery_count
  distribute_link_state                                           = each.value.distribute_link_state
  distribute_link_state_instance_id                               = each.value.distribute_link_state_instance_id
  distribute_link_state_throttle                                  = each.value.distribute_link_state_throttle
  distribute_link_state_excl_external                             = each.value.distribute_link_state_excl_external
  distribute_link_state_allow_prefix_route_policy                 = each.value.distribute_link_state_allow_prefix_route_policy
  distribute_link_state_follow_on                                 = each.value.distribute_link_state_follow_on
  nsr                                                             = each.value.nsr
  nsr_disable                                                     = each.value.nsr_disable
  protocol_shutdown                                               = each.value.protocol_shutdown
  protocol_shutdown_host_mode                                     = each.value.protocol_shutdown_host_mode
  protocol_shutdown_on_reload                                     = each.value.protocol_shutdown_on_reload

  depends_on = [
    iosxr_route_policy.route_policy,
    iosxr_key_chain.key_chain,
    iosxr_segment_routing.segment_routing,
    iosxr_segment_routing_v6.segment_routing_v6
    #iosxr_segment_routing_mapping_server.segment_routing_mapping_server
  ]
}

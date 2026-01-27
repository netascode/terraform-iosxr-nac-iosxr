locals {
  bgp_address_family_ipv4_unicast = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) :
      contains(keys(try(bgp_process.address_family, {})), "ipv4_unicast") ? [{
        key                                                            = format("%s/%s/ipv4-unicast", device.name, bgp_process.as_number)
        device_name                                                    = device.name
        as_number                                                      = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
        af_name                                                        = "ipv4-unicast"
        distance_bgp_external_route                                    = try(bgp_process.address_family.ipv4_unicast.distance_bgp_external_route, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.distance_bgp_external_route, null)
        distance_bgp_internal_route                                    = try(bgp_process.address_family.ipv4_unicast.distance_bgp_internal_route, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.distance_bgp_internal_route, null)
        distance_bgp_local_route                                       = try(bgp_process.address_family.ipv4_unicast.distance_bgp_local_route, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.distance_bgp_local_route, null)
        import_from_bridge_domain                                      = try(bgp_process.address_family.ipv4_unicast.import_from_bridge_domain, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.import_from_bridge_domain, null)
        additional_paths_send                                          = try(bgp_process.address_family.ipv4_unicast.additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.additional_paths_send, null)
        additional_paths_receive                                       = try(bgp_process.address_family.ipv4_unicast.additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.additional_paths_receive, null)
        additional_paths_advertise_limit                               = try(bgp_process.address_family.ipv4_unicast.additional_paths_advertise_limit, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.additional_paths_advertise_limit, null)
        additional_paths_selection_route_policy                        = try(bgp_process.address_family.ipv4_unicast.additional_paths_selection_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.additional_paths_selection_route_policy, null)
        additional_paths_selection_disable                             = try(bgp_process.address_family.ipv4_unicast.additional_paths_selection_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.additional_paths_selection_disable, null)
        permanent_network_route_policy                                 = try(bgp_process.address_family.ipv4_unicast.permanent_network_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.permanent_network_route_policy, null)
        advertise_best_external                                        = try(bgp_process.address_family.ipv4_unicast.advertise_best_external, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.advertise_best_external, null)
        advertise_best_external_labeled_unicast                        = try(bgp_process.address_family.ipv4_unicast.advertise_best_external_labeled_unicast, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.advertise_best_external_labeled_unicast, null)
        advertise_best_external_disable                                = try(bgp_process.address_family.ipv4_unicast.advertise_best_external_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.advertise_best_external_disable, null)
        advertise_local_labeled_route_safi_unicast                     = try(bgp_process.address_family.ipv4_unicast.advertise_local_labeled_route_safi_unicast, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.advertise_local_labeled_route_safi_unicast, null)
        advertise_epe_bgp_labeled_unicast                              = try(bgp_process.address_family.ipv4_unicast.advertise_epe_bgp_labeled_unicast, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.advertise_epe_bgp_labeled_unicast, null)
        allocate_label_all                                             = try(bgp_process.address_family.ipv4_unicast.allocate_label_all, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.allocate_label_all, null)
        allocate_label_all_unlabeled_path                              = try(bgp_process.address_family.ipv4_unicast.allocate_label_all_unlabeled_path, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.allocate_label_all_unlabeled_path, null)
        allocate_label_route_policy                                    = try(bgp_process.address_family.ipv4_unicast.allocate_label_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.allocate_label_route_policy, null)
        allocate_label_route_policy_unlabeled_path                     = try(bgp_process.address_family.ipv4_unicast.allocate_label_route_policy_unlabeled_path, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.allocate_label_route_policy_unlabeled_path, null)
        maximum_paths_ebgp_multipath                                   = try(bgp_process.address_family.ipv4_unicast.maximum_paths_ebgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.maximum_paths_ebgp_multipath, null)
        maximum_paths_ebgp_selective                                   = try(bgp_process.address_family.ipv4_unicast.maximum_paths_ebgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.maximum_paths_ebgp_selective, null)
        maximum_paths_ebgp_route_policy                                = try(bgp_process.address_family.ipv4_unicast.maximum_paths_ebgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.maximum_paths_ebgp_route_policy, null)
        maximum_paths_ibgp_multipath                                   = try(bgp_process.address_family.ipv4_unicast.maximum_paths_ibgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.maximum_paths_ibgp_multipath, null)
        maximum_paths_ibgp_unequal_cost                                = try(bgp_process.address_family.ipv4_unicast.maximum_paths_ibgp_unequal_cost, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.maximum_paths_ibgp_unequal_cost, null)
        maximum_paths_ibgp_unequal_cost_deterministic                  = try(bgp_process.address_family.ipv4_unicast.maximum_paths_ibgp_unequal_cost_deterministic, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.maximum_paths_ibgp_unequal_cost_deterministic, null)
        maximum_paths_ibgp_selective                                   = try(bgp_process.address_family.ipv4_unicast.maximum_paths_ibgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.maximum_paths_ibgp_selective, null)
        maximum_paths_ibgp_route_policy                                = try(bgp_process.address_family.ipv4_unicast.maximum_paths_ibgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.maximum_paths_ibgp_route_policy, null)
        maximum_paths_eibgp_multipath                                  = try(bgp_process.address_family.ipv4_unicast.maximum_paths_eibgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.maximum_paths_eibgp_multipath, null)
        maximum_paths_eibgp_equal_cost                                 = try(bgp_process.address_family.ipv4_unicast.maximum_paths_eibgp_equal_cost, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.maximum_paths_eibgp_equal_cost, null)
        maximum_paths_eibgp_selective                                  = try(bgp_process.address_family.ipv4_unicast.maximum_paths_eibgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.maximum_paths_eibgp_selective, null)
        maximum_paths_eibgp_route_policy                               = try(bgp_process.address_family.ipv4_unicast.maximum_paths_eibgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.maximum_paths_eibgp_route_policy, null)
        maximum_paths_unique_nexthop_check_disable                     = try(bgp_process.address_family.ipv4_unicast.maximum_paths_unique_nexthop_check_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.maximum_paths_unique_nexthop_check_disable, null)
        nexthop_trigger_delay_critical                                 = try(bgp_process.address_family.ipv4_unicast.nexthop_trigger_delay_critical, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.nexthop_trigger_delay_critical, null)
        nexthop_trigger_delay_non_critical                             = try(bgp_process.address_family.ipv4_unicast.nexthop_trigger_delay_non_critical, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.nexthop_trigger_delay_non_critical, null)
        label_mode_per_prefix                                          = try(bgp_process.address_family.ipv4_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.label_mode, null) == "per-prefix" ? true : null
        label_mode_per_ce                                              = try(bgp_process.address_family.ipv4_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.label_mode, null) == "per-ce" ? true : null
        label_mode_per_vrf                                             = try(bgp_process.address_family.ipv4_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.label_mode, null) == "per-vrf" ? true : null
        label_mode_per_vrf_46                                          = try(bgp_process.address_family.ipv4_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.label_mode, null) == "per-vrf-46" ? true : null
        label_mode_route_policy                                        = try(bgp_process.address_family.ipv4_unicast.label_mode_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.label_mode_route_policy, null)
        label_mode_per_nexthop_received_label                          = (try(bgp_process.address_family.ipv4_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.label_mode, null) == "per-nexthop-received-label" || try(bgp_process.address_family.ipv4_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.label_mode, null) == "per-nexthop-received-label-allocate-secondary-label") ? true : null
        label_mode_per_nexthop_received_label_allocate_secondary_label = try(bgp_process.address_family.ipv4_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.label_mode, null) == "per-nexthop-received-label-allocate-secondary-label" ? true : null
        redistribute_connected                                         = try(bgp_process.address_family.ipv4_unicast.redistribute_connected, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.redistribute_connected, null)
        redistribute_connected_metric                                  = try(bgp_process.address_family.ipv4_unicast.redistribute_connected_metric, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.redistribute_connected_metric, null)
        redistribute_connected_multipath                               = try(bgp_process.address_family.ipv4_unicast.redistribute_connected_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.redistribute_connected_multipath, null)
        redistribute_connected_route_policy                            = try(bgp_process.address_family.ipv4_unicast.redistribute_connected_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.redistribute_connected_route_policy, null)
        redistribute_static                                            = try(bgp_process.address_family.ipv4_unicast.redistribute_static, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.redistribute_static, null)
        redistribute_static_metric                                     = try(bgp_process.address_family.ipv4_unicast.redistribute_static_metric, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.redistribute_static_metric, null)
        redistribute_static_multipath                                  = try(bgp_process.address_family.ipv4_unicast.redistribute_static_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.redistribute_static_multipath, null)
        redistribute_static_route_policy                               = try(bgp_process.address_family.ipv4_unicast.redistribute_static_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.redistribute_static_route_policy, null)
        redistribute_rip                                               = try(bgp_process.address_family.ipv4_unicast.redistribute_rip, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.redistribute_rip, null)
        redistribute_rip_metric                                        = try(bgp_process.address_family.ipv4_unicast.redistribute_rip_metric, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.redistribute_rip_metric, null)
        redistribute_rip_multipath                                     = try(bgp_process.address_family.ipv4_unicast.redistribute_rip_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.redistribute_rip_multipath, null)
        redistribute_rip_route_policy                                  = try(bgp_process.address_family.ipv4_unicast.redistribute_rip_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.redistribute_rip_route_policy, null)
        table_policy                                                   = try(bgp_process.address_family.ipv4_unicast.table_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.table_policy, null)
        retain_local_label                                             = try(bgp_process.address_family.ipv4_unicast.retain_local_label, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.retain_local_label, null)
        retain_route_target_all                                        = try(bgp_process.address_family.ipv4_unicast.retain_route_target_all, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.retain_route_target_all, null)
        retain_route_target_route_policy                               = try(bgp_process.address_family.ipv4_unicast.retain_route_target_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.retain_route_target_route_policy, null)
        rnh_install_extcomm                                            = try(bgp_process.address_family.ipv4_unicast.rnh_install_extcomm, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.rnh_install_extcomm, null)
        rnh_install_extcomm_only                                       = try(bgp_process.address_family.ipv4_unicast.rnh_install_extcomm_only, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.rnh_install_extcomm_only, null)
        prefix_ecmp_delay                                              = try(bgp_process.address_family.ipv4_unicast.prefix_ecmp_delay, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.prefix_ecmp_delay, null)
        prefix_ecmp_delay_oor_threshold                                = try(bgp_process.address_family.ipv4_unicast.prefix_ecmp_delay_oor_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.prefix_ecmp_delay_oor_threshold, null)
        bgp_origin_as_validation_enable                                = try(bgp_process.address_family.ipv4_unicast.bgp_origin_as_validation_enable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_origin_as_validation_enable, null)
        bgp_origin_as_validation_signal_ibgp                           = try(bgp_process.address_family.ipv4_unicast.bgp_origin_as_validation_signal_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_origin_as_validation_signal_ibgp, null)
        bgp_bestpath_origin_as_use_validity                            = try(bgp_process.address_family.ipv4_unicast.bgp_bestpath_origin_as_use_validity, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_bestpath_origin_as_use_validity, null)
        bgp_bestpath_origin_as_allow_invalid                           = try(bgp_process.address_family.ipv4_unicast.bgp_bestpath_origin_as_allow_invalid, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_bestpath_origin_as_allow_invalid, null)
        bgp_scan_time                                                  = try(bgp_process.address_family.ipv4_unicast.bgp_scan_time, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_scan_time, null)
        bgp_attribute_download                                         = try(bgp_process.address_family.ipv4_unicast.bgp_attribute_download, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_attribute_download, null)
        bgp_import_delay_seconds                                       = try(bgp_process.address_family.ipv4_unicast.bgp_import_delay_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_import_delay_seconds, null)
        bgp_import_delay_milliseconds                                  = try(bgp_process.address_family.ipv4_unicast.bgp_import_delay_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_import_delay_milliseconds, null)
        bgp_label_delay_seconds                                        = try(bgp_process.address_family.ipv4_unicast.bgp_label_delay_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_label_delay_seconds, null)
        bgp_label_delay_milliseconds                                   = try(bgp_process.address_family.ipv4_unicast.bgp_label_delay_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_label_delay_milliseconds, null)
        bgp_client_to_client_reflection_disable                        = try(bgp_process.address_family.ipv4_unicast.bgp_client_to_client_reflection_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_client_to_client_reflection_disable, null)
        bgp_client_to_client_reflection_cluster_ids_32bit_format = try(length(bgp_process.address_family.ipv4_unicast.bgp_client_to_client_reflection_cluster_ids) == 0, true) ? null : [
          for cluster in bgp_process.address_family.ipv4_unicast.bgp_client_to_client_reflection_cluster_ids : {
            cluster_as = try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null)
            disable    = try(cluster.disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_client_to_client_reflection_cluster_ids.disable, null)
          }
          if try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null) != null
        ]
        bgp_client_to_client_reflection_cluster_ids_ip_format = try(length(bgp_process.address_family.ipv4_unicast.bgp_client_to_client_reflection_cluster_ids) == 0, true) ? null : [
          for cluster in bgp_process.address_family.ipv4_unicast.bgp_client_to_client_reflection_cluster_ids : {
            cluster_ip = try(cluster.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id, null)
            disable    = try(cluster.disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_client_to_client_reflection_cluster_ids.disable, null)
          }
          if try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null) == null
        ]
        bgp_dampening_decay_half_life                            = try(bgp_process.address_family.ipv4_unicast.bgp_dampening_decay_half_life, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_dampening_decay_half_life, null)
        bgp_dampening_reuse_threshold                            = try(bgp_process.address_family.ipv4_unicast.bgp_dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_dampening_reuse_threshold, null)
        bgp_dampening_suppress_threshold                         = try(bgp_process.address_family.ipv4_unicast.bgp_dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_dampening_suppress_threshold, null)
        bgp_dampening_max_suppress_time                          = try(bgp_process.address_family.ipv4_unicast.bgp_dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_dampening_max_suppress_time, null)
        bgp_dampening_route_policy                               = try(bgp_process.address_family.ipv4_unicast.bgp_dampening_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.bgp_dampening_route_policy, null)
        event_prefix_route_policy                                = try(bgp_process.address_family.ipv4_unicast.event_prefix_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.event_prefix_route_policy, null)
        dynamic_med_interval                                     = try(bgp_process.address_family.ipv4_unicast.dynamic_med_interval, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.dynamic_med_interval, null)
        weight_reset_on_import                                   = try(bgp_process.address_family.ipv4_unicast.weight_reset_on_import, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.weight_reset_on_import, null)
        nexthop_route_policy                                     = try(bgp_process.address_family.ipv4_unicast.nexthop_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.nexthop_route_policy, null)
        nexthop_resolution_prefix_length_minimum_ipv4            = try(bgp_process.address_family.ipv4_unicast.nexthop_resolution_prefix_length_minimum_ipv4, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.nexthop_resolution_prefix_length_minimum_ipv4, null)
        nexthop_resolution_prefix_length_minimum_ipv6            = try(bgp_process.address_family.ipv4_unicast.nexthop_resolution_prefix_length_minimum_ipv6, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.nexthop_resolution_prefix_length_minimum_ipv6, null)
        update_limit_sub_group_ebgp                              = try(bgp_process.address_family.ipv4_unicast.update_limit_sub_group_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.update_limit_sub_group_ebgp, null)
        update_limit_sub_group_ibgp                              = try(bgp_process.address_family.ipv4_unicast.update_limit_sub_group_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.update_limit_sub_group_ibgp, null)
        update_limit_address_family                              = try(bgp_process.address_family.ipv4_unicast.update_limit_address_family, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.update_limit_address_family, null)
        update_wait_install                                      = try(bgp_process.address_family.ipv4_unicast.update_wait_install, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.update_wait_install, null)
        update_wait_install_delay_startup                        = try(bgp_process.address_family.ipv4_unicast.update_wait_install_delay_startup, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.update_wait_install_delay_startup, null)
        as_path_loopcheck_out_disable                            = try(bgp_process.address_family.ipv4_unicast.as_path_loopcheck_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.as_path_loopcheck_out_disable, null)
        inter_as_install                                         = try(bgp_process.address_family.ipv4_unicast.inter_as_install, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.inter_as_install, null)
        global_table_multicast                                   = try(bgp_process.address_family.ipv4_unicast.global_table_multicast, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.global_table_multicast, null)
        segmented_multicast                                      = try(bgp_process.address_family.ipv4_unicast.segmented_multicast, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.segmented_multicast, null)
        label_security_asbr_rpf                                  = try(bgp_process.address_family.ipv4_unicast.label_security_asbr_rpf, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.label_security_asbr_rpf, null)
        epe_backup_enable                                        = try(bgp_process.address_family.ipv4_unicast.epe_backup_enable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.epe_backup_enable, null)
        default_martian_check_disable                            = try(bgp_process.address_family.ipv4_unicast.default_martian_check_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.default_martian_check_disable, null)
        export_to_vrf_allow_backup                               = try(bgp_process.address_family.ipv4_unicast.export_to_vrf_allow_backup, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.export_to_vrf_allow_backup, null)
        export_to_vrf_allow_best_external                        = try(bgp_process.address_family.ipv4_unicast.export_to_vrf_allow_best_external, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.export_to_vrf_allow_best_external, null)
        segment_routing_prefix_sid_map                           = try(bgp_process.address_family.ipv4_unicast.segment_routing_prefix_sid_map, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.segment_routing_prefix_sid_map, null)
        segment_routing_srv6_locator                             = try(bgp_process.address_family.ipv4_unicast.segment_routing_srv6.locator, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.segment_routing_srv6.locator, null)
        segment_routing_srv6_usid_allocation_wide_local_id_block = try(bgp_process.address_family.ipv4_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, null)
        segment_routing_srv6_alloc_mode_per_ce                   = try(bgp_process.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode, null) == "per-ce" ? true : null
        segment_routing_srv6_alloc_mode_per_vrf                  = try(bgp_process.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf" ? true : null
        segment_routing_srv6_alloc_mode_per_vrf_46               = try(bgp_process.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf-46" ? true : null
        segment_routing_srv6_alloc_mode_route_policy             = try(bgp_process.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode_route_policy, null)
        aggregate_addresses = try(length(bgp_process.address_family.ipv4_unicast.aggregate_addresses) == 0, true) ? null : [for agg in bgp_process.address_family.ipv4_unicast.aggregate_addresses : {
          address       = try(agg.address, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.aggregate_addresses.address, null)
          prefix        = try(agg.mask, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.aggregate_addresses.mask, null)
          as_set        = try(agg.as_set, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.aggregate_addresses.as_set, null)
          as_confed_set = try(agg.as_confed_set, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.aggregate_addresses.as_confed_set, null)
          summary_only  = try(agg.summary_only, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.aggregate_addresses.summary_only, null)
          route_policy  = try(agg.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.aggregate_addresses.route_policy, null)
          description   = try(agg.description, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.aggregate_addresses.description, null)
          set_tag       = try(agg.set_tag, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.aggregate_addresses.set_tag, null)
          }
        ]
        networks = try(length(bgp_process.address_family.ipv4_unicast.networks) == 0, true) ? null : [for net in bgp_process.address_family.ipv4_unicast.networks : {
          address      = try(net.address, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.networks.address, null)
          prefix       = try(net.mask, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.networks.mask, null)
          route_policy = try(net.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.networks.route_policy, null)
          backdoor     = try(net.backdoor, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.networks.backdoor, null)
          multipath    = try(net.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.networks.multipath, null)
          }
        ]
        redistribute_ospf = try(length(bgp_process.address_family.ipv4_unicast.redistribute_ospf) == 0, true) ? null : [for ospf in bgp_process.address_family.ipv4_unicast.redistribute_ospf : {
          router_tag                                = try(ospf.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.instance_id, null)
          match_internal                            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-internal" ? true : null
          match_external                            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-external" ? true : null
          match_nssa_external                       = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-nssa-external" ? true : null
          match_internal_external                   = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-internal-external" ? true : null
          match_internal_external_1                 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-internal-external-1" ? true : null
          match_internal_external_1_nssa_external   = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-internal-external-1-nssa-external" ? true : null
          match_internal_external_1_nssa_external_1 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-internal-external-1-nssa-external-1" ? true : null
          match_internal_external_1_nssa_external_2 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-internal-external-1-nssa-external-2" ? true : null
          match_internal_external_2                 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-internal-external-2" ? true : null
          match_internal_external_2_nssa_external   = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-internal-external-2-nssa-external" ? true : null
          match_internal_external_2_nssa_external_1 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-internal-external-2-nssa-external-1" ? true : null
          match_internal_external_2_nssa_external_2 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-internal-external-2-nssa-external-2" ? true : null
          match_internal_external_nssa_external     = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-internal-external-nssa-external" ? true : null
          match_internal_external_nssa_external_1   = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-internal-external-nssa-external-1" ? true : null
          match_internal_external_nssa_external_2   = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-internal-external-nssa-external-2" ? true : null
          match_external_1                          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-external-1" ? true : null
          match_external_1_nssa_external            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-external-1-nssa-external" ? true : null
          match_external_1_nssa_external_1          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-external-1-nssa-external-1" ? true : null
          match_external_1_nssa_external_2          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-external-1-nssa-external-2" ? true : null
          match_external_2                          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-external-2" ? true : null
          match_external_2_nssa_external            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-external-2-nssa-external" ? true : null
          match_external_2_nssa_external_1          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-external-2-nssa-external-1" ? true : null
          match_external_2_nssa_external_2          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-external-2-nssa-external-2" ? true : null
          match_external_nssa_external              = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-external-nssa-external" ? true : null
          match_external_nssa_external_1            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-external-nssa-external-1" ? true : null
          match_external_nssa_external_2            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-external-nssa-external-2" ? true : null
          match_nssa_external_1                     = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-nssa-external-1" ? true : null
          match_nssa_external_2                     = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.match, null) == "match-nssa-external-2" ? true : null
          metric                                    = try(ospf.metric, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.metric, null)
          multipath                                 = try(ospf.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.multipath, null)
          route_policy                              = try(ospf.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_ospf.route_policy, null)
          }
        ]
        redistribute_eigrp = try(length(bgp_process.address_family.ipv4_unicast.redistribute_eigrp) == 0, true) ? null : [for eigrp in bgp_process.address_family.ipv4_unicast.redistribute_eigrp : {
          instance_name           = try(eigrp.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_eigrp.instance_id, null)
          match_internal          = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_eigrp.match, null) == "match-internal" ? true : null
          match_internal_external = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_eigrp.match, null) == "match-internal-external" ? true : null
          match_external          = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_eigrp.match, null) == "match-external" ? true : null
          metric                  = try(eigrp.metric, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_eigrp.metric, null)
          multipath               = try(eigrp.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_eigrp.multipath, null)
          route_policy            = try(eigrp.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_eigrp.route_policy, null)
          }
        ]
        redistribute_isis = try(length(bgp_process.address_family.ipv4_unicast.redistribute_isis) == 0, true) ? null : [for isis in bgp_process.address_family.ipv4_unicast.redistribute_isis : {
          instance_name                      = try(isis.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_isis.instance_id, null)
          level_1                            = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_isis.level, null) == "level-1" ? true : null
          level_1_level_2                    = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_isis.level, null) == "level-1-level-2" ? true : null
          level_1_level_2_level_1_inter_area = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_isis.level, null) == "level-1-level-2-level-1-inter-area" ? true : null
          level_1_level_1_inter_area         = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_isis.level, null) == "level-1-level-1-inter-area" ? true : null
          level_2                            = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_isis.level, null) == "level-2" ? true : null
          level_2_level_1_inter_area         = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_isis.level, null) == "level-2-level-1-inter-area" ? true : null
          level_1_inter_area                 = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_isis.level, null) == "level-1-inter-area" ? true : null
          metric                             = try(isis.metric, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_isis.metric, null)
          multipath                          = try(isis.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_isis.multipath, null)
          route_policy                       = try(isis.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.redistribute_isis.route_policy, null)
          }
        ]
        peer_set_ids = try(length(bgp_process.address_family.ipv4_unicast.peer_set_ids) == 0, true) ? null : [for peer_set in bgp_process.address_family.ipv4_unicast.peer_set_ids : {
          peer_id        = try(peer_set.peer_id, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.peer_set_ids.peer_id, null)
          peer_sid_index = try(peer_set.peer_sid_index, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.peer_set_ids.peer_sid_index, null)
          }
        ]
        }
      ] : []
    ]
  ])
}

resource "iosxr_router_bgp_address_family" "ipv4_unicast" {
  for_each                                                 = { for af in local.bgp_address_family_ipv4_unicast : af.key => af }
  device                                                   = each.value.device_name
  as_number                                                = each.value.as_number
  af_name                                                  = each.value.af_name
  distance_bgp_external_route                              = each.value.distance_bgp_external_route
  distance_bgp_internal_route                              = each.value.distance_bgp_internal_route
  distance_bgp_local_route                                 = each.value.distance_bgp_local_route
  import_from_bridge_domain                                = each.value.import_from_bridge_domain
  additional_paths_send                                    = each.value.additional_paths_send
  additional_paths_receive                                 = each.value.additional_paths_receive
  additional_paths_advertise_limit                         = each.value.additional_paths_advertise_limit
  additional_paths_selection_route_policy                  = each.value.additional_paths_selection_route_policy
  additional_paths_selection_disable                       = each.value.additional_paths_selection_disable
  permanent_network_route_policy                           = each.value.permanent_network_route_policy
  advertise_best_external_labeled_unicast                  = each.value.advertise_best_external_labeled_unicast
  advertise_best_external_disable                          = each.value.advertise_best_external_disable
  advertise_local_labeled_route_safi_unicast               = each.value.advertise_local_labeled_route_safi_unicast
  advertise_epe_bgp_labeled_unicast                        = each.value.advertise_epe_bgp_labeled_unicast
  allocate_label_all                                       = each.value.allocate_label_all
  allocate_label_all_unlabeled_path                        = each.value.allocate_label_all_unlabeled_path
  allocate_label_route_policy                              = each.value.allocate_label_route_policy
  allocate_label_route_policy_unlabeled_path               = each.value.allocate_label_route_policy_unlabeled_path
  advertise_best_external                                  = each.value.advertise_best_external
  maximum_paths_ebgp_multipath                             = each.value.maximum_paths_ebgp_multipath
  maximum_paths_ebgp_selective                             = each.value.maximum_paths_ebgp_selective
  maximum_paths_ebgp_route_policy                          = each.value.maximum_paths_ebgp_route_policy
  maximum_paths_ibgp_multipath                             = each.value.maximum_paths_ibgp_multipath
  maximum_paths_ibgp_unequal_cost                          = each.value.maximum_paths_ibgp_unequal_cost
  maximum_paths_ibgp_unequal_cost_deterministic            = each.value.maximum_paths_ibgp_unequal_cost_deterministic
  maximum_paths_ibgp_selective                             = each.value.maximum_paths_ibgp_selective
  maximum_paths_ibgp_route_policy                          = each.value.maximum_paths_ibgp_route_policy
  maximum_paths_eibgp_multipath                            = each.value.maximum_paths_eibgp_multipath
  maximum_paths_eibgp_equal_cost                           = each.value.maximum_paths_eibgp_equal_cost
  maximum_paths_eibgp_selective                            = each.value.maximum_paths_eibgp_selective
  maximum_paths_eibgp_route_policy                         = each.value.maximum_paths_eibgp_route_policy
  maximum_paths_unique_nexthop_check_disable               = each.value.maximum_paths_unique_nexthop_check_disable
  nexthop_trigger_delay_critical                           = each.value.nexthop_trigger_delay_critical
  nexthop_trigger_delay_non_critical                       = each.value.nexthop_trigger_delay_non_critical
  label_mode_per_prefix                                    = each.value.label_mode_per_prefix
  label_mode_per_ce                                        = each.value.label_mode_per_ce
  label_mode_per_vrf                                       = each.value.label_mode_per_vrf
  label_mode_per_vrf_46                                    = each.value.label_mode_per_vrf_46
  label_mode_route_policy                                  = each.value.label_mode_route_policy
  redistribute_connected                                   = each.value.redistribute_connected
  redistribute_connected_metric                            = each.value.redistribute_connected_metric
  redistribute_connected_multipath                         = each.value.redistribute_connected_multipath
  redistribute_connected_route_policy                      = each.value.redistribute_connected_route_policy
  redistribute_static                                      = each.value.redistribute_static
  redistribute_static_metric                               = each.value.redistribute_static_metric
  redistribute_static_multipath                            = each.value.redistribute_static_multipath
  redistribute_static_route_policy                         = each.value.redistribute_static_route_policy
  redistribute_rip                                         = each.value.redistribute_rip
  redistribute_rip_metric                                  = each.value.redistribute_rip_metric
  redistribute_rip_multipath                               = each.value.redistribute_rip_multipath
  redistribute_rip_route_policy                            = each.value.redistribute_rip_route_policy
  aggregate_addresses                                      = each.value.aggregate_addresses
  networks                                                 = each.value.networks
  redistribute_ospf                                        = each.value.redistribute_ospf
  redistribute_eigrp                                       = each.value.redistribute_eigrp
  redistribute_isis                                        = each.value.redistribute_isis
  table_policy                                             = each.value.table_policy
  retain_local_label                                       = each.value.retain_local_label
  rnh_install_extcomm                                      = each.value.rnh_install_extcomm
  rnh_install_extcomm_only                                 = each.value.rnh_install_extcomm_only
  prefix_ecmp_delay                                        = each.value.prefix_ecmp_delay
  prefix_ecmp_delay_oor_threshold                          = each.value.prefix_ecmp_delay_oor_threshold
  bgp_origin_as_validation_enable                          = each.value.bgp_origin_as_validation_enable
  bgp_origin_as_validation_signal_ibgp                     = each.value.bgp_origin_as_validation_signal_ibgp
  bgp_bestpath_origin_as_use_validity                      = each.value.bgp_bestpath_origin_as_use_validity
  bgp_bestpath_origin_as_allow_invalid                     = each.value.bgp_bestpath_origin_as_allow_invalid
  bgp_scan_time                                            = each.value.bgp_scan_time
  bgp_attribute_download                                   = each.value.bgp_attribute_download
  bgp_import_delay_seconds                                 = each.value.bgp_import_delay_seconds
  bgp_import_delay_milliseconds                            = each.value.bgp_import_delay_milliseconds
  bgp_label_delay_seconds                                  = each.value.bgp_label_delay_seconds
  bgp_label_delay_milliseconds                             = each.value.bgp_label_delay_milliseconds
  bgp_client_to_client_reflection_disable                  = each.value.bgp_client_to_client_reflection_disable
  bgp_client_to_client_reflection_cluster_ids_32bit_format = each.value.bgp_client_to_client_reflection_cluster_ids_32bit_format
  bgp_client_to_client_reflection_cluster_ids_ip_format    = each.value.bgp_client_to_client_reflection_cluster_ids_ip_format
  bgp_dampening_decay_half_life                            = each.value.bgp_dampening_decay_half_life
  bgp_dampening_reuse_threshold                            = each.value.bgp_dampening_reuse_threshold
  bgp_dampening_suppress_threshold                         = each.value.bgp_dampening_suppress_threshold
  bgp_dampening_max_suppress_time                          = each.value.bgp_dampening_max_suppress_time
  bgp_dampening_route_policy                               = each.value.bgp_dampening_route_policy
  event_prefix_route_policy                                = each.value.event_prefix_route_policy
  dynamic_med_interval                                     = each.value.dynamic_med_interval
  weight_reset_on_import                                   = each.value.weight_reset_on_import
  nexthop_route_policy                                     = each.value.nexthop_route_policy
  nexthop_resolution_prefix_length_minimum_ipv4            = each.value.nexthop_resolution_prefix_length_minimum_ipv4
  nexthop_resolution_prefix_length_minimum_ipv6            = each.value.nexthop_resolution_prefix_length_minimum_ipv6
  update_limit_sub_group_ebgp                              = each.value.update_limit_sub_group_ebgp
  update_limit_sub_group_ibgp                              = each.value.update_limit_sub_group_ibgp
  update_limit_address_family                              = each.value.update_limit_address_family
  update_wait_install                                      = each.value.update_wait_install
  update_wait_install_delay_startup                        = each.value.update_wait_install_delay_startup
  as_path_loopcheck_out_disable                            = each.value.as_path_loopcheck_out_disable
  epe_backup_enable                                        = each.value.epe_backup_enable
  default_martian_check_disable                            = each.value.default_martian_check_disable
  export_to_vrf_allow_backup                               = each.value.export_to_vrf_allow_backup
  export_to_vrf_allow_best_external                        = each.value.export_to_vrf_allow_best_external
  segment_routing_prefix_sid_map                           = each.value.segment_routing_prefix_sid_map
  segment_routing_srv6_locator                             = each.value.segment_routing_srv6_locator
  segment_routing_srv6_usid_allocation_wide_local_id_block = each.value.segment_routing_srv6_usid_allocation_wide_local_id_block
  segment_routing_srv6_alloc_mode_per_ce                   = each.value.segment_routing_srv6_alloc_mode_per_ce
  segment_routing_srv6_alloc_mode_per_vrf                  = each.value.segment_routing_srv6_alloc_mode_per_vrf
  segment_routing_srv6_alloc_mode_per_vrf_46               = each.value.segment_routing_srv6_alloc_mode_per_vrf_46
  segment_routing_srv6_alloc_mode_route_policy             = each.value.segment_routing_srv6_alloc_mode_route_policy
  peer_set_ids                                             = each.value.peer_set_ids

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_bgp.router_bgp
  ]
}

locals {
  bgp_address_family_ipv6_unicast = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) :
      contains(keys(try(bgp_process.address_family, {})), "ipv6_unicast") ? [{
        key                                                            = format("%s/%s/ipv6-unicast", device.name, bgp_process.as_number)
        device_name                                                    = device.name
        as_number                                                      = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
        af_name                                                        = "ipv6-unicast"
        distance_bgp_external_route                                    = try(bgp_process.address_family.ipv6_unicast.distance_bgp_external_route, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.distance_bgp_external_route, null)
        distance_bgp_internal_route                                    = try(bgp_process.address_family.ipv6_unicast.distance_bgp_internal_route, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.distance_bgp_internal_route, null)
        distance_bgp_local_route                                       = try(bgp_process.address_family.ipv6_unicast.distance_bgp_local_route, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.distance_bgp_local_route, null)
        import_from_bridge_domain                                      = try(bgp_process.address_family.ipv6_unicast.import_from_bridge_domain, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.import_from_bridge_domain, null)
        additional_paths_send                                          = try(bgp_process.address_family.ipv6_unicast.additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.additional_paths_send, null)
        additional_paths_receive                                       = try(bgp_process.address_family.ipv6_unicast.additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.additional_paths_receive, null)
        additional_paths_advertise_limit                               = try(bgp_process.address_family.ipv6_unicast.additional_paths_advertise_limit, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.additional_paths_advertise_limit, null)
        additional_paths_selection_route_policy                        = try(bgp_process.address_family.ipv6_unicast.additional_paths_selection_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.additional_paths_selection_route_policy, null)
        additional_paths_selection_disable                             = try(bgp_process.address_family.ipv6_unicast.additional_paths_selection_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.additional_paths_selection_disable, null)
        permanent_network_route_policy                                 = try(bgp_process.address_family.ipv6_unicast.permanent_network_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.permanent_network_route_policy, null)
        advertise_best_external                                        = try(bgp_process.address_family.ipv6_unicast.advertise_best_external, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.advertise_best_external, null)
        advertise_best_external_labeled_unicast                        = try(bgp_process.address_family.ipv6_unicast.advertise_best_external_labeled_unicast, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.advertise_best_external_labeled_unicast, null)
        advertise_best_external_disable                                = try(bgp_process.address_family.ipv6_unicast.advertise_best_external_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.advertise_best_external_disable, null)
        advertise_local_labeled_route_safi_unicast                     = try(bgp_process.address_family.ipv6_unicast.advertise_local_labeled_route_safi_unicast, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.advertise_local_labeled_route_safi_unicast, null)
        advertise_epe_bgp_labeled_unicast                              = try(bgp_process.address_family.ipv6_unicast.advertise_epe_bgp_labeled_unicast, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.advertise_epe_bgp_labeled_unicast, null)
        allocate_label_all                                             = try(bgp_process.address_family.ipv6_unicast.allocate_label_all, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.allocate_label_all, null)
        allocate_label_all_unlabeled_path                              = try(bgp_process.address_family.ipv6_unicast.allocate_label_all_unlabeled_path, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.allocate_label_all_unlabeled_path, null)
        allocate_label_route_policy                                    = try(bgp_process.address_family.ipv6_unicast.allocate_label_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.allocate_label_route_policy, null)
        allocate_label_route_policy_unlabeled_path                     = try(bgp_process.address_family.ipv6_unicast.allocate_label_route_policy_unlabeled_path, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.allocate_label_route_policy_unlabeled_path, null)
        maximum_paths_ebgp_multipath                                   = try(bgp_process.address_family.ipv6_unicast.maximum_paths_ebgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.maximum_paths_ebgp_multipath, null)
        maximum_paths_ebgp_selective                                   = try(bgp_process.address_family.ipv6_unicast.maximum_paths_ebgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.maximum_paths_ebgp_selective, null)
        maximum_paths_ebgp_route_policy                                = try(bgp_process.address_family.ipv6_unicast.maximum_paths_ebgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.maximum_paths_ebgp_route_policy, null)
        maximum_paths_ibgp_multipath                                   = try(bgp_process.address_family.ipv6_unicast.maximum_paths_ibgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.maximum_paths_ibgp_multipath, null)
        maximum_paths_ibgp_unequal_cost                                = try(bgp_process.address_family.ipv6_unicast.maximum_paths_ibgp_unequal_cost, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.maximum_paths_ibgp_unequal_cost, null)
        maximum_paths_ibgp_unequal_cost_deterministic                  = try(bgp_process.address_family.ipv6_unicast.maximum_paths_ibgp_unequal_cost_deterministic, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.maximum_paths_ibgp_unequal_cost_deterministic, null)
        maximum_paths_ibgp_selective                                   = try(bgp_process.address_family.ipv6_unicast.maximum_paths_ibgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.maximum_paths_ibgp_selective, null)
        maximum_paths_ibgp_route_policy                                = try(bgp_process.address_family.ipv6_unicast.maximum_paths_ibgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.maximum_paths_ibgp_route_policy, null)
        maximum_paths_eibgp_multipath                                  = try(bgp_process.address_family.ipv6_unicast.maximum_paths_eibgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.maximum_paths_eibgp_multipath, null)
        maximum_paths_eibgp_equal_cost                                 = try(bgp_process.address_family.ipv6_unicast.maximum_paths_eibgp_equal_cost, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.maximum_paths_eibgp_equal_cost, null)
        maximum_paths_eibgp_selective                                  = try(bgp_process.address_family.ipv6_unicast.maximum_paths_eibgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.maximum_paths_eibgp_selective, null)
        maximum_paths_eibgp_route_policy                               = try(bgp_process.address_family.ipv6_unicast.maximum_paths_eibgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.maximum_paths_eibgp_route_policy, null)
        maximum_paths_unique_nexthop_check_disable                     = try(bgp_process.address_family.ipv6_unicast.maximum_paths_unique_nexthop_check_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.maximum_paths_unique_nexthop_check_disable, null)
        nexthop_trigger_delay_critical                                 = try(bgp_process.address_family.ipv6_unicast.nexthop_trigger_delay_critical, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.nexthop_trigger_delay_critical, null)
        nexthop_trigger_delay_non_critical                             = try(bgp_process.address_family.ipv6_unicast.nexthop_trigger_delay_non_critical, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.nexthop_trigger_delay_non_critical, null)
        label_mode_per_prefix                                          = try(bgp_process.address_family.ipv6_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.label_mode, null) == "per-prefix" ? true : null
        label_mode_per_ce                                              = try(bgp_process.address_family.ipv6_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.label_mode, null) == "per-ce" ? true : null
        label_mode_per_vrf                                             = try(bgp_process.address_family.ipv6_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.label_mode, null) == "per-vrf" ? true : null
        label_mode_per_vrf_46                                          = try(bgp_process.address_family.ipv6_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.label_mode, null) == "per-vrf-46" ? true : null
        label_mode_route_policy                                        = try(bgp_process.address_family.ipv6_unicast.label_mode_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.label_mode_route_policy, null)
        label_mode_per_nexthop_received_label                          = (try(bgp_process.address_family.ipv6_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.label_mode, null) == "per-nexthop-received-label" || try(bgp_process.address_family.ipv6_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.label_mode, null) == "per-nexthop-received-label-allocate-secondary-label") ? true : null
        label_mode_per_nexthop_received_label_allocate_secondary_label = try(bgp_process.address_family.ipv6_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.label_mode, null) == "per-nexthop-received-label-allocate-secondary-label" ? true : null
        redistribute_connected                                         = try(bgp_process.address_family.ipv6_unicast.redistribute_connected, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_connected, null)
        redistribute_connected_metric                                  = try(bgp_process.address_family.ipv6_unicast.redistribute_connected_metric, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_connected_metric, null)
        redistribute_connected_multipath                               = try(bgp_process.address_family.ipv6_unicast.redistribute_connected_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_connected_multipath, null)
        redistribute_connected_route_policy                            = try(bgp_process.address_family.ipv6_unicast.redistribute_connected_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_connected_route_policy, null)
        redistribute_static                                            = try(bgp_process.address_family.ipv6_unicast.redistribute_static, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_static, null)
        redistribute_static_metric                                     = try(bgp_process.address_family.ipv6_unicast.redistribute_static_metric, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_static_metric, null)
        redistribute_static_multipath                                  = try(bgp_process.address_family.ipv6_unicast.redistribute_static_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_static_multipath, null)
        redistribute_static_route_policy                               = try(bgp_process.address_family.ipv6_unicast.redistribute_static_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_static_route_policy, null)
        redistribute_rip                                               = try(bgp_process.address_family.ipv6_unicast.redistribute_rip, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_rip, null)
        redistribute_rip_metric                                        = try(bgp_process.address_family.ipv6_unicast.redistribute_rip_metric, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_rip_metric, null)
        redistribute_rip_multipath                                     = try(bgp_process.address_family.ipv6_unicast.redistribute_rip_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_rip_multipath, null)
        redistribute_rip_route_policy                                  = try(bgp_process.address_family.ipv6_unicast.redistribute_rip_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_rip_route_policy, null)
        table_policy                                                   = try(bgp_process.address_family.ipv6_unicast.table_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.table_policy, null)
        retain_local_label                                             = try(bgp_process.address_family.ipv6_unicast.retain_local_label, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.retain_local_label, null)
        retain_route_target_all                                        = try(bgp_process.address_family.ipv6_unicast.retain_route_target_all, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.retain_route_target_all, null)
        retain_route_target_route_policy                               = try(bgp_process.address_family.ipv6_unicast.retain_route_target_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.retain_route_target_route_policy, null)
        rnh_install_extcomm                                            = try(bgp_process.address_family.ipv6_unicast.rnh_install_extcomm, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.rnh_install_extcomm, null)
        rnh_install_extcomm_only                                       = try(bgp_process.address_family.ipv6_unicast.rnh_install_extcomm_only, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.rnh_install_extcomm_only, null)
        prefix_ecmp_delay                                              = try(bgp_process.address_family.ipv6_unicast.prefix_ecmp_delay, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.prefix_ecmp_delay, null)
        prefix_ecmp_delay_oor_threshold                                = try(bgp_process.address_family.ipv6_unicast.prefix_ecmp_delay_oor_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.prefix_ecmp_delay_oor_threshold, null)
        bgp_origin_as_validation_enable                                = try(bgp_process.address_family.ipv6_unicast.bgp_origin_as_validation_enable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_origin_as_validation_enable, null)
        bgp_origin_as_validation_signal_ibgp                           = try(bgp_process.address_family.ipv6_unicast.bgp_origin_as_validation_signal_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_origin_as_validation_signal_ibgp, null)
        bgp_bestpath_origin_as_use_validity                            = try(bgp_process.address_family.ipv6_unicast.bgp_bestpath_origin_as_use_validity, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_bestpath_origin_as_use_validity, null)
        bgp_bestpath_origin_as_allow_invalid                           = try(bgp_process.address_family.ipv6_unicast.bgp_bestpath_origin_as_allow_invalid, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_bestpath_origin_as_allow_invalid, null)
        bgp_scan_time                                                  = try(bgp_process.address_family.ipv6_unicast.bgp_scan_time, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_scan_time, null)
        bgp_attribute_download                                         = try(bgp_process.address_family.ipv6_unicast.bgp_attribute_download, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_attribute_download, null)
        bgp_import_delay_seconds                                       = try(bgp_process.address_family.ipv6_unicast.bgp_import_delay_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_import_delay_seconds, null)
        bgp_import_delay_milliseconds                                  = try(bgp_process.address_family.ipv6_unicast.bgp_import_delay_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_import_delay_milliseconds, null)
        bgp_label_delay_seconds                                        = try(bgp_process.address_family.ipv6_unicast.bgp_label_delay_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_label_delay_seconds, null)
        bgp_label_delay_milliseconds                                   = try(bgp_process.address_family.ipv6_unicast.bgp_label_delay_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_label_delay_milliseconds, null)
        bgp_client_to_client_reflection_disable                        = try(bgp_process.address_family.ipv6_unicast.bgp_client_to_client_reflection_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_client_to_client_reflection_disable, null)
        bgp_client_to_client_reflection_cluster_ids_32bit_format = try(length(bgp_process.address_family.ipv6_unicast.bgp_client_to_client_reflection_cluster_ids) == 0, true) ? null : [
          for cluster in bgp_process.address_family.ipv6_unicast.bgp_client_to_client_reflection_cluster_ids : {
            cluster_as = try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null)
            disable    = try(cluster.disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_client_to_client_reflection_cluster_ids.disable, null)
          }
          if try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null) != null
        ]
        bgp_client_to_client_reflection_cluster_ids_ip_format = try(length(bgp_process.address_family.ipv6_unicast.bgp_client_to_client_reflection_cluster_ids) == 0, true) ? null : [
          for cluster in bgp_process.address_family.ipv6_unicast.bgp_client_to_client_reflection_cluster_ids : {
            cluster_ip = try(cluster.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id, null)
            disable    = try(cluster.disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_client_to_client_reflection_cluster_ids.disable, null)
          }
          if try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null) == null
        ]
        bgp_dampening_decay_half_life                            = try(bgp_process.address_family.ipv6_unicast.bgp_dampening_decay_half_life, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_dampening_decay_half_life, null)
        bgp_dampening_reuse_threshold                            = try(bgp_process.address_family.ipv6_unicast.bgp_dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_dampening_reuse_threshold, null)
        bgp_dampening_suppress_threshold                         = try(bgp_process.address_family.ipv6_unicast.bgp_dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_dampening_suppress_threshold, null)
        bgp_dampening_max_suppress_time                          = try(bgp_process.address_family.ipv6_unicast.bgp_dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_dampening_max_suppress_time, null)
        bgp_dampening_route_policy                               = try(bgp_process.address_family.ipv6_unicast.bgp_dampening_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.bgp_dampening_route_policy, null)
        event_prefix_route_policy                                = try(bgp_process.address_family.ipv6_unicast.event_prefix_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.event_prefix_route_policy, null)
        dynamic_med_interval                                     = try(bgp_process.address_family.ipv6_unicast.dynamic_med_interval, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.dynamic_med_interval, null)
        weight_reset_on_import                                   = try(bgp_process.address_family.ipv6_unicast.weight_reset_on_import, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.weight_reset_on_import, null)
        nexthop_route_policy                                     = try(bgp_process.address_family.ipv6_unicast.nexthop_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.nexthop_route_policy, null)
        nexthop_resolution_prefix_length_minimum_ipv4            = try(bgp_process.address_family.ipv6_unicast.nexthop_resolution_prefix_length_minimum_ipv4, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.nexthop_resolution_prefix_length_minimum_ipv4, null)
        nexthop_resolution_prefix_length_minimum_ipv6            = try(bgp_process.address_family.ipv6_unicast.nexthop_resolution_prefix_length_minimum_ipv6, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.nexthop_resolution_prefix_length_minimum_ipv6, null)
        update_limit_sub_group_ebgp                              = try(bgp_process.address_family.ipv6_unicast.update_limit_sub_group_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.update_limit_sub_group_ebgp, null)
        update_limit_sub_group_ibgp                              = try(bgp_process.address_family.ipv6_unicast.update_limit_sub_group_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.update_limit_sub_group_ibgp, null)
        update_limit_address_family                              = try(bgp_process.address_family.ipv6_unicast.update_limit_address_family, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.update_limit_address_family, null)
        update_wait_install                                      = try(bgp_process.address_family.ipv6_unicast.update_wait_install, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.update_wait_install, null)
        update_wait_install_delay_startup                        = try(bgp_process.address_family.ipv6_unicast.update_wait_install_delay_startup, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.update_wait_install_delay_startup, null)
        as_path_loopcheck_out_disable                            = try(bgp_process.address_family.ipv6_unicast.as_path_loopcheck_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.as_path_loopcheck_out_disable, null)
        inter_as_install                                         = try(bgp_process.address_family.ipv6_unicast.inter_as_install, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.inter_as_install, null)
        global_table_multicast                                   = try(bgp_process.address_family.ipv6_unicast.global_table_multicast, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.global_table_multicast, null)
        segmented_multicast                                      = try(bgp_process.address_family.ipv6_unicast.segmented_multicast, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.segmented_multicast, null)
        label_security_asbr_rpf                                  = try(bgp_process.address_family.ipv6_unicast.label_security_asbr_rpf, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.label_security_asbr_rpf, null)
        epe_backup_enable                                        = try(bgp_process.address_family.ipv6_unicast.epe_backup_enable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.epe_backup_enable, null)
        default_martian_check_disable                            = try(bgp_process.address_family.ipv6_unicast.default_martian_check_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.default_martian_check_disable, null)
        export_to_vrf_allow_backup                               = try(bgp_process.address_family.ipv6_unicast.export_to_vrf_allow_backup, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.export_to_vrf_allow_backup, null)
        export_to_vrf_allow_best_external                        = try(bgp_process.address_family.ipv6_unicast.export_to_vrf_allow_best_external, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.export_to_vrf_allow_best_external, null)
        segment_routing_prefix_sid_map                           = try(bgp_process.address_family.ipv6_unicast.segment_routing_prefix_sid_map, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.segment_routing_prefix_sid_map, null)
        segment_routing_srv6_locator                             = try(bgp_process.address_family.ipv6_unicast.segment_routing_srv6.locator, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.segment_routing_srv6.locator, null)
        segment_routing_srv6_usid_allocation_wide_local_id_block = try(bgp_process.address_family.ipv6_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, null)
        segment_routing_srv6_alloc_mode_per_ce                   = try(bgp_process.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode, null) == "per-ce" ? true : null
        segment_routing_srv6_alloc_mode_per_vrf                  = try(bgp_process.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf" ? true : null
        segment_routing_srv6_alloc_mode_per_vrf_46               = try(bgp_process.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf-46" ? true : null
        segment_routing_srv6_alloc_mode_route_policy             = try(bgp_process.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode_route_policy, null)
        aggregate_addresses = try(length(bgp_process.address_family.ipv6_unicast.aggregate_addresses) == 0, true) ? null : [for agg in bgp_process.address_family.ipv6_unicast.aggregate_addresses : {
          address       = try(agg.address, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.aggregate_addresses.address, null)
          prefix        = try(agg.mask, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.aggregate_addresses.mask, null)
          as_set        = try(agg.as_set, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.aggregate_addresses.as_set, null)
          as_confed_set = try(agg.as_confed_set, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.aggregate_addresses.as_confed_set, null)
          summary_only  = try(agg.summary_only, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.aggregate_addresses.summary_only, null)
          route_policy  = try(agg.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.aggregate_addresses.route_policy, null)
          description   = try(agg.description, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.aggregate_addresses.description, null)
          set_tag       = try(agg.set_tag, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.aggregate_addresses.set_tag, null)
          }
        ]
        networks = try(length(bgp_process.address_family.ipv6_unicast.networks) == 0, true) ? null : [for net in bgp_process.address_family.ipv6_unicast.networks : {
          address      = try(net.address, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.networks.address, null)
          prefix       = try(net.mask, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.networks.mask, null)
          route_policy = try(net.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.networks.route_policy, null)
          backdoor     = try(net.backdoor, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.networks.backdoor, null)
          multipath    = try(net.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.networks.multipath, null)
          }
        ]
        redistribute_ospfv3 = try(length(bgp_process.address_family.ipv6_unicast.redistribute_ospfv3) == 0, true) ? null : [for ospfv3 in bgp_process.address_family.ipv6_unicast.redistribute_ospfv3 : {
          router_tag                                = try(ospfv3.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.instance_id, null)
          match_internal                            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal" ? true : null
          match_external                            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external" ? true : null
          match_nssa_external                       = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-nssa-external" ? true : null
          match_internal_external                   = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external" ? true : null
          match_internal_external_1                 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-1" ? true : null
          match_internal_external_1_nssa_external   = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-1-nssa-external" ? true : null
          match_internal_external_1_nssa_external_1 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-1-nssa-external-1" ? true : null
          match_internal_external_1_nssa_external_2 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-1-nssa-external-2" ? true : null
          match_internal_external_2                 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-2" ? true : null
          match_internal_external_2_nssa_external   = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-2-nssa-external" ? true : null
          match_internal_external_2_nssa_external_1 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-2-nssa-external-1" ? true : null
          match_internal_external_2_nssa_external_2 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-2-nssa-external-2" ? true : null
          match_internal_external_nssa_external     = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-nssa-external" ? true : null
          match_internal_external_nssa_external_1   = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-nssa-external-1" ? true : null
          match_internal_external_nssa_external_2   = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-nssa-external-2" ? true : null
          match_external_1                          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-1" ? true : null
          match_external_1_nssa_external            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-1-nssa-external" ? true : null
          match_external_1_nssa_external_1          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-1-nssa-external-1" ? true : null
          match_external_1_nssa_external_2          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-1-nssa-external-2" ? true : null
          match_external_2                          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-2" ? true : null
          match_external_2_nssa_external            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-2-nssa-external" ? true : null
          match_external_2_nssa_external_1          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-2-nssa-external-1" ? true : null
          match_external_2_nssa_external_2          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-2-nssa-external-2" ? true : null
          match_external_nssa_external              = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-nssa-external" ? true : null
          match_external_nssa_external_1            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-nssa-external-1" ? true : null
          match_external_nssa_external_2            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-nssa-external-2" ? true : null
          match_nssa_external_1                     = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-nssa-external-1" ? true : null
          match_nssa_external_2                     = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-nssa-external-2" ? true : null
          metric                                    = try(ospfv3.metric, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.metric, null)
          multipath                                 = try(ospfv3.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.multipath, null)
          route_policy                              = try(ospfv3.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_ospfv3.route_policy, null)
          }
        ]
        redistribute_eigrp = try(length(bgp_process.address_family.ipv6_unicast.redistribute_eigrp) == 0, true) ? null : [for eigrp in bgp_process.address_family.ipv6_unicast.redistribute_eigrp : {
          instance_name           = try(eigrp.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_eigrp.instance_id, null)
          match_internal          = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_eigrp.match, null) == "match-internal" ? true : null
          match_internal_external = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_eigrp.match, null) == "match-internal-external" ? true : null
          match_external          = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_eigrp.match, null) == "match-external" ? true : null
          metric                  = try(eigrp.metric, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_eigrp.metric, null)
          multipath               = try(eigrp.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_eigrp.multipath, null)
          route_policy            = try(eigrp.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_eigrp.route_policy, null)
          }
        ]
        redistribute_isis = try(length(bgp_process.address_family.ipv6_unicast.redistribute_isis) == 0, true) ? null : [for isis in bgp_process.address_family.ipv6_unicast.redistribute_isis : {
          instance_name                      = try(isis.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_isis.instance_id, null)
          level_1                            = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_isis.level, null) == "level-1" ? true : null
          level_1_level_2                    = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_isis.level, null) == "level-1-level-2" ? true : null
          level_1_level_2_level_1_inter_area = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_isis.level, null) == "level-1-level-2-level-1-inter-area" ? true : null
          level_1_level_1_inter_area         = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_isis.level, null) == "level-1-level-1-inter-area" ? true : null
          level_2                            = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_isis.level, null) == "level-2" ? true : null
          level_2_level_1_inter_area         = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_isis.level, null) == "level-2-level-1-inter-area" ? true : null
          level_1_inter_area                 = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_isis.level, null) == "level-1-inter-area" ? true : null
          metric                             = try(isis.metric, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_isis.metric, null)
          multipath                          = try(isis.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_isis.multipath, null)
          route_policy                       = try(isis.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.redistribute_isis.route_policy, null)
          }
        ]
        peer_set_ids = try(length(bgp_process.address_family.ipv6_unicast.peer_set_ids) == 0, true) ? null : [for peer_set in bgp_process.address_family.ipv6_unicast.peer_set_ids : {
          peer_id        = try(peer_set.peer_id, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.peer_set_ids.peer_id, null)
          peer_sid_index = try(peer_set.peer_sid_index, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.ipv6_unicast.peer_set_ids.peer_sid_index, null)
          }
        ]
        }
      ] : []
    ]
  ])
}

resource "iosxr_router_bgp_address_family" "ipv6_unicast" {
  for_each                                                 = { for af in local.bgp_address_family_ipv6_unicast : af.key => af }
  device                                                   = each.value.device_name
  as_number                                                = each.value.as_number
  af_name                                                  = each.value.af_name
  distance_bgp_external_route                              = each.value.distance_bgp_external_route
  distance_bgp_internal_route                              = each.value.distance_bgp_internal_route
  distance_bgp_local_route                                 = each.value.distance_bgp_local_route
  import_from_bridge_domain                                = each.value.import_from_bridge_domain
  additional_paths_send                                    = each.value.additional_paths_send
  additional_paths_receive                                 = each.value.additional_paths_receive
  additional_paths_advertise_limit                         = each.value.additional_paths_advertise_limit
  additional_paths_selection_route_policy                  = each.value.additional_paths_selection_route_policy
  additional_paths_selection_disable                       = each.value.additional_paths_selection_disable
  permanent_network_route_policy                           = each.value.permanent_network_route_policy
  advertise_best_external_labeled_unicast                  = each.value.advertise_best_external_labeled_unicast
  advertise_best_external_disable                          = each.value.advertise_best_external_disable
  advertise_local_labeled_route_safi_unicast               = each.value.advertise_local_labeled_route_safi_unicast
  advertise_epe_bgp_labeled_unicast                        = each.value.advertise_epe_bgp_labeled_unicast
  allocate_label_all                                       = each.value.allocate_label_all
  allocate_label_all_unlabeled_path                        = each.value.allocate_label_all_unlabeled_path
  allocate_label_route_policy                              = each.value.allocate_label_route_policy
  allocate_label_route_policy_unlabeled_path               = each.value.allocate_label_route_policy_unlabeled_path
  advertise_best_external                                  = each.value.advertise_best_external
  maximum_paths_ebgp_multipath                             = each.value.maximum_paths_ebgp_multipath
  maximum_paths_ebgp_selective                             = each.value.maximum_paths_ebgp_selective
  maximum_paths_ebgp_route_policy                          = each.value.maximum_paths_ebgp_route_policy
  maximum_paths_ibgp_multipath                             = each.value.maximum_paths_ibgp_multipath
  maximum_paths_ibgp_unequal_cost                          = each.value.maximum_paths_ibgp_unequal_cost
  maximum_paths_ibgp_unequal_cost_deterministic            = each.value.maximum_paths_ibgp_unequal_cost_deterministic
  maximum_paths_ibgp_selective                             = each.value.maximum_paths_ibgp_selective
  maximum_paths_ibgp_route_policy                          = each.value.maximum_paths_ibgp_route_policy
  maximum_paths_eibgp_multipath                            = each.value.maximum_paths_eibgp_multipath
  maximum_paths_eibgp_equal_cost                           = each.value.maximum_paths_eibgp_equal_cost
  maximum_paths_eibgp_selective                            = each.value.maximum_paths_eibgp_selective
  maximum_paths_eibgp_route_policy                         = each.value.maximum_paths_eibgp_route_policy
  maximum_paths_unique_nexthop_check_disable               = each.value.maximum_paths_unique_nexthop_check_disable
  nexthop_trigger_delay_critical                           = each.value.nexthop_trigger_delay_critical
  nexthop_trigger_delay_non_critical                       = each.value.nexthop_trigger_delay_non_critical
  redistribute_connected                                   = each.value.redistribute_connected
  redistribute_connected_metric                            = each.value.redistribute_connected_metric
  redistribute_connected_multipath                         = each.value.redistribute_connected_multipath
  redistribute_connected_route_policy                      = each.value.redistribute_connected_route_policy
  redistribute_static                                      = each.value.redistribute_static
  redistribute_static_metric                               = each.value.redistribute_static_metric
  redistribute_static_multipath                            = each.value.redistribute_static_multipath
  redistribute_static_route_policy                         = each.value.redistribute_static_route_policy
  redistribute_rip                                         = each.value.redistribute_rip
  redistribute_rip_metric                                  = each.value.redistribute_rip_metric
  redistribute_rip_multipath                               = each.value.redistribute_rip_multipath
  redistribute_rip_route_policy                            = each.value.redistribute_rip_route_policy
  aggregate_addresses                                      = each.value.aggregate_addresses
  networks                                                 = each.value.networks
  redistribute_ospf                                        = each.value.redistribute_ospfv3
  redistribute_eigrp                                       = each.value.redistribute_eigrp
  redistribute_isis                                        = each.value.redistribute_isis
  table_policy                                             = each.value.table_policy
  retain_local_label                                       = each.value.retain_local_label
  rnh_install_extcomm                                      = each.value.rnh_install_extcomm
  rnh_install_extcomm_only                                 = each.value.rnh_install_extcomm_only
  prefix_ecmp_delay                                        = each.value.prefix_ecmp_delay
  prefix_ecmp_delay_oor_threshold                          = each.value.prefix_ecmp_delay_oor_threshold
  bgp_origin_as_validation_enable                          = each.value.bgp_origin_as_validation_enable
  bgp_origin_as_validation_signal_ibgp                     = each.value.bgp_origin_as_validation_signal_ibgp
  bgp_bestpath_origin_as_use_validity                      = each.value.bgp_bestpath_origin_as_use_validity
  bgp_bestpath_origin_as_allow_invalid                     = each.value.bgp_bestpath_origin_as_allow_invalid
  bgp_scan_time                                            = each.value.bgp_scan_time
  bgp_attribute_download                                   = each.value.bgp_attribute_download
  bgp_import_delay_seconds                                 = each.value.bgp_import_delay_seconds
  bgp_import_delay_milliseconds                            = each.value.bgp_import_delay_milliseconds
  bgp_label_delay_seconds                                  = each.value.bgp_label_delay_seconds
  bgp_label_delay_milliseconds                             = each.value.bgp_label_delay_milliseconds
  bgp_client_to_client_reflection_disable                  = each.value.bgp_client_to_client_reflection_disable
  bgp_client_to_client_reflection_cluster_ids_32bit_format = each.value.bgp_client_to_client_reflection_cluster_ids_32bit_format
  bgp_client_to_client_reflection_cluster_ids_ip_format    = each.value.bgp_client_to_client_reflection_cluster_ids_ip_format
  bgp_dampening_decay_half_life                            = each.value.bgp_dampening_decay_half_life
  bgp_dampening_reuse_threshold                            = each.value.bgp_dampening_reuse_threshold
  bgp_dampening_suppress_threshold                         = each.value.bgp_dampening_suppress_threshold
  bgp_dampening_max_suppress_time                          = each.value.bgp_dampening_max_suppress_time
  bgp_dampening_route_policy                               = each.value.bgp_dampening_route_policy
  event_prefix_route_policy                                = each.value.event_prefix_route_policy
  dynamic_med_interval                                     = each.value.dynamic_med_interval
  weight_reset_on_import                                   = each.value.weight_reset_on_import
  nexthop_route_policy                                     = each.value.nexthop_route_policy
  update_limit_sub_group_ebgp                              = each.value.update_limit_sub_group_ebgp
  update_limit_sub_group_ibgp                              = each.value.update_limit_sub_group_ibgp
  update_limit_address_family                              = each.value.update_limit_address_family
  update_wait_install                                      = each.value.update_wait_install
  update_wait_install_delay_startup                        = each.value.update_wait_install_delay_startup
  as_path_loopcheck_out_disable                            = each.value.as_path_loopcheck_out_disable
  epe_backup_enable                                        = each.value.epe_backup_enable
  default_martian_check_disable                            = each.value.default_martian_check_disable
  export_to_vrf_allow_backup                               = each.value.export_to_vrf_allow_backup
  export_to_vrf_allow_best_external                        = each.value.export_to_vrf_allow_best_external
  segment_routing_srv6_locator                             = each.value.segment_routing_srv6_locator
  segment_routing_srv6_usid_allocation_wide_local_id_block = each.value.segment_routing_srv6_usid_allocation_wide_local_id_block
  segment_routing_srv6_alloc_mode_per_ce                   = each.value.segment_routing_srv6_alloc_mode_per_ce
  segment_routing_srv6_alloc_mode_per_vrf                  = each.value.segment_routing_srv6_alloc_mode_per_vrf
  segment_routing_srv6_alloc_mode_per_vrf_46               = each.value.segment_routing_srv6_alloc_mode_per_vrf_46
  segment_routing_srv6_alloc_mode_route_policy             = each.value.segment_routing_srv6_alloc_mode_route_policy
  peer_set_ids                                             = each.value.peer_set_ids

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_bgp.router_bgp
  ]
}

locals {
  bgp_address_family_vpnv4_unicast = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) :
      contains(keys(try(bgp_process.address_family, {})), "vpnv4_unicast") ? [{
        key                                                              = format("%s/%s/vpnv4-unicast", device.name, bgp_process.as_number)
        device_name                                                      = device.name
        as_number                                                        = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
        af_name                                                          = "vpnv4-unicast"
        vrf_all_segment_routing_srv6_locator                             = try(bgp_process.address_family.vpnv4_unicast.segment_routing_srv6.locator, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.segment_routing_srv6.locator, null)
        vrf_all_segment_routing_srv6_usid_allocation_wide_local_id_block = try(bgp_process.address_family.vpnv4_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, null)
        vrf_all_segment_routing_srv6_alloc_mode_per_ce                   = try(bgp_process.address_family.vpnv4_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.segment_routing_srv6.alloc_mode, null) == "per-ce" ? true : null
        vrf_all_segment_routing_srv6_alloc_mode_per_vrf                  = try(bgp_process.address_family.vpnv4_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf" ? true : null
        vrf_all_segment_routing_srv6_alloc_mode_per_vrf_46               = try(bgp_process.address_family.vpnv4_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf-46" ? true : null
        vrf_all_source_rt_import_policy                                  = try(bgp_process.address_family.vpnv4_unicast.source_rt_import_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.source_rt_import_policy, null)
        vrf_all_label_mode_per_ce                                        = try(bgp_process.address_family.vpnv4_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.label_mode, null) == "per-ce" ? true : null
        vrf_all_label_mode_per_vrf                                       = try(bgp_process.address_family.vpnv4_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.label_mode, null) == "per-vrf" ? true : null
        vrf_all_label_mode_per_vrf_46                                    = try(bgp_process.address_family.vpnv4_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.label_mode, null) == "per-vrf-46" ? true : null
        vrf_all_label_mode_route_policy                                  = try(bgp_process.address_family.vpnv4_unicast.label_mode_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.label_mode_route_policy, null)
        vrf_all_rnh_install_extcomm                                      = try(bgp_process.address_family.vpnv4_unicast.rnh_install_extcomm, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.rnh_install_extcomm, null)
        vrf_all_rnh_install_extcomm_only                                 = try(bgp_process.address_family.vpnv4_unicast.rnh_install_extcomm_only, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.rnh_install_extcomm_only, null)
        vrf_all_table_policy                                             = try(bgp_process.address_family.vpnv4_unicast.table_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.table_policy, null)
        additional_paths_send                                            = try(bgp_process.address_family.vpnv4_unicast.additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.additional_paths_send, null)
        additional_paths_receive                                         = try(bgp_process.address_family.vpnv4_unicast.additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.additional_paths_receive, null)
        additional_paths_advertise_limit                                 = try(bgp_process.address_family.vpnv4_unicast.additional_paths_advertise_limit, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.additional_paths_advertise_limit, null)
        additional_paths_selection_route_policy                          = try(bgp_process.address_family.vpnv4_unicast.additional_paths_selection_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.additional_paths_selection_route_policy, null)
        advertise_best_external                                          = try(bgp_process.address_family.vpnv4_unicast.advertise_best_external, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.advertise_best_external, null)
        advertise_best_external_disable                                  = try(bgp_process.address_family.vpnv4_unicast.advertise_best_external_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.advertise_best_external_disable, null)
        nexthop_trigger_delay_critical                                   = try(bgp_process.address_family.vpnv4_unicast.nexthop_trigger_delay_critical, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.nexthop_trigger_delay_critical, null)
        nexthop_trigger_delay_non_critical                               = try(bgp_process.address_family.vpnv4_unicast.nexthop_trigger_delay_non_critical, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.nexthop_trigger_delay_non_critical, null)
        label_mode_per_nexthop_received_label                            = try(bgp_process.address_family.vpnv4_unicast.label_mode_per_nexthop_received_label, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.label_mode_per_nexthop_received_label, null)
        label_mode_per_nexthop_received_label_allocate_secondary_label   = try(bgp_process.address_family.vpnv4_unicast.label_mode_per_nexthop_received_label_allocate_secondary_label, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.label_mode_per_nexthop_received_label_allocate_secondary_label, null)
        retain_local_label                                               = try(bgp_process.address_family.vpnv4_unicast.retain_local_label, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.retain_local_label, null)
        retain_route_target_all                                          = try(bgp_process.address_family.vpnv4_unicast.retain_route_target_all, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.retain_route_target_all, null)
        retain_route_target_route_policy                                 = try(bgp_process.address_family.vpnv4_unicast.retain_route_target_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.retain_route_target_route_policy, null)
        bgp_scan_time                                                    = try(bgp_process.address_family.vpnv4_unicast.bgp_scan_time, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_scan_time, null)
        bgp_import_delay_seconds                                         = try(bgp_process.address_family.vpnv4_unicast.bgp_import_delay_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_import_delay_seconds, null)
        bgp_import_delay_milliseconds                                    = try(bgp_process.address_family.vpnv4_unicast.bgp_import_delay_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_import_delay_milliseconds, null)
        bgp_label_delay_seconds                                          = try(bgp_process.address_family.vpnv4_unicast.bgp_label_delay_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_label_delay_seconds, null)
        bgp_label_delay_milliseconds                                     = try(bgp_process.address_family.vpnv4_unicast.bgp_label_delay_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_label_delay_milliseconds, null)
        bgp_client_to_client_reflection_disable                          = try(bgp_process.address_family.vpnv4_unicast.bgp_client_to_client_reflection_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_client_to_client_reflection_disable, null)
        bgp_client_to_client_reflection_cluster_ids_32bit_format = try(length(bgp_process.address_family.vpnv4_unicast.bgp_client_to_client_reflection_cluster_ids) == 0, true) ? null : [
          for cluster in bgp_process.address_family.vpnv4_unicast.bgp_client_to_client_reflection_cluster_ids : {
            cluster_as = try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null)
            disable    = try(cluster.disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_client_to_client_reflection_cluster_ids.disable, null)
          }
          if try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null) != null
        ]
        bgp_client_to_client_reflection_cluster_ids_ip_format = try(length(bgp_process.address_family.vpnv4_unicast.bgp_client_to_client_reflection_cluster_ids) == 0, true) ? null : [
          for cluster in bgp_process.address_family.vpnv4_unicast.bgp_client_to_client_reflection_cluster_ids : {
            cluster_ip = try(cluster.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id, null)
            disable    = try(cluster.disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_client_to_client_reflection_cluster_ids.disable, null)
          }
          if try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null) == null
        ]
        bgp_dampening_decay_half_life                            = try(bgp_process.address_family.vpnv4_unicast.bgp_dampening_decay_half_life, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_dampening_decay_half_life, null)
        bgp_dampening_reuse_threshold                            = try(bgp_process.address_family.vpnv4_unicast.bgp_dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_dampening_reuse_threshold, null)
        bgp_dampening_suppress_threshold                         = try(bgp_process.address_family.vpnv4_unicast.bgp_dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_dampening_suppress_threshold, null)
        bgp_dampening_max_suppress_time                          = try(bgp_process.address_family.vpnv4_unicast.bgp_dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_dampening_max_suppress_time, null)
        bgp_dampening_route_policy                               = try(bgp_process.address_family.vpnv4_unicast.bgp_dampening_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.bgp_dampening_route_policy, null)
        event_prefix_route_policy                                = try(bgp_process.address_family.vpnv4_unicast.event_prefix_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.event_prefix_route_policy, null)
        dynamic_med_interval                                     = try(bgp_process.address_family.vpnv4_unicast.dynamic_med_interval, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.dynamic_med_interval, null)
        weight_reset_on_import                                   = try(bgp_process.address_family.vpnv4_unicast.weight_reset_on_import, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.weight_reset_on_import, null)
        nexthop_route_policy                                     = try(bgp_process.address_family.vpnv4_unicast.nexthop_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.nexthop_route_policy, null)
        nexthop_resolution_prefix_length_minimum_ipv4            = try(bgp_process.address_family.vpnv4_unicast.nexthop_resolution_prefix_length_minimum_ipv4, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.nexthop_resolution_prefix_length_minimum_ipv4, null)
        nexthop_resolution_prefix_length_minimum_ipv6            = try(bgp_process.address_family.vpnv4_unicast.nexthop_resolution_prefix_length_minimum_ipv6, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.nexthop_resolution_prefix_length_minimum_ipv6, null)
        update_limit_sub_group_ebgp                              = try(bgp_process.address_family.vpnv4_unicast.update_limit_sub_group_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.update_limit_sub_group_ebgp, null)
        update_limit_sub_group_ibgp                              = try(bgp_process.address_family.vpnv4_unicast.update_limit_sub_group_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.update_limit_sub_group_ibgp, null)
        update_limit_address_family                              = try(bgp_process.address_family.vpnv4_unicast.update_limit_address_family, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.update_limit_address_family, null)
        update_wait_install                                      = try(bgp_process.address_family.vpnv4_unicast.update_wait_install, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.update_wait_install, null)
        update_wait_install_delay_startup                        = try(bgp_process.address_family.vpnv4_unicast.update_wait_install_delay_startup, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.update_wait_install_delay_startup, null)
        as_path_loopcheck_out_disable                            = try(bgp_process.address_family.vpnv4_unicast.as_path_loopcheck_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.as_path_loopcheck_out_disable, null)
        default_martian_check_disable                            = try(bgp_process.address_family.vpnv4_unicast.default_martian_check_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.default_martian_check_disable, null)
        export_to_vrf_allow_backup                               = try(bgp_process.address_family.vpnv4_unicast.export_to_vrf_allow_backup, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.export_to_vrf_allow_backup, null)
        export_to_vrf_allow_best_external                        = try(bgp_process.address_family.vpnv4_unicast.export_to_vrf_allow_best_external, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.export_to_vrf_allow_best_external, null)
        segment_routing_srv6_locator                             = try(bgp_process.address_family.vpnv4_unicast.segment_routing_srv6.locator, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.segment_routing_srv6.locator, null)
        segment_routing_srv6_usid_allocation_wide_local_id_block = try(bgp_process.address_family.vpnv4_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, null)
        segment_routing_srv6_alloc_mode_per_ce                   = try(bgp_process.address_family.vpnv4_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.segment_routing_srv6.alloc_mode, null) == "per-ce" ? true : null
        segment_routing_srv6_alloc_mode_per_vrf                  = try(bgp_process.address_family.vpnv4_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf" ? true : null
        segment_routing_srv6_alloc_mode_per_vrf_46               = try(bgp_process.address_family.vpnv4_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf-46" ? true : null
        segment_routing_srv6_alloc_mode_route_policy             = try(bgp_process.address_family.vpnv4_unicast.segment_routing_srv6.alloc_mode_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_unicast.segment_routing_srv6.alloc_mode_route_policy, null)
        }
      ] : []
    ]
  ])
}

resource "iosxr_router_bgp_address_family" "vpnv4_unicast" {
  for_each                                                         = { for af in local.bgp_address_family_vpnv4_unicast : af.key => af }
  device                                                           = each.value.device_name
  as_number                                                        = each.value.as_number
  af_name                                                          = each.value.af_name
  vrf_all_segment_routing_srv6_locator                             = each.value.vrf_all_segment_routing_srv6_locator
  vrf_all_segment_routing_srv6_usid_allocation_wide_local_id_block = each.value.vrf_all_segment_routing_srv6_usid_allocation_wide_local_id_block
  vrf_all_segment_routing_srv6_alloc_mode_per_ce                   = each.value.vrf_all_segment_routing_srv6_alloc_mode_per_ce
  vrf_all_segment_routing_srv6_alloc_mode_per_vrf                  = each.value.vrf_all_segment_routing_srv6_alloc_mode_per_vrf
  vrf_all_segment_routing_srv6_alloc_mode_per_vrf_46               = each.value.vrf_all_segment_routing_srv6_alloc_mode_per_vrf_46
  vrf_all_source_rt_import_policy                                  = each.value.vrf_all_source_rt_import_policy
  vrf_all_label_mode_per_ce                                        = each.value.vrf_all_label_mode_per_ce
  vrf_all_label_mode_per_vrf                                       = each.value.vrf_all_label_mode_per_vrf
  vrf_all_label_mode_per_vrf_46                                    = each.value.vrf_all_label_mode_per_vrf_46
  vrf_all_label_mode_route_policy                                  = each.value.vrf_all_label_mode_route_policy
  vrf_all_rnh_install_extcomm                                      = each.value.vrf_all_rnh_install_extcomm
  vrf_all_rnh_install_extcomm_only                                 = each.value.vrf_all_rnh_install_extcomm_only
  vrf_all_table_policy                                             = each.value.vrf_all_table_policy
  additional_paths_send                                            = each.value.additional_paths_send
  additional_paths_receive                                         = each.value.additional_paths_receive
  additional_paths_advertise_limit                                 = each.value.additional_paths_advertise_limit
  additional_paths_selection_route_policy                          = each.value.additional_paths_selection_route_policy
  advertise_best_external_disable                                  = each.value.advertise_best_external_disable
  advertise_best_external                                          = each.value.advertise_best_external
  nexthop_trigger_delay_critical                                   = each.value.nexthop_trigger_delay_critical
  nexthop_trigger_delay_non_critical                               = each.value.nexthop_trigger_delay_non_critical
  label_mode_per_nexthop_received_label                            = each.value.label_mode_per_nexthop_received_label
  label_mode_per_nexthop_received_label_allocate_secondary_label   = each.value.label_mode_per_nexthop_received_label_allocate_secondary_label
  retain_local_label                                               = each.value.retain_local_label
  retain_route_target_all                                          = each.value.retain_route_target_all
  retain_route_target_route_policy                                 = each.value.retain_route_target_route_policy
  bgp_scan_time                                                    = each.value.bgp_scan_time
  bgp_import_delay_seconds                                         = each.value.bgp_import_delay_seconds
  bgp_import_delay_milliseconds                                    = each.value.bgp_import_delay_milliseconds
  bgp_label_delay_seconds                                          = each.value.bgp_label_delay_seconds
  bgp_label_delay_milliseconds                                     = each.value.bgp_label_delay_milliseconds
  bgp_client_to_client_reflection_disable                          = each.value.bgp_client_to_client_reflection_disable
  bgp_client_to_client_reflection_cluster_ids_32bit_format         = each.value.bgp_client_to_client_reflection_cluster_ids_32bit_format
  bgp_client_to_client_reflection_cluster_ids_ip_format            = each.value.bgp_client_to_client_reflection_cluster_ids_ip_format
  bgp_dampening_decay_half_life                                    = each.value.bgp_dampening_decay_half_life
  bgp_dampening_reuse_threshold                                    = each.value.bgp_dampening_reuse_threshold
  bgp_dampening_suppress_threshold                                 = each.value.bgp_dampening_suppress_threshold
  bgp_dampening_max_suppress_time                                  = each.value.bgp_dampening_max_suppress_time
  bgp_dampening_route_policy                                       = each.value.bgp_dampening_route_policy
  event_prefix_route_policy                                        = each.value.event_prefix_route_policy
  dynamic_med_interval                                             = each.value.dynamic_med_interval
  weight_reset_on_import                                           = each.value.weight_reset_on_import
  nexthop_route_policy                                             = each.value.nexthop_route_policy
  nexthop_resolution_prefix_length_minimum_ipv4                    = each.value.nexthop_resolution_prefix_length_minimum_ipv4
  nexthop_resolution_prefix_length_minimum_ipv6                    = each.value.nexthop_resolution_prefix_length_minimum_ipv6
  update_limit_sub_group_ebgp                                      = each.value.update_limit_sub_group_ebgp
  update_limit_sub_group_ibgp                                      = each.value.update_limit_sub_group_ibgp
  update_limit_address_family                                      = each.value.update_limit_address_family
  update_wait_install                                              = each.value.update_wait_install
  update_wait_install_delay_startup                                = each.value.update_wait_install_delay_startup
  as_path_loopcheck_out_disable                                    = each.value.as_path_loopcheck_out_disable
  default_martian_check_disable                                    = each.value.default_martian_check_disable
  export_to_vrf_allow_backup                                       = each.value.export_to_vrf_allow_backup
  export_to_vrf_allow_best_external                                = each.value.export_to_vrf_allow_best_external
  segment_routing_srv6_locator                                     = each.value.segment_routing_srv6_locator
  segment_routing_srv6_usid_allocation_wide_local_id_block         = each.value.segment_routing_srv6_usid_allocation_wide_local_id_block

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_bgp.router_bgp
  ]
}

locals {
  bgp_address_family_vpnv6_unicast = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) :
      contains(keys(try(bgp_process.address_family, {})), "vpnv6_unicast") ? [{
        key                                                              = format("%s/%s/vpnv6-unicast", device.name, bgp_process.as_number)
        device_name                                                      = device.name
        as_number                                                        = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
        af_name                                                          = "vpnv6-unicast"
        vrf_all_segment_routing_srv6_locator                             = try(bgp_process.address_family.vpnv6_unicast.segment_routing_srv6.locator, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.segment_routing_srv6.locator, null)
        vrf_all_segment_routing_srv6_usid_allocation_wide_local_id_block = try(bgp_process.address_family.vpnv6_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, null)
        vrf_all_segment_routing_srv6_alloc_mode_per_ce                   = try(bgp_process.address_family.vpnv6_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.segment_routing_srv6.alloc_mode, null) == "per-ce" ? true : null
        vrf_all_segment_routing_srv6_alloc_mode_per_vrf                  = try(bgp_process.address_family.vpnv6_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf" ? true : null
        vrf_all_segment_routing_srv6_alloc_mode_per_vrf_46               = try(bgp_process.address_family.vpnv6_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf-46" ? true : null
        vrf_all_source_rt_import_policy                                  = try(bgp_process.address_family.vpnv6_unicast.source_rt_import_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.source_rt_import_policy, null)
        vrf_all_label_mode_per_ce                                        = try(bgp_process.address_family.vpnv6_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.label_mode, null) == "per-ce" ? true : null
        vrf_all_label_mode_per_vrf                                       = try(bgp_process.address_family.vpnv6_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.label_mode, null) == "per-vrf" ? true : null
        vrf_all_label_mode_per_vrf_46                                    = try(bgp_process.address_family.vpnv6_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.label_mode, null) == "per-vrf-46" ? true : null
        vrf_all_label_mode_route_policy                                  = try(bgp_process.address_family.vpnv6_unicast.label_mode_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.label_mode_route_policy, null)
        vrf_all_rnh_install_extcomm                                      = try(bgp_process.address_family.vpnv6_unicast.rnh_install_extcomm, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.rnh_install_extcomm, null)
        vrf_all_rnh_install_extcomm_only                                 = try(bgp_process.address_family.vpnv6_unicast.rnh_install_extcomm_only, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.rnh_install_extcomm_only, null)
        vrf_all_table_policy                                             = try(bgp_process.address_family.vpnv6_unicast.table_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.table_policy, null)
        additional_paths_send                                            = try(bgp_process.address_family.vpnv6_unicast.additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.additional_paths_send, null)
        additional_paths_receive                                         = try(bgp_process.address_family.vpnv6_unicast.additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.additional_paths_receive, null)
        additional_paths_advertise_limit                                 = try(bgp_process.address_family.vpnv6_unicast.additional_paths_advertise_limit, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.additional_paths_advertise_limit, null)
        additional_paths_selection_route_policy                          = try(bgp_process.address_family.vpnv6_unicast.additional_paths_selection_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.additional_paths_selection_route_policy, null)
        advertise_best_external                                          = try(bgp_process.address_family.vpnv6_unicast.advertise_best_external, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.advertise_best_external, null)
        advertise_best_external_disable                                  = try(bgp_process.address_family.vpnv6_unicast.advertise_best_external_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.advertise_best_external_disable, null)
        nexthop_trigger_delay_critical                                   = try(bgp_process.address_family.vpnv6_unicast.nexthop_trigger_delay_critical, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.nexthop_trigger_delay_critical, null)
        nexthop_trigger_delay_non_critical                               = try(bgp_process.address_family.vpnv6_unicast.nexthop_trigger_delay_non_critical, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.nexthop_trigger_delay_non_critical, null)
        label_mode_per_nexthop_received_label                            = try(bgp_process.address_family.vpnv6_unicast.label_mode_per_nexthop_received_label, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.label_mode_per_nexthop_received_label, null)
        label_mode_per_nexthop_received_label_allocate_secondary_label   = try(bgp_process.address_family.vpnv6_unicast.label_mode_per_nexthop_received_label_allocate_secondary_label, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.label_mode_per_nexthop_received_label_allocate_secondary_label, null)
        retain_local_label                                               = try(bgp_process.address_family.vpnv6_unicast.retain_local_label, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.retain_local_label, null)
        retain_route_target_all                                          = try(bgp_process.address_family.vpnv6_unicast.retain_route_target_all, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.retain_route_target_all, null)
        retain_route_target_route_policy                                 = try(bgp_process.address_family.vpnv6_unicast.retain_route_target_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.retain_route_target_route_policy, null)
        bgp_scan_time                                                    = try(bgp_process.address_family.vpnv6_unicast.bgp_scan_time, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_scan_time, null)
        bgp_import_delay_seconds                                         = try(bgp_process.address_family.vpnv6_unicast.bgp_import_delay_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_import_delay_seconds, null)
        bgp_import_delay_milliseconds                                    = try(bgp_process.address_family.vpnv6_unicast.bgp_import_delay_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_import_delay_milliseconds, null)
        bgp_label_delay_seconds                                          = try(bgp_process.address_family.vpnv6_unicast.bgp_label_delay_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_label_delay_seconds, null)
        bgp_label_delay_milliseconds                                     = try(bgp_process.address_family.vpnv6_unicast.bgp_label_delay_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_label_delay_milliseconds, null)
        bgp_client_to_client_reflection_disable                          = try(bgp_process.address_family.vpnv6_unicast.bgp_client_to_client_reflection_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_client_to_client_reflection_disable, null)
        bgp_client_to_client_reflection_cluster_ids_32bit_format = try(length(bgp_process.address_family.vpnv6_unicast.bgp_client_to_client_reflection_cluster_ids) == 0, true) ? null : [
          for cluster in bgp_process.address_family.vpnv6_unicast.bgp_client_to_client_reflection_cluster_ids : {
            cluster_as = try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null)
            disable    = try(cluster.disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_client_to_client_reflection_cluster_ids.disable, null)
          }
          if try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null) != null
        ]
        bgp_client_to_client_reflection_cluster_ids_ip_format = try(length(bgp_process.address_family.vpnv6_unicast.bgp_client_to_client_reflection_cluster_ids) == 0, true) ? null : [
          for cluster in bgp_process.address_family.vpnv6_unicast.bgp_client_to_client_reflection_cluster_ids : {
            cluster_ip = try(cluster.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id, null)
            disable    = try(cluster.disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_client_to_client_reflection_cluster_ids.disable, null)
          }
          if try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null) == null
        ]
        bgp_dampening_decay_half_life                            = try(bgp_process.address_family.vpnv6_unicast.bgp_dampening_decay_half_life, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_dampening_decay_half_life, null)
        bgp_dampening_reuse_threshold                            = try(bgp_process.address_family.vpnv6_unicast.bgp_dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_dampening_reuse_threshold, null)
        bgp_dampening_suppress_threshold                         = try(bgp_process.address_family.vpnv6_unicast.bgp_dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_dampening_suppress_threshold, null)
        bgp_dampening_max_suppress_time                          = try(bgp_process.address_family.vpnv6_unicast.bgp_dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_dampening_max_suppress_time, null)
        bgp_dampening_route_policy                               = try(bgp_process.address_family.vpnv6_unicast.bgp_dampening_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.bgp_dampening_route_policy, null)
        event_prefix_route_policy                                = try(bgp_process.address_family.vpnv6_unicast.event_prefix_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.event_prefix_route_policy, null)
        dynamic_med_interval                                     = try(bgp_process.address_family.vpnv6_unicast.dynamic_med_interval, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.dynamic_med_interval, null)
        weight_reset_on_import                                   = try(bgp_process.address_family.vpnv6_unicast.weight_reset_on_import, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.weight_reset_on_import, null)
        nexthop_route_policy                                     = try(bgp_process.address_family.vpnv6_unicast.nexthop_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.nexthop_route_policy, null)
        update_limit_sub_group_ebgp                              = try(bgp_process.address_family.vpnv6_unicast.update_limit_sub_group_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.update_limit_sub_group_ebgp, null)
        update_limit_sub_group_ibgp                              = try(bgp_process.address_family.vpnv6_unicast.update_limit_sub_group_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.update_limit_sub_group_ibgp, null)
        update_limit_address_family                              = try(bgp_process.address_family.vpnv6_unicast.update_limit_address_family, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.update_limit_address_family, null)
        update_wait_install                                      = try(bgp_process.address_family.vpnv6_unicast.update_wait_install, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.update_wait_install, null)
        update_wait_install_delay_startup                        = try(bgp_process.address_family.vpnv6_unicast.update_wait_install_delay_startup, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.update_wait_install_delay_startup, null)
        as_path_loopcheck_out_disable                            = try(bgp_process.address_family.vpnv6_unicast.as_path_loopcheck_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.as_path_loopcheck_out_disable, null)
        default_martian_check_disable                            = try(bgp_process.address_family.vpnv6_unicast.default_martian_check_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.default_martian_check_disable, null)
        export_to_vrf_allow_backup                               = try(bgp_process.address_family.vpnv6_unicast.export_to_vrf_allow_backup, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.export_to_vrf_allow_backup, null)
        export_to_vrf_allow_best_external                        = try(bgp_process.address_family.vpnv6_unicast.export_to_vrf_allow_best_external, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.export_to_vrf_allow_best_external, null)
        segment_routing_srv6_locator                             = try(bgp_process.address_family.vpnv6_unicast.segment_routing_srv6.locator, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.segment_routing_srv6.locator, null)
        segment_routing_srv6_usid_allocation_wide_local_id_block = try(bgp_process.address_family.vpnv6_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, null)
        segment_routing_srv6_alloc_mode_per_ce                   = try(bgp_process.address_family.vpnv6_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.segment_routing_srv6.alloc_mode, null) == "per-ce" ? true : null
        segment_routing_srv6_alloc_mode_per_vrf                  = try(bgp_process.address_family.vpnv6_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf" ? true : null
        segment_routing_srv6_alloc_mode_per_vrf_46               = try(bgp_process.address_family.vpnv6_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf-46" ? true : null
        segment_routing_srv6_alloc_mode_route_policy             = try(bgp_process.address_family.vpnv6_unicast.segment_routing_srv6.alloc_mode_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_unicast.segment_routing_srv6.alloc_mode_route_policy, null)
        }
      ] : []
    ]
  ])
}

resource "iosxr_router_bgp_address_family" "vpnv6_unicast" {
  for_each                                                         = { for af in local.bgp_address_family_vpnv6_unicast : af.key => af }
  device                                                           = each.value.device_name
  as_number                                                        = each.value.as_number
  af_name                                                          = each.value.af_name
  vrf_all_segment_routing_srv6_locator                             = each.value.vrf_all_segment_routing_srv6_locator
  vrf_all_segment_routing_srv6_usid_allocation_wide_local_id_block = each.value.vrf_all_segment_routing_srv6_usid_allocation_wide_local_id_block
  vrf_all_segment_routing_srv6_alloc_mode_per_ce                   = each.value.vrf_all_segment_routing_srv6_alloc_mode_per_ce
  vrf_all_segment_routing_srv6_alloc_mode_per_vrf                  = each.value.vrf_all_segment_routing_srv6_alloc_mode_per_vrf
  vrf_all_segment_routing_srv6_alloc_mode_per_vrf_46               = each.value.vrf_all_segment_routing_srv6_alloc_mode_per_vrf_46
  vrf_all_source_rt_import_policy                                  = each.value.vrf_all_source_rt_import_policy
  vrf_all_label_mode_per_ce                                        = each.value.vrf_all_label_mode_per_ce
  vrf_all_label_mode_per_vrf                                       = each.value.vrf_all_label_mode_per_vrf
  vrf_all_label_mode_per_vrf_46                                    = each.value.vrf_all_label_mode_per_vrf_46
  vrf_all_label_mode_route_policy                                  = each.value.vrf_all_label_mode_route_policy
  vrf_all_rnh_install_extcomm                                      = each.value.vrf_all_rnh_install_extcomm
  vrf_all_rnh_install_extcomm_only                                 = each.value.vrf_all_rnh_install_extcomm_only
  vrf_all_table_policy                                             = each.value.vrf_all_table_policy
  additional_paths_send                                            = each.value.additional_paths_send
  additional_paths_receive                                         = each.value.additional_paths_receive
  additional_paths_advertise_limit                                 = each.value.additional_paths_advertise_limit
  additional_paths_selection_route_policy                          = each.value.additional_paths_selection_route_policy
  advertise_best_external_disable                                  = each.value.advertise_best_external_disable
  advertise_best_external                                          = each.value.advertise_best_external
  nexthop_trigger_delay_critical                                   = each.value.nexthop_trigger_delay_critical
  nexthop_trigger_delay_non_critical                               = each.value.nexthop_trigger_delay_non_critical
  label_mode_per_nexthop_received_label                            = each.value.label_mode_per_nexthop_received_label
  label_mode_per_nexthop_received_label_allocate_secondary_label   = each.value.label_mode_per_nexthop_received_label_allocate_secondary_label
  retain_local_label                                               = each.value.retain_local_label
  retain_route_target_all                                          = each.value.retain_route_target_all
  retain_route_target_route_policy                                 = each.value.retain_route_target_route_policy
  bgp_scan_time                                                    = each.value.bgp_scan_time
  bgp_import_delay_seconds                                         = each.value.bgp_import_delay_seconds
  bgp_import_delay_milliseconds                                    = each.value.bgp_import_delay_milliseconds
  bgp_label_delay_seconds                                          = each.value.bgp_label_delay_seconds
  bgp_label_delay_milliseconds                                     = each.value.bgp_label_delay_milliseconds
  bgp_client_to_client_reflection_disable                          = each.value.bgp_client_to_client_reflection_disable
  bgp_client_to_client_reflection_cluster_ids_32bit_format         = each.value.bgp_client_to_client_reflection_cluster_ids_32bit_format
  bgp_client_to_client_reflection_cluster_ids_ip_format            = each.value.bgp_client_to_client_reflection_cluster_ids_ip_format
  bgp_dampening_decay_half_life                                    = each.value.bgp_dampening_decay_half_life
  bgp_dampening_reuse_threshold                                    = each.value.bgp_dampening_reuse_threshold
  bgp_dampening_suppress_threshold                                 = each.value.bgp_dampening_suppress_threshold
  bgp_dampening_max_suppress_time                                  = each.value.bgp_dampening_max_suppress_time
  bgp_dampening_route_policy                                       = each.value.bgp_dampening_route_policy
  event_prefix_route_policy                                        = each.value.event_prefix_route_policy
  dynamic_med_interval                                             = each.value.dynamic_med_interval
  weight_reset_on_import                                           = each.value.weight_reset_on_import
  nexthop_route_policy                                             = each.value.nexthop_route_policy
  update_limit_sub_group_ebgp                                      = each.value.update_limit_sub_group_ebgp
  update_limit_sub_group_ibgp                                      = each.value.update_limit_sub_group_ibgp
  update_limit_address_family                                      = each.value.update_limit_address_family
  update_wait_install                                              = each.value.update_wait_install
  update_wait_install_delay_startup                                = each.value.update_wait_install_delay_startup
  as_path_loopcheck_out_disable                                    = each.value.as_path_loopcheck_out_disable
  default_martian_check_disable                                    = each.value.default_martian_check_disable
  export_to_vrf_allow_backup                                       = each.value.export_to_vrf_allow_backup
  export_to_vrf_allow_best_external                                = each.value.export_to_vrf_allow_best_external
  segment_routing_srv6_locator                                     = each.value.segment_routing_srv6_locator
  segment_routing_srv6_usid_allocation_wide_local_id_block         = each.value.segment_routing_srv6_usid_allocation_wide_local_id_block

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_bgp.router_bgp
  ]
}

locals {
  bgp_address_family_vpnv4_multicast = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) :
      contains(keys(try(bgp_process.address_family, {})), "vpnv4_multicast") ? [{
        key                                     = format("%s/%s/vpnv4-multicast", device.name, bgp_process.as_number)
        device_name                             = device.name
        as_number                               = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
        af_name                                 = "vpnv4-multicast"
        additional_paths_send                   = try(bgp_process.address_family.vpnv4_multicast.additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.additional_paths_send, null)
        additional_paths_receive                = try(bgp_process.address_family.vpnv4_multicast.additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.additional_paths_receive, null)
        additional_paths_advertise_limit        = try(bgp_process.address_family.vpnv4_multicast.additional_paths_advertise_limit, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.additional_paths_advertise_limit, null)
        additional_paths_selection_route_policy = try(bgp_process.address_family.vpnv4_multicast.additional_paths_selection_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.additional_paths_selection_route_policy, null)
        advertise_best_external                 = try(bgp_process.address_family.vpnv4_multicast.advertise_best_external, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.advertise_best_external, null)
        advertise_best_external_disable         = try(bgp_process.address_family.vpnv4_multicast.advertise_best_external_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.advertise_best_external_disable, null)
        nexthop_trigger_delay_critical          = try(bgp_process.address_family.vpnv4_multicast.nexthop_trigger_delay_critical, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.nexthop_trigger_delay_critical, null)
        nexthop_trigger_delay_non_critical      = try(bgp_process.address_family.vpnv4_multicast.nexthop_trigger_delay_non_critical, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.nexthop_trigger_delay_non_critical, null)
        retain_local_label                      = try(bgp_process.address_family.vpnv4_multicast.retain_local_label, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.retain_local_label, null)
        retain_route_target_all                 = try(bgp_process.address_family.vpnv4_multicast.retain_route_target_all, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.retain_route_target_all, null)
        retain_route_target_route_policy        = try(bgp_process.address_family.vpnv4_multicast.retain_route_target_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.retain_route_target_route_policy, null)
        bgp_scan_time                           = try(bgp_process.address_family.vpnv4_multicast.bgp_scan_time, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.bgp_scan_time, null)
        bgp_label_delay_seconds                 = try(bgp_process.address_family.vpnv4_multicast.bgp_label_delay_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.bgp_label_delay_seconds, null)
        bgp_label_delay_milliseconds            = try(bgp_process.address_family.vpnv4_multicast.bgp_label_delay_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.bgp_label_delay_milliseconds, null)
        bgp_client_to_client_reflection_disable = try(bgp_process.address_family.vpnv4_multicast.bgp_client_to_client_reflection_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.bgp_client_to_client_reflection_disable, null)
        bgp_client_to_client_reflection_cluster_ids_32bit_format = try(length(bgp_process.address_family.vpnv4_multicast.bgp_client_to_client_reflection_cluster_ids) == 0, true) ? null : [
          for cluster in bgp_process.address_family.vpnv4_multicast.bgp_client_to_client_reflection_cluster_ids : {
            cluster_as = try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null)
            disable    = try(cluster.disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.bgp_client_to_client_reflection_cluster_ids.disable, null)
          }
          if try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null) != null
        ]
        bgp_client_to_client_reflection_cluster_ids_ip_format = try(length(bgp_process.address_family.vpnv4_multicast.bgp_client_to_client_reflection_cluster_ids) == 0, true) ? null : [
          for cluster in bgp_process.address_family.vpnv4_multicast.bgp_client_to_client_reflection_cluster_ids : {
            cluster_ip = try(cluster.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.bgp_client_to_client_reflection_cluster_ids.cluster_id, null)
            disable    = try(cluster.disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.bgp_client_to_client_reflection_cluster_ids.disable, null)
          }
          if try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null) == null
        ]
        bgp_dampening_decay_half_life                 = try(bgp_process.address_family.vpnv4_multicast.bgp_dampening_decay_half_life, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.bgp_dampening_decay_half_life, null)
        bgp_dampening_reuse_threshold                 = try(bgp_process.address_family.vpnv4_multicast.bgp_dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.bgp_dampening_reuse_threshold, null)
        bgp_dampening_suppress_threshold              = try(bgp_process.address_family.vpnv4_multicast.bgp_dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.bgp_dampening_suppress_threshold, null)
        bgp_dampening_max_suppress_time               = try(bgp_process.address_family.vpnv4_multicast.bgp_dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.bgp_dampening_max_suppress_time, null)
        bgp_dampening_route_policy                    = try(bgp_process.address_family.vpnv4_multicast.bgp_dampening_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.bgp_dampening_route_policy, null)
        event_prefix_route_policy                     = try(bgp_process.address_family.vpnv4_multicast.event_prefix_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.event_prefix_route_policy, null)
        nexthop_route_policy                          = try(bgp_process.address_family.vpnv4_multicast.nexthop_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.nexthop_route_policy, null)
        nexthop_resolution_prefix_length_minimum_ipv4 = try(bgp_process.address_family.vpnv4_multicast.nexthop_resolution_prefix_length_minimum_ipv4, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.nexthop_resolution_prefix_length_minimum_ipv4, null)
        update_limit_sub_group_ebgp                   = try(bgp_process.address_family.vpnv4_multicast.update_limit_sub_group_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.update_limit_sub_group_ebgp, null)
        update_limit_sub_group_ibgp                   = try(bgp_process.address_family.vpnv4_multicast.update_limit_sub_group_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.update_limit_sub_group_ibgp, null)
        update_limit_address_family                   = try(bgp_process.address_family.vpnv4_multicast.update_limit_address_family, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.update_limit_address_family, null)
        as_path_loopcheck_out_disable                 = try(bgp_process.address_family.vpnv4_multicast.as_path_loopcheck_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.as_path_loopcheck_out_disable, null)
        default_martian_check_disable                 = try(bgp_process.address_family.vpnv4_multicast.default_martian_check_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv4_multicast.default_martian_check_disable, null)
        }
      ] : []
    ]
  ])
}

resource "iosxr_router_bgp_address_family" "vpnv4_multicast" {
  for_each                                                 = { for af in local.bgp_address_family_vpnv4_multicast : af.key => af }
  device                                                   = each.value.device_name
  as_number                                                = each.value.as_number
  af_name                                                  = each.value.af_name
  additional_paths_send                                    = each.value.additional_paths_send
  additional_paths_receive                                 = each.value.additional_paths_receive
  additional_paths_advertise_limit                         = each.value.additional_paths_advertise_limit
  additional_paths_selection_route_policy                  = each.value.additional_paths_selection_route_policy
  advertise_best_external_disable                          = each.value.advertise_best_external_disable
  advertise_best_external                                  = each.value.advertise_best_external
  nexthop_trigger_delay_critical                           = each.value.nexthop_trigger_delay_critical
  nexthop_trigger_delay_non_critical                       = each.value.nexthop_trigger_delay_non_critical
  retain_local_label                                       = each.value.retain_local_label
  retain_route_target_all                                  = each.value.retain_route_target_all
  retain_route_target_route_policy                         = each.value.retain_route_target_route_policy
  bgp_scan_time                                            = each.value.bgp_scan_time
  bgp_label_delay_seconds                                  = each.value.bgp_label_delay_seconds
  bgp_label_delay_milliseconds                             = each.value.bgp_label_delay_milliseconds
  bgp_client_to_client_reflection_disable                  = each.value.bgp_client_to_client_reflection_disable
  bgp_client_to_client_reflection_cluster_ids_32bit_format = each.value.bgp_client_to_client_reflection_cluster_ids_32bit_format
  bgp_client_to_client_reflection_cluster_ids_ip_format    = each.value.bgp_client_to_client_reflection_cluster_ids_ip_format
  bgp_dampening_decay_half_life                            = each.value.bgp_dampening_decay_half_life
  bgp_dampening_reuse_threshold                            = each.value.bgp_dampening_reuse_threshold
  bgp_dampening_suppress_threshold                         = each.value.bgp_dampening_suppress_threshold
  bgp_dampening_max_suppress_time                          = each.value.bgp_dampening_max_suppress_time
  bgp_dampening_route_policy                               = each.value.bgp_dampening_route_policy
  event_prefix_route_policy                                = each.value.event_prefix_route_policy
  nexthop_route_policy                                     = each.value.nexthop_route_policy
  nexthop_resolution_prefix_length_minimum_ipv4            = each.value.nexthop_resolution_prefix_length_minimum_ipv4
  update_limit_sub_group_ebgp                              = each.value.update_limit_sub_group_ebgp
  update_limit_sub_group_ibgp                              = each.value.update_limit_sub_group_ibgp
  update_limit_address_family                              = each.value.update_limit_address_family
  as_path_loopcheck_out_disable                            = each.value.as_path_loopcheck_out_disable
  default_martian_check_disable                            = each.value.default_martian_check_disable

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_bgp.router_bgp
  ]
}


locals {
  bgp_address_family_vpnv6_multicast = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) :
      contains(keys(try(bgp_process.address_family, {})), "vpnv6_multicast") ? [{
        key                                     = format("%s/%s/vpnv6-multicast", device.name, bgp_process.as_number)
        device_name                             = device.name
        as_number                               = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
        af_name                                 = "vpnv6-multicast"
        additional_paths_send                   = try(bgp_process.address_family.vpnv6_multicast.additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.additional_paths_send, null)
        additional_paths_receive                = try(bgp_process.address_family.vpnv6_multicast.additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.additional_paths_receive, null)
        additional_paths_advertise_limit        = try(bgp_process.address_family.vpnv6_multicast.additional_paths_advertise_limit, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.additional_paths_advertise_limit, null)
        additional_paths_selection_route_policy = try(bgp_process.address_family.vpnv6_multicast.additional_paths_selection_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.additional_paths_selection_route_policy, null)
        advertise_best_external                 = try(bgp_process.address_family.vpnv6_multicast.advertise_best_external, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.advertise_best_external, null)
        advertise_best_external_disable         = try(bgp_process.address_family.vpnv6_multicast.advertise_best_external_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.advertise_best_external_disable, null)
        nexthop_trigger_delay_critical          = try(bgp_process.address_family.vpnv6_multicast.nexthop_trigger_delay_critical, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.nexthop_trigger_delay_critical, null)
        nexthop_trigger_delay_non_critical      = try(bgp_process.address_family.vpnv6_multicast.nexthop_trigger_delay_non_critical, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.nexthop_trigger_delay_non_critical, null)
        retain_local_label                      = try(bgp_process.address_family.vpnv6_multicast.retain_local_label, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.retain_local_label, null)
        retain_route_target_all                 = try(bgp_process.address_family.vpnv6_multicast.retain_route_target_all, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.retain_route_target_all, null)
        retain_route_target_route_policy        = try(bgp_process.address_family.vpnv6_multicast.retain_route_target_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.retain_route_target_route_policy, null)
        bgp_scan_time                           = try(bgp_process.address_family.vpnv6_multicast.bgp_scan_time, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.bgp_scan_time, null)
        bgp_label_delay_seconds                 = try(bgp_process.address_family.vpnv6_multicast.bgp_label_delay_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.bgp_label_delay_seconds, null)
        bgp_label_delay_milliseconds            = try(bgp_process.address_family.vpnv6_multicast.bgp_label_delay_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.bgp_label_delay_milliseconds, null)
        bgp_client_to_client_reflection_disable = try(bgp_process.address_family.vpnv6_multicast.bgp_client_to_client_reflection_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.bgp_client_to_client_reflection_disable, null)
        bgp_client_to_client_reflection_cluster_ids_32bit_format = try(length(bgp_process.address_family.vpnv6_multicast.bgp_client_to_client_reflection_cluster_ids) == 0, true) ? null : [
          for cluster in bgp_process.address_family.vpnv6_multicast.bgp_client_to_client_reflection_cluster_ids : {
            cluster_as = try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null)
            disable    = try(cluster.disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.bgp_client_to_client_reflection_cluster_ids.disable, null)
          }
          if try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null) != null
        ]
        bgp_client_to_client_reflection_cluster_ids_ip_format = try(length(bgp_process.address_family.vpnv6_multicast.bgp_client_to_client_reflection_cluster_ids) == 0, true) ? null : [
          for cluster in bgp_process.address_family.vpnv6_multicast.bgp_client_to_client_reflection_cluster_ids : {
            cluster_ip = try(cluster.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.bgp_client_to_client_reflection_cluster_ids.cluster_id, null)
            disable    = try(cluster.disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.bgp_client_to_client_reflection_cluster_ids.disable, null)
          }
          if try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.bgp_client_to_client_reflection_cluster_ids.cluster_id), null) == null
        ]
        bgp_dampening_decay_half_life                 = try(bgp_process.address_family.vpnv6_multicast.bgp_dampening_decay_half_life, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.bgp_dampening_decay_half_life, null)
        bgp_dampening_reuse_threshold                 = try(bgp_process.address_family.vpnv6_multicast.bgp_dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.bgp_dampening_reuse_threshold, null)
        bgp_dampening_suppress_threshold              = try(bgp_process.address_family.vpnv6_multicast.bgp_dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.bgp_dampening_suppress_threshold, null)
        bgp_dampening_max_suppress_time               = try(bgp_process.address_family.vpnv6_multicast.bgp_dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.bgp_dampening_max_suppress_time, null)
        bgp_dampening_route_policy                    = try(bgp_process.address_family.vpnv6_multicast.bgp_dampening_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.bgp_dampening_route_policy, null)
        event_prefix_route_policy                     = try(bgp_process.address_family.vpnv6_multicast.event_prefix_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.event_prefix_route_policy, null)
        nexthop_route_policy                          = try(bgp_process.address_family.vpnv6_multicast.nexthop_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.nexthop_route_policy, null)
        nexthop_resolution_prefix_length_minimum_ipv4 = try(bgp_process.address_family.vpnv6_multicast.nexthop_resolution_prefix_length_minimum_ipv4, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.nexthop_resolution_prefix_length_minimum_ipv4, null)
        update_limit_sub_group_ebgp                   = try(bgp_process.address_family.vpnv6_multicast.update_limit_sub_group_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.update_limit_sub_group_ebgp, null)
        update_limit_sub_group_ibgp                   = try(bgp_process.address_family.vpnv6_multicast.update_limit_sub_group_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.update_limit_sub_group_ibgp, null)
        update_limit_address_family                   = try(bgp_process.address_family.vpnv6_multicast.update_limit_address_family, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.update_limit_address_family, null)
        as_path_loopcheck_out_disable                 = try(bgp_process.address_family.vpnv6_multicast.as_path_loopcheck_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.as_path_loopcheck_out_disable, null)
        default_martian_check_disable                 = try(bgp_process.address_family.vpnv6_multicast.default_martian_check_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.vpnv6_multicast.default_martian_check_disable, null)
        }
      ] : []
    ]
  ])
}

resource "iosxr_router_bgp_address_family" "vpnv6_multicast" {
  for_each                                                 = { for af in local.bgp_address_family_vpnv6_multicast : af.key => af }
  device                                                   = each.value.device_name
  as_number                                                = each.value.as_number
  af_name                                                  = each.value.af_name
  additional_paths_send                                    = each.value.additional_paths_send
  additional_paths_receive                                 = each.value.additional_paths_receive
  additional_paths_advertise_limit                         = each.value.additional_paths_advertise_limit
  additional_paths_selection_route_policy                  = each.value.additional_paths_selection_route_policy
  advertise_best_external_disable                          = each.value.advertise_best_external_disable
  advertise_best_external                                  = each.value.advertise_best_external
  nexthop_trigger_delay_critical                           = each.value.nexthop_trigger_delay_critical
  nexthop_trigger_delay_non_critical                       = each.value.nexthop_trigger_delay_non_critical
  retain_local_label                                       = each.value.retain_local_label
  retain_route_target_all                                  = each.value.retain_route_target_all
  retain_route_target_route_policy                         = each.value.retain_route_target_route_policy
  bgp_scan_time                                            = each.value.bgp_scan_time
  bgp_label_delay_seconds                                  = each.value.bgp_label_delay_seconds
  bgp_label_delay_milliseconds                             = each.value.bgp_label_delay_milliseconds
  bgp_client_to_client_reflection_disable                  = each.value.bgp_client_to_client_reflection_disable
  bgp_client_to_client_reflection_cluster_ids_32bit_format = each.value.bgp_client_to_client_reflection_cluster_ids_32bit_format
  bgp_client_to_client_reflection_cluster_ids_ip_format    = each.value.bgp_client_to_client_reflection_cluster_ids_ip_format
  bgp_dampening_decay_half_life                            = each.value.bgp_dampening_decay_half_life
  bgp_dampening_reuse_threshold                            = each.value.bgp_dampening_reuse_threshold
  bgp_dampening_suppress_threshold                         = each.value.bgp_dampening_suppress_threshold
  bgp_dampening_max_suppress_time                          = each.value.bgp_dampening_max_suppress_time
  bgp_dampening_route_policy                               = each.value.bgp_dampening_route_policy
  event_prefix_route_policy                                = each.value.event_prefix_route_policy
  nexthop_route_policy                                     = each.value.nexthop_route_policy
  nexthop_resolution_prefix_length_minimum_ipv4            = each.value.nexthop_resolution_prefix_length_minimum_ipv4
  update_limit_sub_group_ebgp                              = each.value.update_limit_sub_group_ebgp
  update_limit_sub_group_ibgp                              = each.value.update_limit_sub_group_ibgp
  update_limit_address_family                              = each.value.update_limit_address_family
  as_path_loopcheck_out_disable                            = each.value.as_path_loopcheck_out_disable
  default_martian_check_disable                            = each.value.default_martian_check_disable

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_bgp.router_bgp
  ]
}

locals {
  bgp_address_family_l2vpn_evpn = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) :
      contains(keys(try(bgp_process.address_family, {})), "l2vpn_evpn") ? [{
        key                                     = format("%s/%s/l2vpn-evpn", device.name, bgp_process.as_number)
        device_name                             = device.name
        as_number                               = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
        af_name                                 = "l2vpn-evpn"
        additional_paths_send                   = try(bgp_process.address_family.l2vpn_evpn.additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.additional_paths_send, null)
        additional_paths_receive                = try(bgp_process.address_family.l2vpn_evpn.additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.additional_paths_receive, null)
        additional_paths_advertise_limit        = try(bgp_process.address_family.l2vpn_evpn.additional_paths_advertise_limit, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.additional_paths_advertise_limit, null)
        additional_paths_selection_route_policy = try(bgp_process.address_family.l2vpn_evpn.additional_paths_selection_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.additional_paths_selection_route_policy, null)
        advertise_best_external                 = try(bgp_process.address_family.l2vpn_evpn.advertise_best_external, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.advertise_best_external, null)
        advertise_best_external_disable         = try(bgp_process.address_family.l2vpn_evpn.advertise_best_external_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.advertise_best_external_disable, null)
        nexthop_trigger_delay_critical          = try(bgp_process.address_family.l2vpn_evpn.nexthop_trigger_delay_critical, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.nexthop_trigger_delay_critical, null)
        nexthop_trigger_delay_non_critical      = try(bgp_process.address_family.l2vpn_evpn.nexthop_trigger_delay_non_critical, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.nexthop_trigger_delay_non_critical, null)
        retain_local_label                      = try(bgp_process.address_family.l2vpn_evpn.retain_local_label, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.retain_local_label, null)
        retain_route_target_all                 = try(bgp_process.address_family.l2vpn_evpn.retain_route_target_all, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.retain_route_target_all, null)
        retain_route_target_route_policy        = try(bgp_process.address_family.l2vpn_evpn.retain_route_target_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.retain_route_target_route_policy, null)
        bgp_scan_time                           = try(bgp_process.address_family.l2vpn_evpn.bgp_scan_time, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_scan_time, null)
        bgp_import_delay_seconds                = try(bgp_process.address_family.l2vpn_evpn.bgp_import_delay_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_import_delay_seconds, null)
        bgp_import_delay_milliseconds           = try(bgp_process.address_family.l2vpn_evpn.bgp_import_delay_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_import_delay_milliseconds, null)
        bgp_label_delay_seconds                 = try(bgp_process.address_family.l2vpn_evpn.bgp_label_delay_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_label_delay_seconds, null)
        bgp_label_delay_milliseconds            = try(bgp_process.address_family.l2vpn_evpn.bgp_label_delay_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_label_delay_milliseconds, null)
        bgp_client_to_client_reflection_disable = try(bgp_process.address_family.l2vpn_evpn.bgp_client_to_client_reflection_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_client_to_client_reflection_disable, null)
        bgp_client_to_client_reflection_cluster_ids_32bit_format = try(length(bgp_process.address_family.l2vpn_evpn.bgp_client_to_client_reflection_cluster_ids) == 0, true) ? null : [
          for cluster in bgp_process.address_family.l2vpn_evpn.bgp_client_to_client_reflection_cluster_ids : {
            cluster_as = try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_client_to_client_reflection_cluster_ids.cluster_id), null)
            disable    = try(cluster.disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_client_to_client_reflection_cluster_ids.disable, null)
          }
          if try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_client_to_client_reflection_cluster_ids.cluster_id), null) != null
        ]
        bgp_client_to_client_reflection_cluster_ids_ip_format = try(length(bgp_process.address_family.l2vpn_evpn.bgp_client_to_client_reflection_cluster_ids) == 0, true) ? null : [
          for cluster in bgp_process.address_family.l2vpn_evpn.bgp_client_to_client_reflection_cluster_ids : {
            cluster_ip = try(cluster.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_client_to_client_reflection_cluster_ids.cluster_id, null)
            disable    = try(cluster.disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_client_to_client_reflection_cluster_ids.disable, null)
          }
          if try(tonumber(cluster.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_client_to_client_reflection_cluster_ids.cluster_id), null) == null
        ]
        bgp_dampening_decay_half_life    = try(bgp_process.address_family.l2vpn_evpn.bgp_dampening_decay_half_life, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_dampening_decay_half_life, null)
        bgp_dampening_reuse_threshold    = try(bgp_process.address_family.l2vpn_evpn.bgp_dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_dampening_reuse_threshold, null)
        bgp_dampening_suppress_threshold = try(bgp_process.address_family.l2vpn_evpn.bgp_dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_dampening_suppress_threshold, null)
        bgp_dampening_max_suppress_time  = try(bgp_process.address_family.l2vpn_evpn.bgp_dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_dampening_max_suppress_time, null)
        bgp_dampening_route_policy       = try(bgp_process.address_family.l2vpn_evpn.bgp_dampening_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.bgp_dampening_route_policy, null)
        event_prefix_route_policy        = try(bgp_process.address_family.l2vpn_evpn.event_prefix_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.event_prefix_route_policy, null)
        nexthop_route_policy             = try(bgp_process.address_family.l2vpn_evpn.nexthop_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.nexthop_route_policy, null)
        update_limit_sub_group_ebgp      = try(bgp_process.address_family.l2vpn_evpn.update_limit_sub_group_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.update_limit_sub_group_ebgp, null)
        update_limit_sub_group_ibgp      = try(bgp_process.address_family.l2vpn_evpn.update_limit_sub_group_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.update_limit_sub_group_ibgp, null)
        update_limit_address_family      = try(bgp_process.address_family.l2vpn_evpn.update_limit_address_family, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.update_limit_address_family, null)
        as_path_loopcheck_out_disable    = try(bgp_process.address_family.l2vpn_evpn.as_path_loopcheck_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.as_path_loopcheck_out_disable, null)
        default_martian_check_disable    = try(bgp_process.address_family.l2vpn_evpn.default_martian_check_disable, local.defaults.iosxr.devices.configuration.routing.bgp.address_family.l2vpn_evpn.default_martian_check_disable, null)
        }
      ] : []
    ]
  ])
}

resource "iosxr_router_bgp_address_family" "l2vpn_evpn" {
  for_each                                                 = { for af in local.bgp_address_family_l2vpn_evpn : af.key => af }
  device                                                   = each.value.device_name
  as_number                                                = each.value.as_number
  af_name                                                  = each.value.af_name
  additional_paths_send                                    = each.value.additional_paths_send
  additional_paths_receive                                 = each.value.additional_paths_receive
  additional_paths_advertise_limit                         = each.value.additional_paths_advertise_limit
  additional_paths_selection_route_policy                  = each.value.additional_paths_selection_route_policy
  advertise_best_external                                  = each.value.advertise_best_external
  advertise_best_external_disable                          = each.value.advertise_best_external_disable
  nexthop_trigger_delay_critical                           = each.value.nexthop_trigger_delay_critical
  nexthop_trigger_delay_non_critical                       = each.value.nexthop_trigger_delay_non_critical
  retain_local_label                                       = each.value.retain_local_label
  retain_route_target_all                                  = each.value.retain_route_target_all
  retain_route_target_route_policy                         = each.value.retain_route_target_route_policy
  bgp_scan_time                                            = each.value.bgp_scan_time
  bgp_import_delay_seconds                                 = each.value.bgp_import_delay_seconds
  bgp_import_delay_milliseconds                            = each.value.bgp_import_delay_milliseconds
  bgp_label_delay_seconds                                  = each.value.bgp_label_delay_seconds
  bgp_label_delay_milliseconds                             = each.value.bgp_label_delay_milliseconds
  bgp_client_to_client_reflection_disable                  = each.value.bgp_client_to_client_reflection_disable
  bgp_client_to_client_reflection_cluster_ids_32bit_format = each.value.bgp_client_to_client_reflection_cluster_ids_32bit_format
  bgp_client_to_client_reflection_cluster_ids_ip_format    = each.value.bgp_client_to_client_reflection_cluster_ids_ip_format
  bgp_dampening_decay_half_life                            = each.value.bgp_dampening_decay_half_life
  bgp_dampening_reuse_threshold                            = each.value.bgp_dampening_reuse_threshold
  bgp_dampening_suppress_threshold                         = each.value.bgp_dampening_suppress_threshold
  bgp_dampening_max_suppress_time                          = each.value.bgp_dampening_max_suppress_time
  bgp_dampening_route_policy                               = each.value.bgp_dampening_route_policy
  event_prefix_route_policy                                = each.value.event_prefix_route_policy
  nexthop_route_policy                                     = each.value.nexthop_route_policy
  update_limit_sub_group_ebgp                              = each.value.update_limit_sub_group_ebgp
  update_limit_sub_group_ibgp                              = each.value.update_limit_sub_group_ibgp
  update_limit_address_family                              = each.value.update_limit_address_family
  as_path_loopcheck_out_disable                            = each.value.as_path_loopcheck_out_disable
  default_martian_check_disable                            = each.value.default_martian_check_disable

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_bgp.router_bgp
  ]
}

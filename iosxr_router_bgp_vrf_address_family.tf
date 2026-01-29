locals {
  router_bgp_vrf_address_family_ipv4_unicast = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : [
        for vrf in try(bgp_process.vrfs, []) :
        contains(keys(try(vrf.address_family, {})), "ipv4_unicast") ? [{
          key                                                      = format("%s/%s/%s/ipv4-unicast", device.name, bgp_process.as_number, vrf.vrf_name)
          device_name                                              = device.name
          as_number                                                = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
          vrf_name                                                 = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.vrf_name, null)
          af_name                                                  = "ipv4-unicast"
          distance_bgp_external_route                              = try(vrf.address_family.ipv4_unicast.distance_bgp_external_route, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.distance_bgp_external_route, null)
          distance_bgp_internal_route                              = try(vrf.address_family.ipv4_unicast.distance_bgp_internal_route, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.distance_bgp_internal_route, null)
          distance_bgp_local_route                                 = try(vrf.address_family.ipv4_unicast.distance_bgp_local_route, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.distance_bgp_local_route, null)
          bgp_attribute_download                                   = try(vrf.address_family.ipv4_unicast.bgp_attribute_download, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.bgp_attribute_download, null)
          allow_vpn_default_originate                              = try(vrf.address_family.ipv4_unicast.allow_vpn_default_originate, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.allow_vpn_default_originate, null)
          additional_paths_send                                    = try(vrf.address_family.ipv4_unicast.additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.additional_paths_send, null)
          additional_paths_send_disable                            = try(vrf.address_family.ipv4_unicast.additional_paths_send_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.additional_paths_send_disable, null)
          additional_paths_receive                                 = try(vrf.address_family.ipv4_unicast.additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.additional_paths_receive, null)
          additional_paths_receive_disable                         = try(vrf.address_family.ipv4_unicast.additional_paths_receive_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.additional_paths_receive_disable, null)
          additional_paths_advertise_limit                         = try(vrf.address_family.ipv4_unicast.additional_paths_advertise_limit, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.additional_paths_advertise_limit, null)
          additional_paths_selection_route_policy                  = try(vrf.address_family.ipv4_unicast.additional_paths_selection_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.additional_paths_selection_route_policy, null)
          additional_paths_selection_disable                       = try(vrf.address_family.ipv4_unicast.additional_paths_selection_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.additional_paths_selection_disable, null)
          advertise_best_external                                  = try(vrf.address_family.ipv4_unicast.advertise_best_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.advertise_best_external, null)
          advertise_best_external_disable                          = try(vrf.address_family.ipv4_unicast.advertise_best_external_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.advertise_best_external_disable, null)
          advertise_local_labeled_route_safi_unicast               = try(vrf.address_family.ipv4_unicast.advertise_local_labeled_route_safi_unicast, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.advertise_local_labeled_route_safi_unicast, null)
          allocate_label_all                                       = try(vrf.address_family.ipv4_unicast.allocate_label_all, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.allocate_label_all, null)
          allocate_label_all_unlabeled_path                        = try(vrf.address_family.ipv4_unicast.allocate_label_all_unlabeled_path, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.allocate_label_all_unlabeled_path, null)
          allocate_label_route_policy_name                         = try(vrf.address_family.ipv4_unicast.allocate_label_route_policy_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.allocate_label_route_policy_name, null)
          allocate_label_route_policy_unlabeled_path               = try(vrf.address_family.ipv4_unicast.allocate_label_route_policy_unlabeled_path, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.allocate_label_route_policy_unlabeled_path, null)
          maximum_paths_ebgp_multipath                             = try(vrf.address_family.ipv4_unicast.maximum_paths_ebgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.maximum_paths_ebgp_multipath, null)
          maximum_paths_ebgp_selective                             = try(vrf.address_family.ipv4_unicast.maximum_paths_ebgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.maximum_paths_ebgp_selective, null)
          maximum_paths_ebgp_route_policy                          = try(vrf.address_family.ipv4_unicast.maximum_paths_ebgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.maximum_paths_ebgp_route_policy, null)
          maximum_paths_ibgp_multipath                             = try(vrf.address_family.ipv4_unicast.maximum_paths_ibgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.maximum_paths_ibgp_multipath, null)
          maximum_paths_ibgp_unequal_cost                          = try(vrf.address_family.ipv4_unicast.maximum_paths_ibgp_unequal_cost, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.maximum_paths_ibgp_unequal_cost, null)
          maximum_paths_ibgp_unequal_cost_deterministic            = try(vrf.address_family.ipv4_unicast.maximum_paths_ibgp_unequal_cost_deterministic, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.maximum_paths_ibgp_unequal_cost_deterministic, null)
          maximum_paths_ibgp_selective                             = try(vrf.address_family.ipv4_unicast.maximum_paths_ibgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.maximum_paths_ibgp_selective, null)
          maximum_paths_ibgp_route_policy                          = try(vrf.address_family.ipv4_unicast.maximum_paths_ibgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.maximum_paths_ibgp_route_policy, null)
          maximum_paths_eibgp_multipath                            = try(vrf.address_family.ipv4_unicast.maximum_paths_eibgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.maximum_paths_eibgp_multipath, null)
          maximum_paths_eibgp_equal_cost                           = try(vrf.address_family.ipv4_unicast.maximum_paths_eibgp_equal_cost, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.maximum_paths_eibgp_equal_cost, null)
          maximum_paths_eibgp_selective                            = try(vrf.address_family.ipv4_unicast.maximum_paths_eibgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.maximum_paths_eibgp_selective, null)
          maximum_paths_eibgp_route_policy                         = try(vrf.address_family.ipv4_unicast.maximum_paths_eibgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.maximum_paths_eibgp_route_policy, null)
          maximum_paths_unique_nexthop_check_disable               = try(vrf.address_family.ipv4_unicast.maximum_paths_unique_nexthop_check_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.maximum_paths_unique_nexthop_check_disable, null)
          label_mode_per_prefix                                    = try(vrf.address_family.ipv4_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.label_mode, null) == "per-prefix" ? true : null
          label_mode_per_ce                                        = try(vrf.address_family.ipv4_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.label_mode, null) == "per-ce" ? true : null
          label_mode_per_vrf                                       = try(vrf.address_family.ipv4_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.label_mode, null) == "per-vrf" ? true : null
          label_mode_per_vrf_46                                    = try(vrf.address_family.ipv4_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.label_mode, null) == "per-vrf-46" ? true : null
          label_mode_route_policy                                  = try(vrf.address_family.ipv4_unicast.label_mode_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.label_mode_route_policy, null)
          redistribute_connected                                   = try(vrf.address_family.ipv4_unicast.redistribute_connected, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_connected, null)
          redistribute_connected_metric                            = try(vrf.address_family.ipv4_unicast.redistribute_connected_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_connected_metric, null)
          redistribute_connected_multipath                         = try(vrf.address_family.ipv4_unicast.redistribute_connected_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_connected_multipath, null)
          redistribute_connected_route_policy                      = try(vrf.address_family.ipv4_unicast.redistribute_connected_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_connected_route_policy, null)
          redistribute_static                                      = try(vrf.address_family.ipv4_unicast.redistribute_static, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_static, null)
          redistribute_static_metric                               = try(vrf.address_family.ipv4_unicast.redistribute_static_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_static_metric, null)
          redistribute_static_multipath                            = try(vrf.address_family.ipv4_unicast.redistribute_static_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_static_multipath, null)
          redistribute_static_route_policy                         = try(vrf.address_family.ipv4_unicast.redistribute_static_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_static_route_policy, null)
          redistribute_rip                                         = try(vrf.address_family.ipv4_unicast.redistribute_rip, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_rip, null)
          redistribute_rip_metric                                  = try(vrf.address_family.ipv4_unicast.redistribute_rip_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_rip_metric, null)
          redistribute_rip_multipath                               = try(vrf.address_family.ipv4_unicast.redistribute_rip_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_rip_multipath, null)
          redistribute_rip_route_policy                            = try(vrf.address_family.ipv4_unicast.redistribute_rip_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_rip_route_policy, null)
          table_policy                                             = try(vrf.address_family.ipv4_unicast.table_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.table_policy, null)
          bgp_origin_as_validation_enable                          = try(vrf.address_family.ipv4_unicast.bgp_origin_as_validation_enable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.bgp_origin_as_validation_enable, null)
          bgp_origin_as_validation_signal_ibgp                     = try(vrf.address_family.ipv4_unicast.bgp_origin_as_validation_signal_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.bgp_origin_as_validation_signal_ibgp, null)
          bgp_bestpath_origin_as_use_validity                      = try(vrf.address_family.ipv4_unicast.bgp_bestpath_origin_as_use_validity, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.bgp_bestpath_origin_as_use_validity, null)
          bgp_bestpath_origin_as_allow_invalid                     = try(vrf.address_family.ipv4_unicast.bgp_bestpath_origin_as_allow_invalid, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.bgp_bestpath_origin_as_allow_invalid, null)
          bgp_dampening_decay_half_life                            = try(vrf.address_family.ipv4_unicast.bgp_dampening_decay_half_life, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.bgp_dampening_decay_half_life, null)
          bgp_dampening_reuse_threshold                            = try(vrf.address_family.ipv4_unicast.bgp_dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.bgp_dampening_reuse_threshold, null)
          bgp_dampening_suppress_threshold                         = try(vrf.address_family.ipv4_unicast.bgp_dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.bgp_dampening_suppress_threshold, null)
          bgp_dampening_max_suppress_time                          = try(vrf.address_family.ipv4_unicast.bgp_dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.bgp_dampening_max_suppress_time, null)
          bgp_dampening_route_policy                               = try(vrf.address_family.ipv4_unicast.bgp_dampening_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.bgp_dampening_route_policy, null)
          dynamic_med_interval                                     = try(vrf.address_family.ipv4_unicast.dynamic_med_interval, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.dynamic_med_interval, null)
          weight_reset_on_import                                   = try(vrf.address_family.ipv4_unicast.weight_reset_on_import, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.weight_reset_on_import, null)
          nexthop_route_policy                                     = try(vrf.address_family.ipv4_unicast.nexthop_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.nexthop_route_policy, null)
          as_path_loopcheck_out_disable                            = try(vrf.address_family.ipv4_unicast.as_path_loopcheck_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.as_path_loopcheck_out_disable, null)
          mvpn_single_forwarder_selection                          = try(vrf.address_family.ipv4_unicast.mvpn_single_forwarder_selection, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.mvpn_single_forwarder_selection, null)
          segment_routing_srv6_locator                             = try(vrf.address_family.ipv4_unicast.segment_routing_srv6.locator, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.segment_routing_srv6.locator, null)
          segment_routing_srv6_usid_allocation_wide_local_id_block = try(vrf.address_family.ipv4_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, null)
          segment_routing_srv6_alloc_mode_per_ce                   = try(vrf.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode, null) == "per-ce" ? true : null
          segment_routing_srv6_alloc_mode_per_vrf                  = try(vrf.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf" ? true : null
          segment_routing_srv6_alloc_mode_per_vrf_46               = try(vrf.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf-46" ? true : null
          segment_routing_srv6_alloc_mode_route_policy             = try(vrf.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.segment_routing_srv6.alloc_mode_route_policy, null)
          aggregate_addresses = try(length(vrf.address_family.ipv4_unicast.aggregate_addresses) == 0, true) ? null : [for agg in vrf.address_family.ipv4_unicast.aggregate_addresses : {
            address       = try(agg.address, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.aggregate_addresses.address, null)
            prefix        = try(agg.mask, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.aggregate_addresses.mask, null)
            as_set        = try(agg.as_set, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.aggregate_addresses.as_set, null)
            as_confed_set = try(agg.as_confed_set, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.aggregate_addresses.as_confed_set, null)
            summary_only  = try(agg.summary_only, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.aggregate_addresses.summary_only, null)
            route_policy  = try(agg.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.aggregate_addresses.route_policy, null)
            description   = try(agg.description, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.aggregate_addresses.description, null)
            set_tag       = try(agg.set_tag, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.aggregate_addresses.set_tag, null)
            }
          ]
          networks = try(length(vrf.address_family.ipv4_unicast.networks) == 0, true) ? null : [for net in vrf.address_family.ipv4_unicast.networks : {
            address      = try(net.address, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.networks.address, null)
            prefix       = try(net.mask, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.networks.mask, null)
            route_policy = try(net.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.networks.route_policy, null)
            backdoor     = try(net.backdoor, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.networks.backdoor, null)
            multipath    = try(net.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.networks.multipath, null)
            }
          ]
          redistribute_ospf = try(length(vrf.address_family.ipv4_unicast.redistribute_ospf) == 0, true) ? null : [for ospf in vrf.address_family.ipv4_unicast.redistribute_ospf : {
            router_tag                                = try(ospf.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.instance_id, null)
            match_internal                            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal" ? true : null
            match_external                            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-external" ? true : null
            match_nssa_external                       = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-nssa-external" ? true : null
            match_internal_external                   = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal-external" ? true : null
            match_internal_external_1                 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal-external-1" ? true : null
            match_internal_external_1_nssa_external   = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal-external-1-nssa-external" ? true : null
            match_internal_external_1_nssa_external_1 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal-external-1-nssa-external-1" ? true : null
            match_internal_external_1_nssa_external_2 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal-external-1-nssa-external-2" ? true : null
            match_internal_external_2                 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal-external-2" ? true : null
            match_internal_external_2_nssa_external   = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal-external-2-nssa-external" ? true : null
            match_internal_external_2_nssa_external_1 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal-external-2-nssa-external-1" ? true : null
            match_internal_external_2_nssa_external_2 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal-external-2-nssa-external-2" ? true : null
            match_internal_external_nssa_external     = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal-external-nssa-external" ? true : null
            match_internal_external_nssa_external_1   = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal-external-nssa-external-1" ? true : null
            match_internal_external_nssa_external_2   = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal-external-nssa-external-2" ? true : null
            match_internal_nssa_external              = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal-nssa-external" ? true : null
            match_internal_nssa_external_1            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal-nssa-external-1" ? true : null
            match_internal_nssa_external_2            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-internal-nssa-external-2" ? true : null
            match_external_1                          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-external-1" ? true : null
            match_external_1_nssa_external            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-external-1-nssa-external" ? true : null
            match_external_1_nssa_external_1          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-external-1-nssa-external-1" ? true : null
            match_external_1_nssa_external_2          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-external-1-nssa-external-2" ? true : null
            match_external_2                          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-external-2" ? true : null
            match_external_2_nssa_external            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-external-2-nssa-external" ? true : null
            match_external_2_nssa_external_1          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-external-2-nssa-external-1" ? true : null
            match_external_2_nssa_external_2          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-external-2-nssa-external-2" ? true : null
            match_external_nssa_external              = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-external-nssa-external" ? true : null
            match_external_nssa_external_1            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-external-nssa-external-1" ? true : null
            match_external_nssa_external_2            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-external-nssa-external-2" ? true : null
            match_nssa_external_1                     = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-nssa-external-1" ? true : null
            match_nssa_external_2                     = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.match, null) == "match-nssa-external-2" ? true : null
            metric                                    = try(ospf.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.metric, null)
            multipath                                 = try(ospf.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.multipath, null)
            route_policy                              = try(ospf.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_ospf.route_policy, null)
            }
          ]
          redistribute_eigrp = try(length(vrf.address_family.ipv4_unicast.redistribute_eigrp) == 0, true) ? null : [for eigrp in vrf.address_family.ipv4_unicast.redistribute_eigrp : {
            instance_name           = try(eigrp.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_eigrp.instance_id, null)
            match_internal          = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_eigrp.match, null) == "match-internal" ? true : null
            match_internal_external = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_eigrp.match, null) == "match-internal-external" ? true : null
            match_external          = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_eigrp.match, null) == "match-external" ? true : null
            metric                  = try(eigrp.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_eigrp.metric, null)
            multipath               = try(eigrp.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_eigrp.multipath, null)
            route_policy            = try(eigrp.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_eigrp.route_policy, null)
            }
          ]
          redistribute_isis = try(length(vrf.address_family.ipv4_unicast.redistribute_isis) == 0, true) ? null : [for isis in vrf.address_family.ipv4_unicast.redistribute_isis : {
            instance_name                      = try(isis.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_isis.instance_id, null)
            level_1                            = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_isis.level, null) == "level-1" ? true : null
            level_1_level_2                    = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_isis.level, null) == "level-1-level-2" ? true : null
            level_1_level_2_level_1_inter_area = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_isis.level, null) == "level-1-level-2-level-1-inter-area" ? true : null
            level_1_level_1_inter_area         = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_isis.level, null) == "level-1-level-1-inter-area" ? true : null
            level_2                            = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_isis.level, null) == "level-2" ? true : null
            level_2_level_1_inter_area         = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_isis.level, null) == "level-2-level-1-inter-area" ? true : null
            level_1_inter_area                 = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_isis.level, null) == "level-1-inter-area" ? true : null
            metric                             = try(isis.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_isis.metric, null)
            multipath                          = try(isis.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_isis.multipath, null)
            route_policy                       = try(isis.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_unicast.redistribute_isis.route_policy, null)
            }
          ]
          }
        ] : []
      ]
    ]
  ])
}


resource "iosxr_router_bgp_vrf_address_family" "ipv4_unicast" {
  for_each                                                 = { for af in local.router_bgp_vrf_address_family_ipv4_unicast : af.key => af }
  device                                                   = each.value.device_name
  as_number                                                = each.value.as_number
  vrf_name                                                 = each.value.vrf_name
  af_name                                                  = each.value.af_name
  distance_bgp_external_route                              = each.value.distance_bgp_external_route
  distance_bgp_internal_route                              = each.value.distance_bgp_internal_route
  distance_bgp_local_route                                 = each.value.distance_bgp_local_route
  bgp_attribute_download                                   = each.value.bgp_attribute_download
  allow_vpn_default_originate                              = each.value.allow_vpn_default_originate
  additional_paths_send                                    = each.value.additional_paths_send
  additional_paths_send_disable                            = each.value.additional_paths_send_disable
  additional_paths_receive                                 = each.value.additional_paths_receive
  additional_paths_receive_disable                         = each.value.additional_paths_receive_disable
  additional_paths_advertise_limit                         = each.value.additional_paths_advertise_limit
  additional_paths_selection_route_policy                  = each.value.additional_paths_selection_route_policy
  additional_paths_selection_disable                       = each.value.additional_paths_selection_disable
  advertise_best_external                                  = each.value.advertise_best_external
  advertise_best_external_disable                          = each.value.advertise_best_external_disable
  advertise_local_labeled_route_safi_unicast               = each.value.advertise_local_labeled_route_safi_unicast
  allocate_label_all                                       = each.value.allocate_label_all
  allocate_label_all_unlabeled_path                        = each.value.allocate_label_all_unlabeled_path
  allocate_label_route_policy_name                         = each.value.allocate_label_route_policy_name
  allocate_label_route_policy_unlabeled_path               = each.value.allocate_label_route_policy_unlabeled_path
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
  table_policy                                             = each.value.table_policy
  bgp_origin_as_validation_enable                          = each.value.bgp_origin_as_validation_enable
  bgp_origin_as_validation_signal_ibgp                     = each.value.bgp_origin_as_validation_signal_ibgp
  bgp_bestpath_origin_as_use_validity                      = each.value.bgp_bestpath_origin_as_use_validity
  bgp_bestpath_origin_as_allow_invalid                     = each.value.bgp_bestpath_origin_as_allow_invalid
  bgp_dampening_decay_half_life                            = each.value.bgp_dampening_decay_half_life
  bgp_dampening_reuse_threshold                            = each.value.bgp_dampening_reuse_threshold
  bgp_dampening_suppress_threshold                         = each.value.bgp_dampening_suppress_threshold
  bgp_dampening_max_suppress_time                          = each.value.bgp_dampening_max_suppress_time
  bgp_dampening_route_policy                               = each.value.bgp_dampening_route_policy
  dynamic_med_interval                                     = each.value.dynamic_med_interval
  weight_reset_on_import                                   = each.value.weight_reset_on_import
  nexthop_route_policy                                     = each.value.nexthop_route_policy
  as_path_loopcheck_out_disable                            = each.value.as_path_loopcheck_out_disable
  mvpn_single_forwarder_selection                          = each.value.mvpn_single_forwarder_selection
  segment_routing_srv6_locator                             = each.value.segment_routing_srv6_locator
  segment_routing_srv6_usid_allocation_wide_local_id_block = each.value.segment_routing_srv6_usid_allocation_wide_local_id_block
  segment_routing_srv6_alloc_mode_per_ce                   = each.value.segment_routing_srv6_alloc_mode_per_ce
  segment_routing_srv6_alloc_mode_per_vrf                  = each.value.segment_routing_srv6_alloc_mode_per_vrf
  segment_routing_srv6_alloc_mode_per_vrf_46               = each.value.segment_routing_srv6_alloc_mode_per_vrf_46
  segment_routing_srv6_alloc_mode_route_policy             = each.value.segment_routing_srv6_alloc_mode_route_policy
  aggregate_addresses                                      = each.value.aggregate_addresses
  networks                                                 = each.value.networks
  redistribute_ospf                                        = each.value.redistribute_ospf
  redistribute_eigrp                                       = each.value.redistribute_eigrp
  redistribute_isis                                        = each.value.redistribute_isis

  lifecycle {
    replace_triggered_by = [
      iosxr_router_bgp_vrf.router_bgp_vrf
    ]
  }

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_bgp.router_bgp,
    iosxr_router_bgp_address_family.ipv4_unicast,
    iosxr_router_bgp_address_family.ipv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_unicast,
    iosxr_router_bgp_address_family.vpnv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_multicast,
    iosxr_router_bgp_address_family.vpnv6_multicast,
    iosxr_router_bgp_address_family.l2vpn_evpn,
    iosxr_router_bgp_session_group.router_bgp_session_group,
    iosxr_router_bgp_neighbor_group.router_bgp_neighbor_group,
    iosxr_router_bgp_af_group.router_bgp_af_group,
    iosxr_router_bgp_vrf.router_bgp_vrf
  ]
}

locals {
  router_bgp_vrf_address_family_ipv6_unicast = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : [
        for vrf in try(bgp_process.vrfs, []) :
        contains(keys(try(vrf.address_family, {})), "ipv6_unicast") ? [{
          key                                                      = format("%s/%s/%s/ipv6-unicast", device.name, bgp_process.as_number, vrf.vrf_name)
          device_name                                              = device.name
          as_number                                                = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
          vrf_name                                                 = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.vrf_name, null)
          af_name                                                  = "ipv6-unicast"
          distance_bgp_external_route                              = try(vrf.address_family.ipv6_unicast.distance_bgp_external_route, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.distance_bgp_external_route, null)
          distance_bgp_internal_route                              = try(vrf.address_family.ipv6_unicast.distance_bgp_internal_route, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.distance_bgp_internal_route, null)
          distance_bgp_local_route                                 = try(vrf.address_family.ipv6_unicast.distance_bgp_local_route, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.distance_bgp_local_route, null)
          bgp_attribute_download                                   = try(vrf.address_family.ipv6_unicast.bgp_attribute_download, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.bgp_attribute_download, null)
          allow_vpn_default_originate                              = try(vrf.address_family.ipv6_unicast.allow_vpn_default_originate, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.allow_vpn_default_originate, null)
          additional_paths_send                                    = try(vrf.address_family.ipv6_unicast.additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.additional_paths_send, null)
          additional_paths_send_disable                            = try(vrf.address_family.ipv6_unicast.additional_paths_send_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.additional_paths_send_disable, null)
          additional_paths_receive                                 = try(vrf.address_family.ipv6_unicast.additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.additional_paths_receive, null)
          additional_paths_receive_disable                         = try(vrf.address_family.ipv6_unicast.additional_paths_receive_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.additional_paths_receive_disable, null)
          additional_paths_advertise_limit                         = try(vrf.address_family.ipv6_unicast.additional_paths_advertise_limit, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.additional_paths_advertise_limit, null)
          additional_paths_selection_route_policy                  = try(vrf.address_family.ipv6_unicast.additional_paths_selection_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.additional_paths_selection_route_policy, null)
          additional_paths_selection_disable                       = try(vrf.address_family.ipv6_unicast.additional_paths_selection_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.additional_paths_selection_disable, null)
          advertise_best_external                                  = try(vrf.address_family.ipv6_unicast.advertise_best_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.advertise_best_external, null)
          advertise_best_external_disable                          = try(vrf.address_family.ipv6_unicast.advertise_best_external_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.advertise_best_external_disable, null)
          advertise_local_labeled_route_safi_unicast               = try(vrf.address_family.ipv6_unicast.advertise_local_labeled_route_safi_unicast, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.advertise_local_labeled_route_safi_unicast, null)
          allocate_label_all                                       = try(vrf.address_family.ipv6_unicast.allocate_label_all, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.allocate_label_all, null)
          allocate_label_all_unlabeled_path                        = try(vrf.address_family.ipv6_unicast.allocate_label_all_unlabeled_path, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.allocate_label_all_unlabeled_path, null)
          allocate_label_route_policy_name                         = try(vrf.address_family.ipv6_unicast.allocate_label_route_policy_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.allocate_label_route_policy_name, null)
          allocate_label_route_policy_unlabeled_path               = try(vrf.address_family.ipv6_unicast.allocate_label_route_policy_unlabeled_path, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.allocate_label_route_policy_unlabeled_path, null)
          maximum_paths_ebgp_multipath                             = try(vrf.address_family.ipv6_unicast.maximum_paths_ebgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.maximum_paths_ebgp_multipath, null)
          maximum_paths_ebgp_selective                             = try(vrf.address_family.ipv6_unicast.maximum_paths_ebgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.maximum_paths_ebgp_selective, null)
          maximum_paths_ebgp_route_policy                          = try(vrf.address_family.ipv6_unicast.maximum_paths_ebgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.maximum_paths_ebgp_route_policy, null)
          maximum_paths_ibgp_multipath                             = try(vrf.address_family.ipv6_unicast.maximum_paths_ibgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.maximum_paths_ibgp_multipath, null)
          maximum_paths_ibgp_unequal_cost                          = try(vrf.address_family.ipv6_unicast.maximum_paths_ibgp_unequal_cost, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.maximum_paths_ibgp_unequal_cost, null)
          maximum_paths_ibgp_unequal_cost_deterministic            = try(vrf.address_family.ipv6_unicast.maximum_paths_ibgp_unequal_cost_deterministic, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.maximum_paths_ibgp_unequal_cost_deterministic, null)
          maximum_paths_ibgp_selective                             = try(vrf.address_family.ipv6_unicast.maximum_paths_ibgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.maximum_paths_ibgp_selective, null)
          maximum_paths_ibgp_route_policy                          = try(vrf.address_family.ipv6_unicast.maximum_paths_ibgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.maximum_paths_ibgp_route_policy, null)
          maximum_paths_eibgp_multipath                            = try(vrf.address_family.ipv6_unicast.maximum_paths_eibgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.maximum_paths_eibgp_multipath, null)
          maximum_paths_eibgp_equal_cost                           = try(vrf.address_family.ipv6_unicast.maximum_paths_eibgp_equal_cost, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.maximum_paths_eibgp_equal_cost, null)
          maximum_paths_eibgp_selective                            = try(vrf.address_family.ipv6_unicast.maximum_paths_eibgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.maximum_paths_eibgp_selective, null)
          maximum_paths_eibgp_route_policy                         = try(vrf.address_family.ipv6_unicast.maximum_paths_eibgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.maximum_paths_eibgp_route_policy, null)
          maximum_paths_unique_nexthop_check_disable               = try(vrf.address_family.ipv6_unicast.maximum_paths_unique_nexthop_check_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.maximum_paths_unique_nexthop_check_disable, null)
          label_mode_per_prefix                                    = try(vrf.address_family.ipv6_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.label_mode, null) == "per-prefix" ? true : null
          label_mode_per_ce                                        = try(vrf.address_family.ipv6_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.label_mode, null) == "per-ce" ? true : null
          label_mode_per_vrf                                       = try(vrf.address_family.ipv6_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.label_mode, null) == "per-vrf" ? true : null
          label_mode_per_vrf_46                                    = try(vrf.address_family.ipv6_unicast.label_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.label_mode, null) == "per-vrf-46" ? true : null
          label_mode_route_policy                                  = try(vrf.address_family.ipv6_unicast.label_mode_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.label_mode_route_policy, null)
          redistribute_connected                                   = try(vrf.address_family.ipv6_unicast.redistribute_connected, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_connected, null)
          redistribute_connected_metric                            = try(vrf.address_family.ipv6_unicast.redistribute_connected_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_connected_metric, null)
          redistribute_connected_multipath                         = try(vrf.address_family.ipv6_unicast.redistribute_connected_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_connected_multipath, null)
          redistribute_connected_route_policy                      = try(vrf.address_family.ipv6_unicast.redistribute_connected_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_connected_route_policy, null)
          redistribute_static                                      = try(vrf.address_family.ipv6_unicast.redistribute_static, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_static, null)
          redistribute_static_metric                               = try(vrf.address_family.ipv6_unicast.redistribute_static_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_static_metric, null)
          redistribute_static_multipath                            = try(vrf.address_family.ipv6_unicast.redistribute_static_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_static_multipath, null)
          redistribute_static_route_policy                         = try(vrf.address_family.ipv6_unicast.redistribute_static_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_static_route_policy, null)
          redistribute_rip                                         = try(vrf.address_family.ipv6_unicast.redistribute_rip, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_rip, null)
          redistribute_rip_metric                                  = try(vrf.address_family.ipv6_unicast.redistribute_rip_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_rip_metric, null)
          redistribute_rip_multipath                               = try(vrf.address_family.ipv6_unicast.redistribute_rip_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_rip_multipath, null)
          redistribute_rip_route_policy                            = try(vrf.address_family.ipv6_unicast.redistribute_rip_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_rip_route_policy, null)
          table_policy                                             = try(vrf.address_family.ipv6_unicast.table_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.table_policy, null)
          bgp_origin_as_validation_enable                          = try(vrf.address_family.ipv6_unicast.bgp_origin_as_validation_enable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.bgp_origin_as_validation_enable, null)
          bgp_origin_as_validation_signal_ibgp                     = try(vrf.address_family.ipv6_unicast.bgp_origin_as_validation_signal_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.bgp_origin_as_validation_signal_ibgp, null)
          bgp_bestpath_origin_as_use_validity                      = try(vrf.address_family.ipv6_unicast.bgp_bestpath_origin_as_use_validity, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.bgp_bestpath_origin_as_use_validity, null)
          bgp_bestpath_origin_as_allow_invalid                     = try(vrf.address_family.ipv6_unicast.bgp_bestpath_origin_as_allow_invalid, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.bgp_bestpath_origin_as_allow_invalid, null)
          bgp_dampening_decay_half_life                            = try(vrf.address_family.ipv6_unicast.bgp_dampening_decay_half_life, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.bgp_dampening_decay_half_life, null)
          bgp_dampening_reuse_threshold                            = try(vrf.address_family.ipv6_unicast.bgp_dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.bgp_dampening_reuse_threshold, null)
          bgp_dampening_suppress_threshold                         = try(vrf.address_family.ipv6_unicast.bgp_dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.bgp_dampening_suppress_threshold, null)
          bgp_dampening_max_suppress_time                          = try(vrf.address_family.ipv6_unicast.bgp_dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.bgp_dampening_max_suppress_time, null)
          bgp_dampening_route_policy                               = try(vrf.address_family.ipv6_unicast.bgp_dampening_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.bgp_dampening_route_policy, null)
          dynamic_med_interval                                     = try(vrf.address_family.ipv6_unicast.dynamic_med_interval, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.dynamic_med_interval, null)
          weight_reset_on_import                                   = try(vrf.address_family.ipv6_unicast.weight_reset_on_import, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.weight_reset_on_import, null)
          nexthop_route_policy                                     = try(vrf.address_family.ipv6_unicast.nexthop_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.nexthop_route_policy, null)
          as_path_loopcheck_out_disable                            = try(vrf.address_family.ipv6_unicast.as_path_loopcheck_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.as_path_loopcheck_out_disable, null)
          mvpn_single_forwarder_selection                          = try(vrf.address_family.ipv6_unicast.mvpn_single_forwarder_selection, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.mvpn_single_forwarder_selection, null)
          segment_routing_srv6_locator                             = try(vrf.address_family.ipv6_unicast.segment_routing_srv6.locator, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.segment_routing_srv6.locator, null)
          segment_routing_srv6_usid_allocation_wide_local_id_block = try(vrf.address_family.ipv6_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.segment_routing_srv6.usid_allocation_wide_local_id_block, null)
          segment_routing_srv6_alloc_mode_per_ce                   = try(vrf.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode, null) == "per-ce" ? true : null
          segment_routing_srv6_alloc_mode_per_vrf                  = try(vrf.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf" ? true : null
          segment_routing_srv6_alloc_mode_per_vrf_46               = try(vrf.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode, null) == "per-vrf-46" ? true : null
          segment_routing_srv6_alloc_mode_route_policy             = try(vrf.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.segment_routing_srv6.alloc_mode_route_policy, null)
          aggregate_addresses = try(length(vrf.address_family.ipv6_unicast.aggregate_addresses) == 0, true) ? null : [for agg in vrf.address_family.ipv6_unicast.aggregate_addresses : {
            address       = try(agg.address, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.aggregate_addresses.address, null)
            prefix        = try(agg.mask, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.aggregate_addresses.mask, null)
            as_set        = try(agg.as_set, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.aggregate_addresses.as_set, null)
            as_confed_set = try(agg.as_confed_set, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.aggregate_addresses.as_confed_set, null)
            summary_only  = try(agg.summary_only, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.aggregate_addresses.summary_only, null)
            route_policy  = try(agg.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.aggregate_addresses.route_policy, null)
            description   = try(agg.description, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.aggregate_addresses.description, null)
            set_tag       = try(agg.set_tag, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.aggregate_addresses.set_tag, null)
            }
          ]
          networks = try(length(vrf.address_family.ipv6_unicast.networks) == 0, true) ? null : [for net in vrf.address_family.ipv6_unicast.networks : {
            address      = try(net.address, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.networks.address, null)
            prefix       = try(net.mask, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.networks.mask, null)
            route_policy = try(net.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.networks.route_policy, null)
            backdoor     = try(net.backdoor, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.networks.backdoor, null)
            multipath    = try(net.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.networks.multipath, null)
            }
          ]
          redistribute_ospfv3 = try(length(vrf.address_family.ipv6_unicast.redistribute_ospfv3) == 0, true) ? null : [for ospfv3 in vrf.address_family.ipv6_unicast.redistribute_ospfv3 : {
            router_tag                                = try(ospfv3.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.instance_id, null)
            match_internal                            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal" ? true : null
            match_external                            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external" ? true : null
            match_nssa_external                       = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-nssa-external" ? true : null
            match_internal_external                   = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external" ? true : null
            match_internal_external_1                 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-1" ? true : null
            match_internal_external_1_nssa_external   = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-1-nssa-external" ? true : null
            match_internal_external_1_nssa_external_1 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-1-nssa-external-1" ? true : null
            match_internal_external_1_nssa_external_2 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-1-nssa-external-2" ? true : null
            match_internal_external_2                 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-2" ? true : null
            match_internal_external_2_nssa_external   = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-2-nssa-external" ? true : null
            match_internal_external_2_nssa_external_1 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-2-nssa-external-1" ? true : null
            match_internal_external_2_nssa_external_2 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-2-nssa-external-2" ? true : null
            match_internal_external_nssa_external     = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-nssa-external" ? true : null
            match_internal_external_nssa_external_1   = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-nssa-external-1" ? true : null
            match_internal_external_nssa_external_2   = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-external-nssa-external-2" ? true : null
            match_internal_nssa_external              = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-nssa-external" ? true : null
            match_internal_nssa_external_1            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-nssa-external-1" ? true : null
            match_internal_nssa_external_2            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-internal-nssa-external-2" ? true : null
            match_external_1                          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-1" ? true : null
            match_external_1_nssa_external            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-1-nssa-external" ? true : null
            match_external_1_nssa_external_1          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-1-nssa-external-1" ? true : null
            match_external_1_nssa_external_2          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-1-nssa-external-2" ? true : null
            match_external_2                          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-2" ? true : null
            match_external_2_nssa_external            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-2-nssa-external" ? true : null
            match_external_2_nssa_external_1          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-2-nssa-external-1" ? true : null
            match_external_2_nssa_external_2          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-2-nssa-external-2" ? true : null
            match_external_nssa_external              = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-nssa-external" ? true : null
            match_external_nssa_external_1            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-nssa-external-1" ? true : null
            match_external_nssa_external_2            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-external-nssa-external-2" ? true : null
            match_nssa_external_1                     = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-nssa-external-1" ? true : null
            match_nssa_external_2                     = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.match, null) == "match-nssa-external-2" ? true : null
            metric                                    = try(ospfv3.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.metric, null)
            multipath                                 = try(ospfv3.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.multipath, null)
            route_policy                              = try(ospfv3.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_ospfv3.route_policy, null)
            }
          ]
          redistribute_eigrp = try(length(vrf.address_family.ipv6_unicast.redistribute_eigrp) == 0, true) ? null : [for eigrp in vrf.address_family.ipv6_unicast.redistribute_eigrp : {
            instance_name           = try(eigrp.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_eigrp.instance_id, null)
            match_internal          = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_eigrp.match, null) == "match-internal" ? true : null
            match_internal_external = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_eigrp.match, null) == "match-internal-external" ? true : null
            match_external          = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_eigrp.match, null) == "match-external" ? true : null
            metric                  = try(eigrp.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_eigrp.metric, null)
            multipath               = try(eigrp.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_eigrp.multipath, null)
            route_policy            = try(eigrp.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_eigrp.route_policy, null)
            }
          ]
          redistribute_isis = try(length(vrf.address_family.ipv6_unicast.redistribute_isis) == 0, true) ? null : [for isis in vrf.address_family.ipv6_unicast.redistribute_isis : {
            instance_name                      = try(isis.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_isis.instance_id, null)
            level_1                            = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_isis.level, null) == "level-1" ? true : null
            level_1_level_2                    = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_isis.level, null) == "level-1-level-2" ? true : null
            level_1_level_2_level_1_inter_area = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_isis.level, null) == "level-1-level-2-level-1-inter-area" ? true : null
            level_1_level_1_inter_area         = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_isis.level, null) == "level-1-level-1-inter-area" ? true : null
            level_2                            = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_isis.level, null) == "level-2" ? true : null
            level_2_level_1_inter_area         = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_isis.level, null) == "level-2-level-1-inter-area" ? true : null
            level_1_inter_area                 = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_isis.level, null) == "level-1-inter-area" ? true : null
            metric                             = try(isis.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_isis.metric, null)
            multipath                          = try(isis.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_isis.multipath, null)
            route_policy                       = try(isis.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_unicast.redistribute_isis.route_policy, null)
            }
          ]
          }
        ] : []
      ]
    ]
  ])
}

resource "iosxr_router_bgp_vrf_address_family" "ipv6_unicast" {
  for_each                                                 = { for af in local.router_bgp_vrf_address_family_ipv6_unicast : af.key => af }
  device                                                   = each.value.device_name
  as_number                                                = each.value.as_number
  vrf_name                                                 = each.value.vrf_name
  af_name                                                  = each.value.af_name
  distance_bgp_external_route                              = each.value.distance_bgp_external_route
  distance_bgp_internal_route                              = each.value.distance_bgp_internal_route
  distance_bgp_local_route                                 = each.value.distance_bgp_local_route
  bgp_attribute_download                                   = each.value.bgp_attribute_download
  allow_vpn_default_originate                              = each.value.allow_vpn_default_originate
  additional_paths_send                                    = each.value.additional_paths_send
  additional_paths_send_disable                            = each.value.additional_paths_send_disable
  additional_paths_receive                                 = each.value.additional_paths_receive
  additional_paths_receive_disable                         = each.value.additional_paths_receive_disable
  additional_paths_advertise_limit                         = each.value.additional_paths_advertise_limit
  additional_paths_selection_route_policy                  = each.value.additional_paths_selection_route_policy
  additional_paths_selection_disable                       = each.value.additional_paths_selection_disable
  advertise_best_external                                  = each.value.advertise_best_external
  advertise_best_external_disable                          = each.value.advertise_best_external_disable
  advertise_local_labeled_route_safi_unicast               = each.value.advertise_local_labeled_route_safi_unicast
  allocate_label_all                                       = each.value.allocate_label_all
  allocate_label_all_unlabeled_path                        = each.value.allocate_label_all_unlabeled_path
  allocate_label_route_policy_name                         = each.value.allocate_label_route_policy_name
  allocate_label_route_policy_unlabeled_path               = each.value.allocate_label_route_policy_unlabeled_path
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
  table_policy                                             = each.value.table_policy
  bgp_origin_as_validation_enable                          = each.value.bgp_origin_as_validation_enable
  bgp_origin_as_validation_signal_ibgp                     = each.value.bgp_origin_as_validation_signal_ibgp
  bgp_bestpath_origin_as_use_validity                      = each.value.bgp_bestpath_origin_as_use_validity
  bgp_bestpath_origin_as_allow_invalid                     = each.value.bgp_bestpath_origin_as_allow_invalid
  bgp_dampening_decay_half_life                            = each.value.bgp_dampening_decay_half_life
  bgp_dampening_reuse_threshold                            = each.value.bgp_dampening_reuse_threshold
  bgp_dampening_suppress_threshold                         = each.value.bgp_dampening_suppress_threshold
  bgp_dampening_max_suppress_time                          = each.value.bgp_dampening_max_suppress_time
  bgp_dampening_route_policy                               = each.value.bgp_dampening_route_policy
  dynamic_med_interval                                     = each.value.dynamic_med_interval
  weight_reset_on_import                                   = each.value.weight_reset_on_import
  nexthop_route_policy                                     = each.value.nexthop_route_policy
  as_path_loopcheck_out_disable                            = each.value.as_path_loopcheck_out_disable
  mvpn_single_forwarder_selection                          = each.value.mvpn_single_forwarder_selection
  segment_routing_srv6_locator                             = each.value.segment_routing_srv6_locator
  segment_routing_srv6_usid_allocation_wide_local_id_block = each.value.segment_routing_srv6_usid_allocation_wide_local_id_block
  segment_routing_srv6_alloc_mode_per_ce                   = each.value.segment_routing_srv6_alloc_mode_per_ce
  segment_routing_srv6_alloc_mode_per_vrf                  = each.value.segment_routing_srv6_alloc_mode_per_vrf
  segment_routing_srv6_alloc_mode_per_vrf_46               = each.value.segment_routing_srv6_alloc_mode_per_vrf_46
  segment_routing_srv6_alloc_mode_route_policy             = each.value.segment_routing_srv6_alloc_mode_route_policy
  aggregate_addresses                                      = each.value.aggregate_addresses
  networks                                                 = each.value.networks
  redistribute_ospf                                        = each.value.redistribute_ospfv3
  redistribute_eigrp                                       = each.value.redistribute_eigrp
  redistribute_isis                                        = each.value.redistribute_isis

  lifecycle {
    replace_triggered_by = [
      iosxr_router_bgp_vrf.router_bgp_vrf
    ]
  }

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_bgp.router_bgp,
    iosxr_router_bgp_address_family.ipv4_unicast,
    iosxr_router_bgp_address_family.ipv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_unicast,
    iosxr_router_bgp_address_family.vpnv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_multicast,
    iosxr_router_bgp_address_family.vpnv6_multicast,
    iosxr_router_bgp_address_family.l2vpn_evpn,
    iosxr_router_bgp_session_group.router_bgp_session_group,
    iosxr_router_bgp_neighbor_group.router_bgp_neighbor_group,
    iosxr_router_bgp_af_group.router_bgp_af_group,
    iosxr_router_bgp_vrf.router_bgp_vrf
  ]
}

locals {
  router_bgp_vrf_address_family_ipv4_multicast = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : [
        for vrf in try(bgp_process.vrfs, []) :
        contains(keys(try(vrf.address_family, {})), "ipv4_multicast") ? [{
          key                                           = format("%s/%s/%s/ipv4-multicast", device.name, bgp_process.as_number, vrf.vrf_name)
          device_name                                   = device.name
          as_number                                     = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
          vrf_name                                      = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.vrf_name, null)
          af_name                                       = "ipv4-multicast"
          distance_bgp_external_route                   = try(vrf.address_family.ipv4_multicast.distance_bgp_external_route, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.distance_bgp_external_route, null)
          distance_bgp_internal_route                   = try(vrf.address_family.ipv4_multicast.distance_bgp_internal_route, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.distance_bgp_internal_route, null)
          distance_bgp_local_route                      = try(vrf.address_family.ipv4_multicast.distance_bgp_local_route, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.distance_bgp_local_route, null)
          maximum_paths_ebgp_multipath                  = try(vrf.address_family.ipv4_multicast.maximum_paths_ebgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.maximum_paths_ebgp_multipath, null)
          maximum_paths_ebgp_selective                  = try(vrf.address_family.ipv4_multicast.maximum_paths_ebgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.maximum_paths_ebgp_selective, null)
          maximum_paths_ebgp_route_policy               = try(vrf.address_family.ipv4_multicast.maximum_paths_ebgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.maximum_paths_ebgp_route_policy, null)
          maximum_paths_ibgp_multipath                  = try(vrf.address_family.ipv4_multicast.maximum_paths_ibgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.maximum_paths_ibgp_multipath, null)
          maximum_paths_ibgp_unequal_cost               = try(vrf.address_family.ipv4_multicast.maximum_paths_ibgp_unequal_cost, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.maximum_paths_ibgp_unequal_cost, null)
          maximum_paths_ibgp_unequal_cost_deterministic = try(vrf.address_family.ipv4_multicast.maximum_paths_ibgp_unequal_cost_deterministic, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.maximum_paths_ibgp_unequal_cost_deterministic, null)
          maximum_paths_ibgp_selective                  = try(vrf.address_family.ipv4_multicast.maximum_paths_ibgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.maximum_paths_ibgp_selective, null)
          maximum_paths_ibgp_route_policy               = try(vrf.address_family.ipv4_multicast.maximum_paths_ibgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.maximum_paths_ibgp_route_policy, null)
          maximum_paths_eibgp_multipath                 = try(vrf.address_family.ipv4_multicast.maximum_paths_eibgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.maximum_paths_eibgp_multipath, null)
          maximum_paths_eibgp_equal_cost                = try(vrf.address_family.ipv4_multicast.maximum_paths_eibgp_equal_cost, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.maximum_paths_eibgp_equal_cost, null)
          maximum_paths_eibgp_selective                 = try(vrf.address_family.ipv4_multicast.maximum_paths_eibgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.maximum_paths_eibgp_selective, null)
          maximum_paths_eibgp_route_policy              = try(vrf.address_family.ipv4_multicast.maximum_paths_eibgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.maximum_paths_eibgp_route_policy, null)
          redistribute_connected                        = try(vrf.address_family.ipv4_multicast.redistribute_connected, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_connected, null)
          redistribute_connected_metric                 = try(vrf.address_family.ipv4_multicast.redistribute_connected_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_connected_metric, null)
          redistribute_connected_multipath              = try(vrf.address_family.ipv4_multicast.redistribute_connected_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_connected_multipath, null)
          redistribute_connected_route_policy           = try(vrf.address_family.ipv4_multicast.redistribute_connected_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_connected_route_policy, null)
          redistribute_static                           = try(vrf.address_family.ipv4_multicast.redistribute_static, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_static, null)
          redistribute_static_metric                    = try(vrf.address_family.ipv4_multicast.redistribute_static_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_static_metric, null)
          redistribute_static_multipath                 = try(vrf.address_family.ipv4_multicast.redistribute_static_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_static_multipath, null)
          redistribute_static_route_policy              = try(vrf.address_family.ipv4_multicast.redistribute_static_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_static_route_policy, null)
          redistribute_rip                              = try(vrf.address_family.ipv4_multicast.redistribute_rip, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_rip, null)
          redistribute_rip_metric                       = try(vrf.address_family.ipv4_multicast.redistribute_rip_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_rip_metric, null)
          redistribute_rip_multipath                    = try(vrf.address_family.ipv4_multicast.redistribute_rip_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_rip_multipath, null)
          redistribute_rip_route_policy                 = try(vrf.address_family.ipv4_multicast.redistribute_rip_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_rip_route_policy, null)
          table_policy                                  = try(vrf.address_family.ipv4_multicast.table_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.table_policy, null)
          bgp_dampening_decay_half_life                 = try(vrf.address_family.ipv4_multicast.bgp_dampening_decay_half_life, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.bgp_dampening_decay_half_life, null)
          bgp_dampening_reuse_threshold                 = try(vrf.address_family.ipv4_multicast.bgp_dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.bgp_dampening_reuse_threshold, null)
          bgp_dampening_suppress_threshold              = try(vrf.address_family.ipv4_multicast.bgp_dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.bgp_dampening_suppress_threshold, null)
          bgp_dampening_max_suppress_time               = try(vrf.address_family.ipv4_multicast.bgp_dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.bgp_dampening_max_suppress_time, null)
          bgp_dampening_route_policy                    = try(vrf.address_family.ipv4_multicast.bgp_dampening_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.bgp_dampening_route_policy, null)
          weight_reset_on_import                        = try(vrf.address_family.ipv4_multicast.weight_reset_on_import, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.weight_reset_on_import, null)
          nexthop_route_policy                          = try(vrf.address_family.ipv4_multicast.nexthop_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.nexthop_route_policy, null)
          as_path_loopcheck_out_disable                 = try(vrf.address_family.ipv4_multicast.as_path_loopcheck_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.as_path_loopcheck_out_disable, null)
          mvpn_single_forwarder_selection               = try(vrf.address_family.ipv4_multicast.mvpn_single_forwarder_selection, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.mvpn_single_forwarder_selection, null)
          aggregate_addresses = try(length(vrf.address_family.ipv4_multicast.aggregate_addresses) == 0, true) ? null : [for agg in vrf.address_family.ipv4_multicast.aggregate_addresses : {
            address       = try(agg.address, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.aggregate_addresses.address, null)
            prefix        = try(agg.mask, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.aggregate_addresses.mask, null)
            as_set        = try(agg.as_set, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.aggregate_addresses.as_set, null)
            as_confed_set = try(agg.as_confed_set, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.aggregate_addresses.as_confed_set, null)
            summary_only  = try(agg.summary_only, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.aggregate_addresses.summary_only, null)
            route_policy  = try(agg.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.aggregate_addresses.route_policy, null)
            description   = try(agg.description, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.aggregate_addresses.description, null)
            set_tag       = try(agg.set_tag, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.aggregate_addresses.set_tag, null)
            }
          ]
          networks = try(length(vrf.address_family.ipv4_multicast.networks) == 0, true) ? null : [for net in vrf.address_family.ipv4_multicast.networks : {
            address      = try(net.address, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.networks.address, null)
            prefix       = try(net.mask, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.networks.mask, null)
            route_policy = try(net.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.networks.route_policy, null)
            backdoor     = try(net.backdoor, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.networks.backdoor, null)
            multipath    = try(net.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.networks.multipath, null)
            }
          ]
          redistribute_ospf = try(length(vrf.address_family.ipv4_multicast.redistribute_ospf) == 0, true) ? null : [for ospf in vrf.address_family.ipv4_multicast.redistribute_ospf : {
            router_tag                                = try(ospf.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.instance_id, null)
            match_internal                            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal" ? true : null
            match_external                            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-external" ? true : null
            match_nssa_external                       = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-nssa-external" ? true : null
            match_internal_external                   = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal-external" ? true : null
            match_internal_external_1                 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal-external-1" ? true : null
            match_internal_external_1_nssa_external   = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal-external-1-nssa-external" ? true : null
            match_internal_external_1_nssa_external_1 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal-external-1-nssa-external-1" ? true : null
            match_internal_external_1_nssa_external_2 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal-external-1-nssa-external-2" ? true : null
            match_internal_external_2                 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal-external-2" ? true : null
            match_internal_external_2_nssa_external   = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal-external-2-nssa-external" ? true : null
            match_internal_external_2_nssa_external_1 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal-external-2-nssa-external-1" ? true : null
            match_internal_external_2_nssa_external_2 = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal-external-2-nssa-external-2" ? true : null
            match_internal_external_nssa_external     = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal-external-nssa-external" ? true : null
            match_internal_external_nssa_external_1   = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal-external-nssa-external-1" ? true : null
            match_internal_external_nssa_external_2   = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal-external-nssa-external-2" ? true : null
            match_internal_nssa_external              = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal-nssa-external" ? true : null
            match_internal_nssa_external_1            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal-nssa-external-1" ? true : null
            match_internal_nssa_external_2            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-internal-nssa-external-2" ? true : null
            match_external_1                          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-external-1" ? true : null
            match_external_1_nssa_external            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-external-1-nssa-external" ? true : null
            match_external_1_nssa_external_1          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-external-1-nssa-external-1" ? true : null
            match_external_1_nssa_external_2          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-external-1-nssa-external-2" ? true : null
            match_external_2                          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-external-2" ? true : null
            match_external_2_nssa_external            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-external-2-nssa-external" ? true : null
            match_external_2_nssa_external_1          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-external-2-nssa-external-1" ? true : null
            match_external_2_nssa_external_2          = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-external-2-nssa-external-2" ? true : null
            match_external_nssa_external              = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-external-nssa-external" ? true : null
            match_external_nssa_external_1            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-external-nssa-external-1" ? true : null
            match_external_nssa_external_2            = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-external-nssa-external-2" ? true : null
            match_nssa_external_1                     = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-nssa-external-1" ? true : null
            match_nssa_external_2                     = try(ospf.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.match, null) == "match-nssa-external-2" ? true : null
            metric                                    = try(ospf.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.metric, null)
            multipath                                 = try(ospf.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.multipath, null)
            route_policy                              = try(ospf.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_ospf.route_policy, null)
            }
          ]
          redistribute_eigrp = try(length(vrf.address_family.ipv4_multicast.redistribute_eigrp) == 0, true) ? null : [for eigrp in vrf.address_family.ipv4_multicast.redistribute_eigrp : {
            instance_name           = try(eigrp.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_eigrp.instance_id, null)
            match_internal          = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_eigrp.match, null) == "match-internal" ? true : null
            match_internal_external = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_eigrp.match, null) == "match-internal-external" ? true : null
            match_external          = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_eigrp.match, null) == "match-external" ? true : null
            metric                  = try(eigrp.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_eigrp.metric, null)
            multipath               = try(eigrp.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_eigrp.multipath, null)
            route_policy            = try(eigrp.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_eigrp.route_policy, null)
            }
          ]
          redistribute_isis = try(length(vrf.address_family.ipv4_multicast.redistribute_isis) == 0, true) ? null : [for isis in vrf.address_family.ipv4_multicast.redistribute_isis : {
            instance_name                      = try(isis.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_isis.instance_id, null)
            level_1                            = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_isis.level, null) == "level-1" ? true : null
            level_1_level_2                    = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_isis.level, null) == "level-1-level-2" ? true : null
            level_1_level_2_level_1_inter_area = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_isis.level, null) == "level-1-level-2-level-1-inter-area" ? true : null
            level_1_level_1_inter_area         = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_isis.level, null) == "level-1-level-1-inter-area" ? true : null
            level_2                            = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_isis.level, null) == "level-2" ? true : null
            level_2_level_1_inter_area         = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_isis.level, null) == "level-2-level-1-inter-area" ? true : null
            level_1_inter_area                 = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_isis.level, null) == "level-1-inter-area" ? true : null
            metric                             = try(isis.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_isis.metric, null)
            multipath                          = try(isis.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_isis.multipath, null)
            route_policy                       = try(isis.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv4_multicast.redistribute_isis.route_policy, null)
            }
          ]
          }
        ] : []
      ]
    ]
  ])
}

resource "iosxr_router_bgp_vrf_address_family" "ipv4_multicast" {
  for_each                                      = { for af in local.router_bgp_vrf_address_family_ipv4_multicast : af.key => af }
  device                                        = each.value.device_name
  as_number                                     = each.value.as_number
  vrf_name                                      = each.value.vrf_name
  af_name                                       = each.value.af_name
  distance_bgp_external_route                   = each.value.distance_bgp_external_route
  distance_bgp_internal_route                   = each.value.distance_bgp_internal_route
  distance_bgp_local_route                      = each.value.distance_bgp_local_route
  maximum_paths_ebgp_multipath                  = each.value.maximum_paths_ebgp_multipath
  maximum_paths_ebgp_selective                  = each.value.maximum_paths_ebgp_selective
  maximum_paths_ebgp_route_policy               = each.value.maximum_paths_ebgp_route_policy
  maximum_paths_ibgp_multipath                  = each.value.maximum_paths_ibgp_multipath
  maximum_paths_ibgp_unequal_cost               = each.value.maximum_paths_ibgp_unequal_cost
  maximum_paths_ibgp_unequal_cost_deterministic = each.value.maximum_paths_ibgp_unequal_cost_deterministic
  maximum_paths_ibgp_selective                  = each.value.maximum_paths_ibgp_selective
  maximum_paths_ibgp_route_policy               = each.value.maximum_paths_ibgp_route_policy
  maximum_paths_eibgp_multipath                 = each.value.maximum_paths_eibgp_multipath
  maximum_paths_eibgp_equal_cost                = each.value.maximum_paths_eibgp_equal_cost
  maximum_paths_eibgp_selective                 = each.value.maximum_paths_eibgp_selective
  maximum_paths_eibgp_route_policy              = each.value.maximum_paths_eibgp_route_policy
  redistribute_connected                        = each.value.redistribute_connected
  redistribute_connected_metric                 = each.value.redistribute_connected_metric
  redistribute_connected_multipath              = each.value.redistribute_connected_multipath
  redistribute_connected_route_policy           = each.value.redistribute_connected_route_policy
  redistribute_static                           = each.value.redistribute_static
  redistribute_static_metric                    = each.value.redistribute_static_metric
  redistribute_static_multipath                 = each.value.redistribute_static_multipath
  redistribute_static_route_policy              = each.value.redistribute_static_route_policy
  redistribute_rip                              = each.value.redistribute_rip
  redistribute_rip_metric                       = each.value.redistribute_rip_metric
  redistribute_rip_multipath                    = each.value.redistribute_rip_multipath
  redistribute_rip_route_policy                 = each.value.redistribute_rip_route_policy
  table_policy                                  = each.value.table_policy
  bgp_dampening_decay_half_life                 = each.value.bgp_dampening_decay_half_life
  bgp_dampening_reuse_threshold                 = each.value.bgp_dampening_reuse_threshold
  bgp_dampening_suppress_threshold              = each.value.bgp_dampening_suppress_threshold
  bgp_dampening_max_suppress_time               = each.value.bgp_dampening_max_suppress_time
  bgp_dampening_route_policy                    = each.value.bgp_dampening_route_policy
  weight_reset_on_import                        = each.value.weight_reset_on_import
  nexthop_route_policy                          = each.value.nexthop_route_policy
  as_path_loopcheck_out_disable                 = each.value.as_path_loopcheck_out_disable
  mvpn_single_forwarder_selection               = each.value.mvpn_single_forwarder_selection
  aggregate_addresses                           = each.value.aggregate_addresses
  networks                                      = each.value.networks
  redistribute_ospf                             = each.value.redistribute_ospf
  redistribute_eigrp                            = each.value.redistribute_eigrp
  redistribute_isis                             = each.value.redistribute_isis

  lifecycle {
    replace_triggered_by = [
      iosxr_router_bgp_vrf.router_bgp_vrf
    ]
  }

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_bgp.router_bgp,
    iosxr_router_bgp_address_family.ipv4_unicast,
    iosxr_router_bgp_address_family.ipv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_unicast,
    iosxr_router_bgp_address_family.vpnv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_multicast,
    iosxr_router_bgp_address_family.vpnv6_multicast,
    iosxr_router_bgp_address_family.l2vpn_evpn,
    iosxr_router_bgp_session_group.router_bgp_session_group,
    iosxr_router_bgp_neighbor_group.router_bgp_neighbor_group,
    iosxr_router_bgp_af_group.router_bgp_af_group,
    iosxr_router_bgp_vrf.router_bgp_vrf
  ]
}


locals {
  router_bgp_vrf_address_family_ipv6_multicast = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : [
        for vrf in try(bgp_process.vrfs, []) :
        contains(keys(try(vrf.address_family, {})), "ipv6_multicast") ? [{
          key                                           = format("%s/%s/%s/ipv6-multicast", device.name, bgp_process.as_number, vrf.vrf_name)
          device_name                                   = device.name
          as_number                                     = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
          vrf_name                                      = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.vrf_name, null)
          af_name                                       = "ipv6-multicast"
          distance_bgp_external_route                   = try(vrf.address_family.ipv6_multicast.distance_bgp_external_route, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.distance_bgp_external_route, null)
          distance_bgp_internal_route                   = try(vrf.address_family.ipv6_multicast.distance_bgp_internal_route, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.distance_bgp_internal_route, null)
          distance_bgp_local_route                      = try(vrf.address_family.ipv6_multicast.distance_bgp_local_route, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.distance_bgp_local_route, null)
          maximum_paths_ebgp_multipath                  = try(vrf.address_family.ipv6_multicast.maximum_paths_ebgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.maximum_paths_ebgp_multipath, null)
          maximum_paths_ebgp_selective                  = try(vrf.address_family.ipv6_multicast.maximum_paths_ebgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.maximum_paths_ebgp_selective, null)
          maximum_paths_ebgp_route_policy               = try(vrf.address_family.ipv6_multicast.maximum_paths_ebgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.maximum_paths_ebgp_route_policy, null)
          maximum_paths_ibgp_multipath                  = try(vrf.address_family.ipv6_multicast.maximum_paths_ibgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.maximum_paths_ibgp_multipath, null)
          maximum_paths_ibgp_unequal_cost               = try(vrf.address_family.ipv6_multicast.maximum_paths_ibgp_unequal_cost, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.maximum_paths_ibgp_unequal_cost, null)
          maximum_paths_ibgp_unequal_cost_deterministic = try(vrf.address_family.ipv6_multicast.maximum_paths_ibgp_unequal_cost_deterministic, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.maximum_paths_ibgp_unequal_cost_deterministic, null)
          maximum_paths_ibgp_selective                  = try(vrf.address_family.ipv6_multicast.maximum_paths_ibgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.maximum_paths_ibgp_selective, null)
          maximum_paths_ibgp_route_policy               = try(vrf.address_family.ipv6_multicast.maximum_paths_ibgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.maximum_paths_ibgp_route_policy, null)
          maximum_paths_eibgp_multipath                 = try(vrf.address_family.ipv6_multicast.maximum_paths_eibgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.maximum_paths_eibgp_multipath, null)
          maximum_paths_eibgp_equal_cost                = try(vrf.address_family.ipv6_multicast.maximum_paths_eibgp_equal_cost, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.maximum_paths_eibgp_equal_cost, null)
          maximum_paths_eibgp_selective                 = try(vrf.address_family.ipv6_multicast.maximum_paths_eibgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.maximum_paths_eibgp_selective, null)
          maximum_paths_eibgp_route_policy              = try(vrf.address_family.ipv6_multicast.maximum_paths_eibgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.maximum_paths_eibgp_route_policy, null)
          redistribute_connected                        = try(vrf.address_family.ipv6_multicast.redistribute_connected, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_connected, null)
          redistribute_connected_metric                 = try(vrf.address_family.ipv6_multicast.redistribute_connected_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_connected_metric, null)
          redistribute_connected_multipath              = try(vrf.address_family.ipv6_multicast.redistribute_connected_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_connected_multipath, null)
          redistribute_connected_route_policy           = try(vrf.address_family.ipv6_multicast.redistribute_connected_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_connected_route_policy, null)
          redistribute_static                           = try(vrf.address_family.ipv6_multicast.redistribute_static, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_static, null)
          redistribute_static_metric                    = try(vrf.address_family.ipv6_multicast.redistribute_static_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_static_metric, null)
          redistribute_static_multipath                 = try(vrf.address_family.ipv6_multicast.redistribute_static_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_static_multipath, null)
          redistribute_static_route_policy              = try(vrf.address_family.ipv6_multicast.redistribute_static_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_static_route_policy, null)
          redistribute_rip                              = try(vrf.address_family.ipv6_multicast.redistribute_rip, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_rip, null)
          redistribute_rip_metric                       = try(vrf.address_family.ipv6_multicast.redistribute_rip_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_rip_metric, null)
          redistribute_rip_multipath                    = try(vrf.address_family.ipv6_multicast.redistribute_rip_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_rip_multipath, null)
          redistribute_rip_route_policy                 = try(vrf.address_family.ipv6_multicast.redistribute_rip_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_rip_route_policy, null)
          table_policy                                  = try(vrf.address_family.ipv6_multicast.table_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.table_policy, null)
          bgp_dampening_decay_half_life                 = try(vrf.address_family.ipv6_multicast.bgp_dampening_decay_half_life, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.bgp_dampening_decay_half_life, null)
          bgp_dampening_reuse_threshold                 = try(vrf.address_family.ipv6_multicast.bgp_dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.bgp_dampening_reuse_threshold, null)
          bgp_dampening_suppress_threshold              = try(vrf.address_family.ipv6_multicast.bgp_dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.bgp_dampening_suppress_threshold, null)
          bgp_dampening_max_suppress_time               = try(vrf.address_family.ipv6_multicast.bgp_dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.bgp_dampening_max_suppress_time, null)
          bgp_dampening_route_policy                    = try(vrf.address_family.ipv6_multicast.bgp_dampening_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.bgp_dampening_route_policy, null)
          weight_reset_on_import                        = try(vrf.address_family.ipv6_multicast.weight_reset_on_import, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.weight_reset_on_import, null)
          nexthop_route_policy                          = try(vrf.address_family.ipv6_multicast.nexthop_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.nexthop_route_policy, null)
          as_path_loopcheck_out_disable                 = try(vrf.address_family.ipv6_multicast.as_path_loopcheck_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.as_path_loopcheck_out_disable, null)
          mvpn_single_forwarder_selection               = try(vrf.address_family.ipv6_multicast.mvpn_single_forwarder_selection, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.mvpn_single_forwarder_selection, null)
          aggregate_addresses = try(length(vrf.address_family.ipv6_multicast.aggregate_addresses) == 0, true) ? null : [for agg in vrf.address_family.ipv6_multicast.aggregate_addresses : {
            address       = try(agg.address, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.aggregate_addresses.address, null)
            prefix        = try(agg.mask, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.aggregate_addresses.mask, null)
            as_set        = try(agg.as_set, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.aggregate_addresses.as_set, null)
            as_confed_set = try(agg.as_confed_set, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.aggregate_addresses.as_confed_set, null)
            summary_only  = try(agg.summary_only, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.aggregate_addresses.summary_only, null)
            route_policy  = try(agg.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.aggregate_addresses.route_policy, null)
            description   = try(agg.description, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.aggregate_addresses.description, null)
            set_tag       = try(agg.set_tag, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.aggregate_addresses.set_tag, null)
            }
          ]
          networks = try(length(vrf.address_family.ipv6_multicast.networks) == 0, true) ? null : [for net in vrf.address_family.ipv6_multicast.networks : {
            address      = try(net.address, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.networks.address, null)
            prefix       = try(net.mask, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.networks.mask, null)
            route_policy = try(net.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.networks.route_policy, null)
            backdoor     = try(net.backdoor, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.networks.backdoor, null)
            multipath    = try(net.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.networks.multipath, null)
            }
          ]
          redistribute_ospfv3 = try(length(vrf.address_family.ipv6_multicast.redistribute_ospfv3) == 0, true) ? null : [for ospfv3 in vrf.address_family.ipv6_multicast.redistribute_ospfv3 : {
            router_tag                                = try(ospfv3.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.instance_id, null)
            match_internal                            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal" ? true : null
            match_external                            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-external" ? true : null
            match_nssa_external                       = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-nssa-external" ? true : null
            match_internal_external                   = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal-external" ? true : null
            match_internal_external_1                 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal-external-1" ? true : null
            match_internal_external_1_nssa_external   = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal-external-1-nssa-external" ? true : null
            match_internal_external_1_nssa_external_1 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal-external-1-nssa-external-1" ? true : null
            match_internal_external_1_nssa_external_2 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal-external-1-nssa-external-2" ? true : null
            match_internal_external_2                 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal-external-2" ? true : null
            match_internal_external_2_nssa_external   = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal-external-2-nssa-external" ? true : null
            match_internal_external_2_nssa_external_1 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal-external-2-nssa-external-1" ? true : null
            match_internal_external_2_nssa_external_2 = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal-external-2-nssa-external-2" ? true : null
            match_internal_external_nssa_external     = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal-external-nssa-external" ? true : null
            match_internal_external_nssa_external_1   = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal-external-nssa-external-1" ? true : null
            match_internal_external_nssa_external_2   = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal-external-nssa-external-2" ? true : null
            match_internal_nssa_external              = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal-nssa-external" ? true : null
            match_internal_nssa_external_1            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal-nssa-external-1" ? true : null
            match_internal_nssa_external_2            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-internal-nssa-external-2" ? true : null
            match_external_1                          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-external-1" ? true : null
            match_external_1_nssa_external            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-external-1-nssa-external" ? true : null
            match_external_1_nssa_external_1          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-external-1-nssa-external-1" ? true : null
            match_external_1_nssa_external_2          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-external-1-nssa-external-2" ? true : null
            match_external_2                          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-external-2" ? true : null
            match_external_2_nssa_external            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-external-2-nssa-external" ? true : null
            match_external_2_nssa_external_1          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-external-2-nssa-external-1" ? true : null
            match_external_2_nssa_external_2          = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-external-2-nssa-external-2" ? true : null
            match_external_nssa_external              = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-external-nssa-external" ? true : null
            match_external_nssa_external_1            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-external-nssa-external-1" ? true : null
            match_external_nssa_external_2            = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-external-nssa-external-2" ? true : null
            match_nssa_external_1                     = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-nssa-external-1" ? true : null
            match_nssa_external_2                     = try(ospfv3.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.match, null) == "match-nssa-external-2" ? true : null
            metric                                    = try(ospfv3.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.metric, null)
            multipath                                 = try(ospfv3.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.multipath, null)
            route_policy                              = try(ospfv3.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_ospfv3.route_policy, null)
            }
          ]
          redistribute_eigrp = try(length(vrf.address_family.ipv6_multicast.redistribute_eigrp) == 0, true) ? null : [for eigrp in vrf.address_family.ipv6_multicast.redistribute_eigrp : {
            instance_name           = try(eigrp.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_eigrp.instance_id, null)
            match_internal          = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_eigrp.match, null) == "match-internal" ? true : null
            match_internal_external = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_eigrp.match, null) == "match-internal-external" ? true : null
            match_external          = try(eigrp.match, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_eigrp.match, null) == "match-external" ? true : null
            metric                  = try(eigrp.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_eigrp.metric, null)
            multipath               = try(eigrp.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_eigrp.multipath, null)
            route_policy            = try(eigrp.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_eigrp.route_policy, null)
            }
          ]
          redistribute_isis = try(length(vrf.address_family.ipv6_multicast.redistribute_isis) == 0, true) ? null : [for isis in vrf.address_family.ipv6_multicast.redistribute_isis : {
            instance_name                      = try(isis.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_isis.instance_id, null)
            level_1                            = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_isis.level, null) == "level-1" ? true : null
            level_1_level_2                    = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_isis.level, null) == "level-1-level-2" ? true : null
            level_1_level_2_level_1_inter_area = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_isis.level, null) == "level-1-level-2-level-1-inter-area" ? true : null
            level_1_level_1_inter_area         = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_isis.level, null) == "level-1-level-1-inter-area" ? true : null
            level_2                            = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_isis.level, null) == "level-2" ? true : null
            level_2_level_1_inter_area         = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_isis.level, null) == "level-2-level-1-inter-area" ? true : null
            level_1_inter_area                 = try(isis.level, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_isis.level, null) == "level-1-inter-area" ? true : null
            metric                             = try(isis.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_isis.metric, null)
            multipath                          = try(isis.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_isis.multipath, null)
            route_policy                       = try(isis.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.ipv6_multicast.redistribute_isis.route_policy, null)
            }
          ]
          }
        ] : []
      ]
    ]
  ])
}

resource "iosxr_router_bgp_vrf_address_family" "ipv6_multicast" {
  for_each                                      = { for af in local.router_bgp_vrf_address_family_ipv6_multicast : af.key => af }
  device                                        = each.value.device_name
  as_number                                     = each.value.as_number
  vrf_name                                      = each.value.vrf_name
  af_name                                       = each.value.af_name
  distance_bgp_external_route                   = each.value.distance_bgp_external_route
  distance_bgp_internal_route                   = each.value.distance_bgp_internal_route
  distance_bgp_local_route                      = each.value.distance_bgp_local_route
  maximum_paths_ebgp_multipath                  = each.value.maximum_paths_ebgp_multipath
  maximum_paths_ebgp_selective                  = each.value.maximum_paths_ebgp_selective
  maximum_paths_ebgp_route_policy               = each.value.maximum_paths_ebgp_route_policy
  maximum_paths_ibgp_multipath                  = each.value.maximum_paths_ibgp_multipath
  maximum_paths_ibgp_unequal_cost               = each.value.maximum_paths_ibgp_unequal_cost
  maximum_paths_ibgp_unequal_cost_deterministic = each.value.maximum_paths_ibgp_unequal_cost_deterministic
  maximum_paths_ibgp_selective                  = each.value.maximum_paths_ibgp_selective
  maximum_paths_ibgp_route_policy               = each.value.maximum_paths_ibgp_route_policy
  maximum_paths_eibgp_multipath                 = each.value.maximum_paths_eibgp_multipath
  maximum_paths_eibgp_equal_cost                = each.value.maximum_paths_eibgp_equal_cost
  maximum_paths_eibgp_selective                 = each.value.maximum_paths_eibgp_selective
  maximum_paths_eibgp_route_policy              = each.value.maximum_paths_eibgp_route_policy
  redistribute_connected                        = each.value.redistribute_connected
  redistribute_connected_metric                 = each.value.redistribute_connected_metric
  redistribute_connected_multipath              = each.value.redistribute_connected_multipath
  redistribute_connected_route_policy           = each.value.redistribute_connected_route_policy
  redistribute_static                           = each.value.redistribute_static
  redistribute_static_metric                    = each.value.redistribute_static_metric
  redistribute_static_multipath                 = each.value.redistribute_static_multipath
  redistribute_static_route_policy              = each.value.redistribute_static_route_policy
  redistribute_rip                              = each.value.redistribute_rip
  redistribute_rip_metric                       = each.value.redistribute_rip_metric
  redistribute_rip_multipath                    = each.value.redistribute_rip_multipath
  redistribute_rip_route_policy                 = each.value.redistribute_rip_route_policy
  table_policy                                  = each.value.table_policy
  bgp_dampening_decay_half_life                 = each.value.bgp_dampening_decay_half_life
  bgp_dampening_reuse_threshold                 = each.value.bgp_dampening_reuse_threshold
  bgp_dampening_suppress_threshold              = each.value.bgp_dampening_suppress_threshold
  bgp_dampening_max_suppress_time               = each.value.bgp_dampening_max_suppress_time
  bgp_dampening_route_policy                    = each.value.bgp_dampening_route_policy
  weight_reset_on_import                        = each.value.weight_reset_on_import
  nexthop_route_policy                          = each.value.nexthop_route_policy
  as_path_loopcheck_out_disable                 = each.value.as_path_loopcheck_out_disable
  mvpn_single_forwarder_selection               = each.value.mvpn_single_forwarder_selection
  aggregate_addresses                           = each.value.aggregate_addresses
  networks                                      = each.value.networks
  redistribute_ospf                             = each.value.redistribute_ospfv3
  redistribute_eigrp                            = each.value.redistribute_eigrp
  redistribute_isis                             = each.value.redistribute_isis

  lifecycle {
    replace_triggered_by = [
      iosxr_router_bgp_vrf.router_bgp_vrf
    ]
  }

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_bgp.router_bgp,
    iosxr_router_bgp_address_family.ipv4_unicast,
    iosxr_router_bgp_address_family.ipv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_unicast,
    iosxr_router_bgp_address_family.vpnv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_multicast,
    iosxr_router_bgp_address_family.vpnv6_multicast,
    iosxr_router_bgp_address_family.l2vpn_evpn,
    iosxr_router_bgp_session_group.router_bgp_session_group,
    iosxr_router_bgp_neighbor_group.router_bgp_neighbor_group,
    iosxr_router_bgp_af_group.router_bgp_af_group,
    iosxr_router_bgp_vrf.router_bgp_vrf
  ]
}

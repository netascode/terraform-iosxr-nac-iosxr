locals {
  router_bgp_vrf_address_family = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : [
        for vrf in try(bgp_process.vrfs, []) : [
          for af in try(vrf.address_family, []) : {
            key                                                            = format("%s/%s/%s/%s", device.name, bgp_process.as_number, vrf.vrf_name, af.af_name)
            device_name                                                    = device.name
            as_number                                                      = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
            vrf_name                                                       = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.vrf_name, null)
            af_name                                                        = try(af.af_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.af_name, null)
            additional_paths_send                                          = try(af.additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.additional_paths_send, null)
            additional_paths_send_disable                                  = try(af.additional_paths_send_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.additional_paths_send_disable, null)
            additional_paths_receive                                       = try(af.additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.additional_paths_receive, null)
            additional_paths_receive_disable                               = try(af.additional_paths_receive_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.additional_paths_receive_disable, null)
            additional_paths_selection_route_policy                        = try(af.additional_paths_selection_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.additional_paths_selection_route_policy, null)
            additional_paths_selection_disable                             = try(af.additional_paths_selection_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.additional_paths_selection_disable, null)
            allocate_label_all                                             = try(af.allocate_label_all, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.allocate_label_all, null)
            allocate_label_all_unlabeled_path                              = try(af.allocate_label_all_unlabeled_path, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.allocate_label_all_unlabeled_path, null)
            allocate_label_route_policy_name                               = try(af.allocate_label_route_policy_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.allocate_label_route_policy_name, null)
            allocate_label_route_policy_unlabeled_path                     = try(af.allocate_label_route_policy_unlabeled_path, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.allocate_label_route_policy_unlabeled_path, null)
            advertise_best_external                                        = try(af.advertise_best_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.advertise_best_external, null)
            maximum_paths_ebgp_multipath                                   = try(af.maximum_paths_ebgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.maximum_paths_ebgp_multipath, null)
            maximum_paths_ebgp_selective                                   = try(af.maximum_paths_ebgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.maximum_paths_ebgp_selective, null)
            maximum_paths_ebgp_route_policy                                = try(af.maximum_paths_ebgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.maximum_paths_ebgp_route_policy, null)
            maximum_paths_ibgp_multipath                                   = try(af.maximum_paths_ibgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.maximum_paths_ibgp_multipath, null)
            maximum_paths_ibgp_unequal_cost                                = try(af.maximum_paths_ibgp_unequal_cost, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.maximum_paths_ibgp_unequal_cost, null)
            maximum_paths_ibgp_unequal_cost_deterministic                  = try(af.maximum_paths_ibgp_unequal_cost_deterministic, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.maximum_paths_ibgp_unequal_cost_deterministic, null)
            maximum_paths_ibgp_selective                                   = try(af.maximum_paths_ibgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.maximum_paths_ibgp_selective, null)
            maximum_paths_ibgp_route_policy                                = try(af.maximum_paths_ibgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.maximum_paths_ibgp_route_policy, null)
            maximum_paths_eibgp_multipath                                  = try(af.maximum_paths_eibgp_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.maximum_paths_eibgp_multipath, null)
            maximum_paths_eibgp_equal_cost                                 = try(af.maximum_paths_eibgp_equal_cost, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.maximum_paths_eibgp_equal_cost, null)
            maximum_paths_eibgp_selective                                  = try(af.maximum_paths_eibgp_selective, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.maximum_paths_eibgp_selective, null)
            maximum_paths_eibgp_route_policy                               = try(af.maximum_paths_eibgp_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.maximum_paths_eibgp_route_policy, null)
            maximum_paths_unique_nexthop_check_disable                     = try(af.maximum_paths_unique_nexthop_check_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.maximum_paths_unique_nexthop_check_disable, null)
            label_mode_per_prefix                                          = try(af.label_mode_per_prefix, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.label_mode_per_prefix, null)
            label_mode_per_ce                                              = try(af.label_mode_per_ce, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.label_mode_per_ce, null)
            label_mode_per_vrf                                             = try(af.label_mode_per_vrf, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.label_mode_per_vrf, null)
            label_mode_per_vrf_46                                          = try(af.label_mode_per_vrf_46, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.label_mode_per_vrf_46, null)
            label_mode_route_policy                                        = try(af.label_mode_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.label_mode_route_policy, null)
            label_mode_per_nexthop_received_label                          = try(af.label_mode_per_nexthop_received_label, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.label_mode_per_nexthop_received_label, null)
            label_mode_per_nexthop_received_label_allocate_secondary_label = try(af.label_mode_per_nexthop_received_label_allocate_secondary_label, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.label_mode_per_nexthop_received_label_allocate_secondary_label, null)
            segment_routing_srv6_locator                                   = try(af.segment_routing_srv6_locator, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.segment_routing_srv6_locator, null)
            segment_routing_srv6_alloc_mode_per_ce                         = try(af.segment_routing_srv6_alloc_mode_per_ce, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.segment_routing_srv6_alloc_mode_per_ce, null)
            segment_routing_srv6_alloc_mode_per_vrf                        = try(af.segment_routing_srv6_alloc_mode_per_vrf, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.segment_routing_srv6_alloc_mode_per_vrf, null)
            segment_routing_srv6_alloc_mode_per_vrf_46                     = try(af.segment_routing_srv6_alloc_mode_per_vrf_46, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.segment_routing_srv6_alloc_mode_per_vrf_46, null)
            segment_routing_srv6_alloc_mode_route_policy                   = try(af.segment_routing_srv6_alloc_mode_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.segment_routing_srv6_alloc_mode_route_policy, null)
            redistribute_connected                                         = try(af.redistribute_connected, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_connected, null)
            redistribute_connected_metric                                  = try(af.redistribute_connected_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_connected_metric, null)
            redistribute_connected_multipath                               = try(af.redistribute_connected_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_connected_multipath, null)
            redistribute_connected_route_policy                            = try(af.redistribute_connected_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_connected_route_policy, null)
            redistribute_static                                            = try(af.redistribute_static, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_static, null)
            redistribute_static_metric                                     = try(af.redistribute_static_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_static_metric, null)
            redistribute_static_multipath                                  = try(af.redistribute_static_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_static_multipath, null)
            redistribute_static_route_policy                               = try(af.redistribute_static_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_static_route_policy, null)
            redistribute_rip                                               = try(af.redistribute_rip, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_rip, null)
            redistribute_rip_metric                                        = try(af.redistribute_rip_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_rip_metric, null)
            redistribute_rip_multipath                                     = try(af.redistribute_rip_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_rip_multipath, null)
            redistribute_rip_route_policy                                  = try(af.redistribute_rip_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_rip_route_policy, null)
            aggregate_addresses = try(length(af.aggregate_addresses) == 0, true) ? null : [for agg in af.aggregate_addresses : {
              address       = try(agg.address, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.aggregate_addresses.address, null)
              prefix        = try(agg.mask, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.aggregate_addresses.mask, null)
              as_set        = try(agg.as_set, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.aggregate_addresses.as_set, null)
              as_confed_set = try(agg.as_confed_set, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.aggregate_addresses.as_confed_set, null)
              summary_only  = try(agg.summary_only, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.aggregate_addresses.summary_only, null)
              route_policy  = try(agg.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.aggregate_addresses.route_policy, null)
              description   = try(agg.description, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.aggregate_addresses.description, null)
              set_tag       = try(agg.set_tag, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.aggregate_addresses.set_tag, null)
              }
            ]
            networks = try(length(af.networks) == 0, true) ? null : [for net in af.networks : {
              address      = try(net.address, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.networks.address, null)
              prefix       = try(net.mask, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.networks.mask, null)
              route_policy = try(net.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.networks.route_policy, null)
              backdoor     = try(net.backdoor, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.networks.backdoor, null)
              multipath    = try(net.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.networks.multipath, null)
              }
            ]
            redistribute_ospf = try(length(af.redistribute_ospf) == 0, true) ? null : [for ospf in af.redistribute_ospf : {
              router_tag                                = try(ospf.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.instance_id, null)
              match_internal                            = try(ospf.match_internal, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal, null)
              match_external                            = try(ospf.match_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_external, null)
              match_nssa_external                       = try(ospf.match_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_nssa_external, null)
              match_internal_external                   = try(ospf.match_internal_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal_external, null)
              match_internal_external_1                 = try(ospf.match_internal_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal_external_1, null)
              match_internal_external_1_nssa_external   = try(ospf.match_internal_external_1_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal_external_1_nssa_external, null)
              match_internal_external_1_nssa_external_1 = try(ospf.match_internal_external_1_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal_external_1_nssa_external_1, null)
              match_internal_external_1_nssa_external_2 = try(ospf.match_internal_external_1_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal_external_1_nssa_external_2, null)
              match_internal_external_2                 = try(ospf.match_internal_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal_external_2, null)
              match_internal_external_2_nssa_external   = try(ospf.match_internal_external_2_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal_external_2_nssa_external, null)
              match_internal_external_2_nssa_external_1 = try(ospf.match_internal_external_2_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal_external_2_nssa_external_1, null)
              match_internal_external_2_nssa_external_2 = try(ospf.match_internal_external_2_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal_external_2_nssa_external_2, null)
              match_internal_external_nssa_external     = try(ospf.match_internal_external_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal_external_nssa_external, null)
              match_internal_external_nssa_external_1   = try(ospf.match_internal_external_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal_external_nssa_external_1, null)
              match_internal_external_nssa_external_2   = try(ospf.match_internal_external_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal_external_nssa_external_2, null)
              match_internal_nssa_external              = try(ospf.match_internal_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal_nssa_external, null)
              match_internal_nssa_external_1            = try(ospf.match_internal_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal_nssa_external_1, null)
              match_internal_nssa_external_2            = try(ospf.match_internal_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_internal_nssa_external_2, null)
              match_external_1                          = try(ospf.match_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_external_1, null)
              match_external_1_nssa_external            = try(ospf.match_external_1_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_external_1_nssa_external, null)
              match_external_1_nssa_external_1          = try(ospf.match_external_1_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_external_1_nssa_external_1, null)
              match_external_1_nssa_external_2          = try(ospf.match_external_1_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_external_1_nssa_external_2, null)
              match_external_2                          = try(ospf.match_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_external_2, null)
              match_external_2_nssa_external            = try(ospf.match_external_2_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_external_2_nssa_external, null)
              match_external_2_nssa_external_1          = try(ospf.match_external_2_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_external_2_nssa_external_1, null)
              match_external_2_nssa_external_2          = try(ospf.match_external_2_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_external_2_nssa_external_2, null)
              match_external_nssa_external              = try(ospf.match_external_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_external_nssa_external, null)
              match_external_nssa_external_1            = try(ospf.match_external_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_external_nssa_external_1, null)
              match_external_nssa_external_2            = try(ospf.match_external_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_external_nssa_external_2, null)
              match_nssa_external_1                     = try(ospf.match_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_nssa_external_1, null)
              match_nssa_external_2                     = try(ospf.match_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.match_nssa_external_2, null)
              metric                                    = try(ospf.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.metric, null)
              multipath                                 = try(ospf.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.multipath, null)
              route_policy                              = try(ospf.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospf.route_policy, null)
              }
            ]
            redistribute_ospfv3 = try(length(af.redistribute_ospfv3) == 0, true) ? null : [for ospfv3 in af.redistribute_ospfv3 : {
              router_tag                                = try(ospfv3.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.instance_id, null)
              match_internal                            = try(ospfv3.match_internal, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal, null)
              match_external                            = try(ospfv3.match_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_external, null)
              match_nssa_external                       = try(ospfv3.match_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_nssa_external, null)
              match_internal_external                   = try(ospfv3.match_internal_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal_external, null)
              match_internal_external_1                 = try(ospfv3.match_internal_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal_external_1, null)
              match_internal_external_1_nssa_external   = try(ospfv3.match_internal_external_1_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal_external_1_nssa_external, null)
              match_internal_external_1_nssa_external_1 = try(ospfv3.match_internal_external_1_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal_external_1_nssa_external_1, null)
              match_internal_external_1_nssa_external_2 = try(ospfv3.match_internal_external_1_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal_external_1_nssa_external_2, null)
              match_internal_external_2                 = try(ospfv3.match_internal_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal_external_2, null)
              match_internal_external_2_nssa_external   = try(ospfv3.match_internal_external_2_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal_external_2_nssa_external, null)
              match_internal_external_2_nssa_external_1 = try(ospfv3.match_internal_external_2_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal_external_2_nssa_external_1, null)
              match_internal_external_2_nssa_external_2 = try(ospfv3.match_internal_external_2_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal_external_2_nssa_external_2, null)
              match_internal_external_nssa_external     = try(ospfv3.match_internal_external_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal_external_nssa_external, null)
              match_internal_external_nssa_external_1   = try(ospfv3.match_internal_external_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal_external_nssa_external_1, null)
              match_internal_external_nssa_external_2   = try(ospfv3.match_internal_external_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal_external_nssa_external_2, null)
              match_internal_nssa_external              = try(ospfv3.match_internal_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal_nssa_external, null)
              match_internal_nssa_external_1            = try(ospfv3.match_internal_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal_nssa_external_1, null)
              match_internal_nssa_external_2            = try(ospfv3.match_internal_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_internal_nssa_external_2, null)
              match_external_1                          = try(ospfv3.match_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_external_1, null)
              match_external_1_nssa_external            = try(ospfv3.match_external_1_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_external_1_nssa_external, null)
              match_external_1_nssa_external_1          = try(ospfv3.match_external_1_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_external_1_nssa_external_1, null)
              match_external_1_nssa_external_2          = try(ospfv3.match_external_1_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_external_1_nssa_external_2, null)
              match_external_2                          = try(ospfv3.match_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_external_2, null)
              match_external_2_nssa_external            = try(ospfv3.match_external_2_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_external_2_nssa_external, null)
              match_external_2_nssa_external_1          = try(ospfv3.match_external_2_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_external_2_nssa_external_1, null)
              match_external_2_nssa_external_2          = try(ospfv3.match_external_2_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_external_2_nssa_external_2, null)
              match_external_nssa_external              = try(ospfv3.match_external_nssa_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_external_nssa_external, null)
              match_external_nssa_external_1            = try(ospfv3.match_external_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_external_nssa_external_1, null)
              match_external_nssa_external_2            = try(ospfv3.match_external_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_external_nssa_external_2, null)
              match_nssa_external_1                     = try(ospfv3.match_nssa_external_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_nssa_external_1, null)
              match_nssa_external_2                     = try(ospfv3.match_nssa_external_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.match_nssa_external_2, null)
              metric                                    = try(ospfv3.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.metric, null)
              multipath                                 = try(ospfv3.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.multipath, null)
              route_policy                              = try(ospfv3.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_ospfv3.route_policy, null)
              }
            ]
            redistribute_eigrp = try(length(af.redistribute_eigrp) == 0, true) ? null : [for eigrp in af.redistribute_eigrp : {
              instance_name           = try(eigrp.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_eigrp.instance_id, null)
              match_internal          = try(eigrp.match_internal, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_eigrp.match_internal, null)
              match_internal_external = try(eigrp.match_internal_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_eigrp.match_internal_external, null)
              match_external          = try(eigrp.match_external, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_eigrp.match_external, null)
              metric                  = try(eigrp.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_eigrp.metric, null)
              multipath               = try(eigrp.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_eigrp.multipath, null)
              route_policy            = try(eigrp.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_eigrp.route_policy, null)
              }
            ]
            redistribute_isis = try(length(af.redistribute_isis) == 0, true) ? null : [for isis in af.redistribute_isis : {
              instance_name                      = try(isis.instance_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_isis.instance_id, null)
              level_1                            = try(isis.level_1, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_isis.level_1, null)
              level_1_level_2                    = try(isis.level_1_level_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_isis.level_1_level_2, null)
              level_1_level_2_level_1_inter_area = try(isis.level_1_level_2_level_1_inter_area, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_isis.level_1_level_2_level_1_inter_area, null)
              level_1_level_1_inter_area         = try(isis.level_1_level_1_inter_area, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_isis.level_1_level_1_inter_area, null)
              level_2                            = try(isis.level_2, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_isis.level_2, null)
              level_2_level_1_inter_area         = try(isis.level_2_level_1_inter_area, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_isis.level_2_level_1_inter_area, null)
              level_1_inter_area                 = try(isis.level_1_inter_area, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_isis.level_1_inter_area, null)
              metric                             = try(isis.metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_isis.metric, null)
              multipath                          = try(isis.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_isis.multipath, null)
              route_policy                       = try(isis.route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.address_family.redistribute_isis.route_policy, null)
              }
            ]
          }
        ]
      ]
    ]
  ])
}

resource "iosxr_router_bgp_vrf_address_family" "router_bgp_vrf_address_family" {
  for_each                                                       = { for af in local.router_bgp_vrf_address_family : af.key => af }
  device                                                         = each.value.device_name
  as_number                                                      = each.value.as_number
  vrf_name                                                       = each.value.vrf_name
  af_name                                                        = each.value.af_name
  additional_paths_send                                          = each.value.additional_paths_send
  additional_paths_send_disable                                  = each.value.additional_paths_send_disable
  additional_paths_receive                                       = each.value.additional_paths_receive
  additional_paths_receive_disable                               = each.value.additional_paths_receive_disable
  additional_paths_selection_route_policy                        = each.value.additional_paths_selection_route_policy
  additional_paths_selection_disable                             = each.value.additional_paths_selection_disable
  allocate_label_all                                             = each.value.allocate_label_all
  allocate_label_all_unlabeled_path                              = each.value.allocate_label_all_unlabeled_path
  allocate_label_route_policy_name                               = each.value.allocate_label_route_policy_name
  allocate_label_route_policy_unlabeled_path                     = each.value.allocate_label_route_policy_unlabeled_path
  advertise_best_external                                        = each.value.advertise_best_external
  maximum_paths_ebgp_multipath                                   = each.value.maximum_paths_ebgp_multipath
  maximum_paths_ebgp_selective                                   = each.value.maximum_paths_ebgp_selective
  maximum_paths_ebgp_route_policy                                = each.value.maximum_paths_ebgp_route_policy
  maximum_paths_ibgp_multipath                                   = each.value.maximum_paths_ibgp_multipath
  maximum_paths_ibgp_unequal_cost                                = each.value.maximum_paths_ibgp_unequal_cost
  maximum_paths_ibgp_unequal_cost_deterministic                  = each.value.maximum_paths_ibgp_unequal_cost_deterministic
  maximum_paths_ibgp_selective                                   = each.value.maximum_paths_ibgp_selective
  maximum_paths_ibgp_route_policy                                = each.value.maximum_paths_ibgp_route_policy
  maximum_paths_eibgp_multipath                                  = each.value.maximum_paths_eibgp_multipath
  maximum_paths_eibgp_equal_cost                                 = each.value.maximum_paths_eibgp_equal_cost
  maximum_paths_eibgp_selective                                  = each.value.maximum_paths_eibgp_selective
  maximum_paths_eibgp_route_policy                               = each.value.maximum_paths_eibgp_route_policy
  maximum_paths_unique_nexthop_check_disable                     = each.value.maximum_paths_unique_nexthop_check_disable
  label_mode_per_prefix                                          = each.value.label_mode_per_prefix
  label_mode_per_ce                                              = each.value.label_mode_per_ce
  label_mode_per_vrf                                             = each.value.label_mode_per_vrf
  label_mode_per_vrf_46                                          = each.value.label_mode_per_vrf_46
  label_mode_route_policy                                        = each.value.label_mode_route_policy
  label_mode_per_nexthop_received_label                          = each.value.label_mode_per_nexthop_received_label
  label_mode_per_nexthop_received_label_allocate_secondary_label = each.value.label_mode_per_nexthop_received_label_allocate_secondary_label
  segment_routing_srv6_locator                                   = each.value.segment_routing_srv6_locator
  segment_routing_srv6_alloc_mode_per_ce                         = each.value.segment_routing_srv6_alloc_mode_per_ce
  segment_routing_srv6_alloc_mode_per_vrf                        = each.value.segment_routing_srv6_alloc_mode_per_vrf
  segment_routing_srv6_alloc_mode_per_vrf_46                     = each.value.segment_routing_srv6_alloc_mode_per_vrf_46
  segment_routing_srv6_alloc_mode_route_policy                   = each.value.segment_routing_srv6_alloc_mode_route_policy
  redistribute_connected                                         = each.value.redistribute_connected
  redistribute_connected_metric                                  = each.value.redistribute_connected_metric
  redistribute_connected_multipath                               = each.value.redistribute_connected_multipath
  redistribute_connected_route_policy                            = each.value.redistribute_connected_route_policy
  redistribute_static                                            = each.value.redistribute_static
  redistribute_static_metric                                     = each.value.redistribute_static_metric
  redistribute_static_multipath                                  = each.value.redistribute_static_multipath
  redistribute_static_route_policy                               = each.value.redistribute_static_route_policy
  redistribute_rip                                               = each.value.redistribute_rip
  redistribute_rip_metric                                        = each.value.redistribute_rip_metric
  redistribute_rip_multipath                                     = each.value.redistribute_rip_multipath
  redistribute_rip_route_policy                                  = each.value.redistribute_rip_route_policy
  aggregate_addresses                                            = each.value.aggregate_addresses
  networks                                                       = each.value.networks
  redistribute_ospf                                              = each.value.redistribute_ospf
  redistribute_ospfv3                                            = each.value.redistribute_ospfv3
  redistribute_eigrp                                             = each.value.redistribute_eigrp
  redistribute_isis                                              = each.value.redistribute_isis

  depends_on = [
    iosxr_router_bgp_vrf.router_bgp_vrf,
    iosxr_route_policy.route_policy
  ]
}

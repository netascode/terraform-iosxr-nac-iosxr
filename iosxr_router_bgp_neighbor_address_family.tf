locals {
  router_bgp_neighbor_address_family = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : [
        for neighbor in try(bgp_process.neighbors, []) : [
          for af in try(neighbor.address_family, []) : {
            key                                                     = format("%s/%s/%s/%s", device.name, bgp_process.as_number, neighbor.ip, af.af_name)
            device_name                                             = device.name
            as_number                                               = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
            address                                                 = try(neighbor.ip, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ip, null)
            af_name                                                 = try(af.af_name, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.af_name, null)
            encapsulation_type                                      = try(af.encapsulation_type, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.encapsulation_type, null)
            weight                                                  = try(af.weight, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.weight, null)
            multipath                                               = try(af.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.multipath, null)
            use_af_group                                            = try(af.use_af_group, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.use_af_group, null)
            capability_orf_prefix                                   = try(af.capability_orf_prefix, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.capability_orf_prefix, null)
            additional_paths_send                                   = try(af.additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.additional_paths_send, null)
            additional_paths_send_disable                           = try(af.additional_paths_send_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.additional_paths_send_disable, null)
            additional_paths_receive                                = try(af.additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.additional_paths_receive, null)
            additional_paths_receive_disable                        = try(af.additional_paths_receive_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.additional_paths_receive_disable, null)
            default_originate                                       = try(af.default_originate, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.default_originate, null)
            default_originate_route_policy                          = try(af.default_originate_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.default_originate_route_policy, null)
            default_originate_inheritance_disable                   = try(af.default_originate_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.default_originate_inheritance_disable, null)
            maximum_prefix_limit                                    = try(af.maximum_prefix_limit, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.maximum_prefix_limit, null)
            maximum_prefix_threshold                                = try(af.maximum_prefix_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.maximum_prefix_threshold, can(af.maximum_prefix_limit) ? 75 : null)
            maximum_prefix_restart                                  = try(af.maximum_prefix_restart, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.maximum_prefix_restart, null)
            maximum_prefix_discard_extra_paths                      = try(af.maximum_prefix_discard_extra_paths, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.maximum_prefix_discard_extra_paths, null)
            maximum_prefix_warning_only                             = try(af.maximum_prefix_warning_only, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.maximum_prefix_warning_only, null)
            next_hop_self                                           = try(af.next_hop_self, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.next_hop_self, null)
            next_hop_self_inheritance_disable                       = try(af.next_hop_self_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.next_hop_self_inheritance_disable, null)
            next_hop_unchanged                                      = try(af.next_hop_unchanged, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.next_hop_unchanged, null)
            next_hop_unchanged_multipath                            = try(af.next_hop_unchanged_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.next_hop_unchanged_multipath, null)
            next_hop_unchanged_inheritance_disable                  = try(af.next_hop_unchanged_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.next_hop_unchanged_inheritance_disable, null)
            route_policy_in                                         = try(af.route_policy_in, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.route_policy_in, null)
            route_policy_out                                        = try(af.route_policy_out, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.route_policy_out, null)
            orf_route_policy                                        = try(af.orf_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.orf_route_policy, null)
            cluster_id_allow_equal                                  = try(af.cluster_id_allow_equal, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.cluster_id_allow_equal, null)
            cluster_id_allow_equal_disable                          = try(af.cluster_id_allow_equal_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.cluster_id_allow_equal_disable, null)
            replace_private_as                                      = try(af.replace_private_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.replace_private_as, null)
            replace_private_as_internal                             = try(af.replace_private_as_internal, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.replace_private_as_internal, null)
            remove_private_as_inbound                               = try(af.remove_private_as_inbound, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.remove_private_as_inbound, null)
            remove_private_as_inbound_entire_aspath                 = try(af.remove_private_as_inbound_entire_aspath, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.remove_private_as_inbound_entire_aspath, null)
            remove_private_as_inbound_inheritance_disable           = try(af.remove_private_as_inbound_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.remove_private_as_inbound_inheritance_disable, null)
            remove_private_as                                       = try(af.remove_private_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.remove_private_as, null)
            remove_private_as_entire_aspath                         = try(af.remove_private_as_entire_aspath, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.remove_private_as_entire_aspath, null)
            remove_private_as_internal                              = try(af.remove_private_as_internal, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.remove_private_as_internal, null)
            route_reflector_client                                  = try(af.route_reflector_client, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.route_reflector_client, null)
            route_reflector_client_inheritance_disable              = try(af.route_reflector_client_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.route_reflector_client_inheritance_disable, null)
            send_community_ebgp                                     = try(af.send_community_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.send_community_ebgp, null)
            send_community_ebgp_inheritance_disable                 = try(af.send_community_ebgp_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.send_community_ebgp_inheritance_disable, null)
            send_community_gshut_ebgp                               = try(af.send_community_gshut_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.send_community_gshut_ebgp, null)
            send_community_gshut_ebgp_inheritance_disable           = try(af.send_community_gshut_ebgp_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.send_community_gshut_ebgp_inheritance_disable, null)
            send_extended_community_ebgp                            = try(af.send_extended_community_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.send_extended_community_ebgp, null)
            send_extended_community_ebgp_inheritance_disable        = try(af.send_extended_community_ebgp_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.send_extended_community_ebgp_inheritance_disable, null)
            soft_reconfiguration_inbound                            = try(af.soft_reconfiguration_inbound, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.soft_reconfiguration_inbound, null)
            soft_reconfiguration_inbound_always                     = try(af.soft_reconfiguration_inbound_always, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.soft_reconfiguration_inbound_always, null)
            update_out_originator_loopcheck                         = try(af.update_out_originator_loopcheck, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.update_out_originator_loopcheck, null)
            update_out_originator_loopcheck_disable                 = try(af.update_out_originator_loopcheck_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.update_out_originator_loopcheck_disable, null)
            advertise_vpnv4_unicast                                 = try(af.advertise_vpnv4_unicast, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.advertise_vpnv4_unicast, null)
            advertise_vpnv4_unicast_re_originated                   = try(af.advertise_vpnv4_unicast_re_originated, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.advertise_vpnv4_unicast_re_originated, null)
            advertise_vpnv4_unicast_re_originated_stitching_rt      = try(af.advertise_vpnv4_unicast_re_originated_stitching_rt, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.advertise_vpnv4_unicast_re_originated_stitching_rt, null)
            advertise_vpnv6_unicast                                 = try(af.advertise_vpnv6_unicast, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.advertise_vpnv6_unicast, null)
            advertise_vpnv6_unicast_re_originated                   = try(af.advertise_vpnv6_unicast_re_originated, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.advertise_vpnv6_unicast_re_originated, null)
            advertise_vpnv6_unicast_re_originated_stitching_rt      = try(af.advertise_vpnv6_unicast_re_originated_stitching_rt, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.advertise_vpnv6_unicast_re_originated_stitching_rt, null)
            advertise_l2vpn_evpn_re_originated                      = try(af.advertise_l2vpn_evpn_re_originated, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.advertise_l2vpn_evpn_re_originated, null)
            advertise_l2vpn_evpn_re_originated_stitching_rt         = try(af.advertise_l2vpn_evpn_re_originated_stitching_rt, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.advertise_l2vpn_evpn_re_originated_stitching_rt, null)
            segment_routing_srv6_prefix_sid_type4                   = try(af.segment_routing_srv6_prefix_sid_type4, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.segment_routing_srv6_prefix_sid_type4, null)
            import_stitching_rt                                     = try(af.import_stitching_rt, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.import_stitching_rt, null)
            import_stitching_rt_re_originate                        = try(af.import_stitching_rt_re_originate, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.import_stitching_rt_re_originate, null)
            import_stitching_rt_re_originate_stitching_rt           = try(af.import_stitching_rt_re_originate_stitching_rt, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.import_stitching_rt_re_originate_stitching_rt, null)
            import_re_originate                                     = try(af.import_re_originate, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.import_re_originate, null)
            allowas_in                                              = try(af.allowas_in, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.allowas_in, null)
            site_of_origin_two_byte_as_number                       = try(af.site_of_origin_two_byte_as_number, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.site_of_origin_two_byte_as_number, null)
            site_of_origin_two_byte_as_index                        = try(af.site_of_origin_two_byte_as_index, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.site_of_origin_two_byte_as_index, null)
            site_of_origin_four_byte_as_number                      = try(af.site_of_origin_four_byte_as_number, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.site_of_origin_four_byte_as_number, null)
            site_of_origin_four_byte_as_index                       = try(af.site_of_origin_four_byte_as_index, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.site_of_origin_four_byte_as_index, null)
            site_of_origin_ipv4_address                             = try(af.site_of_origin_ipv4_address, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.site_of_origin_ipv4_address, null)
            site_of_origin_ipv4_address_index                       = try(af.site_of_origin_ipv4_address_index, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.site_of_origin_ipv4_address_index, null)
            as_override                                             = try(af.as_override, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.as_override, null)
            as_override_inheritance_disable                         = try(af.as_override_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.as_override_inheritance_disable, null)
            aigp                                                    = try(af.aigp, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.aigp, null)
            aigp_disable                                            = try(af.aigp_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.aigp_disable, null)
            aigp_send_med                                           = try(af.aigp_send_med, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.aigp_send_med, null)
            aigp_send_med_disable                                   = try(af.aigp_send_med_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.aigp_send_med_disable, null)
            aigp_send_cost_community_disable                        = try(af.aigp_send_cost_community_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.aigp_send_cost_community_disable, null)
            aigp_send_cost_community_id                             = try(af.aigp_send_cost_community_id, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.aigp_send_cost_community_id, null)
            aigp_send_cost_community_id_poi_igp_cost                = try(af.aigp_send_cost_community_id_poi_igp_cost, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.aigp_send_cost_community_id_poi_igp_cost, null)
            aigp_send_cost_community_id_poi_igp_cost_transitive     = try(af.aigp_send_cost_community_id_poi_igp_cost_transitive, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.aigp_send_cost_community_id_poi_igp_cost_transitive, null)
            aigp_send_cost_community_id_poi_pre_bestpath            = try(af.aigp_send_cost_community_id_poi_pre_bestpath, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.aigp_send_cost_community_id_poi_pre_bestpath, null)
            aigp_send_cost_community_id_poi_pre_bestpath_transitive = try(af.aigp_send_cost_community_id_poi_pre_bestpath_transitive, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.aigp_send_cost_community_id_poi_pre_bestpath_transitive, null)
            send_multicast_attributes                               = try(af.send_multicast_attributes, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.send_multicast_attributes, null)
            send_multicast_attributes_disable                       = try(af.send_multicast_attributes_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.send_multicast_attributes_disable, null)
            accept_own                                              = try(af.accept_own, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.accept_own, null)
            accept_own_inheritance_disable                          = try(af.accept_own_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.accept_own_inheritance_disable, null)
            slow_peer_dynamic                                       = try(af.slow_peer_dynamic, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.slow_peer_dynamic, null)
            slow_peer_dynamic_threshold                             = try(af.slow_peer_dynamic_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.slow_peer_dynamic_threshold, null)
            slow_peer_dynamic_disable                               = try(af.slow_peer_dynamic_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.slow_peer_dynamic_disable, null)
            slow_peer_static                                        = try(af.slow_peer_static, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.slow_peer_static, null)
            origin_as_validation_disable                            = try(af.origin_as_validation_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.origin_as_validation_disable, null)
            bestpath_origin_as_allow_invalid                        = try(af.bestpath_origin_as_allow_invalid, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.bestpath_origin_as_allow_invalid, null)
          }
        ]
      ]
    ]
  ])
}

resource "iosxr_router_bgp_neighbor_address_family" "router_bgp_neighbor_address_family" {
  for_each                                                = { for af in local.router_bgp_neighbor_address_family : af.key => af }
  device                                                  = each.value.device_name
  as_number                                               = each.value.as_number
  address                                                 = each.value.address
  af_name                                                 = each.value.af_name
  encapsulation_type                                      = each.value.encapsulation_type
  weight                                                  = each.value.weight
  multipath                                               = each.value.multipath
  use_af_group                                            = each.value.use_af_group
  capability_orf_prefix                                   = each.value.capability_orf_prefix
  additional_paths_send                                   = each.value.additional_paths_send
  additional_paths_send_disable                           = each.value.additional_paths_send_disable
  additional_paths_receive                                = each.value.additional_paths_receive
  additional_paths_receive_disable                        = each.value.additional_paths_receive_disable
  default_originate                                       = each.value.default_originate
  default_originate_route_policy                          = each.value.default_originate_route_policy
  default_originate_inheritance_disable                   = each.value.default_originate_inheritance_disable
  maximum_prefix_limit                                    = each.value.maximum_prefix_limit
  maximum_prefix_threshold                                = each.value.maximum_prefix_threshold
  maximum_prefix_restart                                  = each.value.maximum_prefix_restart
  maximum_prefix_discard_extra_paths                      = each.value.maximum_prefix_discard_extra_paths
  maximum_prefix_warning_only                             = each.value.maximum_prefix_warning_only
  next_hop_self                                           = each.value.next_hop_self
  next_hop_self_inheritance_disable                       = each.value.next_hop_self_inheritance_disable
  next_hop_unchanged                                      = each.value.next_hop_unchanged
  next_hop_unchanged_multipath                            = each.value.next_hop_unchanged_multipath
  next_hop_unchanged_inheritance_disable                  = each.value.next_hop_unchanged_inheritance_disable
  route_policy_in                                         = each.value.route_policy_in
  route_policy_out                                        = each.value.route_policy_out
  orf_route_policy                                        = each.value.orf_route_policy
  cluster_id_allow_equal                                  = each.value.cluster_id_allow_equal
  cluster_id_allow_equal_disable                          = each.value.cluster_id_allow_equal_disable
  replace_private_as                                      = each.value.replace_private_as
  replace_private_as_internal                             = each.value.replace_private_as_internal
  remove_private_as_inbound                               = each.value.remove_private_as_inbound
  remove_private_as_inbound_entire_aspath                 = each.value.remove_private_as_inbound_entire_aspath
  remove_private_as_inbound_inheritance_disable           = each.value.remove_private_as_inbound_inheritance_disable
  remove_private_as                                       = each.value.remove_private_as
  remove_private_as_entire_aspath                         = each.value.remove_private_as_entire_aspath
  remove_private_as_internal                              = each.value.remove_private_as_internal
  route_reflector_client                                  = each.value.route_reflector_client
  route_reflector_client_inheritance_disable              = each.value.route_reflector_client_inheritance_disable
  send_community_ebgp                                     = each.value.send_community_ebgp
  send_community_ebgp_inheritance_disable                 = each.value.send_community_ebgp_inheritance_disable
  send_community_gshut_ebgp                               = each.value.send_community_gshut_ebgp
  send_community_gshut_ebgp_inheritance_disable           = each.value.send_community_gshut_ebgp_inheritance_disable
  send_extended_community_ebgp                            = each.value.send_extended_community_ebgp
  send_extended_community_ebgp_inheritance_disable        = each.value.send_extended_community_ebgp_inheritance_disable
  soft_reconfiguration_inbound                            = each.value.soft_reconfiguration_inbound
  soft_reconfiguration_inbound_always                     = each.value.soft_reconfiguration_inbound_always
  update_out_originator_loopcheck                         = each.value.update_out_originator_loopcheck
  update_out_originator_loopcheck_disable                 = each.value.update_out_originator_loopcheck_disable
  advertise_vpnv4_unicast                                 = each.value.advertise_vpnv4_unicast
  advertise_vpnv4_unicast_re_originated                   = each.value.advertise_vpnv4_unicast_re_originated
  advertise_vpnv4_unicast_re_originated_stitching_rt      = each.value.advertise_vpnv4_unicast_re_originated_stitching_rt
  advertise_vpnv6_unicast                                 = each.value.advertise_vpnv6_unicast
  advertise_vpnv6_unicast_re_originated                   = each.value.advertise_vpnv6_unicast_re_originated
  advertise_vpnv6_unicast_re_originated_stitching_rt      = each.value.advertise_vpnv6_unicast_re_originated_stitching_rt
  advertise_l2vpn_evpn_re_originated                      = each.value.advertise_l2vpn_evpn_re_originated
  advertise_l2vpn_evpn_re_originated_stitching_rt         = each.value.advertise_l2vpn_evpn_re_originated_stitching_rt
  segment_routing_srv6_prefix_sid_type4                   = each.value.segment_routing_srv6_prefix_sid_type4
  import_stitching_rt                                     = each.value.import_stitching_rt
  import_stitching_rt_re_originate                        = each.value.import_stitching_rt_re_originate
  import_stitching_rt_re_originate_stitching_rt           = each.value.import_stitching_rt_re_originate_stitching_rt
  import_re_originate                                     = each.value.import_re_originate
  allowas_in                                              = each.value.allowas_in
  site_of_origin_two_byte_as_number                       = each.value.site_of_origin_two_byte_as_number
  site_of_origin_two_byte_as_index                        = each.value.site_of_origin_two_byte_as_index
  site_of_origin_four_byte_as_number                      = each.value.site_of_origin_four_byte_as_number
  site_of_origin_four_byte_as_index                       = each.value.site_of_origin_four_byte_as_index
  site_of_origin_ipv4_address                             = each.value.site_of_origin_ipv4_address
  site_of_origin_ipv4_address_index                       = each.value.site_of_origin_ipv4_address_index
  as_override                                             = each.value.as_override
  as_override_inheritance_disable                         = each.value.as_override_inheritance_disable
  aigp                                                    = each.value.aigp
  aigp_disable                                            = each.value.aigp_disable
  aigp_send_med                                           = each.value.aigp_send_med
  aigp_send_med_disable                                   = each.value.aigp_send_med_disable
  aigp_send_cost_community_disable                        = each.value.aigp_send_cost_community_disable
  aigp_send_cost_community_id                             = each.value.aigp_send_cost_community_id
  aigp_send_cost_community_id_poi_igp_cost                = each.value.aigp_send_cost_community_id_poi_igp_cost
  aigp_send_cost_community_id_poi_igp_cost_transitive     = each.value.aigp_send_cost_community_id_poi_igp_cost_transitive
  aigp_send_cost_community_id_poi_pre_bestpath            = each.value.aigp_send_cost_community_id_poi_pre_bestpath
  aigp_send_cost_community_id_poi_pre_bestpath_transitive = each.value.aigp_send_cost_community_id_poi_pre_bestpath_transitive
  send_multicast_attributes                               = each.value.send_multicast_attributes
  send_multicast_attributes_disable                       = each.value.send_multicast_attributes_disable
  accept_own                                              = each.value.accept_own
  accept_own_inheritance_disable                          = each.value.accept_own_inheritance_disable
  slow_peer_dynamic                                       = each.value.slow_peer_dynamic
  slow_peer_dynamic_threshold                             = each.value.slow_peer_dynamic_threshold
  slow_peer_dynamic_disable                               = each.value.slow_peer_dynamic_disable
  slow_peer_static                                        = each.value.slow_peer_static
  origin_as_validation_disable                            = each.value.origin_as_validation_disable
  bestpath_origin_as_allow_invalid                        = each.value.bestpath_origin_as_allow_invalid

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_bgp_address_family.ipv4_unicast,
    iosxr_router_bgp_address_family.ipv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_unicast,
    iosxr_router_bgp_address_family.vpnv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_multicast,
    iosxr_router_bgp_address_family.vpnv6_multicast,
    iosxr_router_bgp_address_family.l2vpn_evpn,
    iosxr_router_bgp_neighbor_group.router_bgp_neighbor_group,
    iosxr_router_bgp_af_group.router_bgp_af_group
  ]
}

locals {
  router_bgp_neighbor_address_family = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : [
        for neighbor in try(bgp_process.neighbors, []) : [
          for af in try(neighbor.address_family, []) : {
            key                                                = format("%s/%s/%s/%s", device.name, bgp_process.as_number, neighbor.ip, af.af_name)
            device_name                                        = device.name
            as_number                                          = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
            address                                            = try(neighbor.ip, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ip, null)
            af_name                                            = try(af.af_name, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.af_name, null)
            import_stitching_rt                                = try(af.import_stitching_rt, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.import_stitching_rt, null)
            import_stitching_rt_re_originate                   = try(af.import_stitching_rt_re_originate, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.import_stitching_rt_re_originate, null)
            import_stitching_rt_re_originate_stitching_rt      = try(af.import_stitching_rt_re_originate_stitching_rt, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.import_stitching_rt_re_originate_stitching_rt, null)
            import_re_originate                                = try(af.import_re_originate, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.import_re_originate, null)
            route_reflector_client                             = try(af.route_reflector_client, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.route_reflector_client, null)
            route_reflector_client_inheritance_disable         = try(af.route_reflector_client_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.route_reflector_client_inheritance_disable, null)
            advertise_vpnv4_unicast                            = try(af.advertise_vpnv4_unicast, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.advertise_vpnv4_unicast, null)
            advertise_vpnv4_unicast_re_originated              = try(af.advertise_vpnv4_unicast_re_originated, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.advertise_vpnv4_unicast_re_originated, null)
            advertise_vpnv4_unicast_re_originated_stitching_rt = try(af.advertise_vpnv4_unicast_re_originated_stitching_rt, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.advertise_vpnv4_unicast_re_originated_stitching_rt, null)
            next_hop_self                                      = try(af.next_hop_self, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.next_hop_self, null)
            next_hop_self_inheritance_disable                  = try(af.next_hop_self_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.next_hop_self_inheritance_disable, null)
            encapsulation_type                                 = try(af.encapsulation_type, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.encapsulation_type, null)
            route_policy_in                                    = try(af.route_policy_in, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.route_policy_in, null)
            route_policy_out                                   = try(af.route_policy_out, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.route_policy_out, null)
            soft_reconfiguration_inbound                       = try(af.soft_reconfiguration_inbound, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.soft_reconfiguration_inbound, null)
            soft_reconfiguration_inbound_always                = try(af.soft_reconfiguration_inbound_always, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.soft_reconfiguration_inbound_always, null)
            send_community_ebgp                                = try(af.send_community_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.send_community_ebgp, null)
            send_community_ebgp_inheritance_disable            = try(af.send_community_ebgp_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.send_community_ebgp_inheritance_disable, null)
            maximum_prefix_limit                               = try(af.maximum_prefix_limit, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.maximum_prefix_limit, null)
            maximum_prefix_threshold                           = try(af.maximum_prefix_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.maximum_prefix_threshold, null)
            maximum_prefix_restart                             = try(af.maximum_prefix_restart, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.maximum_prefix_restart, null)
            maximum_prefix_discard_extra_paths                 = try(af.maximum_prefix_discard_extra_paths, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.maximum_prefix_discard_extra_paths, null)
            maximum_prefix_warning_only                        = try(af.maximum_prefix_warning_only, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.maximum_prefix_warning_only, null)
            default_originate                                  = try(af.default_originate, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.default_originate, null)
            default_originate_route_policy                     = try(af.default_originate_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.default_originate_route_policy, null)
            default_originate_inheritance_disable              = try(af.default_originate_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address_family.default_originate_inheritance_disable, null)
          }
        ]
      ]
    ]
  ])
}

resource "iosxr_router_bgp_neighbor_address_family" "router_bgp_neighbor_address_family" {
  for_each                                           = { for af in local.router_bgp_neighbor_address_family : af.key => af }
  device                                             = each.value.device_name
  as_number                                          = each.value.as_number
  address                                            = each.value.address
  af_name                                            = each.value.af_name
  import_stitching_rt                                = each.value.import_stitching_rt
  import_stitching_rt_re_originate                   = each.value.import_stitching_rt_re_originate
  import_stitching_rt_re_originate_stitching_rt      = each.value.import_stitching_rt_re_originate_stitching_rt
  import_re_originate                                = each.value.import_re_originate
  route_reflector_client                             = each.value.route_reflector_client
  route_reflector_client_inheritance_disable         = each.value.route_reflector_client_inheritance_disable
  advertise_vpnv4_unicast                            = each.value.advertise_vpnv4_unicast
  advertise_vpnv4_unicast_re_originated              = each.value.advertise_vpnv4_unicast_re_originated
  advertise_vpnv4_unicast_re_originated_stitching_rt = each.value.advertise_vpnv4_unicast_re_originated_stitching_rt
  next_hop_self                                      = each.value.next_hop_self
  next_hop_self_inheritance_disable                  = each.value.next_hop_self_inheritance_disable
  encapsulation_type                                 = each.value.encapsulation_type
  route_policy_in                                    = each.value.route_policy_in
  route_policy_out                                   = each.value.route_policy_out
  soft_reconfiguration_inbound                       = each.value.soft_reconfiguration_inbound
  soft_reconfiguration_inbound_always                = each.value.soft_reconfiguration_inbound_always
  send_community_ebgp                                = each.value.send_community_ebgp
  send_community_ebgp_inheritance_disable            = each.value.send_community_ebgp_inheritance_disable
  maximum_prefix_limit                               = each.value.maximum_prefix_limit
  maximum_prefix_threshold                           = each.value.maximum_prefix_threshold
  maximum_prefix_restart                             = each.value.maximum_prefix_restart
  maximum_prefix_discard_extra_paths                 = each.value.maximum_prefix_discard_extra_paths
  maximum_prefix_warning_only                        = each.value.maximum_prefix_warning_only
  default_originate                                  = each.value.default_originate
  default_originate_route_policy                     = each.value.default_originate_route_policy
  default_originate_inheritance_disable              = each.value.default_originate_inheritance_disable

  depends_on = [
    iosxr_router_bgp.router_bgp,
    iosxr_route_policy.route_policy
  ]
}

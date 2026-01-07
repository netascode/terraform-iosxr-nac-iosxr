locals {
  router_bgp_vrf_neighbor_address_family = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : [
        for vrf in try(bgp_process.vrfs, []) : [
          for neighbor in try(vrf.neighbors, []) : [
            for af in try(neighbor.address_family, []) : {
              key                                           = format("%s/%s/%s/%s/%s", device.name, bgp_process.as_number, vrf.vrf_name, neighbor.ip, af.af_name)
              device_name                                   = device.name
              as_number                                     = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
              vrf_name                                      = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.vrf_name, null)
              address                                       = try(neighbor.ip, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ip, null)
              af_name                                       = try(af.af_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.af_name, null)
              route_policy_in                               = try(af.route_policy_in, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.route_policy_in, null)
              route_policy_out                              = try(af.route_policy_out, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.route_policy_out, null)
              default_originate                             = try(af.default_originate, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.default_originate, null)
              default_originate_route_policy                = try(af.default_originate_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.default_originate_route_policy, null)
              default_originate_inheritance_disable         = try(af.default_originate_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.default_originate_inheritance_disable, null)
              next_hop_self                                 = try(af.next_hop_self, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.next_hop_self, null)
              next_hop_self_inheritance_disable             = try(af.next_hop_self_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.next_hop_self_inheritance_disable, null)
              soft_reconfiguration_inbound_always           = try(af.soft_reconfiguration_inbound_always, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.soft_reconfiguration_inbound_always, null)
              send_community_ebgp_inheritance_disable       = try(af.send_community_ebgp_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.send_community_ebgp_inheritance_disable, null)
              remove_private_as_inbound                     = try(af.remove_private_as_inbound, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.remove_private_as_inbound, null)
              remove_private_as_inbound_inheritance_disable = try(af.remove_private_as_inbound_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.remove_private_as_inbound_inheritance_disable, null)
              remove_private_as_inbound_entire_aspath       = try(af.remove_private_as_inbound_entire_aspath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.remove_private_as_inbound_entire_aspath, null)
              remove_private_as                             = try(af.remove_private_as, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.remove_private_as, null)
              remove_private_as_entire_aspath               = try(af.remove_private_as_entire_aspath, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.remove_private_as_entire_aspath, null)
              remove_private_as_inheritance_disable         = try(af.remove_private_as_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.remove_private_as_inheritance_disable, null)
              remove_private_as_internal                    = try(af.remove_private_as_internal, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.address_family.remove_private_as_internal, null)
            }
          ]
        ]
      ]
    ]
  ])
}

resource "iosxr_router_bgp_vrf_neighbor_address_family" "router_bgp_vrf_neighbor_address_family" {
  for_each                                      = { for af in local.router_bgp_vrf_neighbor_address_family : af.key => af }
  device                                        = each.value.device_name
  as_number                                     = each.value.as_number
  vrf_name                                      = each.value.vrf_name
  address                                       = each.value.address
  af_name                                       = each.value.af_name
  route_policy_in                               = each.value.route_policy_in
  route_policy_out                              = each.value.route_policy_out
  default_originate                             = each.value.default_originate
  default_originate_route_policy                = each.value.default_originate_route_policy
  default_originate_inheritance_disable         = each.value.default_originate_inheritance_disable
  next_hop_self                                 = each.value.next_hop_self
  next_hop_self_inheritance_disable             = each.value.next_hop_self_inheritance_disable
  soft_reconfiguration_inbound_always           = each.value.soft_reconfiguration_inbound_always
  send_community_ebgp_inheritance_disable       = each.value.send_community_ebgp_inheritance_disable
  remove_private_as_inbound                     = each.value.remove_private_as_inbound
  remove_private_as_inbound_inheritance_disable = each.value.remove_private_as_inbound_inheritance_disable
  remove_private_as_inbound_entire_aspath       = each.value.remove_private_as_inbound_entire_aspath
  remove_private_as                             = each.value.remove_private_as
  remove_private_as_entire_aspath               = each.value.remove_private_as_entire_aspath
  remove_private_as_inheritance_disable         = each.value.remove_private_as_inheritance_disable
  remove_private_as_internal                    = each.value.remove_private_as_internal

  depends_on = [
    iosxr_router_bgp_vrf_address_family.router_bgp_vrf_address_family,
    iosxr_router_bgp_neighbor_group.router_bgp_neighbor_group,
    iosxr_route_policy.route_policy
  ]
}

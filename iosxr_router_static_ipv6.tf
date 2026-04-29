locals {
  router_static_ipv6_unicast = flatten([
    for device in local.devices : [
      for route in try(local.device_config[device.name].routing.static_routes.address_family.ipv6_unicast.prefixes, []) : {
        key            = format("%s/%s/%s", device.name, route.address, route.length)
        device_name    = device.name
        prefix_address = try(route.address, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.address, null)
        prefix_length  = try(route.length, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.length, null)
        nexthop_interfaces = try(length(route.next_hops) == 0, true) ? null : [for nh in route.next_hops : {
          interface_name  = try(nh.interface, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.interface, null)
          description     = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.description, null)
          tag             = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.tag, null)
          distance_metric = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.distance, null)
          permanent       = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.permanent, null)
          track           = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.track, null)
          metric          = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.metric, null)
          } if try(nh.interface, null) != null && try(nh.ip, null) == null
        ]
        nexthop_interface_addresses = try(length(route.next_hops) == 0, true) ? null : [for nh in route.next_hops : {
          interface_name                   = try(nh.interface, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.interface, null)
          address                          = try(nh.ip, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.ip, null)
          bfd_fast_detect_minimum_interval = try(nh.bfd_fast_detect_minimum_interval, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.bfd_fast_detect_minimum_interval, null)
          bfd_fast_detect_multiplier       = try(nh.bfd_fast_detect_multiplier, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.bfd_fast_detect_multiplier, null)
          description                      = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.description, null)
          tag                              = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.tag, null)
          distance_metric                  = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.distance, null)
          permanent                        = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.permanent, null)
          track                            = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.track, null)
          metric                           = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.metric, null)
          } if try(nh.interface, null) != null && try(nh.ip, null) != null
        ]
        nexthop_addresses = try(length(route.next_hops) == 0, true) ? null : [for nh in route.next_hops : {
          address                          = try(nh.ip, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.ip, null)
          bfd_fast_detect_minimum_interval = try(nh.bfd_fast_detect_minimum_interval, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.bfd_fast_detect_minimum_interval, null)
          bfd_fast_detect_multiplier       = try(nh.bfd_fast_detect_multiplier, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.bfd_fast_detect_multiplier, null)
          description                      = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.description, null)
          tag                              = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.tag, null)
          distance_metric                  = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.distance, null)
          permanent                        = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.permanent, null)
          track                            = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.track, null)
          metric                           = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.metric, null)
          } if try(nh.ip, null) != null && try(nh.interface, null) == null
        ]
        sr_policies = try(length(route.sr_policies) == 0, true) ? null : [for sr_policy in route.sr_policies : {
          sr_policy_name  = try(sr_policy.name, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.sr_policies.name, null)
          description     = try(sr_policy.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.sr_policies.description, null)
          tag             = try(sr_policy.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.sr_policies.tag, null)
          distance_metric = try(sr_policy.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.sr_policies.distance, null)
          permanent       = try(sr_policy.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.sr_policies.permanent, null)
          track           = try(sr_policy.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.sr_policies.track, null)
          metric          = try(sr_policy.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.sr_policies.metric, null)
          }
        ]
        vrfs = try(length(route.vrfs) == 0, true) ? null : [for vrf in route.vrfs : {
          vrf_name = try(vrf.name, null)
          nexthop_interfaces = try(length(vrf.next_hops) == 0, true) ? null : [for nh in vrf.next_hops : {
            interface_name  = try(nh.interface, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.interface, null)
            description     = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.description, null)
            tag             = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.tag, null)
            distance_metric = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.distance, null)
            permanent       = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.permanent, null)
            track           = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.track, null)
            metric          = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.metric, null)
            } if try(nh.interface, null) != null && try(nh.ip, null) == null
          ]
          nexthop_interface_addresses = try(length(vrf.next_hops) == 0, true) ? null : [for nh in vrf.next_hops : {
            interface_name                   = try(nh.interface, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.interface, null)
            address                          = try(nh.ip, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.ip, null)
            bfd_fast_detect_minimum_interval = try(nh.bfd_fast_detect_minimum_interval, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.bfd_fast_detect_minimum_interval, null)
            bfd_fast_detect_multiplier       = try(nh.bfd_fast_detect_multiplier, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.bfd_fast_detect_multiplier, null)
            description                      = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.description, null)
            tag                              = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.tag, null)
            distance_metric                  = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.distance, null)
            permanent                        = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.permanent, null)
            track                            = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.track, null)
            metric                           = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.metric, null)
            } if try(nh.interface, null) != null && try(nh.ip, null) != null
          ]
          nexthop_addresses = try(length(vrf.next_hops) == 0, true) ? null : [for nh in vrf.next_hops : {
            address                          = try(nh.ip, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.ip, null)
            bfd_fast_detect_minimum_interval = try(nh.bfd_fast_detect_minimum_interval, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.bfd_fast_detect_minimum_interval, null)
            bfd_fast_detect_multiplier       = try(nh.bfd_fast_detect_multiplier, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.bfd_fast_detect_multiplier, null)
            description                      = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.description, null)
            tag                              = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.tag, null)
            distance_metric                  = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.distance, null)
            permanent                        = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.permanent, null)
            track                            = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.track, null)
            metric                           = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.next_hops.metric, null)
            } if try(nh.ip, null) != null && try(nh.interface, null) == null
          ]
          sr_policies = try(length(vrf.sr_policies) == 0, true) ? null : [for sr_policy in vrf.sr_policies : {
            sr_policy_name  = try(sr_policy.name, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.sr_policies.name, null)
            description     = try(sr_policy.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.sr_policies.description, null)
            tag             = try(sr_policy.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.sr_policies.tag, null)
            distance_metric = try(sr_policy.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.sr_policies.distance, null)
            permanent       = try(sr_policy.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.sr_policies.permanent, null)
            track           = try(sr_policy.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.sr_policies.track, null)
            metric          = try(sr_policy.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_unicast.prefixes.sr_policies.metric, null)
            }
          ]
          }
        ]
      }
    ]
  ])
}

resource "iosxr_router_static_ipv6_unicast" "router_static_ipv6_unicast" {
  for_each                    = { for route in local.router_static_ipv6_unicast : route.key => route }
  device                      = each.value.device_name
  prefix_address              = each.value.prefix_address
  prefix_length               = each.value.prefix_length
  nexthop_interfaces          = length(coalesce(each.value.nexthop_interfaces, [])) > 0 ? each.value.nexthop_interfaces : null
  nexthop_interface_addresses = length(coalesce(each.value.nexthop_interface_addresses, [])) > 0 ? each.value.nexthop_interface_addresses : null
  nexthop_addresses           = length(coalesce(each.value.nexthop_addresses, [])) > 0 ? each.value.nexthop_addresses : null
  sr_policies                 = length(coalesce(each.value.sr_policies, [])) > 0 ? each.value.sr_policies : null
  vrfs                        = length(coalesce(each.value.vrfs, [])) > 0 ? each.value.vrfs : null

  depends_on = [
    iosxr_vrf.vrf
  ]
}

locals {
  router_static_ipv6_multicast = flatten([
    for device in local.devices : [
      for route in try(local.device_config[device.name].routing.static_routes.address_family.ipv6_multicast.prefixes, []) : {
        key            = format("%s/%s/%s", device.name, route.address, route.length)
        device_name    = device.name
        prefix_address = try(route.address, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.address, null)
        prefix_length  = try(route.length, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.length, null)
        nexthop_interfaces = try(length(route.next_hops) == 0, true) ? null : [for nh in route.next_hops : {
          interface_name  = try(nh.interface, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.interface, null)
          description     = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.description, null)
          tag             = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.tag, null)
          distance_metric = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.distance, null)
          permanent       = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.permanent, null)
          track           = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.track, null)
          metric          = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.metric, null)
          } if try(nh.interface, null) != null && try(nh.ip, null) == null
        ]
        nexthop_interface_addresses = try(length(route.next_hops) == 0, true) ? null : [for nh in route.next_hops : {
          interface_name                   = try(nh.interface, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.interface, null)
          address                          = try(nh.ip, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.ip, null)
          bfd_fast_detect_minimum_interval = try(nh.bfd_fast_detect_minimum_interval, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.bfd_fast_detect_minimum_interval, null)
          bfd_fast_detect_multiplier       = try(nh.bfd_fast_detect_multiplier, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.bfd_fast_detect_multiplier, null)
          description                      = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.description, null)
          tag                              = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.tag, null)
          distance_metric                  = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.distance, null)
          permanent                        = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.permanent, null)
          track                            = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.track, null)
          metric                           = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.metric, null)
          } if try(nh.interface, null) != null && try(nh.ip, null) != null
        ]
        nexthop_addresses = try(length(route.next_hops) == 0, true) ? null : [for nh in route.next_hops : {
          address                          = try(nh.ip, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.ip, null)
          bfd_fast_detect_minimum_interval = try(nh.bfd_fast_detect_minimum_interval, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.bfd_fast_detect_minimum_interval, null)
          bfd_fast_detect_multiplier       = try(nh.bfd_fast_detect_multiplier, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.bfd_fast_detect_multiplier, null)
          description                      = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.description, null)
          tag                              = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.tag, null)
          distance_metric                  = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.distance, null)
          permanent                        = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.permanent, null)
          track                            = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.track, null)
          metric                           = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.metric, null)
          } if try(nh.ip, null) != null && try(nh.interface, null) == null
        ]
        sr_policies = try(length(route.sr_policies) == 0, true) ? null : [for sr_policy in route.sr_policies : {
          sr_policy_name  = try(sr_policy.name, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.sr_policies.name, null)
          description     = try(sr_policy.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.sr_policies.description, null)
          tag             = try(sr_policy.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.sr_policies.tag, null)
          distance_metric = try(sr_policy.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.sr_policies.distance, null)
          permanent       = try(sr_policy.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.sr_policies.permanent, null)
          track           = try(sr_policy.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.sr_policies.track, null)
          metric          = try(sr_policy.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.sr_policies.metric, null)
          }
        ]
        vrfs = try(length(route.vrfs) == 0, true) ? null : [for vrf in route.vrfs : {
          vrf_name = try(vrf.name, null)
          nexthop_interfaces = try(length(vrf.next_hops) == 0, true) ? null : [for nh in vrf.next_hops : {
            interface_name  = try(nh.interface, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.interface, null)
            description     = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.description, null)
            tag             = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.tag, null)
            distance_metric = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.distance, null)
            permanent       = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.permanent, null)
            track           = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.track, null)
            metric          = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.metric, null)
            } if try(nh.interface, null) != null && try(nh.ip, null) == null
          ]
          nexthop_interface_addresses = try(length(vrf.next_hops) == 0, true) ? null : [for nh in vrf.next_hops : {
            interface_name                   = try(nh.interface, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.interface, null)
            address                          = try(nh.ip, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.ip, null)
            bfd_fast_detect_minimum_interval = try(nh.bfd_fast_detect_minimum_interval, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.bfd_fast_detect_minimum_interval, null)
            bfd_fast_detect_multiplier       = try(nh.bfd_fast_detect_multiplier, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.bfd_fast_detect_multiplier, null)
            description                      = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.description, null)
            tag                              = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.tag, null)
            distance_metric                  = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.distance, null)
            permanent                        = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.permanent, null)
            track                            = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.track, null)
            metric                           = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.metric, null)
            } if try(nh.interface, null) != null && try(nh.ip, null) != null
          ]
          nexthop_addresses = try(length(vrf.next_hops) == 0, true) ? null : [for nh in vrf.next_hops : {
            address                          = try(nh.ip, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.ip, null)
            bfd_fast_detect_minimum_interval = try(nh.bfd_fast_detect_minimum_interval, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.bfd_fast_detect_minimum_interval, null)
            bfd_fast_detect_multiplier       = try(nh.bfd_fast_detect_multiplier, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.bfd_fast_detect_multiplier, null)
            description                      = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.description, null)
            tag                              = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.tag, null)
            distance_metric                  = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.distance, null)
            permanent                        = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.permanent, null)
            track                            = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.track, null)
            metric                           = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.metric, null)
            } if try(nh.ip, null) != null && try(nh.interface, null) == null
          ]
          sr_policies = try(length(vrf.sr_policies) == 0, true) ? null : [for sr_policy in vrf.sr_policies : {
            sr_policy_name  = try(sr_policy.name, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.sr_policies.name, null)
            description     = try(sr_policy.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.sr_policies.description, null)
            tag             = try(sr_policy.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.sr_policies.tag, null)
            distance_metric = try(sr_policy.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.sr_policies.distance, null)
            permanent       = try(sr_policy.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.sr_policies.permanent, null)
            track           = try(sr_policy.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.sr_policies.track, null)
            metric          = try(sr_policy.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.sr_policies.metric, null)
            }
          ]
          }
        ]
      }
    ]
  ])
}

resource "iosxr_router_static_ipv6_multicast" "router_static_ipv6_multicast" {
  for_each                    = { for route in local.router_static_ipv6_multicast : route.key => route }
  device                      = each.value.device_name
  prefix_address              = each.value.prefix_address
  prefix_length               = each.value.prefix_length
  nexthop_interfaces          = length(coalesce(each.value.nexthop_interfaces, [])) > 0 ? each.value.nexthop_interfaces : null
  nexthop_interface_addresses = length(coalesce(each.value.nexthop_interface_addresses, [])) > 0 ? each.value.nexthop_interface_addresses : null
  nexthop_addresses           = length(coalesce(each.value.nexthop_addresses, [])) > 0 ? each.value.nexthop_addresses : null
  sr_policies                 = length(coalesce(each.value.sr_policies, [])) > 0 ? each.value.sr_policies : null
  vrfs                        = length(coalesce(each.value.vrfs, [])) > 0 ? each.value.vrfs : null

  depends_on = [
    iosxr_vrf.vrf
  ]
}

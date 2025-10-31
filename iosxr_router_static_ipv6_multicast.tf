locals {
  router_static_ipv6_multicast = flatten([
    for device in local.devices : [
      for route in try(local.device_config[device.name].routing.static_routes.address_family.ipv6_multicast.prefixes, []) : {
        key            = format("%s/%s/%s", device.name, route.address, route.mask)
        device_name    = device.name
        prefix_address = try(route.address, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.address, null)
        prefix_length  = try(route.mask, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.mask, null)
        nexthop_interfaces = try(length(route.next_hops) == 0, true) ? null : [for nh in route.next_hops : {
          interface_name  = try(nh.interface_id, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.interface_id, null)
          description     = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.description, null)
          tag             = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.tag, null)
          distance_metric = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.distance, null)
          permanent       = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.permanent, null)
          track           = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.track, null)
          metric          = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.metric, null)
          } if try(nh.interface_id, null) != null && try(nh.address, null) == null
        ]
        nexthop_interface_addresses = try(length(route.next_hops) == 0, true) ? null : [for nh in route.next_hops : {
          interface_name  = try(nh.interface_id, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.interface_id, null)
          address         = try(nh.address, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.address, null)
          description     = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.description, null)
          tag             = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.tag, null)
          distance_metric = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.distance, null)
          permanent       = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.permanent, null)
          track           = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.track, null)
          metric          = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.metric, null)
          } if try(nh.interface_id, null) != null && try(nh.address, null) != null
        ]
        nexthop_addresses = try(length(route.next_hops) == 0, true) ? null : [for nh in route.next_hops : {
          address         = try(nh.address, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.address, null)
          description     = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.description, null)
          tag             = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.tag, null)
          distance_metric = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.distance, null)
          permanent       = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.permanent, null)
          track           = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.track, null)
          metric          = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.metric, null)
          } if try(nh.address, null) != null && try(nh.interface_id, null) == null
        ]
        vrfs = try(length(route.vrfs) == 0, true) ? null : [for vrf in route.vrfs : {
          vrf_name = try(vrf.vrf_name, null)
          nexthop_interfaces = try(length(vrf.next_hops) == 0, true) ? null : [for nh in vrf.next_hops : {
            interface_name  = try(nh.interface_id, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.interface_id, null)
            description     = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.description, null)
            tag             = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.tag, null)
            distance_metric = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.distance, null)
            permanent       = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.permanent, null)
            track           = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.track, null)
            metric          = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.metric, null)
            } if try(nh.interface_id, null) != null && try(nh.address, null) == null
          ]
          nexthop_interface_addresses = try(length(vrf.next_hops) == 0, true) ? null : [for nh in vrf.next_hops : {
            interface_name  = try(nh.interface_id, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.interface_id, null)
            address         = try(nh.address, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.address, null)
            description     = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.description, null)
            tag             = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.tag, null)
            distance_metric = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.distance, null)
            permanent       = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.permanent, null)
            track           = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.track, null)
            metric          = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.metric, null)
            } if try(nh.interface_id, null) != null && try(nh.address, null) != null
          ]
          nexthop_addresses = try(length(vrf.next_hops) == 0, true) ? null : [for nh in vrf.next_hops : {
            address         = try(nh.address, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.address, null)
            description     = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.description, null)
            tag             = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.tag, null)
            distance_metric = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.distance, null)
            permanent       = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.permanent, null)
            track           = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.track, null)
            metric          = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.address_family.ipv6_multicast.prefixes.next_hops.metric, null)
            } if try(nh.address, null) != null && try(nh.interface_id, null) == null
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
  vrfs                        = length(coalesce(each.value.vrfs, [])) > 0 ? each.value.vrfs : null

  depends_on = [
    # Future dependencies - uncomment when resource is created:
    #iosxr_vrf.vrf
  ]
}

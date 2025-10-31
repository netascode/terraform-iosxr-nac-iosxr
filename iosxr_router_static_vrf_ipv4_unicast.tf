locals {
  router_static_vrf_ipv4_unicast = flatten([
    for device in local.devices : [
      for vrf in try(local.device_config[device.name].routing.static_routes.vrfs, []) : [
        for route in try(vrf.address_family.ipv4_unicast.prefixes, []) : {
          key            = format("%s/%s/%s/%s", device.name, vrf.vrf_name, route.address, route.mask)
          device_name    = device.name
          vrf_name       = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.vrf_name, null)
          prefix_address = try(route.address, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.address, null)
          prefix_length  = try(route.mask, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.mask, null)
          nexthop_interfaces = try(length(route.next_hops) == 0, true) ? null : [for nh in route.next_hops : {
            interface_name  = try(nh.interface_id, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.interface_id, null)
            description     = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.description, null)
            tag             = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.tag, null)
            distance_metric = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.distance, null)
            permanent       = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.permanent, null)
            track           = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.track, null)
            metric          = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.metric, null)
            } if try(nh.interface_id, null) != null && try(nh.address, null) == null
          ]
          nexthop_interface_addresses = try(length(route.next_hops) == 0, true) ? null : [for nh in route.next_hops : {
            interface_name                   = try(nh.interface_id, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.interface_id, null)
            address                          = try(nh.address, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.address, null)
            bfd_fast_detect_minimum_interval = try(nh.bfd_fast_detect_minimum_interval, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.bfd_fast_detect_minimum_interval, null)
            bfd_fast_detect_multiplier       = try(nh.bfd_fast_detect_multiplier, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.bfd_fast_detect_multiplier, null)
            description                      = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.description, null)
            tag                              = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.tag, null)
            distance_metric                  = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.distance, null)
            permanent                        = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.permanent, null)
            track                            = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.track, null)
            metric                           = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.metric, null)
            } if try(nh.interface_id, null) != null && try(nh.address, null) != null
          ]
          nexthop_addresses = try(length(route.next_hops) == 0, true) ? null : [for nh in route.next_hops : {
            address                          = try(nh.address, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.address, null)
            bfd_fast_detect_minimum_interval = try(nh.bfd_fast_detect_minimum_interval, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.bfd_fast_detect_minimum_interval, null)
            bfd_fast_detect_multiplier       = try(nh.bfd_fast_detect_multiplier, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.bfd_fast_detect_multiplier, null)
            description                      = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.description, null)
            tag                              = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.tag, null)
            distance_metric                  = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.distance, null)
            permanent                        = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.permanent, null)
            track                            = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.track, null)
            metric                           = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.metric, null)
            } if try(nh.address, null) != null && try(nh.interface_id, null) == null
          ]
          vrfs = try(length(route.vrfs) == 0, true) ? null : [for cross_vrf in route.vrfs : {
            vrf_name = try(cross_vrf.vrf_name, null)
            nexthop_interfaces = try(length(cross_vrf.next_hops) == 0, true) ? null : [for nh in cross_vrf.next_hops : {
              interface_name  = try(nh.interface_id, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.interface_id, null)
              description     = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.description, null)
              tag             = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.tag, null)
              distance_metric = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.distance, null)
              permanent       = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.permanent, null)
              track           = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.track, null)
              metric          = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.metric, null)
              } if try(nh.interface_id, null) != null && try(nh.address, null) == null
            ]
            nexthop_interface_addresses = try(length(cross_vrf.next_hops) == 0, true) ? null : [for nh in cross_vrf.next_hops : {
              interface_name                   = try(nh.interface_id, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.interface_id, null)
              address                          = try(nh.address, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.address, null)
              bfd_fast_detect_minimum_interval = try(nh.bfd_fast_detect_minimum_interval, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.bfd_fast_detect_minimum_interval, null)
              bfd_fast_detect_multiplier       = try(nh.bfd_fast_detect_multiplier, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.bfd_fast_detect_multiplier, null)
              description                      = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.description, null)
              tag                              = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.tag, null)
              distance_metric                  = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.distance, null)
              permanent                        = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.permanent, null)
              track                            = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.track, null)
              metric                           = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.metric, null)
              } if try(nh.interface_id, null) != null && try(nh.address, null) != null
            ]
            nexthop_addresses = try(length(cross_vrf.next_hops) == 0, true) ? null : [for nh in cross_vrf.next_hops : {
              address                          = try(nh.address, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.address, null)
              bfd_fast_detect_minimum_interval = try(nh.bfd_fast_detect_minimum_interval, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.bfd_fast_detect_minimum_interval, null)
              bfd_fast_detect_multiplier       = try(nh.bfd_fast_detect_multiplier, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.bfd_fast_detect_multiplier, null)
              description                      = try(nh.description, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.description, null)
              tag                              = try(nh.tag, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.tag, null)
              distance_metric                  = try(nh.distance, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.distance, null)
              permanent                        = try(nh.permanent, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.permanent, null)
              track                            = try(nh.track, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.track, null)
              metric                           = try(nh.metric, local.defaults.iosxr.devices.configuration.routing.static_routes.vrfs.address_family.ipv4_unicast.prefixes.next_hops.metric, null)
              } if try(nh.address, null) != null && try(nh.interface_id, null) == null
            ]
            }
          ]
        }
      ]
    ]
  ])
}

resource "iosxr_router_static_vrf_ipv4_unicast" "router_static_vrf_ipv4_unicast" {
  for_each                    = { for route in local.router_static_vrf_ipv4_unicast : route.key => route }
  device                      = each.value.device_name
  vrf_name                    = each.value.vrf_name
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

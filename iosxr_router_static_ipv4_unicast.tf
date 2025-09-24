locals {
  device_router_static_ipv4_unicast = flatten([
    for device in local.devices : [
      for route in try(local.device_config[device.name].router_static_ipv4_unicast, local.defaults.iosxr.configuration.router_static_ipv4_unicast, []) : {
        device_name    = device.name
        prefix_address = try(route.prefix_address, null)
        prefix_length  = try(route.prefix_length, null)
        key            = "${device.name}-static-${route.prefix_address}-${route.prefix_length}"

        nexthop_interfaces = [
          for nh in try(route.nexthop_interfaces, []) : {
            interface_name  = try(nh.interface_name, null)
            description     = try(nh.description, null)
            tag             = try(nh.tag, null)
            distance_metric = try(nh.distance_metric, null)
            permanent       = try(nh.permanent, null)
            track           = try(nh.track, null)
            metric          = try(nh.metric, null)
          }
        ]

        nexthop_interface_addresses = [
          for nh in try(route.nexthop_interface_addresses, []) : {
            interface_name  = try(nh.interface_name, null)
            address         = try(nh.address, null)
            description     = try(nh.description, null)
            tag             = try(nh.tag, null)
            distance_metric = try(nh.distance_metric, null)
            permanent       = try(nh.permanent, null)
            track           = try(nh.track, null)
            metric          = try(nh.metric, null)
          }
        ]

        nexthop_addresses = [
          for nh in try(route.nexthop_addresses, []) : {
            address         = try(nh.address, null)
            description     = try(nh.description, null)
            tag             = try(nh.tag, null)
            distance_metric = try(nh.distance_metric, null)
            permanent       = try(nh.permanent, null)
            track           = try(nh.track, null)
            metric          = try(nh.metric, null)
          }
        ]

        vrfs = [
          for vrf in try(route.vrfs, []) : {
            vrf_name = try(vrf.vrf_name, null)

            nexthop_interfaces = [
              for nh in try(vrf.nexthop_interfaces, []) : {
                interface_name  = try(nh.interface_name, null)
                description     = try(nh.description, null)
                tag             = try(nh.tag, null)
                distance_metric = try(nh.distance_metric, null)
                permanent       = try(nh.permanent, null)
                track           = try(nh.track, null)
                metric          = try(nh.metric, null)
              }
            ]

            nexthop_interface_addresses = [
              for nh in try(vrf.nexthop_interface_addresses, []) : {
                interface_name  = try(nh.interface_name, null)
                address         = try(nh.address, null)
                description     = try(nh.description, null)
                tag             = try(nh.tag, null)
                distance_metric = try(nh.distance_metric, null)
                permanent       = try(nh.permanent, null)
                track           = try(nh.track, null)
                metric          = try(nh.metric, null)
              }
            ]

            nexthop_addresses = [
              for nh in try(vrf.nexthop_addresses, []) : {
                address         = try(nh.address, null)
                description     = try(nh.description, null)
                tag             = try(nh.tag, null)
                distance_metric = try(nh.distance_metric, null)
                permanent       = try(nh.permanent, null)
                track           = try(nh.track, null)
                metric          = try(nh.metric, null)
              }
            ]
          }
        ]
      }
    ]
    if try(local.device_config[device.name].router_static_ipv4_unicast, null) != null || try(local.defaults.iosxr.configuration.router_static_ipv4_unicast, null) != null
  ])
}

resource "iosxr_router_static_ipv4_unicast" "router_static_ipv4_unicast" {
  for_each = {
    for route in local.device_router_static_ipv4_unicast :
    route.key => route
  }

  device         = each.value.device_name
  prefix_address = each.value.prefix_address
  prefix_length  = each.value.prefix_length

  nexthop_interfaces          = each.value.nexthop_interfaces
  nexthop_interface_addresses = each.value.nexthop_interface_addresses
  nexthop_addresses           = each.value.nexthop_addresses
  vrfs                        = each.value.vrfs
}
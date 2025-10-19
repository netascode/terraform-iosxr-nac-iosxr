locals {
  device_route_policies = flatten([
    for device in local.devices : [
      for route_policy in try(local.device_config[device.name].route_policy, []) : {
        key               = "${device.name}-${route_policy.route_policy_name}"
        device_name       = device.name
        route_policy_name = try(route_policy.route_policy_name, local.defaults.iosxr.configuration.route_policy.route_policy_name, null)
        rpl               = try(route_policy.rpl, local.defaults.iosxr.configuration.route_policy.rpl, null)
      }
    ]
  ])
}

resource "iosxr_route_policy" "route_policy" {
  for_each          = { for route_policy in local.device_route_policies : route_policy.key => route_policy }
  device            = each.value.device_name
  route_policy_name = each.value.route_policy_name
  rpl               = each.value.rpl
}

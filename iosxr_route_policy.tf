locals {
  route_policies = flatten([
    for device in local.devices : [
      for route_policy in try(local.device_config[device.name].route_policies, []) : {
        key               = format("%s/%s", device.name, route_policy.name)
        device_name       = device.name
        route_policy_name = try(route_policy.name, local.defaults.iosxr.devices.configuration.route_policies.name, null)
        rpl               = try(route_policy.rpl, local.defaults.iosxr.devices.configuration.route_policies.rpl, null)
      }
    ]
  ])
}

resource "iosxr_route_policy" "route_policy" {
  for_each          = { for route_policy in local.route_policies : route_policy.key => route_policy }
  device            = each.value.device_name
  route_policy_name = each.value.route_policy_name
  rpl               = each.value.rpl

  # route-policy definitions accept forward references, so they must NOT depend on those sets here.
  # Existence constraint is only enforced when a policy is ATTACHED, dependencies live on the attach-point resources instead.
  depends_on = [
    iosxr_key_chain.key_chain,
  ]
}

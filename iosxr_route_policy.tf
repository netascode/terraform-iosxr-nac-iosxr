locals {
  route_policies = flatten([
    for device in local.devices : [
      for route_policy in try(local.device_config[device.name].route_policy, []) : {
        key               = "${device.name}-${route_policy.route_policy_name}"
        device_name       = device.name
        route_policy_name = try(route_policy.route_policy_name, local.defaults.iosxr.devices.configuration.route_policy.route_policy_name, null)
        rpl               = try(route_policy.rpl, local.defaults.iosxr.devices.configuration.route_policy.rpl, null)
      }
    ]
  ])
}

resource "iosxr_route_policy" "route_policy" {
  for_each          = { for route_policy in local.route_policies : route_policy.key => route_policy }
  device            = each.value.device_name
  route_policy_name = each.value.route_policy_name
  rpl               = each.value.rpl

  depends_on = [
    iosxr_as_path_set.as_path_set,
    iosxr_community_set.community_set,
    iosxr_esi_set.esi_set,
    iosxr_prefix_set.prefix_set,
    iosxr_rd_set.rd_set,
    iosxr_tag_set.tag_set,
    iosxr_extcommunity_cost_set.extcommunity_cost_set,
    iosxr_extcommunity_opaque_set.extcommunity_opaque_set
    # Future dependencies - uncomment when resource is created:
    #iosxr_extcommunity_rt_set.extcommunity_rt_set,
    #iosxr_extcommunity_soo_set.extcommunity_soo_set,
    #iosxr_ipv4_prefix_list.ipv4_prefix_list,
    #iosxr_ipv6_prefix_list.ipv6_prefix_list,
    #iosxr_ipv4_access_list.ipv4_access_list,
    #iosxr_ipv6_access_list.ipv6_access_list
  ]
}

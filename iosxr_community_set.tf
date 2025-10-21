locals {
  community_sets = flatten([
    for device in local.devices : [
      for community_set in try(local.device_config[device.name].community_set, []) : {
        key         = "${device.name}-${community_set.set_name}"
        device_name = device.name
        set_name    = try(community_set.set_name, local.defaults.iosxr.configuration.community_set.set_name, null)
        rpl         = try(community_set.rpl, local.defaults.iosxr.configuration.community_set.rpl, null)
      }
    ]
  ])
}

resource "iosxr_community_set" "community_set" {
  for_each = { for community_set in local.community_sets : community_set.key => community_set }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

locals {
  device_tag_sets = flatten([
    for device in local.devices : [
      for tag_set in try(local.device_config[device.name].tag_sets, []) : {
        key         = "${device.name}-${tag_set.set_name}"
        device_name = device.name
        set_name    = try(tag_set.set_name, local.defaults.iosxr.configuration.tag_sets.set_name, null)
        rpl_tag_set = try(tag_set.rpl, local.defaults.iosxr.configuration.tag_sets.rpl, null)
      }
    ]
    if try(local.device_config[device.name].tag_sets, null) != null && try(local.defaults.iosxr.configuration.tag_sets, null) != null
  ])
}

resource "iosxr_tag_set" "tag_set" {
  for_each    = { for tag_set in local.device_tag_sets : tag_set.key => tag_set }
  device      = each.value.device_name
  set_name    = each.value.set_name
  rpl_tag_set = each.value.rpl_tag_set
}

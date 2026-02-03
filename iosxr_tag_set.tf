locals {
  tag_sets = flatten([
    for device in local.devices : [
      for tag_set in try(local.device_config[device.name].tag_sets, []) : {
        key         = format("%s/%s", device.name, tag_set.set_name)
        device_name = device.name
        set_name    = try(tag_set.set_name, local.defaults.iosxr.devices.configuration.tag_sets.set_name, null)
        rpl         = try(tag_set.rpl, local.defaults.iosxr.devices.configuration.tag_sets.rpl, null)
      }
    ]
  ])
}

resource "iosxr_tag_set" "tag_set" {
  for_each = { for tag_set in local.tag_sets : tag_set.key => tag_set }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

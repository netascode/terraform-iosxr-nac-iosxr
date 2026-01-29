locals {
  prefix_sets = flatten([
    for device in local.devices : [
      for prefix_set in try(local.device_config[device.name].prefix_sets, []) : {
        key         = format("%s/%s", device.name, prefix_set.set_name)
        device_name = device.name
        set_name    = try(prefix_set.set_name, local.defaults.iosxr.devices.configuration.prefix_sets.set_name, null)
        rpl         = try(prefix_set.rpl, local.defaults.iosxr.devices.configuration.prefix_sets.rpl, null)
      }
    ]
  ])
}

resource "iosxr_prefix_set" "prefix_set" {
  for_each = { for prefix_set in local.prefix_sets : prefix_set.key => prefix_set }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

locals {
  device_prefix_sets = flatten([
    for device in local.devices : [
      for prefix_set in try(local.device_config[device.name].prefix_set, []) : {
        key         = "${device.name}-${prefix_set.set_name}"
        device_name = device.name
        set_name    = try(prefix_set.set_name, local.defaults.iosxr.configuration.prefix_set.set_name, null)
        rpl         = try(prefix_set.rpl, local.defaults.iosxr.configuration.prefix_set.rpl, null)
      }
      if try(prefix_set.set_name, local.defaults.iosxr.configuration.prefix_set.set_name, null) != null &&
      try(prefix_set.rpl, local.defaults.iosxr.configuration.prefix_set.rpl, null) != null
    ]
  ])
}

resource "iosxr_prefix_set" "prefix_set" {
  for_each = { for prefix_set in local.device_prefix_sets : prefix_set.key => prefix_set }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

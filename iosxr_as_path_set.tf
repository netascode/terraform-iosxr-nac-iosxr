locals {
  as_path_sets = flatten([
    for device in local.devices : [
      for as_path_set in try(local.device_config[device.name].as_path_sets, []) : {
        key         = "${device.name}-${as_path_set.set_name}"
        device_name = device.name
        set_name    = try(as_path_set.set_name, local.defaults.iosxr.configuration.as_path_sets.set_name, null)
        rpl         = try(as_path_set.rpl, local.defaults.iosxr.configuration.as_path_sets.rpl, null)
      }
    ]
  ])
}

resource "iosxr_as_path_set" "as_path_set" {
  for_each = { for as_path_set in local.as_path_sets : as_path_set.key => as_path_set }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

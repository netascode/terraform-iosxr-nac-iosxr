locals {
  esi_sets = flatten([
    for device in local.devices : [
      for esi_set in try(local.device_config[device.name].esi_sets, []) : {
        key         = "${device.name}-${esi_set.set_name}"
        device_name = device.name
        set_name    = try(esi_set.set_name, local.defaults.iosxr.devices.configuration.esi_sets.set_name, null)
        rpl         = try(esi_set.rpl, local.defaults.iosxr.devices.configuration.esi_sets.rpl, null)
      }
    ]
  ])
}

resource "iosxr_esi_set" "esi_set" {
  for_each = { for esi_set in local.esi_sets : esi_set.key => esi_set }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

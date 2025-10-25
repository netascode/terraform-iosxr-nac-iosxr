locals {
  extcommunity_opaque_sets = flatten([
    for device in local.devices : [
      for extcommunity_opaque_set in try(local.device_config[device.name].extcommunity_opaque_sets, []) : {
        key         = "${device.name}-${extcommunity_opaque_set.set_name}"
        device_name = device.name
        set_name    = try(extcommunity_opaque_set.set_name, local.defaults.iosxr.devices.configuration.extcommunity_opaque_sets.set_name, null)
        rpl         = try(extcommunity_opaque_set.rpl, local.defaults.iosxr.devices.configuration.extcommunity_opaque_sets.rpl, null)
      }
    ]
  ])
}

resource "iosxr_extcommunity_opaque_set" "extcommunity_opaque_set" {
  for_each = { for extcommunity_opaque_set in local.extcommunity_opaque_sets : extcommunity_opaque_set.key => extcommunity_opaque_set }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

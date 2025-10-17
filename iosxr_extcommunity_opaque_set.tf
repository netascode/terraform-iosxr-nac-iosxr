locals {
  device_extcommunity_opaque_sets = flatten([
    for device in local.devices : [
      for extcommunity_opaque_set in try(local.device_config[device.name].extcommunity_opaque_set, []) : {
        device_name = device.name
        set_name    = try(extcommunity_opaque_set.set_name, local.defaults.iosxr.configuration.extcommunity_opaque_set.set_name, null)
        key         = "${device.name}-extcommunity-opaque-set-${extcommunity_opaque_set.set_name}"
        rpl         = try(extcommunity_opaque_set.rpl, local.defaults.iosxr.configuration.extcommunity_opaque_set.rpl, null)
      }
    ]
    if try(local.device_config[device.name].extcommunity_opaque_set, null) != null || try(local.defaults.iosxr.configuration.extcommunity_opaque_set, null) != null
  ])
}

resource "iosxr_extcommunity_opaque_set" "extcommunity_opaque_set" {
  for_each = { for extcommunity_opaque_set in local.device_extcommunity_opaque_sets : extcommunity_opaque_set.key => extcommunity_opaque_set }

  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

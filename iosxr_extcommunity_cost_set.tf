locals {
  device_extcommunity_cost_sets = flatten([
    for device in local.devices : [
      for extcommunity_cost_set in try(local.device_config[device.name].extcommunity_cost_set, []) : {
        device_name = device.name
        set_name    = try(extcommunity_cost_set.set_name, local.defaults.iosxr.configuration.extcommunity_cost_set.set_name, null)
        key         = "${device.name}-extcommunity-cost-set-${extcommunity_cost_set.set_name}"
        rpl         = try(extcommunity_cost_set.rpl, local.defaults.iosxr.configuration.extcommunity_cost_set.rpl, null)
      }
    ]
    if try(local.device_config[device.name].extcommunity_cost_set, null) != null || try(local.defaults.iosxr.configuration.extcommunity_cost_set, null) != null
  ])
}

resource "iosxr_extcommunity_cost_set" "extcommunity_cost_set" {
  for_each = { for extcommunity_cost_set in local.device_extcommunity_cost_sets : extcommunity_cost_set.key => extcommunity_cost_set }

  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

locals {
  rd_sets = flatten([
    for device in local.devices : [
      for rd_set in try(local.device_config[device.name].rd_sets, []) : {
        key         = "${device.name}-${rd_set.set_name}"
        device_name = device.name
        set_name    = try(rd_set.set_name, local.defaults.iosxr.configuration.rd_sets.set_name, null)
        rpl         = try(rd_set.rpl, local.defaults.iosxr.configuration.rd_sets.rpl, null)
      }
    ]
  ])
}

resource "iosxr_rd_set" "rd_set" {
  for_each = { for rd_set in local.rd_sets : rd_set.key => rd_set }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

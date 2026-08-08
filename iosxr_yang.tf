locals {
  yang = flatten([
    for device in local.devices : [
      for yang_name, yang in try(local.device_config[device.name].yang, {}) : {
        key         = format("%s/%s", device.name, yang_name)
        device_name = device.name
        path        = try(yang.path, null)
        attributes  = try(yang.attributes, null)
        # lists       = try(length(yang.lists) == 0, true) ? null : [for list in yang.lists : {
        #   name   = try(list.name, null)
        #   key    = try(list.key, null)
        #   items  = try(list.items, null)
        #   values = try(list.values, null)
        #   }
        # ]
      }
    ]
  ])
}

resource "iosxr_yang" "yang" {
  for_each   = { for yang in local.yang : yang.key => yang }
  device     = each.value.device_name
  path       = each.value.path
  attributes = each.value.attributes
  # lists      = each.value.lists
}
# revisit lists

locals {
  gnmi = flatten([
    for device in local.devices : [
      for gnmi_name, gnmi in try(local.device_config[device.name].gnmi, {}) : {
        key         = "${device.name}-${gnmi_name}"
        device_name = device.name
        path        = try(gnmi.path, null)
        attributes  = try(gnmi.attributes, null)
        # lists       = try(length(gnmi.lists) == 0, true) ? null : [for list in gnmi.lists : {
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

resource "iosxr_gnmi" "gnmi" {
  for_each   = { for gnmi in local.gnmi : gnmi.key => gnmi }
  device     = each.value.device_name
  path       = each.value.path
  attributes = each.value.attributes
  # lists      = each.value.lists
}
# revisit lists

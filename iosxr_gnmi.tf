locals {
  device_gnmi = flatten([
    for device in local.devices : [
      for gnmi_name, gnmi in try(local.device_config[device.name].gnmi, {}) : {
        device_name = device.name
        gnmi_name   = gnmi_name
        key         = "${device.name}-${gnmi_name}"
        path        = try(gnmi.path, local.defaults.iosxr.configuration.gnmi_path, null)
        attributes  = try(gnmi.attributes, local.defaults.iosxr.configuration.gnmi_attributes, null)
        lists = try(gnmi.lists, null) == null ? null : [for list in gnmi.lists : {
          name   = try(list.name, local.defaults.iosxr.configuration.gnmi_lists_name, null)
          key    = try(list.key, local.defaults.iosxr.configuration.gnmi_lists_key, null)
          items  = try(list.items, local.defaults.iosxr.configuration.gnmi_lists_items, null)
          values = try(list.values, local.defaults.iosxr.configuration.gnmi_lists_values, null)
        }]
      }
    ]
    if try(local.device_config[device.name].gnmi, null) != null || try(local.defaults.iosxr.configuration.gnmi, null) != null
  ])
}

resource "iosxr_gnmi" "gnmi" {
  for_each = { for gnmi in local.device_gnmi : gnmi.key => gnmi }

  # Required attribute
  path = each.value.path

  # Optional attributes
  attributes = each.value.attributes
  lists      = each.value.lists
}
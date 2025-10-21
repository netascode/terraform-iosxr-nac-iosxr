locals {
  logging_source_interfaces = flatten([
    for device in local.devices : [
      for logging_source_interface in try(local.device_config[device.name].logging_source_interface, []) : {
        key         = "${device.name}-${logging_source_interface.name}"
        device_name = device.name
        name        = try(logging_source_interface.name, local.defaults.iosxr.configuration.logging_source_interface.name, null)
        vrfs = try(length(logging_source_interface.vrfs) == 0, true) ? null : [for vrf in logging_source_interface.vrfs : {
          name = try(vrf.name, local.defaults.iosxr.configuration.logging_source_interface_vrfs.name, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_logging_source_interface" "logging_source_interface" {
  for_each = { for lsi in local.logging_source_interfaces : lsi.key => lsi }
  device   = each.value.device_name
  name     = each.value.name
  vrfs     = each.value.vrfs
}

locals {
  device_radius_source_interface = flatten([
    for device in local.devices : [
      for radius_source_interface in try(local.device_config[device.name].radius_source_interface, []) : {
        device_name      = device.name
        key              = "${device.name}-${radius_source_interface.vrf}"
        vrf              = radius_source_interface.vrf
        source_interface = try(radius_source_interface.source_interface, local.defaults.iosxr.configuration.radius_source_interface.source_interface, null)
      }
    ]
    if try(local.device_config[device.name].radius_source_interface, null) != null
  ])
}

resource "iosxr_radius_source_interface" "radius_source_interface" {
  for_each = { for item in local.device_radius_source_interface : item.key => item }

  device           = each.value.device_name
  vrf              = each.value.vrf
  source_interface = each.value.source_interface
}

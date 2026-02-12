locals {
  radius_source_interfaces = flatten([
    for device in local.devices : [
      for radius_source_interface in try(local.device_config[device.name].radius_source_interface, []) : {
        key              = format("%s/%s", device.name, radius_source_interface.vrf)
        device_name      = device.name
        vrf              = radius_source_interface.vrf
        source_interface = try(radius_source_interface.interface, local.defaults.iosxr.devices.configuration.radius_source_interface.interface, null)
      }
    ]
  ])
}

resource "iosxr_radius_source_interface" "radius_source_interface" {
  for_each         = { for radius_source_interface in local.radius_source_interfaces : radius_source_interface.key => radius_source_interface }
  device           = each.value.device_name
  vrf              = each.value.vrf
  source_interface = each.value.source_interface
}

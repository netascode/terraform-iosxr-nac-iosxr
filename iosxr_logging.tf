resource "iosxr_logging" "logging" {
  for_each                = { for device in local.devices : device.name => device if try(local.device_config[device.name].logging, null) != null || try(local.defaults.iosxr.devices.configuration.logging, null) != null }
  device                  = each.value.name
  ipv4_dscp               = try(local.device_config[each.value.name].logging.ipv4_dscp, local.defaults.iosxr.devices.configuration.logging.ipv4_dscp, null)
  trap                    = try(local.device_config[each.value.name].logging.trap, local.defaults.iosxr.devices.configuration.logging.trap, null)
  events_display_location = try(local.device_config[each.value.name].logging.events_display_location, local.defaults.iosxr.devices.configuration.logging.events_display_location, null)
  events_level            = try(local.device_config[each.value.name].logging.events_level, local.defaults.iosxr.devices.configuration.logging.events_level, null)
  console                 = try(local.device_config[each.value.name].logging.console, local.defaults.iosxr.devices.configuration.logging.console, null)
  monitor                 = try(local.device_config[each.value.name].logging.monitor, local.defaults.iosxr.devices.configuration.logging.monitor, null)
  buffered_size           = try(local.device_config[each.value.name].logging.buffered_size, local.defaults.iosxr.devices.configuration.logging.buffered_size, null)
  buffered_level          = try(local.device_config[each.value.name].logging.buffered_level, local.defaults.iosxr.devices.configuration.logging.buffered_level, null)
  facility_level          = try(local.device_config[each.value.name].logging.facility_level, local.defaults.iosxr.devices.configuration.logging.facility_level, null)
  hostnameprefix          = try(local.device_config[each.value.name].logging.hostnameprefix, local.defaults.iosxr.devices.configuration.logging.hostnameprefix, null)
  suppress_duplicates     = try(local.device_config[each.value.name].logging.suppress_duplicates, local.defaults.iosxr.devices.configuration.logging.suppress_duplicates, null)
  source_interfaces = try(length(local.device_config[each.value.name].logging.source_interfaces) == 0, true) ? null : [for source_interface in local.device_config[each.value.name].logging.source_interfaces : {
    name = try(source_interface.name, local.defaults.iosxr.devices.configuration.logging.source_interfaces.name, null)
    vrfs = try(length(source_interface.vrfs) == 0, true) ? null : [for vrf in source_interface.vrfs : {
      name = try(vrf.name, local.defaults.iosxr.devices.configuration.logging.source_interfaces.vrfs.name, null)
    }]
  }]
}

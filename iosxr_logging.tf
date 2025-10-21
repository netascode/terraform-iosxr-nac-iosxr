resource "iosxr_logging" "logging" {
  for_each                     = { for device in local.devices : device.name => device if try(local.device_config[device.name].logging, null) != null || try(local.defaults.iosxr.configuration.logging, null) != null }
  device                       = each.value.name
  ipv4_dscp                    = try(local.device_config[each.value.name].logging.ipv4_dscp, local.defaults.iosxr.configuration.logging.ipv4_dscp, null)
  trap                         = try(local.device_config[each.value.name].logging.trap, local.defaults.iosxr.configuration.logging.trap, null)
  events_display_location      = try(local.device_config[each.value.name].logging.events_display_location, local.defaults.iosxr.configuration.logging.events_display_location, null)
  events_level                 = try(local.device_config[each.value.name].logging.events_level, local.defaults.iosxr.configuration.logging.events_level, null)
  console                      = try(local.device_config[each.value.name].logging.console, local.defaults.iosxr.configuration.logging.console, null)
  monitor                      = try(local.device_config[each.value.name].logging.monitor, local.defaults.iosxr.configuration.logging.monitor, null)
  buffered_logging_buffer_size = try(local.device_config[each.value.name].logging.buffered_logging_buffer_size, local.defaults.iosxr.configuration.logging.buffered_logging_buffer_size, null)
  buffered_level               = try(local.device_config[each.value.name].logging.buffered_level, local.defaults.iosxr.configuration.logging.buffered_level, null)
  facility_level               = try(local.device_config[each.value.name].logging.facility_level, local.defaults.iosxr.configuration.logging.facility_level, null)
  hostnameprefix               = try(local.device_config[each.value.name].logging.hostnameprefix, local.defaults.iosxr.configuration.logging.hostnameprefix, null)
  suppress_duplicates          = try(local.device_config[each.value.name].logging.suppress_duplicates, local.defaults.iosxr.configuration.logging.suppress_duplicates, null)
}

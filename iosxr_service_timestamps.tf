resource "iosxr_service_timestamps" "service_timestamps" {
  for_each                     = { for device in local.devices : device.name => device if try(local.device_config[device.name].service_timestamps, null) != null || try(local.defaults.iosxr.configuration.service_timestamps, null) != null }
  device                       = each.value.name
  debug_datetime_localtime     = try(local.device_config[each.value.name].service_timestamps.debug_datetime_localtime, local.defaults.iosxr.configuration.service_timestamps.debug_datetime_localtime, null)
  debug_datetime_msec          = try(local.device_config[each.value.name].service_timestamps.debug_datetime_msec, local.defaults.iosxr.configuration.service_timestamps.debug_datetime_msec, null)
  debug_datetime_show_timezone = try(local.device_config[each.value.name].service_timestamps.debug_datetime_show_timezone, local.defaults.iosxr.configuration.service_timestamps.debug_datetime_show_timezone, null)
  debug_datetime_year          = try(local.device_config[each.value.name].service_timestamps.debug_datetime_year, local.defaults.iosxr.configuration.service_timestamps.debug_datetime_year, null)
  debug_uptime                 = try(local.device_config[each.value.name].service_timestamps.debug_uptime, local.defaults.iosxr.configuration.service_timestamps.debug_uptime, null)
  debug_disable                = try(local.device_config[each.value.name].service_timestamps.debug_disable, local.defaults.iosxr.configuration.service_timestamps.debug_disable, null)
  log_datetime_localtime       = try(local.device_config[each.value.name].service_timestamps.log_datetime_localtime, local.defaults.iosxr.configuration.service_timestamps.log_datetime_localtime, null)
  log_datetime_msec            = try(local.device_config[each.value.name].service_timestamps.log_datetime_msec, local.defaults.iosxr.configuration.service_timestamps.log_datetime_msec, null)
  log_datetime_show_timezone   = try(local.device_config[each.value.name].service_timestamps.log_datetime_show_timezone, local.defaults.iosxr.configuration.service_timestamps.log_datetime_show_timezone, null)
  log_datetime_year            = try(local.device_config[each.value.name].service_timestamps.log_datetime_year, local.defaults.iosxr.configuration.service_timestamps.log_datetime_year, null)
  log_uptime                   = try(local.device_config[each.value.name].service_timestamps.log_uptime, local.defaults.iosxr.configuration.service_timestamps.log_uptime, null)
  log_disable                  = try(local.device_config[each.value.name].service_timestamps.log_disable, local.defaults.iosxr.configuration.service_timestamps.log_disable, null)
}

resource "iosxr_logging" "logging" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].logging, null) != null || try(local.defaults.iosxr.devices.configuration.logging, null) != null }
  device   = each.value.name

  # Console / trap / monitor
  console          = try(local.device_config[each.value.name].logging.console, local.defaults.iosxr.devices.configuration.logging.console, null)
  console_facility = try(local.device_config[each.value.name].logging.console_facility, local.defaults.iosxr.devices.configuration.logging.console_facility, null)
  trap             = try(local.device_config[each.value.name].logging.trap, local.defaults.iosxr.devices.configuration.logging.trap, null)
  monitor          = try(local.device_config[each.value.name].logging.monitor, local.defaults.iosxr.devices.configuration.logging.monitor, null)

  # Monitor discriminators
  monitor_discriminator_match1   = try(local.device_config[each.value.name].logging.monitor_discriminator_match1, local.defaults.iosxr.devices.configuration.logging.monitor_discriminator_match1, null)
  monitor_discriminator_match2   = try(local.device_config[each.value.name].logging.monitor_discriminator_match2, local.defaults.iosxr.devices.configuration.logging.monitor_discriminator_match2, null)
  monitor_discriminator_match3   = try(local.device_config[each.value.name].logging.monitor_discriminator_match3, local.defaults.iosxr.devices.configuration.logging.monitor_discriminator_match3, null)
  monitor_discriminator_nomatch1 = try(local.device_config[each.value.name].logging.monitor_discriminator_nomatch1, local.defaults.iosxr.devices.configuration.logging.monitor_discriminator_nomatch1, null)
  monitor_discriminator_nomatch2 = try(local.device_config[each.value.name].logging.monitor_discriminator_nomatch2, local.defaults.iosxr.devices.configuration.logging.monitor_discriminator_nomatch2, null)
  monitor_discriminator_nomatch3 = try(local.device_config[each.value.name].logging.monitor_discriminator_nomatch3, local.defaults.iosxr.devices.configuration.logging.monitor_discriminator_nomatch3, null)

  # Archive
  archive_disk0            = try(local.device_config[each.value.name].logging.archive_disk0, local.defaults.iosxr.devices.configuration.logging.archive_disk0, null)
  archive_disk1            = try(local.device_config[each.value.name].logging.archive_disk1, local.defaults.iosxr.devices.configuration.logging.archive_disk1, null)
  archive_harddisk         = try(local.device_config[each.value.name].logging.archive_harddisk, local.defaults.iosxr.devices.configuration.logging.archive_harddisk, null)
  archive_frequency_daily  = try(local.device_config[each.value.name].logging.archive_frequency_daily, local.defaults.iosxr.devices.configuration.logging.archive_frequency_daily, null)
  archive_frequency_weekly = try(local.device_config[each.value.name].logging.archive_frequency_weekly, local.defaults.iosxr.devices.configuration.logging.archive_frequency_weekly, null)
  archive_filesize         = try(local.device_config[each.value.name].logging.archive_filesize, local.defaults.iosxr.devices.configuration.logging.archive_filesize, null)
  archive_size             = try(local.device_config[each.value.name].logging.archive_size, local.defaults.iosxr.devices.configuration.logging.archive_size, null)
  archive_length           = try(local.device_config[each.value.name].logging.archive_length, local.defaults.iosxr.devices.configuration.logging.archive_length, null)
  archive_severity         = try(local.device_config[each.value.name].logging.archive_severity, local.defaults.iosxr.devices.configuration.logging.archive_severity, null)
  archive_threshold        = try(local.device_config[each.value.name].logging.archive_threshold, local.defaults.iosxr.devices.configuration.logging.archive_threshold, null)

  # IP DSCP / precedence
  ipv4_dscp       = try(local.device_config[each.value.name].logging.ipv4_dscp, local.defaults.iosxr.devices.configuration.logging.ipv4_dscp, null)
  ipv4_precedence = try(local.device_config[each.value.name].logging.ipv4_precedence, local.defaults.iosxr.devices.configuration.logging.ipv4_precedence, null)
  ipv6_dscp       = try(local.device_config[each.value.name].logging.ipv6_dscp, local.defaults.iosxr.devices.configuration.logging.ipv6_dscp, null)
  ipv6_precedence = try(local.device_config[each.value.name].logging.ipv6_precedence, local.defaults.iosxr.devices.configuration.logging.ipv6_precedence, null)

  # Facility
  facility_level = try(local.device_config[each.value.name].logging.facility_level, local.defaults.iosxr.devices.configuration.logging.facility_level, null)

  # Buffered
  buffered_entries_count          = try(local.device_config[each.value.name].logging.buffered_entries_count, local.defaults.iosxr.devices.configuration.logging.buffered_entries_count, null)
  buffered_size                   = try(local.device_config[each.value.name].logging.buffered_size, local.defaults.iosxr.devices.configuration.logging.buffered_size, null)
  buffered_level                  = try(local.device_config[each.value.name].logging.buffered_level, local.defaults.iosxr.devices.configuration.logging.buffered_level, null)
  buffered_discriminator_match1   = try(local.device_config[each.value.name].logging.buffered_discriminator_match1, local.defaults.iosxr.devices.configuration.logging.buffered_discriminator_match1, null)
  buffered_discriminator_match2   = try(local.device_config[each.value.name].logging.buffered_discriminator_match2, local.defaults.iosxr.devices.configuration.logging.buffered_discriminator_match2, null)
  buffered_discriminator_match3   = try(local.device_config[each.value.name].logging.buffered_discriminator_match3, local.defaults.iosxr.devices.configuration.logging.buffered_discriminator_match3, null)
  buffered_discriminator_nomatch1 = try(local.device_config[each.value.name].logging.buffered_discriminator_nomatch1, local.defaults.iosxr.devices.configuration.logging.buffered_discriminator_nomatch1, null)
  buffered_discriminator_nomatch2 = try(local.device_config[each.value.name].logging.buffered_discriminator_nomatch2, local.defaults.iosxr.devices.configuration.logging.buffered_discriminator_nomatch2, null)
  buffered_discriminator_nomatch3 = try(local.device_config[each.value.name].logging.buffered_discriminator_nomatch3, local.defaults.iosxr.devices.configuration.logging.buffered_discriminator_nomatch3, null)

  # Container
  container_all             = try(local.device_config[each.value.name].logging.container_all, local.defaults.iosxr.devices.configuration.logging.container_all, null)
  container_fetch_timestamp = try(local.device_config[each.value.name].logging.container_fetch_timestamp, local.defaults.iosxr.devices.configuration.logging.container_fetch_timestamp, null)

  # File list
  file = try(length(local.device_config[each.value.name].logging.file) == 0, true) ? null : [
    for f in try(local.device_config[each.value.name].logging.file, []) : {
      file_name                                      = try(f.file_name, null)
      path                                           = try(f.path, null)
      maxfilesize                                    = try(f.maxfilesize, null)
      severity                                       = try(f.severity, null)
      local_accounting_send_to_remote_facility_level = try(f.local_accounting_send_to_remote_facility_level, null)
      discriminator_match1                           = try(f.discriminator_match1, null)
      discriminator_match2                           = try(f.discriminator_match2, null)
      discriminator_match3                           = try(f.discriminator_match3, null)
      discriminator_nomatch1                         = try(f.discriminator_nomatch1, null)
      discriminator_nomatch2                         = try(f.discriminator_nomatch2, null)
      discriminator_nomatch3                         = try(f.discriminator_nomatch3, null)
    }
  ]

  # History
  history      = try(local.device_config[each.value.name].logging.history, local.defaults.iosxr.devices.configuration.logging.history, null)
  history_size = try(local.device_config[each.value.name].logging.history_size, local.defaults.iosxr.devices.configuration.logging.history_size, null)

  hostnameprefix = try(local.device_config[each.value.name].logging.hostnameprefix, local.defaults.iosxr.devices.configuration.logging.hostnameprefix, null)
  localfilesize  = try(local.device_config[each.value.name].logging.localfilesize, local.defaults.iosxr.devices.configuration.logging.localfilesize, null)

  # Source interfaces
  source_interfaces = try(length(local.device_config[each.value.name].logging.source_interfaces) == 0, true) ? null : [
    for si in try(local.device_config[each.value.name].logging.source_interfaces, []) : {
      name = try(si.name, null)
      vrfs = try(length(si.vrfs) == 0, true) ? null : [
        for vrf in try(si.vrfs, []) : {
          name = try(vrf.name, null)
        }
      ]
    }
  ]

  suppress_duplicates = try(local.device_config[each.value.name].logging.suppress_duplicates, local.defaults.iosxr.devices.configuration.logging.suppress_duplicates, null)
  format_bsd          = try(local.device_config[each.value.name].logging.format_bsd, local.defaults.iosxr.devices.configuration.logging.format_bsd, null)
  format_rfc5424      = try(local.device_config[each.value.name].logging.format_rfc5424, local.defaults.iosxr.devices.configuration.logging.format_rfc5424, null)
  yang                = try(local.device_config[each.value.name].logging.yang, local.defaults.iosxr.devices.configuration.logging.yang, null)

  # Suppress rules
  suppress_rules = try(length(local.device_config[each.value.name].logging.suppress_rules) == 0, true) ? null : [
    for rule in try(local.device_config[each.value.name].logging.suppress_rules, []) : {
      rule_name           = try(rule.rule_name, null)
      all_alarms          = try(rule.all_alarms, null)
      apply_all_of_router = try(rule.apply_all_of_router, null)
      alarms = try(length(rule.alarms) == 0, true) ? null : [
        for alarm in try(rule.alarms, []) : {
          message_category = try(alarm.message_category, null)
          group_name       = try(alarm.group_name, null)
          message_code     = try(alarm.message_code, null)
        }
      ]
      apply_source_locations = try(length(rule.apply_source_locations) == 0, true) ? null : [
        for loc in try(rule.apply_source_locations, []) : {
          location_name = try(loc.location_name, null)
        }
      ]
    }
  ]

  # Events
  events_buffer_size                = try(local.device_config[each.value.name].logging.events_buffer_size, local.defaults.iosxr.devices.configuration.logging.events_buffer_size, null)
  events_display_location           = try(local.device_config[each.value.name].logging.events_display_location, local.defaults.iosxr.devices.configuration.logging.events_display_location, null)
  events_level                      = try(local.device_config[each.value.name].logging.events_level, local.defaults.iosxr.devices.configuration.logging.events_level, null)
  events_precfg_suppression         = try(local.device_config[each.value.name].logging.events_precfg_suppression, local.defaults.iosxr.devices.configuration.logging.events_precfg_suppression, null)
  events_precfg_suppression_timeout = try(local.device_config[each.value.name].logging.events_precfg_suppression_timeout, local.defaults.iosxr.devices.configuration.logging.events_precfg_suppression_timeout, null)
  events_threshold                  = try(local.device_config[each.value.name].logging.events_threshold, local.defaults.iosxr.devices.configuration.logging.events_threshold, null)

  # Filter matches
  filter_matches = try(length(local.device_config[each.value.name].logging.filter_matches) == 0, true) ? null : [
    for fm in try(local.device_config[each.value.name].logging.filter_matches, []) : {
      match = try(fm.match, null)
    }
  ]
}

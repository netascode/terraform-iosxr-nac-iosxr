resource "iosxr_logging" "logging" {
  for_each                          = { for device in local.devices : device.name => device if try(local.device_config[device.name].logging, null) != null || try(local.defaults.iosxr.devices.configuration.logging, null) != null }
  device                            = each.value.name
  archive_disk0                     = try(local.device_config[each.value.name].logging.archive.device, local.defaults.iosxr.devices.configuration.logging.archive.device, null) == "disk0" ? true : null
  archive_disk1                     = try(local.device_config[each.value.name].logging.archive.device, local.defaults.iosxr.devices.configuration.logging.archive.device, null) == "disk1" ? true : null
  archive_harddisk                  = try(local.device_config[each.value.name].logging.archive.device, local.defaults.iosxr.devices.configuration.logging.archive.device, null) == "harddisk" ? true : null
  archive_filesize                  = try(local.device_config[each.value.name].logging.archive.filesize, local.defaults.iosxr.devices.configuration.logging.archive.filesize, null)
  archive_frequency_daily           = try(local.device_config[each.value.name].logging.archive.frequency, local.defaults.iosxr.devices.configuration.logging.archive.frequency, null) == "daily" ? true : null
  archive_frequency_weekly          = try(local.device_config[each.value.name].logging.archive.frequency, local.defaults.iosxr.devices.configuration.logging.archive.frequency, null) == "weekly" ? true : null
  archive_length                    = try(local.device_config[each.value.name].logging.archive.length, local.defaults.iosxr.devices.configuration.logging.archive.length, null)
  archive_severity                  = try(local.device_config[each.value.name].logging.archive.severity, local.defaults.iosxr.devices.configuration.logging.archive.severity, null)
  archive_size                      = try(local.device_config[each.value.name].logging.archive.size, local.defaults.iosxr.devices.configuration.logging.archive.size, null)
  archive_threshold                 = try(local.device_config[each.value.name].logging.archive.threshold, local.defaults.iosxr.devices.configuration.logging.archive.threshold, null)
  buffered_size                     = try(local.device_config[each.value.name].logging.buffered.size, local.defaults.iosxr.devices.configuration.logging.buffered.size, null)
  buffered_entries_count            = try(local.device_config[each.value.name].logging.buffered.entries_count, local.defaults.iosxr.devices.configuration.logging.buffered.entries_count, null)
  buffered_level                    = try(local.device_config[each.value.name].logging.buffered.level, local.defaults.iosxr.devices.configuration.logging.buffered.level, null)
  buffered_discriminator_match1     = try(local.device_config[each.value.name].logging.buffered.discriminator_match1, local.defaults.iosxr.devices.configuration.logging.buffered.discriminator_match1, null)
  buffered_discriminator_match2     = try(local.device_config[each.value.name].logging.buffered.discriminator_match2, local.defaults.iosxr.devices.configuration.logging.buffered.discriminator_match2, null)
  buffered_discriminator_match3     = try(local.device_config[each.value.name].logging.buffered.discriminator_match3, local.defaults.iosxr.devices.configuration.logging.buffered.discriminator_match3, null)
  buffered_discriminator_nomatch1   = try(local.device_config[each.value.name].logging.buffered.discriminator_nomatch1, local.defaults.iosxr.devices.configuration.logging.buffered.discriminator_nomatch1, null)
  buffered_discriminator_nomatch2   = try(local.device_config[each.value.name].logging.buffered.discriminator_nomatch2, local.defaults.iosxr.devices.configuration.logging.buffered.discriminator_nomatch2, null)
  buffered_discriminator_nomatch3   = try(local.device_config[each.value.name].logging.buffered.discriminator_nomatch3, local.defaults.iosxr.devices.configuration.logging.buffered.discriminator_nomatch3, null)
  console                           = try(local.device_config[each.value.name].logging.console, local.defaults.iosxr.devices.configuration.logging.console, null)
  console_facility                  = try(local.device_config[each.value.name].logging.console_facility, local.defaults.iosxr.devices.configuration.logging.console_facility, null)
  container_all                     = try(local.device_config[each.value.name].logging.container_all, local.defaults.iosxr.devices.configuration.logging.container_all, null)
  container_fetch_timestamp         = try(local.device_config[each.value.name].logging.container_fetch_timestamp, local.defaults.iosxr.devices.configuration.logging.container_fetch_timestamp, null)
  events_buffer_size                = try(local.device_config[each.value.name].logging.events.buffer_size, local.defaults.iosxr.devices.configuration.logging.events.buffer_size, null)
  events_display_location           = try(local.device_config[each.value.name].logging.events.display_location, local.defaults.iosxr.devices.configuration.logging.events.display_location, null)
  events_level                      = try(local.device_config[each.value.name].logging.events.level, local.defaults.iosxr.devices.configuration.logging.events.level, null)
  events_precfg_suppression         = try(local.device_config[each.value.name].logging.events.precfg_suppression, local.defaults.iosxr.devices.configuration.logging.events.precfg_suppression, null)
  events_precfg_suppression_timeout = try(local.device_config[each.value.name].logging.events.precfg_suppression_timeout, local.defaults.iosxr.devices.configuration.logging.events.precfg_suppression_timeout, null)
  events_threshold                  = try(local.device_config[each.value.name].logging.events.threshold, local.defaults.iosxr.devices.configuration.logging.events.threshold, null)
  facility_level                    = try(local.device_config[each.value.name].logging.facility_level, local.defaults.iosxr.devices.configuration.logging.facility_level, null)
  format_bsd                        = try(local.device_config[each.value.name].logging.format, local.defaults.iosxr.devices.configuration.logging.format, null) == "bsd" ? true : null
  format_rfc5424                    = try(local.device_config[each.value.name].logging.format, local.defaults.iosxr.devices.configuration.logging.format, null) == "rfc5424" ? true : null
  history                           = try(local.device_config[each.value.name].logging.history, local.defaults.iosxr.devices.configuration.logging.history, null)
  history_size                      = try(local.device_config[each.value.name].logging.history_size, local.defaults.iosxr.devices.configuration.logging.history_size, null)
  hostnameprefix                    = try(local.device_config[each.value.name].logging.hostnameprefix, local.defaults.iosxr.devices.configuration.logging.hostnameprefix, null)
  ipv4_dscp = try(lookup(local.dscp_map,
    tostring(try(local.device_config[each.value.name].logging.ipv4_dscp, local.defaults.iosxr.devices.configuration.logging.ipv4_dscp)),
    tostring(try(local.device_config[each.value.name].logging.ipv4_dscp, local.defaults.iosxr.devices.configuration.logging.ipv4_dscp))
    ), null
  )
  ipv4_precedence = try(lookup(local.precedence_map,
    tostring(try(local.device_config[each.value.name].logging.ipv4_precedence, local.defaults.iosxr.devices.configuration.logging.ipv4_precedence)),
    tostring(try(local.device_config[each.value.name].logging.ipv4_precedence, local.defaults.iosxr.devices.configuration.logging.ipv4_precedence))
    ), null
  )
  ipv6_dscp = try(lookup(local.dscp_map,
    tostring(try(local.device_config[each.value.name].logging.ipv6_dscp, local.defaults.iosxr.devices.configuration.logging.ipv6_dscp)),
    tostring(try(local.device_config[each.value.name].logging.ipv6_dscp, local.defaults.iosxr.devices.configuration.logging.ipv6_dscp))
    ), null
  )
  ipv6_precedence = try(lookup(local.precedence_map,
    tostring(try(local.device_config[each.value.name].logging.ipv6_precedence, local.defaults.iosxr.devices.configuration.logging.ipv6_precedence)),
    tostring(try(local.device_config[each.value.name].logging.ipv6_precedence, local.defaults.iosxr.devices.configuration.logging.ipv6_precedence))
    ), null
  )
  localfilesize                  = try(local.device_config[each.value.name].logging.localfilesize, local.defaults.iosxr.devices.configuration.logging.localfilesize, null)
  monitor                        = try(local.device_config[each.value.name].logging.monitor.level, local.defaults.iosxr.devices.configuration.logging.monitor.level, null)
  monitor_discriminator_match1   = try(local.device_config[each.value.name].logging.monitor.discriminator_match1, local.defaults.iosxr.devices.configuration.logging.monitor.discriminator_match1, null)
  monitor_discriminator_match2   = try(local.device_config[each.value.name].logging.monitor.discriminator_match2, local.defaults.iosxr.devices.configuration.logging.monitor.discriminator_match2, null)
  monitor_discriminator_match3   = try(local.device_config[each.value.name].logging.monitor.discriminator_match3, local.defaults.iosxr.devices.configuration.logging.monitor.discriminator_match3, null)
  monitor_discriminator_nomatch1 = try(local.device_config[each.value.name].logging.monitor.discriminator_nomatch1, local.defaults.iosxr.devices.configuration.logging.monitor.discriminator_nomatch1, null)
  monitor_discriminator_nomatch2 = try(local.device_config[each.value.name].logging.monitor.discriminator_nomatch2, local.defaults.iosxr.devices.configuration.logging.monitor.discriminator_nomatch2, null)
  monitor_discriminator_nomatch3 = try(local.device_config[each.value.name].logging.monitor.discriminator_nomatch3, local.defaults.iosxr.devices.configuration.logging.monitor.discriminator_nomatch3, null)
  suppress_duplicates            = try(local.device_config[each.value.name].logging.suppress_duplicates, local.defaults.iosxr.devices.configuration.logging.suppress_duplicates, null)
  trap                           = try(local.device_config[each.value.name].logging.trap, local.defaults.iosxr.devices.configuration.logging.trap, null)
  yang                           = try(local.device_config[each.value.name].logging.yang, local.defaults.iosxr.devices.configuration.logging.yang, null)
  file = try(length(local.device_config[each.value.name].logging.files) == 0, true) ? null : [
    for file in local.device_config[each.value.name].logging.files : {
      file_name                                      = try(file.name, local.defaults.iosxr.devices.configuration.logging.files.name, null)
      path                                           = try(file.path, local.defaults.iosxr.devices.configuration.logging.files.path, null)
      maxfilesize                                    = try(file.maxfilesize, local.defaults.iosxr.devices.configuration.logging.files.maxfilesize, null)
      severity                                       = try(file.severity, local.defaults.iosxr.devices.configuration.logging.files.severity, null)
      local_accounting_send_to_remote_facility_level = try(file.accounting_remote_facility, local.defaults.iosxr.devices.configuration.logging.files.accounting_remote_facility, null)
      discriminator_match1                           = try(file.discriminator_match1, local.defaults.iosxr.devices.configuration.logging.files.discriminator_match1, null)
      discriminator_match2                           = try(file.discriminator_match2, local.defaults.iosxr.devices.configuration.logging.files.discriminator_match2, null)
      discriminator_match3                           = try(file.discriminator_match3, local.defaults.iosxr.devices.configuration.logging.files.discriminator_match3, null)
      discriminator_nomatch1                         = try(file.discriminator_nomatch1, local.defaults.iosxr.devices.configuration.logging.files.discriminator_nomatch1, null)
      discriminator_nomatch2                         = try(file.discriminator_nomatch2, local.defaults.iosxr.devices.configuration.logging.files.discriminator_nomatch2, null)
      discriminator_nomatch3                         = try(file.discriminator_nomatch3, local.defaults.iosxr.devices.configuration.logging.files.discriminator_nomatch3, null)
    }
  ]
  filter_matches = try(length(local.device_config[each.value.name].logging.events.filter_matches) == 0, true) ? null : [
    for filter_match in local.device_config[each.value.name].logging.events.filter_matches : {
      match = try(filter_match.match, local.defaults.iosxr.devices.configuration.logging.events.filter_matches.match, null)
    }
  ]
  source_interfaces = try(length(local.device_config[each.value.name].logging.source_interfaces) == 0, true) ? null : [
    for iface_name, entries in { for si in local.device_config[each.value.name].logging.source_interfaces : try(si.name, local.defaults.iosxr.devices.configuration.logging.source_interfaces.name) => si... } : {
      name = iface_name
      vrfs = [for e in entries : { name = try(e.vrf, local.defaults.iosxr.devices.configuration.logging.source_interfaces.vrf) }]
    }
  ]
  suppress_rules = try(length(local.device_config[each.value.name].logging.suppress_rules) == 0, true) ? null : [
    for suppress_rule in local.device_config[each.value.name].logging.suppress_rules : {
      rule_name           = try(suppress_rule.name, local.defaults.iosxr.devices.configuration.logging.suppress_rules.name, null)
      all_alarms          = try(suppress_rule.all_alarms, local.defaults.iosxr.devices.configuration.logging.suppress_rules.all_alarms, null)
      apply_all_of_router = try(suppress_rule.apply_to.all_of_router, local.defaults.iosxr.devices.configuration.logging.suppress_rules.apply_to.all_of_router, null)
      alarms = try(length(suppress_rule.alarms) == 0, true) ? null : [
        for alarm in suppress_rule.alarms : {
          message_category = try(alarm.category, local.defaults.iosxr.devices.configuration.logging.suppress_rules.alarms.category, null)
          group_name       = try(alarm.group, local.defaults.iosxr.devices.configuration.logging.suppress_rules.alarms.group, null)
          message_code     = try(alarm.code, local.defaults.iosxr.devices.configuration.logging.suppress_rules.alarms.code, null)
        }
      ]
      apply_source_locations = try(length(suppress_rule.apply_to.source_locations) == 0, true) ? null : [
        for location in suppress_rule.apply_to.source_locations : {
          location_name = try(location.name, local.defaults.iosxr.devices.configuration.logging.suppress_rules.apply_to.source_locations.name, null)
        }
      ]
    }
  ]
}

##### LOGGING VRF #####

locals {
  logging_vrfs = flatten([
    for device in local.devices : [
      for vrf_name in distinct([
        for h in try(local.device_config[device.name].logging.hosts, []) : try(h.vrf, local.defaults.iosxr.devices.configuration.logging.hosts.vrf, null)]) : {
        key         = format("%s/%s", device.name, vrf_name)
        device_name = device.name
        vrf_name    = vrf_name
        hostnames = try(length([
          for h in try(local.device_config[device.name].logging.hosts, []) :
          h if try(h.vrf, local.defaults.iosxr.devices.configuration.logging.hosts.vrf, null) == vrf_name
          && can(regex(":", try(h.address, local.defaults.iosxr.devices.configuration.logging.hosts.address, ""))) == false
          && can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(h.address, local.defaults.iosxr.devices.configuration.logging.hosts.address, ""))) == false
          ]) == 0, true) ? null : [for h in try(local.device_config[device.name].logging.hosts, []) : {
          name                    = try(h.address, local.defaults.iosxr.devices.configuration.logging.hosts.address, null)
          severity                = try(h.severity, local.defaults.iosxr.devices.configuration.logging.hosts.severity, null)
          port                    = try(h.port, local.defaults.iosxr.devices.configuration.logging.hosts.port, null)
          operator                = try(h.operator, local.defaults.iosxr.devices.configuration.logging.hosts.operator, null)
          facility                = try(h.facility, local.defaults.iosxr.devices.configuration.logging.hosts.facility, null)
          hostname_source_address = try(h.source_address, local.defaults.iosxr.devices.configuration.logging.hosts.source_address, null)
          }
          if try(h.vrf, local.defaults.iosxr.devices.configuration.logging.hosts.vrf, null) == vrf_name
          && can(regex(":", try(h.address, local.defaults.iosxr.devices.configuration.logging.hosts.address, ""))) == false
          && can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(h.address, local.defaults.iosxr.devices.configuration.logging.hosts.address, ""))) == false
        ]
        host_ipv4_addresses = try(length([
          for h in try(local.device_config[device.name].logging.hosts, []) :
          h if try(h.vrf, local.defaults.iosxr.devices.configuration.logging.hosts.vrf, null) == vrf_name
          && can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(h.address, local.defaults.iosxr.devices.configuration.logging.hosts.address, "")))
          ]) == 0, true) ? null : [
          for h in try(local.device_config[device.name].logging.hosts, []) : {
            ipv4_address        = try(h.address, local.defaults.iosxr.devices.configuration.logging.hosts.address, null)
            severity            = try(h.severity, local.defaults.iosxr.devices.configuration.logging.hosts.severity, null)
            port                = try(h.port, local.defaults.iosxr.devices.configuration.logging.hosts.port, null)
            operator            = try(h.operator, local.defaults.iosxr.devices.configuration.logging.hosts.operator, null)
            facility            = try(h.facility, local.defaults.iosxr.devices.configuration.logging.hosts.facility, null)
            ipv4_source_address = try(h.source_address, local.defaults.iosxr.devices.configuration.logging.hosts.source_address, null)
          }
          if try(h.vrf, local.defaults.iosxr.devices.configuration.logging.hosts.vrf, null) == vrf_name
          && can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(h.address, local.defaults.iosxr.devices.configuration.logging.hosts.address, "")))
        ]
        host_ipv6_addresses = try(length([
          for h in try(local.device_config[device.name].logging.hosts, []) :
          h if try(h.vrf, local.defaults.iosxr.devices.configuration.logging.hosts.vrf, null) == vrf_name
          && can(regex(":", try(h.address, local.defaults.iosxr.devices.configuration.logging.hosts.address, ""))) == true
          ]) == 0, true) ? null : [
          for h in try(local.device_config[device.name].logging.hosts, []) : {
            ipv6_address        = try(h.address, local.defaults.iosxr.devices.configuration.logging.hosts.address, null)
            severity            = try(h.severity, local.defaults.iosxr.devices.configuration.logging.hosts.severity, null)
            port                = try(h.port, local.defaults.iosxr.devices.configuration.logging.hosts.port, null)
            operator            = try(h.operator, local.defaults.iosxr.devices.configuration.logging.hosts.operator, null)
            facility            = try(h.facility, local.defaults.iosxr.devices.configuration.logging.hosts.facility, null)
            ipv6_source_address = try(h.source_address, local.defaults.iosxr.devices.configuration.logging.hosts.source_address, null)
          }
          if try(h.vrf, local.defaults.iosxr.devices.configuration.logging.hosts.vrf, null) == vrf_name
          && can(regex(":", try(h.address, local.defaults.iosxr.devices.configuration.logging.hosts.address, ""))) == true
        ]
      }
    ]
  ])
}

resource "iosxr_logging_vrf" "logging_vrf" {
  for_each            = { for v in local.logging_vrfs : v.key => v }
  device              = each.value.device_name
  vrf_name            = each.value.vrf_name
  hostnames           = each.value.hostnames
  host_ipv4_addresses = each.value.host_ipv4_addresses
  host_ipv6_addresses = each.value.host_ipv6_addresses

  depends_on = [
    iosxr_logging.logging,
    iosxr_domain.domain,
    iosxr_domain_vrf.domain_vrf
  ]

}

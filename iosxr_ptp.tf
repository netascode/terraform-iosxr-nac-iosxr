##### PTP #####

locals {
  ptp = { for device in local.devices : device.name => {
    frequency_priority                            = try(local.device_config[device.name].ptp.frequency_priority, local.defaults.iosxr.devices.configuration.ptp.frequency_priority, null)
    time_of_day_priority                          = try(local.device_config[device.name].ptp.time_of_day_priority, local.defaults.iosxr.devices.configuration.ptp.time_of_day_priority, null)
    ipv6_verify_checksum                          = try(local.device_config[device.name].ptp.ipv6_verify_checksum, local.defaults.iosxr.devices.configuration.ptp.ipv6_verify_checksum, null)
    min_clock_class                               = try(local.device_config[device.name].ptp.min_clock_class, local.defaults.iosxr.devices.configuration.ptp.min_clock_class, null)
    utc_offset_baseline                           = try(local.device_config[device.name].ptp.utc_offset_baseline, local.defaults.iosxr.devices.configuration.ptp.utc_offset_baseline, null)
    uncalibrated_traceable_override               = try(local.device_config[device.name].ptp.uncalibrated_traceable_override, local.defaults.iosxr.devices.configuration.ptp.uncalibrated_traceable_override, null)
    startup_clock_class                           = try(local.device_config[device.name].ptp.startup_clock_class, local.defaults.iosxr.devices.configuration.ptp.startup_clock_class, null)
    freerun_clock_class                           = try(local.device_config[device.name].ptp.freerun_clock_class, local.defaults.iosxr.devices.configuration.ptp.freerun_clock_class, null)
    double_failure_clock_class                    = try(local.device_config[device.name].ptp.double_failure_clock_class, local.defaults.iosxr.devices.configuration.ptp.double_failure_clock_class, null)
    transparent_clock_domain_all                  = try(local.device_config[device.name].ptp.transparent_clock_domain_all, local.defaults.iosxr.devices.configuration.ptp.transparent_clock_domain_all, null)
    physical_layer_frequency                      = try(local.device_config[device.name].ptp.physical_layer_frequency, local.defaults.iosxr.devices.configuration.ptp.physical_layer_frequency, null)
    network_type_high_pdv                         = try(local.device_config[device.name].ptp.network_type_high_pdv, local.defaults.iosxr.devices.configuration.ptp.network_type_high_pdv, null)
    servo_slow_tracking                           = try(local.device_config[device.name].ptp.servo_slow_tracking, local.defaults.iosxr.devices.configuration.ptp.servo_slow_tracking, null)
    holdover_spec_clock_class                     = try(local.device_config[device.name].ptp.holdover_spec_clock_class, local.defaults.iosxr.devices.configuration.ptp.holdover_spec_clock_class, null)
    holdover_spec_duration                        = try(local.device_config[device.name].ptp.holdover_spec_duration, local.defaults.iosxr.devices.configuration.ptp.holdover_spec_duration, null)
    holdover_spec_traceable_override              = try(local.device_config[device.name].ptp.holdover_spec_traceable_override, local.defaults.iosxr.devices.configuration.ptp.holdover_spec_traceable_override, null)
    apts                                          = try(local.device_config[device.name].ptp.apts, local.defaults.iosxr.devices.configuration.ptp.apts, null)
    phase_difference_threshold_breach             = try(local.device_config[device.name].ptp.phase_difference_threshold_breach, local.defaults.iosxr.devices.configuration.ptp.phase_difference_threshold_breach, null)
    detect_ptsf_unusable                          = try(local.device_config[device.name].ptp.detect_ptsf_unusable, local.defaults.iosxr.devices.configuration.ptp.detect_ptsf_unusable, null)
    performance_monitoring                        = try(local.device_config[device.name].ptp.performance_monitoring, local.defaults.iosxr.devices.configuration.ptp.performance_monitoring, null)
    log_best_primary_clock_changes                = try(local.device_config[device.name].ptp.log_best_primary_clock_changes, local.defaults.iosxr.devices.configuration.ptp.log_best_primary_clock_changes, null)
    log_servo_events                              = try(local.device_config[device.name].ptp.log_servo_events, local.defaults.iosxr.devices.configuration.ptp.log_servo_events, null)
    uncalibrated_clock_class_clock_class          = try(local.device_config[device.name].ptp.uncalibrated_clock_class, local.defaults.iosxr.devices.configuration.ptp.uncalibrated_clock_class, null)
    uncalibrated_clock_class_unless_from_holdover = try(local.device_config[device.name].ptp.uncalibrated_unless_from_holdover, local.defaults.iosxr.devices.configuration.ptp.uncalibrated_unless_from_holdover, null)
    virtual_port                                  = try(local.device_config[device.name].ptp.virtual_port.enable, local.defaults.iosxr.devices.configuration.ptp.virtual_port.enable, null)
    virtual_port_priority1                        = try(local.device_config[device.name].ptp.virtual_port.priority1, local.defaults.iosxr.devices.configuration.ptp.virtual_port.priority1, null)
    virtual_port_priority2                        = try(local.device_config[device.name].ptp.virtual_port.priority2, local.defaults.iosxr.devices.configuration.ptp.virtual_port.priority2, null)
    virtual_port_clock_class                      = try(local.device_config[device.name].ptp.virtual_port.clock_class, local.defaults.iosxr.devices.configuration.ptp.virtual_port.clock_class, null)
    virtual_port_clock_accuracy                   = try(local.device_config[device.name].ptp.virtual_port.clock_accuracy, local.defaults.iosxr.devices.configuration.ptp.virtual_port.clock_accuracy, null)
    virtual_port_offset_scaled_log_variance       = try(local.device_config[device.name].ptp.virtual_port.offset_scaled_log_variance, local.defaults.iosxr.devices.configuration.ptp.virtual_port.offset_scaled_log_variance, null)
    virtual_port_local_priority                   = try(local.device_config[device.name].ptp.virtual_port.local_priority, local.defaults.iosxr.devices.configuration.ptp.virtual_port.local_priority, null)
    virtual_port_gm_threshold_breach              = try(local.device_config[device.name].ptp.virtual_port.gm_threshold_breach, local.defaults.iosxr.devices.configuration.ptp.virtual_port.gm_threshold_breach, null)
    clock_identity_mac_address_router             = try(local.device_config[device.name].ptp.clock.identity_mac, local.defaults.iosxr.devices.configuration.ptp.clock.identity_mac, null) == "router" ? true : null
    clock_identity_mac_address_custom             = try(local.device_config[device.name].ptp.clock.identity_mac, local.defaults.iosxr.devices.configuration.ptp.clock.identity_mac, null) != "router" ? try(provider::utils::normalize_mac(try(local.device_config[device.name].ptp.clock.identity_mac, local.defaults.iosxr.devices.configuration.ptp.clock.identity_mac), "colon"), null) : null
    clock_identity_eui_64                         = try(local.device_config[device.name].ptp.clock.identity_eui_64, local.defaults.iosxr.devices.configuration.ptp.clock.identity_eui_64, null)
    clock_timescale_ptp                           = try(local.device_config[device.name].ptp.clock.timescale, local.defaults.iosxr.devices.configuration.ptp.clock.timescale, null) == "ptp" ? true : null
    clock_timescale_arb                           = try(local.device_config[device.name].ptp.clock.timescale, local.defaults.iosxr.devices.configuration.ptp.clock.timescale, null) == "arb" ? true : null
    clock_domain                                  = try(local.device_config[device.name].ptp.clock.domain, local.defaults.iosxr.devices.configuration.ptp.clock.domain, null)
    clock_priority1                               = try(local.device_config[device.name].ptp.clock.priority1, local.defaults.iosxr.devices.configuration.ptp.clock.priority1, null)
    clock_priority2                               = try(local.device_config[device.name].ptp.clock.priority2, local.defaults.iosxr.devices.configuration.ptp.clock.priority2, null)
    clock_clock_class                             = try(local.device_config[device.name].ptp.clock.clock_class, local.defaults.iosxr.devices.configuration.ptp.clock.clock_class, null)
    clock_time_source_atomic_clock                = try(local.device_config[device.name].ptp.clock.time_source, local.defaults.iosxr.devices.configuration.ptp.clock.time_source, null) == "atomic-clock" ? true : null
    clock_time_source_gps                         = try(local.device_config[device.name].ptp.clock.time_source, local.defaults.iosxr.devices.configuration.ptp.clock.time_source, null) == "gps" ? true : null
    clock_time_source_terrestrial_radio           = try(local.device_config[device.name].ptp.clock.time_source, local.defaults.iosxr.devices.configuration.ptp.clock.time_source, null) == "terrestrial-radio" ? true : null
    clock_time_source_ptp                         = try(local.device_config[device.name].ptp.clock.time_source, local.defaults.iosxr.devices.configuration.ptp.clock.time_source, null) == "ptp" ? true : null
    clock_time_source_ntp                         = try(local.device_config[device.name].ptp.clock.time_source, local.defaults.iosxr.devices.configuration.ptp.clock.time_source, null) == "ntp" ? true : null
    clock_time_source_hand_set                    = try(local.device_config[device.name].ptp.clock.time_source, local.defaults.iosxr.devices.configuration.ptp.clock.time_source, null) == "hand-set" ? true : null
    clock_time_source_other                       = try(local.device_config[device.name].ptp.clock.time_source, local.defaults.iosxr.devices.configuration.ptp.clock.time_source, null) == "other" ? true : null
    clock_time_source_internal_oscillator         = try(local.device_config[device.name].ptp.clock.time_source, local.defaults.iosxr.devices.configuration.ptp.clock.time_source, null) == "internal-oscillator" ? true : null
    clock_profile_g_8265_1                        = try(local.device_config[device.name].ptp.clock.profile, local.defaults.iosxr.devices.configuration.ptp.clock.profile, null) == "g-8265-1" ? true : null
    clock_profile_g_8265_1_clock_type_master      = try(local.device_config[device.name].ptp.clock.profile, local.defaults.iosxr.devices.configuration.ptp.clock.profile, null) == "g-8265-1" && try(local.device_config[device.name].ptp.clock.profile_clock_type, local.defaults.iosxr.devices.configuration.ptp.clock.profile_clock_type, null) == "primary" ? true : null
    clock_profile_g_8265_1_clock_type_slave       = try(local.device_config[device.name].ptp.clock.profile, local.defaults.iosxr.devices.configuration.ptp.clock.profile, null) == "g-8265-1" && try(local.device_config[device.name].ptp.clock.profile_clock_type, local.defaults.iosxr.devices.configuration.ptp.clock.profile_clock_type, null) == "slave" ? true : null
    clock_profile_g_8275_1_clock_type_t_bc        = try(local.device_config[device.name].ptp.clock.profile, local.defaults.iosxr.devices.configuration.ptp.clock.profile, null) == "g-8275-1" && try(local.device_config[device.name].ptp.clock.profile_clock_type, local.defaults.iosxr.devices.configuration.ptp.clock.profile_clock_type, null) == "t-bc" ? true : null
    clock_profile_g_8275_1_clock_type_t_gm        = try(local.device_config[device.name].ptp.clock.profile, local.defaults.iosxr.devices.configuration.ptp.clock.profile, null) == "g-8275-1" && try(local.device_config[device.name].ptp.clock.profile_clock_type, local.defaults.iosxr.devices.configuration.ptp.clock.profile_clock_type, null) == "t-gm" ? true : null
    clock_profile_g_8275_1_clock_type_t_tsc       = try(local.device_config[device.name].ptp.clock.profile, local.defaults.iosxr.devices.configuration.ptp.clock.profile, null) == "g-8275-1" && try(local.device_config[device.name].ptp.clock.profile_clock_type, local.defaults.iosxr.devices.configuration.ptp.clock.profile_clock_type, null) == "t-tsc" ? true : null
    clock_profile_g_8275_2_clock_type_t_bc        = try(local.device_config[device.name].ptp.clock.profile, local.defaults.iosxr.devices.configuration.ptp.clock.profile, null) == "g-8275-2" && try(local.device_config[device.name].ptp.clock.profile_clock_type, local.defaults.iosxr.devices.configuration.ptp.clock.profile_clock_type, null) == "t-bc" ? true : null
    clock_profile_g_8275_2_clock_type_t_gm        = try(local.device_config[device.name].ptp.clock.profile, local.defaults.iosxr.devices.configuration.ptp.clock.profile, null) == "g-8275-2" && try(local.device_config[device.name].ptp.clock.profile_clock_type, local.defaults.iosxr.devices.configuration.ptp.clock.profile_clock_type, null) == "t-gm" ? true : null
    clock_profile_g_8275_2_clock_type_t_tsc       = try(local.device_config[device.name].ptp.clock.profile, local.defaults.iosxr.devices.configuration.ptp.clock.profile, null) == "g-8275-2" && try(local.device_config[device.name].ptp.clock.profile_clock_type, local.defaults.iosxr.devices.configuration.ptp.clock.profile_clock_type, null) == "t-tsc" ? true : null
    utc_offsets = try(length(local.device_config[device.name].ptp.utc_offsets) == 0, true) ? null : [for offset in local.device_config[device.name].ptp.utc_offsets : {
      date         = try(substr(offset.date, 0, 10), local.defaults.iosxr.devices.configuration.ptp.utc_offsets.date, null)
      offset_value = try(offset.offset_value, local.defaults.iosxr.devices.configuration.ptp.utc_offsets.offset_value, null)
    }]
  } if try(local.device_config[device.name].ptp, null) != null || try(local.defaults.iosxr.devices.configuration.ptp, null) != null }
}

resource "iosxr_ptp" "ptp" {
  for_each                                      = local.ptp
  device                                        = each.key
  frequency_priority                            = each.value.frequency_priority
  time_of_day_priority                          = each.value.time_of_day_priority
  ipv6_verify_checksum                          = each.value.ipv6_verify_checksum
  min_clock_class                               = each.value.min_clock_class
  utc_offset_baseline                           = each.value.utc_offset_baseline
  uncalibrated_traceable_override               = each.value.uncalibrated_traceable_override
  startup_clock_class                           = each.value.startup_clock_class
  freerun_clock_class                           = each.value.freerun_clock_class
  double_failure_clock_class                    = each.value.double_failure_clock_class
  transparent_clock_domain_all                  = each.value.transparent_clock_domain_all
  physical_layer_frequency                      = each.value.physical_layer_frequency
  network_type_high_pdv                         = each.value.network_type_high_pdv
  servo_slow_tracking                           = each.value.servo_slow_tracking
  holdover_spec_clock_class                     = each.value.holdover_spec_clock_class
  holdover_spec_duration                        = each.value.holdover_spec_duration
  holdover_spec_traceable_override              = each.value.holdover_spec_traceable_override
  apts                                          = each.value.apts
  phase_difference_threshold_breach             = each.value.phase_difference_threshold_breach
  detect_ptsf_unusable                          = each.value.detect_ptsf_unusable
  performance_monitoring                        = each.value.performance_monitoring
  log_best_primary_clock_changes                = each.value.log_best_primary_clock_changes
  log_servo_events                              = each.value.log_servo_events
  uncalibrated_clock_class_clock_class          = each.value.uncalibrated_clock_class_clock_class
  uncalibrated_clock_class_unless_from_holdover = each.value.uncalibrated_clock_class_unless_from_holdover
  virtual_port                                  = each.value.virtual_port
  virtual_port_priority1                        = each.value.virtual_port_priority1
  virtual_port_priority2                        = each.value.virtual_port_priority2
  virtual_port_clock_class                      = each.value.virtual_port_clock_class
  virtual_port_clock_accuracy                   = each.value.virtual_port_clock_accuracy
  virtual_port_offset_scaled_log_variance       = each.value.virtual_port_offset_scaled_log_variance
  virtual_port_local_priority                   = each.value.virtual_port_local_priority
  virtual_port_gm_threshold_breach              = each.value.virtual_port_gm_threshold_breach
  clock_identity_mac_address_router             = each.value.clock_identity_mac_address_router
  clock_identity_mac_address_custom             = each.value.clock_identity_mac_address_custom
  clock_identity_eui_64                         = each.value.clock_identity_eui_64
  clock_timescale_ptp                           = each.value.clock_timescale_ptp
  clock_timescale_arb                           = each.value.clock_timescale_arb
  clock_domain                                  = each.value.clock_domain
  clock_priority1                               = each.value.clock_priority1
  clock_priority2                               = each.value.clock_priority2
  clock_clock_class                             = each.value.clock_clock_class
  clock_time_source_atomic_clock                = each.value.clock_time_source_atomic_clock
  clock_time_source_gps                         = each.value.clock_time_source_gps
  clock_time_source_terrestrial_radio           = each.value.clock_time_source_terrestrial_radio
  clock_time_source_ptp                         = each.value.clock_time_source_ptp
  clock_time_source_ntp                         = each.value.clock_time_source_ntp
  clock_time_source_hand_set                    = each.value.clock_time_source_hand_set
  clock_time_source_other                       = each.value.clock_time_source_other
  clock_time_source_internal_oscillator         = each.value.clock_time_source_internal_oscillator
  clock_profile_g_8265_1                        = each.value.clock_profile_g_8265_1
  clock_profile_g_8265_1_clock_type_master      = each.value.clock_profile_g_8265_1_clock_type_master
  clock_profile_g_8265_1_clock_type_slave       = each.value.clock_profile_g_8265_1_clock_type_slave
  clock_profile_g_8275_1_clock_type_t_bc        = each.value.clock_profile_g_8275_1_clock_type_t_bc
  clock_profile_g_8275_1_clock_type_t_gm        = each.value.clock_profile_g_8275_1_clock_type_t_gm
  clock_profile_g_8275_1_clock_type_t_tsc       = each.value.clock_profile_g_8275_1_clock_type_t_tsc
  clock_profile_g_8275_2_clock_type_t_bc        = each.value.clock_profile_g_8275_2_clock_type_t_bc
  clock_profile_g_8275_2_clock_type_t_gm        = each.value.clock_profile_g_8275_2_clock_type_t_gm
  clock_profile_g_8275_2_clock_type_t_tsc       = each.value.clock_profile_g_8275_2_clock_type_t_tsc
  utc_offsets                                   = each.value.utc_offsets
}

##### PTP Profile #####

locals {
  ptp_profiles = flatten([
    for device in local.devices : [
      for profile in try(local.device_config[device.name].ptp.profiles, []) : {
        key                                                             = format("%s/%s", device.name, profile.name)
        device_name                                                     = device.name
        profile_name                                                    = try(profile.name, local.defaults.iosxr.devices.configuration.ptp.profiles.name, null)
        transport_ipv4                                                  = try(profile.transport, local.defaults.iosxr.devices.configuration.ptp.profiles.transport, null) == "ipv4" ? true : null
        transport_ipv6                                                  = try(profile.transport, local.defaults.iosxr.devices.configuration.ptp.profiles.transport, null) == "ipv6" ? true : null
        transport_ethernet                                              = try(profile.transport, local.defaults.iosxr.devices.configuration.ptp.profiles.transport, null) == "ethernet" ? true : null
        port_state_slave_only                                           = try(profile.port_state, local.defaults.iosxr.devices.configuration.ptp.profiles.port_state, null) == "slave-only" ? true : null
        port_state_master_only                                          = try(profile.port_state, local.defaults.iosxr.devices.configuration.ptp.profiles.port_state, null) == "master-only" ? true : null
        port_state_any                                                  = try(profile.port_state, local.defaults.iosxr.devices.configuration.ptp.profiles.port_state, null) == "any" ? true : null
        clock_operation_one_step                                        = try(profile.clock_operation, local.defaults.iosxr.devices.configuration.ptp.profiles.clock_operation, null) == "one-step" ? true : null
        clock_operation_two_step                                        = try(profile.clock_operation, local.defaults.iosxr.devices.configuration.ptp.profiles.clock_operation, null) == "two-step" ? true : null
        multicast                                                       = try(profile.multicast, local.defaults.iosxr.devices.configuration.ptp.profiles.multicast, null) == "enable" ? true : null
        multicast_mixed                                                 = try(profile.multicast, local.defaults.iosxr.devices.configuration.ptp.profiles.multicast, null) == "mixed" ? true : null
        multicast_disable                                               = try(profile.multicast, local.defaults.iosxr.devices.configuration.ptp.profiles.multicast, null) == "disable" ? true : null
        source_ipv4_address                                             = try(profile.source_ipv4_address, local.defaults.iosxr.devices.configuration.ptp.profiles.source_ipv4_address, null)
        source_ipv6_address                                             = try(profile.source_ipv6_address, local.defaults.iosxr.devices.configuration.ptp.profiles.source_ipv6_address, null)
        announce_interval                                               = try(profile.announce_interval, local.defaults.iosxr.devices.configuration.ptp.profiles.announce_interval, null)
        announce_frequency                                              = try(profile.announce_frequency, local.defaults.iosxr.devices.configuration.ptp.profiles.announce_frequency, null)
        announce_timeout                                                = try(profile.announce_timeout, local.defaults.iosxr.devices.configuration.ptp.profiles.announce_timeout, null)
        announce_grant_duration                                         = try(profile.announce_grant_duration, local.defaults.iosxr.devices.configuration.ptp.profiles.announce_grant_duration, null)
        sync_interval                                                   = try(profile.sync_interval, local.defaults.iosxr.devices.configuration.ptp.profiles.sync_interval, null)
        sync_frequency                                                  = try(profile.sync_frequency, local.defaults.iosxr.devices.configuration.ptp.profiles.sync_frequency, null)
        sync_grant_duration                                             = try(profile.sync_grant_duration, local.defaults.iosxr.devices.configuration.ptp.profiles.sync_grant_duration, null)
        sync_timeout                                                    = try(profile.sync_timeout, local.defaults.iosxr.devices.configuration.ptp.profiles.sync_timeout, null)
        delay_request_interval                                          = try(profile.delay_request_interval, local.defaults.iosxr.devices.configuration.ptp.profiles.delay_request_interval, null)
        delay_request_frequency                                         = try(profile.delay_request_frequency, local.defaults.iosxr.devices.configuration.ptp.profiles.delay_request_frequency, null)
        cos                                                             = try(profile.cos, local.defaults.iosxr.devices.configuration.ptp.profiles.cos, null)
        cos_event                                                       = try(profile.cos_event, local.defaults.iosxr.devices.configuration.ptp.profiles.cos_event, null)
        cos_general                                                     = try(profile.cos_general, local.defaults.iosxr.devices.configuration.ptp.profiles.cos_general, null)
        dscp                                                            = try(profile.dscp, local.defaults.iosxr.devices.configuration.ptp.profiles.dscp, null)
        dscp_event                                                      = try(profile.dscp_event, local.defaults.iosxr.devices.configuration.ptp.profiles.dscp_event, null)
        dscp_general                                                    = try(profile.dscp_general, local.defaults.iosxr.devices.configuration.ptp.profiles.dscp_general, null)
        ipv4_ttl                                                        = try(profile.ipv4_ttl, local.defaults.iosxr.devices.configuration.ptp.profiles.ipv4_ttl, null)
        ipv6_hop_limit                                                  = try(profile.ipv6_hop_limit, local.defaults.iosxr.devices.configuration.ptp.profiles.ipv6_hop_limit, null)
        delay_asymmetry_value                                           = try(profile.delay_asymmetry_value, local.defaults.iosxr.devices.configuration.ptp.profiles.delay_asymmetry_value, null)
        delay_response_grant_duration                                   = try(profile.delay_response_grant_duration, local.defaults.iosxr.devices.configuration.ptp.profiles.delay_response_grant_duration, null)
        delay_response_timeout                                          = try(profile.delay_response_timeout, local.defaults.iosxr.devices.configuration.ptp.profiles.delay_response_timeout, null)
        delay_asymmetry_unit_nanoseconds                                = try(profile.delay_asymmetry_unit, local.defaults.iosxr.devices.configuration.ptp.profiles.delay_asymmetry_unit, null) == "nanoseconds" ? true : null
        delay_asymmetry_unit_microseconds                               = try(profile.delay_asymmetry_unit, local.defaults.iosxr.devices.configuration.ptp.profiles.delay_asymmetry_unit, null) == "microseconds" ? true : null
        delay_asymmetry_unit_milliseconds                               = try(profile.delay_asymmetry_unit, local.defaults.iosxr.devices.configuration.ptp.profiles.delay_asymmetry_unit, null) == "milliseconds" ? true : null
        unicast_grant_invalid_request_reduce                            = try(profile.unicast_grant_invalid_request, local.defaults.iosxr.devices.configuration.ptp.profiles.unicast_grant_invalid_request, null) == "reduce" ? true : null
        unicast_grant_invalid_request_deny                              = try(profile.unicast_grant_invalid_request, local.defaults.iosxr.devices.configuration.ptp.profiles.unicast_grant_invalid_request, null) == "deny" ? true : null
        multicast_target_address_ethernet_mac_address_01_1b_19_00_00_00 = try(profile.multicast_target_address, local.defaults.iosxr.devices.configuration.ptp.profiles.multicast_target_address, null) == "01-1B-19-00-00-00" ? true : null
        multicast_target_address_ethernet_mac_address_01_80_c2_00_00_0e = try(profile.multicast_target_address, local.defaults.iosxr.devices.configuration.ptp.profiles.multicast_target_address, null) == "01-80-C2-00-00-0E" ? true : null
        slave_ipv4s = try(length(profile.slaves) > 0, false) ? [for slave in profile.slaves : {
          address        = try(slave.address, local.defaults.iosxr.devices.configuration.ptp.profiles.slaves.address, null)
          non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.ptp.profiles.slaves.non_negotiated, null)
        } if can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(slave.address, "")))] : null
        slave_ipv6s = try(length(profile.slaves) > 0, false) ? [for slave in profile.slaves : {
          address        = try(slave.address, local.defaults.iosxr.devices.configuration.ptp.profiles.slaves.address, null)
          non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.ptp.profiles.slaves.non_negotiated, null)
        } if !can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(slave.address, ""))) && !can(regex("^([0-9a-fA-F]{2}[:-]){5}[0-9a-fA-F]{2}$", try(slave.address, ""))) && !can(regex("^[0-9a-fA-F]{4}\\.[0-9a-fA-F]{4}\\.[0-9a-fA-F]{4}$", try(slave.address, "")))] : null
        slave_ethernets = try(length(profile.slaves) > 0, false) ? [for slave in profile.slaves : {
          address        = provider::utils::normalize_mac(try(slave.address, local.defaults.iosxr.devices.configuration.ptp.profiles.slaves.address, null), "colon")
          non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.ptp.profiles.slaves.non_negotiated, null)
        } if can(regex("^([0-9a-fA-F]{2}[:-]){5}[0-9a-fA-F]{2}$", try(slave.address, ""))) || can(regex("^[0-9a-fA-F]{4}\\.[0-9a-fA-F]{4}\\.[0-9a-fA-F]{4}$", try(slave.address, "")))] : null
        master_ipv4s = try(length(profile.masters) > 0, false) ? [for master in profile.masters : {
          address         = try(master.address, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.address, null)
          priority        = try(master.priority, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.priority, null)
          clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.clock_class, null)
          multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.multicast, null) == "enable" ? true : null
          multicast_mixed = try(master.multicast, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.multicast, null) == "mixed" ? true : null
          non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.non_negotiated, null)
          delay_asymmetry = try(master.delay_asymmetry_value, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.delay_asymmetry_value, null)
          nanoseconds     = try(master.delay_asymmetry_unit, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.delay_asymmetry_unit, null) == "nanoseconds" ? true : null
          microseconds    = try(master.delay_asymmetry_unit, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.delay_asymmetry_unit, null) == "microseconds" ? true : null
          milliseconds    = try(master.delay_asymmetry_unit, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.delay_asymmetry_unit, null) == "milliseconds" ? true : null
        } if can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(master.address, "")))] : null
        master_ipv6s = try(length(profile.masters) > 0, false) ? [for master in profile.masters : {
          address         = try(master.address, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.address, null)
          priority        = try(master.priority, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.priority, null)
          clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.clock_class, null)
          multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.multicast, null) == "enable" ? true : null
          multicast_mixed = try(master.multicast, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.multicast, null) == "mixed" ? true : null
          non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.non_negotiated, null)
          delay_asymmetry = try(master.delay_asymmetry_value, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.delay_asymmetry_value, null)
          nanoseconds     = try(master.delay_asymmetry_unit, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.delay_asymmetry_unit, null) == "nanoseconds" ? true : null
          microseconds    = try(master.delay_asymmetry_unit, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.delay_asymmetry_unit, null) == "microseconds" ? true : null
          milliseconds    = try(master.delay_asymmetry_unit, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.delay_asymmetry_unit, null) == "milliseconds" ? true : null
        } if !can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(master.address, ""))) && !can(regex("^([0-9a-fA-F]{2}[:-]){5}[0-9a-fA-F]{2}$", try(master.address, ""))) && !can(regex("^[0-9a-fA-F]{4}\\.[0-9a-fA-F]{4}\\.[0-9a-fA-F]{4}$", try(master.address, "")))] : null
        master_ethernets = try(length(profile.masters) > 0, false) ? [for master in profile.masters : {
          address         = provider::utils::normalize_mac(try(master.address, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.address, null), "colon")
          priority        = try(master.priority, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.priority, null)
          clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.clock_class, null)
          multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.multicast, null) == "enable" ? true : null
          multicast_mixed = try(master.multicast, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.multicast, null) == "mixed" ? true : null
          non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.non_negotiated, null)
          delay_asymmetry = try(master.delay_asymmetry_value, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.delay_asymmetry_value, null)
          nanoseconds     = try(master.delay_asymmetry_unit, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.delay_asymmetry_unit, null) == "nanoseconds" ? true : null
          microseconds    = try(master.delay_asymmetry_unit, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.delay_asymmetry_unit, null) == "microseconds" ? true : null
          milliseconds    = try(master.delay_asymmetry_unit, local.defaults.iosxr.devices.configuration.ptp.profiles.masters.delay_asymmetry_unit, null) == "milliseconds" ? true : null
        } if can(regex("^([0-9a-fA-F]{2}[:-]){5}[0-9a-fA-F]{2}$", try(master.address, ""))) || can(regex("^[0-9a-fA-F]{4}\\.[0-9a-fA-F]{4}\\.[0-9a-fA-F]{4}$", try(master.address, "")))] : null
        interop_profile_default                              = try(profile.interop.profile, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.profile, null) == "default" ? true : null
        interop_profile_g_8265_1                             = try(profile.interop.profile, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.profile, null) == "g-8265-1" ? true : null
        interop_profile_g_8275_1                             = try(profile.interop.profile, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.profile, null) == "g-8275-1" ? true : null
        interop_profile_g_8275_2                             = try(profile.interop.profile, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.profile, null) == "g-8275-2" ? true : null
        interop_domain                                       = try(profile.interop.domain, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.domain, null)
        interop_egress_conversion_priority1                  = try(profile.interop.egress_conversion.priority1, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.egress_conversion.priority1, null)
        interop_egress_conversion_priority2                  = try(profile.interop.egress_conversion.priority2, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.egress_conversion.priority2, null)
        interop_egress_conversion_clock_accuracy             = try(profile.interop.egress_conversion.clock_accuracy, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.egress_conversion.clock_accuracy, null)
        interop_egress_conversion_offset_scaled_log_variance = try(profile.interop.egress_conversion.offset_scaled_log_variance, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.egress_conversion.offset_scaled_log_variance, null)
        interop_egress_conversion_clock_class_default        = try(profile.interop.egress_conversion.clock_class_default, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.egress_conversion.clock_class_default, null)
        interop_egress_conversion_clock_class_mappings = try(length(profile.interop.egress_conversion.clock_class_mappings) == 0, true) ? null : [for mapping in profile.interop.egress_conversion.clock_class_mappings : {
          clock_class_to_map_from = try(mapping.class_from, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.egress_conversion.clock_class_mappings.class_from, null)
          clock_class_to_map_to   = try(mapping.class_to, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.egress_conversion.clock_class_mappings.class_to, null)
        }]
        interop_ingress_conversion_priority1                  = try(profile.interop.ingress_conversion.priority1, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.ingress_conversion.priority1, null)
        interop_ingress_conversion_priority2                  = try(profile.interop.ingress_conversion.priority2, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.ingress_conversion.priority2, null)
        interop_ingress_conversion_clock_accuracy             = try(profile.interop.ingress_conversion.clock_accuracy, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.ingress_conversion.clock_accuracy, null)
        interop_ingress_conversion_offset_scaled_log_variance = try(profile.interop.ingress_conversion.offset_scaled_log_variance, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.ingress_conversion.offset_scaled_log_variance, null)
        interop_ingress_conversion_clock_class_default        = try(profile.interop.ingress_conversion.clock_class_default, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.ingress_conversion.clock_class_default, null)
        interop_ingress_conversion_clock_class_mappings = try(length(profile.interop.ingress_conversion.clock_class_mappings) == 0, true) ? null : [for mapping in profile.interop.ingress_conversion.clock_class_mappings : {
          clock_class_to_map_from = try(mapping.class_from, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.ingress_conversion.clock_class_mappings.class_from, null)
          clock_class_to_map_to   = try(mapping.class_to, local.defaults.iosxr.devices.configuration.ptp.profiles.interop.ingress_conversion.clock_class_mappings.class_to, null)
        }]
      }
    ] if try(local.device_config[device.name].ptp.profiles, null) != null
  ])
}

resource "iosxr_ptp_profile" "ptp_profile" {
  for_each                                                        = { for p in local.ptp_profiles : p.key => p }
  device                                                          = each.value.device_name
  profile_name                                                    = each.value.profile_name
  transport_ipv4                                                  = each.value.transport_ipv4
  transport_ipv6                                                  = each.value.transport_ipv6
  transport_ethernet                                              = each.value.transport_ethernet
  port_state_slave_only                                           = each.value.port_state_slave_only
  port_state_master_only                                          = each.value.port_state_master_only
  port_state_any                                                  = each.value.port_state_any
  clock_operation_one_step                                        = each.value.clock_operation_one_step
  clock_operation_two_step                                        = each.value.clock_operation_two_step
  multicast                                                       = each.value.multicast
  multicast_mixed                                                 = each.value.multicast_mixed
  multicast_disable                                               = each.value.multicast_disable
  multicast_target_address_ethernet_mac_address_01_1b_19_00_00_00 = each.value.multicast_target_address_ethernet_mac_address_01_1b_19_00_00_00
  multicast_target_address_ethernet_mac_address_01_80_c2_00_00_0e = each.value.multicast_target_address_ethernet_mac_address_01_80_c2_00_00_0e
  source_ipv4_address                                             = each.value.source_ipv4_address
  source_ipv6_address                                             = each.value.source_ipv6_address
  announce_interval                                               = each.value.announce_interval
  announce_frequency                                              = each.value.announce_frequency
  announce_timeout                                                = each.value.announce_timeout
  announce_grant_duration                                         = each.value.announce_grant_duration
  sync_interval                                                   = each.value.sync_interval
  sync_frequency                                                  = each.value.sync_frequency
  sync_grant_duration                                             = each.value.sync_grant_duration
  sync_timeout                                                    = each.value.sync_timeout
  delay_request_interval                                          = each.value.delay_request_interval
  delay_request_frequency                                         = each.value.delay_request_frequency
  cos                                                             = each.value.cos
  cos_event                                                       = each.value.cos_event
  cos_general                                                     = each.value.cos_general
  dscp                                                            = each.value.dscp
  dscp_event                                                      = each.value.dscp_event
  dscp_general                                                    = each.value.dscp_general
  ipv4_ttl                                                        = each.value.ipv4_ttl
  ipv6_hop_limit                                                  = each.value.ipv6_hop_limit
  delay_asymmetry_value                                           = each.value.delay_asymmetry_value
  delay_asymmetry_unit_nanoseconds                                = each.value.delay_asymmetry_unit_nanoseconds
  delay_asymmetry_unit_microseconds                               = each.value.delay_asymmetry_unit_microseconds
  delay_asymmetry_unit_milliseconds                               = each.value.delay_asymmetry_unit_milliseconds
  delay_response_grant_duration                                   = each.value.delay_response_grant_duration
  delay_response_timeout                                          = each.value.delay_response_timeout
  unicast_grant_invalid_request_reduce                            = each.value.unicast_grant_invalid_request_reduce
  unicast_grant_invalid_request_deny                              = each.value.unicast_grant_invalid_request_deny
  slave_ipv4s                                                     = each.value.slave_ipv4s
  slave_ipv6s                                                     = each.value.slave_ipv6s
  slave_ethernets                                                 = each.value.slave_ethernets
  master_ipv4s                                                    = each.value.master_ipv4s
  master_ipv6s                                                    = each.value.master_ipv6s
  master_ethernets                                                = each.value.master_ethernets
  interop_profile_default                                         = each.value.interop_profile_default
  interop_profile_g_8265_1                                        = each.value.interop_profile_g_8265_1
  interop_profile_g_8275_1                                        = each.value.interop_profile_g_8275_1
  interop_profile_g_8275_2                                        = each.value.interop_profile_g_8275_2
  interop_domain                                                  = each.value.interop_domain
  interop_egress_conversion_priority1                             = each.value.interop_egress_conversion_priority1
  interop_egress_conversion_priority2                             = each.value.interop_egress_conversion_priority2
  interop_egress_conversion_clock_accuracy                        = each.value.interop_egress_conversion_clock_accuracy
  interop_egress_conversion_offset_scaled_log_variance            = each.value.interop_egress_conversion_offset_scaled_log_variance
  interop_egress_conversion_clock_class_default                   = each.value.interop_egress_conversion_clock_class_default
  interop_egress_conversion_clock_class_mappings                  = each.value.interop_egress_conversion_clock_class_mappings
  interop_ingress_conversion_priority1                            = each.value.interop_ingress_conversion_priority1
  interop_ingress_conversion_priority2                            = each.value.interop_ingress_conversion_priority2
  interop_ingress_conversion_clock_accuracy                       = each.value.interop_ingress_conversion_clock_accuracy
  interop_ingress_conversion_offset_scaled_log_variance           = each.value.interop_ingress_conversion_offset_scaled_log_variance
  interop_ingress_conversion_clock_class_default                  = each.value.interop_ingress_conversion_clock_class_default
  interop_ingress_conversion_clock_class_mappings                 = each.value.interop_ingress_conversion_clock_class_mappings

  depends_on = [
    iosxr_ptp.ptp
  ]

}

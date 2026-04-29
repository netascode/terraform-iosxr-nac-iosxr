##### SNMP Server #####

resource "iosxr_snmp_server" "snmp_server" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].snmp_server, null) != null || try(local.defaults.iosxr.devices.configuration.snmp_server, null) != null }
  device   = each.value.name

  chassis_id                                             = try(local.device_config[each.value.name].snmp_server.chassis_id, local.defaults.iosxr.devices.configuration.snmp_server.chassis_id, null)
  contact                                                = try(local.device_config[each.value.name].snmp_server.contact, local.defaults.iosxr.devices.configuration.snmp_server.contact, null)
  location                                               = try(local.device_config[each.value.name].snmp_server.location, local.defaults.iosxr.devices.configuration.snmp_server.location, null)
  packetsize                                             = try(local.device_config[each.value.name].snmp_server.packetsize, local.defaults.iosxr.devices.configuration.snmp_server.packetsize, null)
  trap_timeout                                           = try(local.device_config[each.value.name].snmp_server.trap_timeout, local.defaults.iosxr.devices.configuration.snmp_server.trap_timeout, null)
  queue_length                                           = try(local.device_config[each.value.name].snmp_server.queue_length, local.defaults.iosxr.devices.configuration.snmp_server.queue_length, null)
  throttle_time                                          = try(local.device_config[each.value.name].snmp_server.throttle_time, local.defaults.iosxr.devices.configuration.snmp_server.throttle_time, null)
  overload_control                                       = try(local.device_config[each.value.name].snmp_server.overload_control, local.defaults.iosxr.devices.configuration.snmp_server.overload_control, null)
  overload_throttle_rate                                 = try(local.device_config[each.value.name].snmp_server.overload_throttle_rate, local.defaults.iosxr.devices.configuration.snmp_server.overload_throttle_rate, null)
  traps_snmp_authentication                              = try(local.device_config[each.value.name].snmp_server.traps.snmp_authentication, local.defaults.iosxr.devices.configuration.snmp_server.traps.snmp_authentication, null)
  traps_snmp_coldstart                                   = try(local.device_config[each.value.name].snmp_server.traps.snmp_coldstart, local.defaults.iosxr.devices.configuration.snmp_server.traps.snmp_coldstart, null)
  traps_snmp_warmstart                                   = try(local.device_config[each.value.name].snmp_server.traps.snmp_warmstart, local.defaults.iosxr.devices.configuration.snmp_server.traps.snmp_warmstart, null)
  traps_snmp_linkup                                      = try(local.device_config[each.value.name].snmp_server.traps.snmp_linkup, local.defaults.iosxr.devices.configuration.snmp_server.traps.snmp_linkup, null)
  traps_snmp_linkdown                                    = try(local.device_config[each.value.name].snmp_server.traps.snmp_linkdown, local.defaults.iosxr.devices.configuration.snmp_server.traps.snmp_linkdown, null)
  traps_snmp_all                                         = try(local.device_config[each.value.name].snmp_server.traps.snmp_all, local.defaults.iosxr.devices.configuration.snmp_server.traps.snmp_all, null)
  traps_l2vpn_all                                        = try(local.device_config[each.value.name].snmp_server.traps.l2vpn_all, local.defaults.iosxr.devices.configuration.snmp_server.traps.l2vpn_all, null)
  traps_l2vpn_vc_up                                      = try(local.device_config[each.value.name].snmp_server.traps.l2vpn_vc_up, local.defaults.iosxr.devices.configuration.snmp_server.traps.l2vpn_vc_up, null)
  traps_l2vpn_vc_down                                    = try(local.device_config[each.value.name].snmp_server.traps.l2vpn_vc_down, local.defaults.iosxr.devices.configuration.snmp_server.traps.l2vpn_vc_down, null)
  traps_l2vpn_cisco                                      = try(local.device_config[each.value.name].snmp_server.traps.l2vpn_cisco, local.defaults.iosxr.devices.configuration.snmp_server.traps.l2vpn_cisco, null)
  traps_vpls_all                                         = try(local.device_config[each.value.name].snmp_server.traps.vpls_all, local.defaults.iosxr.devices.configuration.snmp_server.traps.vpls_all, null)
  traps_vpls_status                                      = try(local.device_config[each.value.name].snmp_server.traps.vpls_status, local.defaults.iosxr.devices.configuration.snmp_server.traps.vpls_status, null)
  traps_vpls_full_raise                                  = try(local.device_config[each.value.name].snmp_server.traps.vpls_full_raise, local.defaults.iosxr.devices.configuration.snmp_server.traps.vpls_full_raise, null)
  traps_vpls_full_clear                                  = try(local.device_config[each.value.name].snmp_server.traps.vpls_full_clear, local.defaults.iosxr.devices.configuration.snmp_server.traps.vpls_full_clear, null)
  traps_bfd                                              = try(local.device_config[each.value.name].snmp_server.traps.bfd, local.defaults.iosxr.devices.configuration.snmp_server.traps.bfd, null)
  traps_config                                           = try(local.device_config[each.value.name].snmp_server.traps.config, local.defaults.iosxr.devices.configuration.snmp_server.traps.config, null)
  traps_cfm                                              = try(local.device_config[each.value.name].snmp_server.traps.cfm, local.defaults.iosxr.devices.configuration.snmp_server.traps.cfm, null)
  traps_ethernet_oam_events                              = try(local.device_config[each.value.name].snmp_server.traps.ethernet_oam_events, local.defaults.iosxr.devices.configuration.snmp_server.traps.ethernet_oam_events, null)
  traps_rf                                               = try(local.device_config[each.value.name].snmp_server.traps.rf, local.defaults.iosxr.devices.configuration.snmp_server.traps.rf, null)
  traps_sensor                                           = try(local.device_config[each.value.name].snmp_server.traps.sensor, local.defaults.iosxr.devices.configuration.snmp_server.traps.sensor, null)
  traps_mpls_l3vpn_all                                   = try(local.device_config[each.value.name].snmp_server.traps.mpls_l3vpn_all, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_l3vpn_all, null)
  traps_mpls_l3vpn_vrf_up                                = try(local.device_config[each.value.name].snmp_server.traps.mpls_l3vpn_vrf_up, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_l3vpn_vrf_up, null)
  traps_mpls_l3vpn_vrf_down                              = try(local.device_config[each.value.name].snmp_server.traps.mpls_l3vpn_vrf_down, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_l3vpn_vrf_down, null)
  traps_mpls_l3vpn_mid_threshold_exceeded                = try(local.device_config[each.value.name].snmp_server.traps.mpls_l3vpn_mid_threshold_exceeded, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_l3vpn_mid_threshold_exceeded, null)
  traps_mpls_l3vpn_max_threshold_exceeded                = try(local.device_config[each.value.name].snmp_server.traps.mpls_l3vpn_max_threshold_exceeded, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_l3vpn_max_threshold_exceeded, null)
  traps_mpls_l3vpn_max_threshold_cleared                 = try(local.device_config[each.value.name].snmp_server.traps.mpls_l3vpn_max_threshold_cleared, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_l3vpn_max_threshold_cleared, null)
  traps_mpls_l3vpn_max_threshold_reissue_notif_time      = try(local.device_config[each.value.name].snmp_server.traps.mpls_l3vpn_max_threshold_reissue_notif_time, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_l3vpn_max_threshold_reissue_notif_time, null)
  traps_mpls_traffic_eng_cisco                           = try(local.device_config[each.value.name].snmp_server.traps.mpls_traffic_eng_cisco, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_traffic_eng_cisco, null)
  traps_mpls_traffic_eng_cisco_ext_bringup_fail          = try(local.device_config[each.value.name].snmp_server.traps.mpls_traffic_eng_cisco_ext_bringup_fail, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_traffic_eng_cisco_ext_bringup_fail, null)
  traps_mpls_traffic_eng_cisco_ext_insuff_bw             = try(local.device_config[each.value.name].snmp_server.traps.mpls_traffic_eng_cisco_ext_insuff_bw, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_traffic_eng_cisco_ext_insuff_bw, null)
  traps_mpls_traffic_eng_cisco_ext_preempt               = try(local.device_config[each.value.name].snmp_server.traps.mpls_traffic_eng_cisco_ext_preempt, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_traffic_eng_cisco_ext_preempt, null)
  traps_mpls_traffic_eng_cisco_ext_reroute_pending       = try(local.device_config[each.value.name].snmp_server.traps.mpls_traffic_eng_cisco_ext_reroute_pending, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_traffic_eng_cisco_ext_reroute_pending, null)
  traps_mpls_traffic_eng_cisco_ext_reroute_pending_clear = try(local.device_config[each.value.name].snmp_server.traps.mpls_traffic_eng_cisco_ext_reroute_pending_clear, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_traffic_eng_cisco_ext_reroute_pending_clear, null)
  traps_mpls_traffic_eng_down                            = try(local.device_config[each.value.name].snmp_server.traps.mpls_traffic_eng_down, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_traffic_eng_down, null)
  traps_mpls_traffic_eng_p2mp_down                       = try(local.device_config[each.value.name].snmp_server.traps.mpls_traffic_eng_p2mp_down, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_traffic_eng_p2mp_down, null)
  traps_mpls_traffic_eng_p2mp_up                         = try(local.device_config[each.value.name].snmp_server.traps.mpls_traffic_eng_p2mp_up, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_traffic_eng_p2mp_up, null)
  traps_mpls_traffic_eng_reoptimize                      = try(local.device_config[each.value.name].snmp_server.traps.mpls_traffic_eng_reoptimize, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_traffic_eng_reoptimize, null)
  traps_mpls_traffic_eng_reroute                         = try(local.device_config[each.value.name].snmp_server.traps.mpls_traffic_eng_reroute, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_traffic_eng_reroute, null)
  traps_mpls_traffic_eng_up                              = try(local.device_config[each.value.name].snmp_server.traps.mpls_traffic_eng_up, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_traffic_eng_up, null)
  traps_ntp                                              = try(local.device_config[each.value.name].snmp_server.traps.ntp, local.defaults.iosxr.devices.configuration.snmp_server.traps.ntp, null)
  traps_bgp_cbgp_two_enable                              = try(local.device_config[each.value.name].snmp_server.traps.bgp_cbgp_two, local.defaults.iosxr.devices.configuration.snmp_server.traps.bgp_cbgp_two, null) == "enable" ? true : null
  traps_bgp_cbgp_two_updown                              = try(local.device_config[each.value.name].snmp_server.traps.bgp_cbgp_two, local.defaults.iosxr.devices.configuration.snmp_server.traps.bgp_cbgp_two, null) == "updown" ? true : null
  traps_bgp_enable_cisco_bgp4_mib                        = try(local.device_config[each.value.name].snmp_server.traps.bgp_enable, local.defaults.iosxr.devices.configuration.snmp_server.traps.bgp_enable, null) == "bgp4_mib" ? true : null
  traps_bgp_enable_updown                                = try(local.device_config[each.value.name].snmp_server.traps.bgp_enable, local.defaults.iosxr.devices.configuration.snmp_server.traps.bgp_enable, null) == "updown" ? true : null
  traps_hsrp                                             = try(local.device_config[each.value.name].snmp_server.traps.hsrp, local.defaults.iosxr.devices.configuration.snmp_server.traps.hsrp, null)
  traps_isis_database_overload                           = try(local.device_config[each.value.name].snmp_server.traps.isis_database_overload, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_database_overload, null)
  traps_isis_manual_address_drops                        = try(local.device_config[each.value.name].snmp_server.traps.isis_manual_address_drops, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_manual_address_drops, null)
  traps_isis_corrupted_lsp_detected                      = try(local.device_config[each.value.name].snmp_server.traps.isis_corrupted_lsp_detected, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_corrupted_lsp_detected, null)
  traps_isis_attempt_to_exceed_max_sequence              = try(local.device_config[each.value.name].snmp_server.traps.isis_attempt_to_exceed_max_sequence, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_attempt_to_exceed_max_sequence, null)
  traps_isis_id_len_mismatch                             = try(local.device_config[each.value.name].snmp_server.traps.isis_id_len_mismatch, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_id_len_mismatch, null)
  traps_isis_max_area_addresses_mismatch                 = try(local.device_config[each.value.name].snmp_server.traps.isis_max_area_addresses_mismatch, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_max_area_addresses_mismatch, null)
  traps_isis_own_lsp_purge                               = try(local.device_config[each.value.name].snmp_server.traps.isis_own_lsp_purge, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_own_lsp_purge, null)
  traps_isis_sequence_number_skip                        = try(local.device_config[each.value.name].snmp_server.traps.isis_sequence_number_skip, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_sequence_number_skip, null)
  traps_isis_authentication_type_failure                 = try(local.device_config[each.value.name].snmp_server.traps.isis_authentication_type_failure, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_authentication_type_failure, null)
  traps_isis_authentication_failure                      = try(local.device_config[each.value.name].snmp_server.traps.isis_authentication_failure, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_authentication_failure, null)
  traps_isis_version_skew                                = try(local.device_config[each.value.name].snmp_server.traps.isis_version_skew, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_version_skew, null)
  traps_isis_area_mismatch                               = try(local.device_config[each.value.name].snmp_server.traps.isis_area_mismatch, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_area_mismatch, null)
  traps_isis_rejected_adjacency                          = try(local.device_config[each.value.name].snmp_server.traps.isis_rejected_adjacency, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_rejected_adjacency, null)
  traps_isis_lsp_too_large_to_propagate                  = try(local.device_config[each.value.name].snmp_server.traps.isis_lsp_too_large_to_propagate, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_lsp_too_large_to_propagate, null)
  traps_isis_orig_lsp_buff_size_mismatch                 = try(local.device_config[each.value.name].snmp_server.traps.isis_orig_lsp_buff_size_mismatch, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_orig_lsp_buff_size_mismatch, null)
  traps_isis_protocols_supported_mismatch                = try(local.device_config[each.value.name].snmp_server.traps.isis_protocols_supported_mismatch, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_protocols_supported_mismatch, null)
  traps_isis_adjacency_change                            = try(local.device_config[each.value.name].snmp_server.traps.isis_adjacency_change, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_adjacency_change, null)
  traps_isis_lsp_error_detected                          = try(local.device_config[each.value.name].snmp_server.traps.isis_lsp_error_detected, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_lsp_error_detected, null)
  traps_isis_all                                         = try(local.device_config[each.value.name].snmp_server.traps.isis_all, local.defaults.iosxr.devices.configuration.snmp_server.traps.isis_all, null)
  traps_vrrp_events                                      = try(local.device_config[each.value.name].snmp_server.traps.vrrp_events, local.defaults.iosxr.devices.configuration.snmp_server.traps.vrrp_events, null)
  traps_alarm                                            = try(local.device_config[each.value.name].snmp_server.traps.alarm, local.defaults.iosxr.devices.configuration.snmp_server.traps.alarm, null)
  traps_bridgemib                                        = try(local.device_config[each.value.name].snmp_server.traps.bridgemib, local.defaults.iosxr.devices.configuration.snmp_server.traps.bridgemib, null)
  traps_copy_complete                                    = try(local.device_config[each.value.name].snmp_server.traps.copy_complete, local.defaults.iosxr.devices.configuration.snmp_server.traps.copy_complete, null)
  traps_entity                                           = try(local.device_config[each.value.name].snmp_server.traps.entity, local.defaults.iosxr.devices.configuration.snmp_server.traps.entity, null)
  traps_cisco_entity_ext                                 = try(local.device_config[each.value.name].snmp_server.traps.cisco_entity_ext, local.defaults.iosxr.devices.configuration.snmp_server.traps.cisco_entity_ext, null)
  traps_entity_redundancy_all                            = try(local.device_config[each.value.name].snmp_server.traps.entity_redundancy_all, local.defaults.iosxr.devices.configuration.snmp_server.traps.entity_redundancy_all, null)
  traps_entity_redundancy_switchover                     = try(local.device_config[each.value.name].snmp_server.traps.entity_redundancy_switchover, local.defaults.iosxr.devices.configuration.snmp_server.traps.entity_redundancy_switchover, null)
  traps_entity_redundancy_status                         = try(local.device_config[each.value.name].snmp_server.traps.entity_redundancy_status, local.defaults.iosxr.devices.configuration.snmp_server.traps.entity_redundancy_status, null)
  traps_entity_state_switchover                          = try(local.device_config[each.value.name].snmp_server.traps.entity_state_switchover, local.defaults.iosxr.devices.configuration.snmp_server.traps.entity_state_switchover, null)
  traps_entity_state_operstatus                          = try(local.device_config[each.value.name].snmp_server.traps.entity_state_operstatus, local.defaults.iosxr.devices.configuration.snmp_server.traps.entity_state_operstatus, null)
  traps_flash_insertion                                  = try(local.device_config[each.value.name].snmp_server.traps.flash_insertion, local.defaults.iosxr.devices.configuration.snmp_server.traps.flash_insertion, null)
  traps_flash_removal                                    = try(local.device_config[each.value.name].snmp_server.traps.flash_removal, local.defaults.iosxr.devices.configuration.snmp_server.traps.flash_removal, null)
  traps_fru_ctrl                                         = try(local.device_config[each.value.name].snmp_server.traps.fru_ctrl, local.defaults.iosxr.devices.configuration.snmp_server.traps.fru_ctrl, null)
  traps_ipsla                                            = try(local.device_config[each.value.name].snmp_server.traps.ipsla, local.defaults.iosxr.devices.configuration.snmp_server.traps.ipsla, null)
  traps_mpls_ldp_down                                    = try(local.device_config[each.value.name].snmp_server.traps.mpls_ldp_down, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_ldp_down, null)
  traps_mpls_ldp_up                                      = try(local.device_config[each.value.name].snmp_server.traps.mpls_ldp_up, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_ldp_up, null)
  traps_mpls_ldp_threshold                               = try(local.device_config[each.value.name].snmp_server.traps.mpls_ldp_threshold, local.defaults.iosxr.devices.configuration.snmp_server.traps.mpls_ldp_threshold, null)
  traps_pim_neighbor_change                              = try(local.device_config[each.value.name].snmp_server.traps.pim_neighbor_change, local.defaults.iosxr.devices.configuration.snmp_server.traps.pim_neighbor_change, null)
  traps_pim_interface_state_change                       = try(local.device_config[each.value.name].snmp_server.traps.pim_interface_state_change, local.defaults.iosxr.devices.configuration.snmp_server.traps.pim_interface_state_change, null)
  traps_pim_invalid_message_received                     = try(local.device_config[each.value.name].snmp_server.traps.pim_invalid_message_received, local.defaults.iosxr.devices.configuration.snmp_server.traps.pim_invalid_message_received, null)
  traps_pim_rp_mapping_change                            = try(local.device_config[each.value.name].snmp_server.traps.pim_rp_mapping_change, local.defaults.iosxr.devices.configuration.snmp_server.traps.pim_rp_mapping_change, null)
  traps_power                                            = try(local.device_config[each.value.name].snmp_server.traps.power, local.defaults.iosxr.devices.configuration.snmp_server.traps.power, null)
  traps_syslog                                           = try(local.device_config[each.value.name].snmp_server.traps.syslog, local.defaults.iosxr.devices.configuration.snmp_server.traps.syslog, null)
  traps_system                                           = try(local.device_config[each.value.name].snmp_server.traps.system, local.defaults.iosxr.devices.configuration.snmp_server.traps.system, null)
  trap_source                                            = try(local.device_config[each.value.name].snmp_server.trap_source, local.defaults.iosxr.devices.configuration.snmp_server.trap_source, null)
  trap_source_ipv4                                       = try(local.device_config[each.value.name].snmp_server.trap_source_ipv4, local.defaults.iosxr.devices.configuration.snmp_server.trap_source_ipv4, null)
  trap_source_ipv6                                       = try(local.device_config[each.value.name].snmp_server.trap_source_ipv6, local.defaults.iosxr.devices.configuration.snmp_server.trap_source_ipv6, null)
  trap_source_port                                       = try(local.device_config[each.value.name].snmp_server.trap_source_port, local.defaults.iosxr.devices.configuration.snmp_server.trap_source_port, null)
  trap_throttle_time                                     = try(local.device_config[each.value.name].snmp_server.trap_throttle_time, local.defaults.iosxr.devices.configuration.snmp_server.trap_throttle_time, null)
  trap_authentication_vrf_disable                        = try(local.device_config[each.value.name].snmp_server.trap_authentication_vrf_disable, local.defaults.iosxr.devices.configuration.snmp_server.trap_authentication_vrf_disable, null)
  trap_delay_timer                                       = try(local.device_config[each.value.name].snmp_server.trap_delay_timer, local.defaults.iosxr.devices.configuration.snmp_server.trap_delay_timer, null)
  ipv4_dscp = try(lookup(local.dscp_map,
    tostring(try(local.device_config[each.value.name].snmp_server.ipv4_dscp, local.defaults.iosxr.devices.configuration.snmp_server.ipv4_dscp)),
    tostring(try(local.device_config[each.value.name].snmp_server.ipv4_dscp, local.defaults.iosxr.devices.configuration.snmp_server.ipv4_dscp))
    ), null
  )
  ipv6_dscp = try(lookup(local.dscp_map,
    tostring(try(local.device_config[each.value.name].snmp_server.ipv6_dscp, local.defaults.iosxr.devices.configuration.snmp_server.ipv6_dscp)),
    tostring(try(local.device_config[each.value.name].snmp_server.ipv6_dscp, local.defaults.iosxr.devices.configuration.snmp_server.ipv6_dscp))
    ), null
  )
  drop_unknown_user                = try(local.device_config[each.value.name].snmp_server.drop_unknown_user, local.defaults.iosxr.devices.configuration.snmp_server.drop_unknown_user, null)
  drop_report_acl_ipv4             = try(local.device_config[each.value.name].snmp_server.drop_report_acl_ipv4, local.defaults.iosxr.devices.configuration.snmp_server.drop_report_acl_ipv4, null)
  drop_report_acl_ipv6             = try(local.device_config[each.value.name].snmp_server.drop_report_acl_ipv6, local.defaults.iosxr.devices.configuration.snmp_server.drop_report_acl_ipv6, null)
  engine_id_local                  = try(local.device_config[each.value.name].snmp_server.engine_ids.local, local.defaults.iosxr.devices.configuration.snmp_server.engine_ids.local, null)
  oid_poll_stats                   = try(local.device_config[each.value.name].snmp_server.oid_poll_stats, local.defaults.iosxr.devices.configuration.snmp_server.oid_poll_stats, null)
  timeouts_subagent                = try(local.device_config[each.value.name].snmp_server.timeouts_subagent, local.defaults.iosxr.devices.configuration.snmp_server.timeouts_subagent, null)
  timeouts_duplicate               = try(local.device_config[each.value.name].snmp_server.timeouts_duplicate, local.defaults.iosxr.devices.configuration.snmp_server.timeouts_duplicate, null)
  timeouts_in_qdrop                = try(local.device_config[each.value.name].snmp_server.timeouts_in_qdrop, local.defaults.iosxr.devices.configuration.snmp_server.timeouts_in_qdrop, null)
  timeouts_threshold               = try(local.device_config[each.value.name].snmp_server.timeouts_threshold, local.defaults.iosxr.devices.configuration.snmp_server.timeouts_threshold, null)
  timeouts_pdu_stats               = try(local.device_config[each.value.name].snmp_server.timeouts_pdu_stats, local.defaults.iosxr.devices.configuration.snmp_server.timeouts_pdu_stats, null)
  logging_threshold_oid_processing = try(local.device_config[each.value.name].snmp_server.logging_threshold_oid_processing, local.defaults.iosxr.devices.configuration.snmp_server.logging_threshold_oid_processing, null)
  logging_threshold_pdu_processing = try(local.device_config[each.value.name].snmp_server.logging_threshold_pdu_processing, local.defaults.iosxr.devices.configuration.snmp_server.logging_threshold_pdu_processing, null)
  inform_retries                   = try(local.device_config[each.value.name].snmp_server.inform_retries, local.defaults.iosxr.devices.configuration.snmp_server.inform_retries, null)
  inform_timeout                   = try(local.device_config[each.value.name].snmp_server.inform_timeout, local.defaults.iosxr.devices.configuration.snmp_server.inform_timeout, null)
  inform_pending                   = try(local.device_config[each.value.name].snmp_server.inform_pending, local.defaults.iosxr.devices.configuration.snmp_server.inform_pending, null)

  communities = try(length(local.device_config[each.value.name].snmp_server.communities) == 0, true) ? null : [for community in local.device_config[each.value.name].snmp_server.communities : {
    community   = try(community.name, local.defaults.iosxr.devices.configuration.snmp_server.communities.name, null)
    view        = try(community.view, local.defaults.iosxr.devices.configuration.snmp_server.communities.view, null)
    ro          = try(community.ro, local.defaults.iosxr.devices.configuration.snmp_server.communities.ro, null)
    rw          = try(community.rw, local.defaults.iosxr.devices.configuration.snmp_server.communities.rw, null)
    sdrowner    = try(community.sdrowner, local.defaults.iosxr.devices.configuration.snmp_server.communities.sdrowner, null)
    systemowner = try(community.systemowner, local.defaults.iosxr.devices.configuration.snmp_server.communities.systemowner, null)
    ipv4        = try(community.ipv4_acl, local.defaults.iosxr.devices.configuration.snmp_server.communities.ipv4_acl, null)
    ipv6        = try(community.ipv6_acl, local.defaults.iosxr.devices.configuration.snmp_server.communities.ipv6_acl, null)
    }
  ]
  engine_id_remotes = try(length(local.device_config[each.value.name].snmp_server.engine_ids.remote) == 0, true) ? null : [for remote in local.device_config[each.value.name].snmp_server.engine_ids.remote : {
    address   = try(remote.address, local.defaults.iosxr.devices.configuration.snmp_server.engine_ids.remote.address, null)
    engine_id = try(remote.id, local.defaults.iosxr.devices.configuration.snmp_server.engine_ids.remote.id, null)
    udp_port  = try(remote.udp_port, local.defaults.iosxr.devices.configuration.snmp_server.engine_ids.remote.udp_port, null)
    }
  ]
  groups = try(length(local.device_config[each.value.name].snmp_server.groups) == 0, true) ? null : [for group in local.device_config[each.value.name].snmp_server.groups : {
    group_name  = try(group.name, local.defaults.iosxr.devices.configuration.snmp_server.groups.name, null)
    v1          = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v1" ? true : null
    v1_read     = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v1" ? try(group.read_view, local.defaults.iosxr.devices.configuration.snmp_server.groups.read_view, null) : null
    v1_write    = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v1" ? try(group.write_view, local.defaults.iosxr.devices.configuration.snmp_server.groups.write_view, null) : null
    v1_context  = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v1" ? try(group.context, local.defaults.iosxr.devices.configuration.snmp_server.groups.context, null) : null
    v1_notify   = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v1" ? try(group.notify_view, local.defaults.iosxr.devices.configuration.snmp_server.groups.notify_view, null) : null
    v1_ipv4     = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v1" ? try(group.ipv4_acl, local.defaults.iosxr.devices.configuration.snmp_server.groups.ipv4_acl, null) : null
    v1_ipv6     = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v1" ? try(group.ipv6_acl, local.defaults.iosxr.devices.configuration.snmp_server.groups.ipv6_acl, null) : null
    v2c         = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v2c" ? true : null
    v2c_read    = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v2c" ? try(group.read_view, local.defaults.iosxr.devices.configuration.snmp_server.groups.read_view, null) : null
    v2c_write   = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v2c" ? try(group.write_view, local.defaults.iosxr.devices.configuration.snmp_server.groups.write_view, null) : null
    v2c_context = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v2c" ? try(group.context, local.defaults.iosxr.devices.configuration.snmp_server.groups.context, null) : null
    v2c_notify  = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v2c" ? try(group.notify_view, local.defaults.iosxr.devices.configuration.snmp_server.groups.notify_view, null) : null
    v2c_ipv4    = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v2c" ? try(group.ipv4_acl, local.defaults.iosxr.devices.configuration.snmp_server.groups.ipv4_acl, null) : null
    v2c_ipv6    = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v2c" ? try(group.ipv6_acl, local.defaults.iosxr.devices.configuration.snmp_server.groups.ipv6_acl, null) : null
    v3_priv     = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v3" && try(group.v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.groups.v3_security_level, null) == "priv" ? true : null
    v3_auth     = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v3" && try(group.v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.groups.v3_security_level, null) == "auth" ? true : null
    v3_noauth   = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v3" && try(group.v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.groups.v3_security_level, null) == "noauth" ? true : null
    v3_read     = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v3" ? try(group.read_view, local.defaults.iosxr.devices.configuration.snmp_server.groups.read_view, null) : null
    v3_write    = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v3" ? try(group.write_view, local.defaults.iosxr.devices.configuration.snmp_server.groups.write_view, null) : null
    v3_context  = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v3" ? try(group.context, local.defaults.iosxr.devices.configuration.snmp_server.groups.context, null) : null
    v3_notify   = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v3" ? try(group.notify_view, local.defaults.iosxr.devices.configuration.snmp_server.groups.notify_view, null) : null
    v3_ipv4     = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v3" ? try(group.ipv4_acl, local.defaults.iosxr.devices.configuration.snmp_server.groups.ipv4_acl, null) : null
    v3_ipv6     = try(group.version, local.defaults.iosxr.devices.configuration.snmp_server.groups.version, null) == "v3" ? try(group.ipv6_acl, local.defaults.iosxr.devices.configuration.snmp_server.groups.ipv6_acl, null) : null
    }
  ]
  hosts = try(length(local.device_config[each.value.name].snmp_server.hosts) == 0, true) ? null : [for host in local.device_config[each.value.name].snmp_server.hosts : {
    address = try(host.address, local.defaults.iosxr.devices.configuration.snmp_server.hosts.address, null)
    traps_unencrypted_strings = try(length([for t in host.traps : t if try(t.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.encryption_type, null) == "unencrypted"]) == 0, true) ? null : [for t in host.traps : {
      community_string          = try(t.community, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.community, null)
      udp_port                  = try(t.udp_port, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.udp_port, null)
      version_v2c               = try(t.version, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.version, null) == "v2c" ? true : null
      version_v3_security_level = try(t.version, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.version, null) == "v3" ? try(t.v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.v3_security_level, null) : null
    } if try(t.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.encryption_type, null) == "unencrypted"]
    traps_encrypted_default = try(length([for t in host.traps : t if try(t.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.encryption_type, null) == "default"]) == 0, true) ? null : [for t in host.traps : {
      community_string          = try(t.community, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.community, null)
      udp_port                  = try(t.udp_port, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.udp_port, null)
      version_v2c               = try(t.version, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.version, null) == "v2c" ? true : null
      version_v3_security_level = try(t.version, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.version, null) == "v3" ? try(t.v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.v3_security_level, null) : null
    } if try(t.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.encryption_type, null) == "default"]
    traps_encrypted_aes = try(length([for t in host.traps : t if try(t.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.encryption_type, null) == "aes"]) == 0, true) ? null : [for t in host.traps : {
      community_string          = try(t.community, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.community, null)
      udp_port                  = try(t.udp_port, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.udp_port, null)
      version_v2c               = try(t.version, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.version, null) == "v2c" ? true : null
      version_v3_security_level = try(t.version, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.version, null) == "v3" ? try(t.v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.v3_security_level, null) : null
    } if try(t.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.hosts.traps.encryption_type, null) == "aes"]
    informs_unencrypted_strings = try(length([for i in host.informs : i if try(i.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.encryption_type, null) == "unencrypted"]) == 0, true) ? null : [for i in host.informs : {
      community_string          = try(i.community, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.community, null)
      udp_port                  = try(i.udp_port, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.udp_port, null)
      version_v2c               = try(i.version, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.version, null) == "v2c" ? true : null
      version_v3_security_level = try(i.version, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.version, null) == "v3" ? try(i.v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.v3_security_level, null) : null
    } if try(i.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.encryption_type, null) == "unencrypted"]
    informs_encrypted_default = try(length([for i in host.informs : i if try(i.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.encryption_type, null) == "default"]) == 0, true) ? null : [for i in host.informs : {
      community_string          = try(i.community, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.community, null)
      udp_port                  = try(i.udp_port, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.udp_port, null)
      version_v2c               = try(i.version, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.version, null) == "v2c" ? true : null
      version_v3_security_level = try(i.version, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.version, null) == "v3" ? try(i.v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.v3_security_level, null) : null
    } if try(i.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.encryption_type, null) == "default"]
    informs_encrypted_aes = try(length([for i in host.informs : i if try(i.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.encryption_type, null) == "aes"]) == 0, true) ? null : [for i in host.informs : {
      community_string          = try(i.community, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.community, null)
      udp_port                  = try(i.udp_port, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.udp_port, null)
      version_v2c               = try(i.version, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.version, null) == "v2c" ? true : null
      version_v3_security_level = try(i.version, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.version, null) == "v3" ? try(i.v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.v3_security_level, null) : null
    } if try(i.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.hosts.informs.encryption_type, null) == "aes"]
    }
  ]
  users = try(length(local.device_config[each.value.name].snmp_server.users) == 0, true) ? null : [for user in local.device_config[each.value.name].snmp_server.users : {
    user_name                              = try(user.name, local.defaults.iosxr.devices.configuration.snmp_server.users.name, null)
    group_name                             = try(user.group, local.defaults.iosxr.devices.configuration.snmp_server.users.group, null)
    v1                                     = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v1" ? true : null
    v1_ipv4                                = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v1" ? try(user.ipv4_acl, local.defaults.iosxr.devices.configuration.snmp_server.users.ipv4_acl, null) : null
    v1_ipv6                                = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v1" ? try(user.ipv6_acl, local.defaults.iosxr.devices.configuration.snmp_server.users.ipv6_acl, null) : null
    v1_systemowner                         = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v1" ? try(user.systemowner, local.defaults.iosxr.devices.configuration.snmp_server.users.systemowner, null) : null
    v2c                                    = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v2c" ? true : null
    v2c_ipv4                               = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v2c" ? try(user.ipv4_acl, local.defaults.iosxr.devices.configuration.snmp_server.users.ipv4_acl, null) : null
    v2c_ipv6                               = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v2c" ? try(user.ipv6_acl, local.defaults.iosxr.devices.configuration.snmp_server.users.ipv6_acl, null) : null
    v2c_systemowner                        = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v2c" ? try(user.systemowner, local.defaults.iosxr.devices.configuration.snmp_server.users.systemowner, null) : null
    v3                                     = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" ? true : null
    v3_auth_md5_encryption_default         = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" && try(user.v3_authentication.algorithm, null) == "md5" && try(user.v3_authentication.encryption_type, "default") == "default" ? try(user.v3_authentication.password, null) : null
    v3_auth_md5_encryption_aes             = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" && try(user.v3_authentication.algorithm, null) == "md5" && try(user.v3_authentication.encryption_type, "default") == "aes" ? try(user.v3_authentication.password, null) : null
    v3_auth_sha_encryption_default         = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" && try(user.v3_authentication.algorithm, null) == "sha" && try(user.v3_authentication.encryption_type, "default") == "default" ? try(user.v3_authentication.password, null) : null
    v3_auth_sha_encryption_aes             = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" && try(user.v3_authentication.algorithm, null) == "sha" && try(user.v3_authentication.encryption_type, "default") == "aes" ? try(user.v3_authentication.password, null) : null
    v3_auth_sha_256_encryption_default     = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" && try(user.v3_authentication.algorithm, null) == "sha-256" && try(user.v3_authentication.encryption_type, "default") == "default" ? try(user.v3_authentication.password, null) : null
    v3_auth_sha_256_encryption_aes         = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" && try(user.v3_authentication.algorithm, null) == "sha-256" && try(user.v3_authentication.encryption_type, "default") == "aes" ? try(user.v3_authentication.password, null) : null
    v3_auth_sha_512_encryption_default     = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" && try(user.v3_authentication.algorithm, null) == "sha-512" && try(user.v3_authentication.encryption_type, "default") == "default" ? try(user.v3_authentication.password, null) : null
    v3_auth_sha_512_encryption_aes         = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" && try(user.v3_authentication.algorithm, null) == "sha-512" && try(user.v3_authentication.encryption_type, "default") == "aes" ? try(user.v3_authentication.password, null) : null
    v3_ipv4                                = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" ? try(user.ipv4_acl, local.defaults.iosxr.devices.configuration.snmp_server.users.ipv4_acl, null) : null
    v3_ipv6                                = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" ? try(user.ipv6_acl, local.defaults.iosxr.devices.configuration.snmp_server.users.ipv6_acl, null) : null
    v3_priv_aes_aes_128_encryption_default = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" && try(user.v3_privacy.algorithm, null) == "aes-128" && try(user.v3_privacy.encryption_type, "default") == "default" ? try(user.v3_privacy.password, null) : null
    v3_priv_aes_aes_128_encryption_aes     = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" && try(user.v3_privacy.algorithm, null) == "aes-128" && try(user.v3_privacy.encryption_type, "default") == "aes" ? try(user.v3_privacy.password, null) : null
    v3_priv_aes_aes_192_encryption_default = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" && try(user.v3_privacy.algorithm, null) == "aes-192" && try(user.v3_privacy.encryption_type, "default") == "default" ? try(user.v3_privacy.password, null) : null
    v3_priv_aes_aes_192_encryption_aes     = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" && try(user.v3_privacy.algorithm, null) == "aes-192" && try(user.v3_privacy.encryption_type, "default") == "aes" ? try(user.v3_privacy.password, null) : null
    v3_priv_aes_aes_256_encryption_default = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" && try(user.v3_privacy.algorithm, null) == "aes-256" && try(user.v3_privacy.encryption_type, "default") == "default" ? try(user.v3_privacy.password, null) : null
    v3_priv_aes_aes_256_encryption_aes     = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" && try(user.v3_privacy.algorithm, null) == "aes-256" && try(user.v3_privacy.encryption_type, "default") == "aes" ? try(user.v3_privacy.password, null) : null
    v3_systemowner                         = try(user.version, local.defaults.iosxr.devices.configuration.snmp_server.users.version, null) == "v3" ? try(user.systemowner, local.defaults.iosxr.devices.configuration.snmp_server.users.systemowner, null) : null
    }
  ]
  views = try(length(local.device_config[each.value.name].snmp_server.views) == 0, true) ? null : [for view in local.device_config[each.value.name].snmp_server.views : {
    view_name = try(view.name, local.defaults.iosxr.devices.configuration.snmp_server.views.name, null)
    mib_view_families = try(length(view.mibs) == 0, true) ? null : [for mib in view.mibs : {
      name     = try(mib.id, local.defaults.iosxr.devices.configuration.snmp_server.views.mibs.id, null)
      excluded = try(mib.scope, local.defaults.iosxr.devices.configuration.snmp_server.views.mibs.scope, "included") == "excluded" ? true : null
      included = try(mib.scope, local.defaults.iosxr.devices.configuration.snmp_server.views.mibs.scope, "included") == "included" ? true : null
      }
    ]
    }
  ]
}

##### SNMP Server VRFs #####

locals {
  snmp_server_vrfs = flatten([
    for device in local.devices : [
      for vrf in try(local.device_config[device.name].snmp_server.vrfs, []) : {
        key         = format("%s/%s", device.name, vrf.vrf)
        device_name = device.name
        vrf_name    = try(vrf.vrf, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.vrf, null)
        hosts = try(length(vrf.hosts) == 0, true) ? null : [for host in vrf.hosts : {
          address = try(host.address, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.address, null)
          traps_unencrypted_strings = try(length([for t in host.traps : t if try(t.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.encryption_type, null) == "unencrypted"]) == 0, true) ? null : [for t in host.traps : {
            community_string          = try(t.community, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.community, null)
            udp_port                  = try(t.udp_port, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.udp_port, "default")
            version_v2c               = try(t.version, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.version, null) == "v2c" ? true : null
            version_v3_security_level = try(t.version, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.version, null) == "v3" ? try(t.v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.v3_security_level, null) : null
          } if try(t.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.encryption_type, null) == "unencrypted"]
          traps_encrypted_default = try(length([for t in host.traps : t if try(t.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.encryption_type, null) == "default"]) == 0, true) ? null : [for t in host.traps : {
            community_string          = try(t.community, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.community, null)
            udp_port                  = try(t.udp_port, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.udp_port, "default")
            version_v2c               = try(t.version, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.version, null) == "v2c" ? true : null
            version_v3_security_level = try(t.version, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.version, null) == "v3" ? try(t.v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.v3_security_level, null) : null
          } if try(t.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.encryption_type, null) == "default"]
          traps_encrypted_aes = try(length([for t in host.traps : t if try(t.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.encryption_type, null) == "aes"]) == 0, true) ? null : [for t in host.traps : {
            community_string          = try(t.community, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.community, null)
            udp_port                  = try(t.udp_port, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.udp_port, "default")
            version_v2c               = try(t.version, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.version, null) == "v2c" ? true : null
            version_v3_security_level = try(t.version, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.version, null) == "v3" ? try(t.v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.v3_security_level, null) : null
          } if try(t.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.traps.encryption_type, null) == "aes"]
          informs_unencrypted_strings = try(length([for i in host.informs : i if try(i.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.encryption_type, null) == "unencrypted"]) == 0, true) ? null : [for i in host.informs : {
            community_string          = try(i.community, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.community, null)
            udp_port                  = try(i.udp_port, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.udp_port, "default")
            version_v2c               = try(i.version, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.version, null) == "v2c" ? true : null
            version_v3_security_level = try(i.version, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.version, null) == "v3" ? try(i.v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.v3_security_level, null) : null
          } if try(i.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.encryption_type, null) == "unencrypted"]
          informs_encrypted_default = try(length([for i in host.informs : i if try(i.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.encryption_type, null) == "default"]) == 0, true) ? null : [for i in host.informs : {
            community_string          = try(i.community, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.community, null)
            udp_port                  = try(i.udp_port, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.udp_port, "default")
            version_v2c               = try(i.version, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.version, null) == "v2c" ? true : null
            version_v3_security_level = try(i.version, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.version, null) == "v3" ? try(i.v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.v3_security_level, null) : null
          } if try(i.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.encryption_type, null) == "default"]
          informs_encrypted_aes = try(length([for i in host.informs : i if try(i.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.encryption_type, null) == "aes"]) == 0, true) ? null : [for i in host.informs : {
            community_string          = try(i.community, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.community, null)
            udp_port                  = try(i.udp_port, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.udp_port, "default")
            version_v2c               = try(i.version, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.version, null) == "v2c" ? true : null
            version_v3_security_level = try(i.version, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.version, null) == "v3" ? try(i.v3_security_level, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.v3_security_level, null) : null
          } if try(i.encryption_type, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.hosts.informs.encryption_type, null) == "aes"]
        }]
        contexts = try(length(vrf.contexts) == 0, true) ? null : [for context in vrf.contexts : {
          name = try(context.name, local.defaults.iosxr.devices.configuration.snmp_server.vrfs.contexts.name, null)
        }]
      }
    ]
  ])
}

resource "iosxr_snmp_server_vrf" "snmp_server_vrf" {
  for_each = { for vrf in local.snmp_server_vrfs : vrf.key => vrf }
  device   = each.value.device_name
  vrf_name = each.value.vrf_name
  hosts    = each.value.hosts
  contexts = each.value.contexts
}

##### SNMP Server MIBs #####

locals {
  snmp_server_mibs = flatten([
    for device in local.devices : [
      {
        key                                    = device.name
        device_name                            = device.name
        cbqosmib_cache                         = try(local.device_config[device.name].snmp_server.mibs.cbqosmib_cache, local.defaults.iosxr.devices.configuration.snmp_server.mibs.cbqosmib_cache, null)
        cbqosmib_cache_refresh_time            = try(local.device_config[device.name].snmp_server.mibs.cbqosmib_cache_refresh_time, local.defaults.iosxr.devices.configuration.snmp_server.mibs.cbqosmib_cache_refresh_time, null)
        cbqosmib_cache_service_policy_count    = try(local.device_config[device.name].snmp_server.mibs.cbqosmib_cache_service_policy_count, local.defaults.iosxr.devices.configuration.snmp_server.mibs.cbqosmib_cache_service_policy_count, null)
        cbqosmib_persist                       = try(local.device_config[device.name].snmp_server.mibs.cbqosmib_persist, local.defaults.iosxr.devices.configuration.snmp_server.mibs.cbqosmib_persist, null)
        cbqosmib_member_stats                  = try(local.device_config[device.name].snmp_server.mibs.cbqosmib_member_stats, local.defaults.iosxr.devices.configuration.snmp_server.mibs.cbqosmib_member_stats, null)
        ifindex_persist                        = try(local.device_config[device.name].snmp_server.mibs.ifindex_persist, local.defaults.iosxr.devices.configuration.snmp_server.mibs.ifindex_persist, null)
        trap_link_ietf                         = try(local.device_config[device.name].snmp_server.mibs.trap_link_ietf, local.defaults.iosxr.devices.configuration.snmp_server.mibs.trap_link_ietf, null)
        ifmib_ifalias_long                     = try(local.device_config[device.name].snmp_server.mibs.ifmib_ifalias_long, local.defaults.iosxr.devices.configuration.snmp_server.mibs.ifmib_ifalias_long, null)
        ifmib_stats_cache                      = try(local.device_config[device.name].snmp_server.mibs.ifmib_stats_cache, local.defaults.iosxr.devices.configuration.snmp_server.mibs.ifmib_stats_cache, null)
        ifmib_ipsubscriber                     = try(local.device_config[device.name].snmp_server.mibs.ifmib_ipsubscriber, local.defaults.iosxr.devices.configuration.snmp_server.mibs.ifmib_ipsubscriber, null)
        ifmib_internal_cache_max_duration      = try(local.device_config[device.name].snmp_server.mibs.ifmib_internal_cache_max_duration, local.defaults.iosxr.devices.configuration.snmp_server.mibs.ifmib_internal_cache_max_duration, null)
        rfmib_entphyindex                      = try(local.device_config[device.name].snmp_server.mibs.rfmib_entphyindex, local.defaults.iosxr.devices.configuration.snmp_server.mibs.rfmib_entphyindex, null)
        sensormib_cache                        = try(local.device_config[device.name].snmp_server.mibs.sensormib_cache, local.defaults.iosxr.devices.configuration.snmp_server.mibs.sensormib_cache, null)
        mplstemib_cache_timers_garbage_collect = try(local.device_config[device.name].snmp_server.mibs.mplstemib_cache_timers_garbage_collect, local.defaults.iosxr.devices.configuration.snmp_server.mibs.mplstemib_cache_timers_garbage_collect, null)
        mplstemib_cache_timers_refresh         = try(local.device_config[device.name].snmp_server.mibs.mplstemib_cache_timers_refresh, local.defaults.iosxr.devices.configuration.snmp_server.mibs.mplstemib_cache_timers_refresh, null)
        mplsp2mpmib_cache_timer                = try(local.device_config[device.name].snmp_server.mibs.mplsp2mpmib_cache_timer, local.defaults.iosxr.devices.configuration.snmp_server.mibs.mplsp2mpmib_cache_timer, null)
        frrmib_cache_timer                     = try(local.device_config[device.name].snmp_server.mibs.frrmib_cache_timer, local.defaults.iosxr.devices.configuration.snmp_server.mibs.frrmib_cache_timer, null)
        cmplsteextmib_cache_timer              = try(local.device_config[device.name].snmp_server.mibs.cmplsteextmib_cache_timer, local.defaults.iosxr.devices.configuration.snmp_server.mibs.cmplsteextmib_cache_timer, null)
        cmplsteextstdmib_cache_timer           = try(local.device_config[device.name].snmp_server.mibs.cmplsteextstdmib_cache_timer, local.defaults.iosxr.devices.configuration.snmp_server.mibs.cmplsteextstdmib_cache_timer, null)
        mroutemib_send_all_vrf                 = try(local.device_config[device.name].snmp_server.mibs.mroutemib_send_all_vrf, local.defaults.iosxr.devices.configuration.snmp_server.mibs.mroutemib_send_all_vrf, null)
        notification_log_mib_default           = try(local.device_config[device.name].snmp_server.mibs.notification_log_mib_default, local.defaults.iosxr.devices.configuration.snmp_server.mibs.notification_log_mib_default, null)
        notification_log_mib_global_age_out    = try(local.device_config[device.name].snmp_server.mibs.notification_log_mib_global_age_out, local.defaults.iosxr.devices.configuration.snmp_server.mibs.notification_log_mib_global_age_out, null)
        notification_log_mib_global_size       = try(local.device_config[device.name].snmp_server.mibs.notification_log_mib_global_size, local.defaults.iosxr.devices.configuration.snmp_server.mibs.notification_log_mib_global_size, null)
        notification_log_mib_disable           = try(local.device_config[device.name].snmp_server.mibs.notification_log_mib_disable, local.defaults.iosxr.devices.configuration.snmp_server.mibs.notification_log_mib_disable, null)
        notification_log_mib_size              = try(local.device_config[device.name].snmp_server.mibs.notification_log_mib_size, local.defaults.iosxr.devices.configuration.snmp_server.mibs.notification_log_mib_size, null)
        entityindex_persist                    = try(local.device_config[device.name].snmp_server.mibs.entityindex_persist, local.defaults.iosxr.devices.configuration.snmp_server.mibs.entityindex_persist, null)
        interfaces = try(length(local.device_config[device.name].snmp_server.interfaces) == 0, true) ? null : [
          for intf in local.device_config[device.name].snmp_server.interfaces : {
            interface_name                  = try(intf.name, local.defaults.iosxr.devices.configuration.snmp_server.interfaces.name, null)
            notification_linkupdown_disable = try(intf.notification_linkupdown_disable, local.defaults.iosxr.devices.configuration.snmp_server.interfaces.notification_linkupdown_disable, null)
            notification_linkupdown_enable  = try(intf.notification_linkupdown_enable, local.defaults.iosxr.devices.configuration.snmp_server.interfaces.notification_linkupdown_enable, null)
            index_persistence               = try(intf.index_persistence, local.defaults.iosxr.devices.configuration.snmp_server.interfaces.index_persistence, null)
          }
        ]
      }
    ] if try(local.device_config[device.name].snmp_server.mibs, null) != null || try(local.defaults.iosxr.devices.configuration.snmp_server.mibs, null) != null || try(length(local.device_config[device.name].snmp_server.interfaces) > 0, false)
  ])
}

resource "iosxr_snmp_server_mib" "snmp_server_mib" {
  for_each                               = { for mib in local.snmp_server_mibs : mib.key => mib }
  device                                 = each.value.device_name
  cbqosmib_cache                         = each.value.cbqosmib_cache
  cbqosmib_cache_refresh_time            = each.value.cbqosmib_cache_refresh_time
  cbqosmib_cache_service_policy_count    = each.value.cbqosmib_cache_service_policy_count
  cbqosmib_persist                       = each.value.cbqosmib_persist
  cbqosmib_member_stats                  = each.value.cbqosmib_member_stats
  ifindex_persist                        = each.value.ifindex_persist
  trap_link_ietf                         = each.value.trap_link_ietf
  ifmib_ifalias_long                     = each.value.ifmib_ifalias_long
  ifmib_stats_cache                      = each.value.ifmib_stats_cache
  ifmib_ipsubscriber                     = each.value.ifmib_ipsubscriber
  ifmib_internal_cache_max_duration      = each.value.ifmib_internal_cache_max_duration
  rfmib_entphyindex                      = each.value.rfmib_entphyindex
  sensormib_cache                        = each.value.sensormib_cache
  mplstemib_cache_timers_garbage_collect = each.value.mplstemib_cache_timers_garbage_collect
  mplstemib_cache_timers_refresh         = each.value.mplstemib_cache_timers_refresh
  mplsp2mpmib_cache_timer                = each.value.mplsp2mpmib_cache_timer
  frrmib_cache_timer                     = each.value.frrmib_cache_timer
  cmplsteextmib_cache_timer              = each.value.cmplsteextmib_cache_timer
  cmplsteextstdmib_cache_timer           = each.value.cmplsteextstdmib_cache_timer
  mroutemib_send_all_vrf                 = each.value.mroutemib_send_all_vrf
  notification_log_mib_default           = each.value.notification_log_mib_default
  notification_log_mib_global_age_out    = each.value.notification_log_mib_global_age_out
  notification_log_mib_global_size       = each.value.notification_log_mib_global_size
  notification_log_mib_disable           = each.value.notification_log_mib_disable
  notification_log_mib_size              = each.value.notification_log_mib_size
  entityindex_persist                    = each.value.entityindex_persist
  interfaces                             = each.value.interfaces
}

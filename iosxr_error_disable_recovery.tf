locals {
  error_disable_recovery = flatten([
    for device in local.devices : [
      {
        key                                     = device.name
        device_name                             = device.name
        link_oam_session_down_interval          = try(local.device_config[device.name].error_disable_recovery.link_oam_session_down_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.link_oam_session_down_interval, null)
        link_oam_discovery_timeout_interval     = try(local.device_config[device.name].error_disable_recovery.link_oam_discovery_timeout_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.link_oam_discovery_timeout_interval, null)
        link_oam_capabilities_conflict_interval = try(local.device_config[device.name].error_disable_recovery.link_oam_capabilities_conflict_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.link_oam_capabilities_conflict_interval, null)
        link_oam_miswired_interval              = try(local.device_config[device.name].error_disable_recovery.link_oam_miswired_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.link_oam_miswired_interval, null)
        link_oam_link_fault_interval            = try(local.device_config[device.name].error_disable_recovery.link_oam_link_fault_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.link_oam_link_fault_interval, null)
        link_oam_dying_gasp_interval            = try(local.device_config[device.name].error_disable_recovery.link_oam_dying_gasp_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.link_oam_dying_gasp_interval, null)
        link_oam_critical_event_interval        = try(local.device_config[device.name].error_disable_recovery.link_oam_critical_event_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.link_oam_critical_event_interval, null)
        link_oam_threshold_breached_interval    = try(local.device_config[device.name].error_disable_recovery.link_oam_threshold_breached_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.link_oam_threshold_breached_interval, null)
        stp_bpdu_guard_interval                 = try(local.device_config[device.name].error_disable_recovery.stp_bpdu_guard_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.stp_bpdu_guard_interval, null)
        stp_legacy_bpdu_interval                = try(local.device_config[device.name].error_disable_recovery.stp_legacy_bpdu_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.stp_legacy_bpdu_interval, null)
        cluster_udld_interval                   = try(local.device_config[device.name].error_disable_recovery.cluster_udld_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.cluster_udld_interval, null)
        cluster_minlinks_interval               = try(local.device_config[device.name].error_disable_recovery.cluster_minlinks_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.cluster_minlinks_interval, null)
        udld_unidirectional_interval            = try(local.device_config[device.name].error_disable_recovery.udld_unidirectional_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.udld_unidirectional_interval, null)
        udld_neighbor_mismatch_interval         = try(local.device_config[device.name].error_disable_recovery.udld_neighbor_mismatch_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.udld_neighbor_mismatch_interval, null)
        udld_timeout_interval                   = try(local.device_config[device.name].error_disable_recovery.udld_timeout_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.udld_timeout_interval, null)
        udld_loopback_interval                  = try(local.device_config[device.name].error_disable_recovery.udld_loopback_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.udld_loopback_interval, null)
        pvrst_pvid_mismatch_interval            = try(local.device_config[device.name].error_disable_recovery.pvrst_pvid_mismatch_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.pvrst_pvid_mismatch_interval, null)
        l2vpn_bport_mac_move_interval           = try(local.device_config[device.name].error_disable_recovery.l2vpn_bport_mac_move_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.l2vpn_bport_mac_move_interval, null)
        ot_track_state_change_interval          = try(local.device_config[device.name].error_disable_recovery.ot_track_state_change_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.ot_track_state_change_interval, null)
        link_oam_dampening_interval             = try(local.device_config[device.name].error_disable_recovery.link_oam_dampening_interval, local.defaults.iosxr.devices.configuration.error_disable_recovery.link_oam_dampening_interval, null)
      }
    ]
    if try(local.device_config[device.name].error_disable_recovery, null) != null || try(local.defaults.iosxr.devices.configuration.error_disable_recovery, null) != null
  ])
}

resource "iosxr_error_disable_recovery" "error_disable_recovery" {
  for_each                                = { for error_disable_recovery in local.error_disable_recovery : error_disable_recovery.key => error_disable_recovery }
  device                                  = each.value.device_name
  link_oam_session_down_interval          = each.value.link_oam_session_down_interval
  link_oam_discovery_timeout_interval     = each.value.link_oam_discovery_timeout_interval
  link_oam_capabilities_conflict_interval = each.value.link_oam_capabilities_conflict_interval
  link_oam_miswired_interval              = each.value.link_oam_miswired_interval
  link_oam_link_fault_interval            = each.value.link_oam_link_fault_interval
  link_oam_dying_gasp_interval            = each.value.link_oam_dying_gasp_interval
  link_oam_critical_event_interval        = each.value.link_oam_critical_event_interval
  link_oam_threshold_breached_interval    = each.value.link_oam_threshold_breached_interval
  stp_bpdu_guard_interval                 = each.value.stp_bpdu_guard_interval
  stp_legacy_bpdu_interval                = each.value.stp_legacy_bpdu_interval
  cluster_udld_interval                   = each.value.cluster_udld_interval
  cluster_minlinks_interval               = each.value.cluster_minlinks_interval
  udld_unidirectional_interval            = each.value.udld_unidirectional_interval
  udld_neighbor_mismatch_interval         = each.value.udld_neighbor_mismatch_interval
  udld_timeout_interval                   = each.value.udld_timeout_interval
  udld_loopback_interval                  = each.value.udld_loopback_interval
  pvrst_pvid_mismatch_interval            = each.value.pvrst_pvid_mismatch_interval
  l2vpn_bport_mac_move_interval           = each.value.l2vpn_bport_mac_move_interval
  ot_track_state_change_interval          = each.value.ot_track_state_change_interval
  link_oam_dampening_interval             = each.value.link_oam_dampening_interval
}

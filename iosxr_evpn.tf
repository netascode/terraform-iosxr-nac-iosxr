##### EVPN #####

locals {
  evpn = { for device in local.devices : device.name => {
    bgp_rd = try(local.device_config[device.name].evpn.bgp.rd, local.defaults.iosxr.devices.configuration.evpn.bgp.rd, null) != null ? provider::utils::normalize_bgp_rd(
      try(local.device_config[device.name].evpn.bgp.rd, local.defaults.iosxr.devices.configuration.evpn.bgp.rd)
    ) : null
    cost_out                                                  = try(local.device_config[device.name].evpn.cost_out, local.defaults.iosxr.devices.configuration.evpn.cost_out, null)
    enforce_mtu_match                                         = try(local.device_config[device.name].evpn.mtu_match, local.defaults.iosxr.devices.configuration.evpn.mtu_match, null) == "enforce" ? true : null
    ethernet_segment_type_one_auto_generation_disable         = try(local.device_config[device.name].evpn.ethernet_segment.type_one_auto_generation_disable, local.defaults.iosxr.devices.configuration.evpn.ethernet_segment.type_one_auto_generation_disable, null)
    host_ipv4_duplicate_detection_disable                     = try(local.device_config[device.name].evpn.duplicate_detection.ipv4.disable, local.defaults.iosxr.devices.configuration.evpn.duplicate_detection.ipv4.disable, null)
    host_ipv4_duplicate_detection_freeze_time                 = try(local.device_config[device.name].evpn.duplicate_detection.ipv4.freeze_time, local.defaults.iosxr.devices.configuration.evpn.duplicate_detection.ipv4.freeze_time, null)
    host_ipv4_duplicate_detection_move_count                  = try(local.device_config[device.name].evpn.duplicate_detection.ipv4.move_count, local.defaults.iosxr.devices.configuration.evpn.duplicate_detection.ipv4.move_count, null)
    host_ipv4_duplicate_detection_move_interval               = try(local.device_config[device.name].evpn.duplicate_detection.ipv4.move_interval, local.defaults.iosxr.devices.configuration.evpn.duplicate_detection.ipv4.move_interval, null)
    host_ipv4_duplicate_detection_reset_freeze_count_interval = try(local.device_config[device.name].evpn.duplicate_detection.ipv4.reset_freeze_count_interval, local.defaults.iosxr.devices.configuration.evpn.duplicate_detection.ipv4.reset_freeze_count_interval, null)
    host_ipv4_duplicate_detection_retry_count                 = try(tostring(local.device_config[device.name].evpn.duplicate_detection.ipv4.retry_count), tostring(local.defaults.iosxr.devices.configuration.evpn.duplicate_detection.ipv4.retry_count), null)
    host_ipv6_duplicate_detection_disable                     = try(local.device_config[device.name].evpn.duplicate_detection.ipv6.disable, local.defaults.iosxr.devices.configuration.evpn.duplicate_detection.ipv6.disable, null)
    host_ipv6_duplicate_detection_freeze_time                 = try(local.device_config[device.name].evpn.duplicate_detection.ipv6.freeze_time, local.defaults.iosxr.devices.configuration.evpn.duplicate_detection.ipv6.freeze_time, null)
    host_ipv6_duplicate_detection_move_count                  = try(local.device_config[device.name].evpn.duplicate_detection.ipv6.move_count, local.defaults.iosxr.devices.configuration.evpn.duplicate_detection.ipv6.move_count, null)
    host_ipv6_duplicate_detection_move_interval               = try(local.device_config[device.name].evpn.duplicate_detection.ipv6.move_interval, local.defaults.iosxr.devices.configuration.evpn.duplicate_detection.ipv6.move_interval, null)
    host_ipv6_duplicate_detection_reset_freeze_count_interval = try(local.device_config[device.name].evpn.duplicate_detection.ipv6.reset_freeze_count_interval, local.defaults.iosxr.devices.configuration.evpn.duplicate_detection.ipv6.reset_freeze_count_interval, null)
    host_ipv6_duplicate_detection_retry_count                 = try(tostring(local.device_config[device.name].evpn.duplicate_detection.ipv6.retry_count), tostring(local.defaults.iosxr.devices.configuration.evpn.duplicate_detection.ipv6.retry_count), null)
    ignore_mtu_mismatch                                       = try(local.device_config[device.name].evpn.mtu_match, local.defaults.iosxr.devices.configuration.evpn.mtu_match, null) == "ignore" ? true : null
    load_balancing_flow_label_static                          = try(local.device_config[device.name].evpn.load_balancing.flow_label_static, local.defaults.iosxr.devices.configuration.evpn.load_balancing.flow_label_static, null)
    logging_df_election                                       = try(local.device_config[device.name].evpn.logging_df_election, local.defaults.iosxr.devices.configuration.evpn.logging_df_election, null)
    source_interface                                          = try(local.device_config[device.name].evpn.source_interface, local.defaults.iosxr.devices.configuration.evpn.source_interface, null)
    srv6                                                      = try(local.device_config[device.name].evpn.srv6.enabled, local.defaults.iosxr.devices.configuration.evpn.srv6.enabled, null)
    srv6_usid_allocation_wide_local_id_block                  = try(local.device_config[device.name].evpn.srv6.usid_allocation_wide_local_id_block, local.defaults.iosxr.devices.configuration.evpn.srv6.usid_allocation_wide_local_id_block, null)
    staggered_bringup_timer                                   = try(local.device_config[device.name].evpn.staggered_bringup_timer, local.defaults.iosxr.devices.configuration.evpn.staggered_bringup_timer, null)
    startup_cost_in                                           = try(local.device_config[device.name].evpn.startup_cost_in, local.defaults.iosxr.devices.configuration.evpn.startup_cost_in, null)
    timers_ac_debounce                                        = try(local.device_config[device.name].evpn.timers.ac_debounce, local.defaults.iosxr.devices.configuration.evpn.timers.ac_debounce, null)
    timers_backup_replacement_delay                           = try(local.device_config[device.name].evpn.timers.backup_replacement_delay, local.defaults.iosxr.devices.configuration.evpn.timers.backup_replacement_delay, null)
    timers_carving                                            = try(local.device_config[device.name].evpn.timers.carving, local.defaults.iosxr.devices.configuration.evpn.timers.carving, null)
    timers_mac_postpone                                       = try(local.device_config[device.name].evpn.timers.mac_postpone, local.defaults.iosxr.devices.configuration.evpn.timers.mac_postpone, null)
    timers_peering                                            = try(local.device_config[device.name].evpn.timers.peering, local.defaults.iosxr.devices.configuration.evpn.timers.peering, null)
    timers_recovery                                           = try(local.device_config[device.name].evpn.timers.recovery, local.defaults.iosxr.devices.configuration.evpn.timers.recovery, null)
    transmit_l2_mtu                                           = try(local.device_config[device.name].evpn.transmit_mtu, local.defaults.iosxr.devices.configuration.evpn.transmit_mtu, null) == "layer_2" ? true : null
    transmit_mtu_zero                                         = try(local.device_config[device.name].evpn.transmit_mtu, local.defaults.iosxr.devices.configuration.evpn.transmit_mtu, null) == "zero" ? true : null
    virtual_access_evi_ethernet_segment_bgp_rt = try(
      provider::utils::normalize_mac(
        try(local.device_config[device.name].evpn.virtual.access_evi.ethernet_segment.route_target, local.defaults.iosxr.devices.configuration.evpn.virtual.access_evi.ethernet_segment.route_target),
        "colon"
      ),
      null
    )
    virtual_access_evi_ethernet_segment_esi_zero = try(local.device_config[device.name].evpn.virtual.access_evi.ethernet_segment.esi_zero, local.defaults.iosxr.devices.configuration.evpn.virtual.access_evi.ethernet_segment.esi_zero, null)
    groups = try(length(local.device_config[device.name].evpn.groups) == 0, true) ? null : [for group in local.device_config[device.name].evpn.groups : {
      group_id = try(group.id, local.defaults.iosxr.devices.configuration.evpn.groups.id, null)
      core_interfaces = try(length(group.core_interfaces) == 0, true) ? null : [for core_interface in group.core_interfaces : {
        interface_name = try(core_interface.name, local.defaults.iosxr.devices.configuration.evpn.groups.core_interfaces.name, null)
      }]
    }]
    srv6_locators = try(length(local.device_config[device.name].evpn.srv6.locators) == 0, true) ? null : [for locator in local.device_config[device.name].evpn.srv6.locators : {
      locator_name                        = try(locator.name, local.defaults.iosxr.devices.configuration.evpn.srv6.locators.name, null)
      usid_allocation_wide_local_id_block = try(locator.usid_allocation_wide_local_id_block, local.defaults.iosxr.devices.configuration.evpn.srv6.locators.usid_allocation_wide_local_id_block, null)
    }]
    virtual_neighbors = try(length(local.device_config[device.name].evpn.virtual.neighbors) == 0, true) ? null : [for neighbor in local.device_config[device.name].evpn.virtual.neighbors : {
      address = try(neighbor.address, local.defaults.iosxr.devices.configuration.evpn.virtual.neighbors.address, null)
      pw_id   = try(neighbor.pw_id, local.defaults.iosxr.devices.configuration.evpn.virtual.neighbors.pw_id, null)
      ethernet_segment_bgp_rt = try(
        provider::utils::normalize_mac(
          try(neighbor.ethernet_segment.route_target, local.defaults.iosxr.devices.configuration.evpn.virtual.neighbors.ethernet_segment.route_target),
          "colon"
        ),
        null
      )
      ethernet_segment_esi_zero                                       = try(neighbor.ethernet_segment.esi_zero, local.defaults.iosxr.devices.configuration.evpn.virtual.neighbors.ethernet_segment.esi_zero, null)
      ethernet_segment_service_carving_hrw                            = try(neighbor.ethernet_segment.service_carving_hrw, local.defaults.iosxr.devices.configuration.evpn.virtual.neighbors.ethernet_segment.service_carving_hrw, null)
      ethernet_segment_service_carving_manual_primary                 = try(neighbor.ethernet_segment.service_carving_manual.primary, local.defaults.iosxr.devices.configuration.evpn.virtual.neighbors.ethernet_segment.service_carving_manual.primary, null)
      ethernet_segment_service_carving_manual_secondary               = try(neighbor.ethernet_segment.service_carving_manual.secondary, local.defaults.iosxr.devices.configuration.evpn.virtual.neighbors.ethernet_segment.service_carving_manual.secondary, null)
      ethernet_segment_service_carving_multicast_hrw_g                = try(neighbor.ethernet_segment.service_carving_multicast.hrw_g, local.defaults.iosxr.devices.configuration.evpn.virtual.neighbors.ethernet_segment.service_carving_multicast.hrw_g, null)
      ethernet_segment_service_carving_multicast_hrw_s_g              = try(neighbor.ethernet_segment.service_carving_multicast.hrw_s_g, local.defaults.iosxr.devices.configuration.evpn.virtual.neighbors.ethernet_segment.service_carving_multicast.hrw_s_g, null)
      ethernet_segment_service_carving_preference_based_access_driven = try(neighbor.ethernet_segment.service_carving_preference.access_driven, local.defaults.iosxr.devices.configuration.evpn.virtual.neighbors.ethernet_segment.service_carving_preference.access_driven, null)
      ethernet_segment_service_carving_preference_based_weight        = try(neighbor.ethernet_segment.service_carving_preference.weight, local.defaults.iosxr.devices.configuration.evpn.virtual.neighbors.ethernet_segment.service_carving_preference.weight, null)
      timers_ac_debounce                                              = try(neighbor.timers.ac_debounce, local.defaults.iosxr.devices.configuration.evpn.virtual.neighbors.timers.ac_debounce, null)
      timers_carving                                                  = try(neighbor.timers.carving, local.defaults.iosxr.devices.configuration.evpn.virtual.neighbors.timers.carving, null)
      timers_peering                                                  = try(neighbor.timers.peering, local.defaults.iosxr.devices.configuration.evpn.virtual.neighbors.timers.peering, null)
      timers_recovery                                                 = try(neighbor.timers.recovery, local.defaults.iosxr.devices.configuration.evpn.virtual.neighbors.timers.recovery, null)
    }]
    virtual_vfis = try(length(local.device_config[device.name].evpn.virtual.vfis) == 0, true) ? null : [for vfi in local.device_config[device.name].evpn.virtual.vfis : {
      vfi_name = try(vfi.name, local.defaults.iosxr.devices.configuration.evpn.virtual.vfis.name, null)
      ethernet_segment_bgp_rt = try(
        provider::utils::normalize_mac(
          try(vfi.ethernet_segment.route_target, local.defaults.iosxr.devices.configuration.evpn.virtual.vfis.ethernet_segment.route_target),
          "colon"
        ),
        null
      )
      ethernet_segment_esi_zero                                       = try(vfi.ethernet_segment.esi_zero, local.defaults.iosxr.devices.configuration.evpn.virtual.vfis.ethernet_segment.esi_zero, null)
      ethernet_segment_service_carving_hrw                            = try(vfi.ethernet_segment.service_carving_hrw, local.defaults.iosxr.devices.configuration.evpn.virtual.vfis.ethernet_segment.service_carving_hrw, null)
      ethernet_segment_service_carving_manual_primary                 = try(vfi.ethernet_segment.service_carving_manual.primary, local.defaults.iosxr.devices.configuration.evpn.virtual.vfis.ethernet_segment.service_carving_manual.primary, null)
      ethernet_segment_service_carving_manual_secondary               = try(vfi.ethernet_segment.service_carving_manual.secondary, local.defaults.iosxr.devices.configuration.evpn.virtual.vfis.ethernet_segment.service_carving_manual.secondary, null)
      ethernet_segment_service_carving_preference_based_access_driven = try(vfi.ethernet_segment.service_carving_preference.access_driven, local.defaults.iosxr.devices.configuration.evpn.virtual.vfis.ethernet_segment.service_carving_preference.access_driven, null)
      ethernet_segment_service_carving_preference_based_weight        = try(vfi.ethernet_segment.service_carving_preference.weight, local.defaults.iosxr.devices.configuration.evpn.virtual.vfis.ethernet_segment.service_carving_preference.weight, null)
      timers_ac_debounce                                              = try(vfi.timers.ac_debounce, local.defaults.iosxr.devices.configuration.evpn.virtual.vfis.timers.ac_debounce, null)
      timers_carving                                                  = try(vfi.timers.carving, local.defaults.iosxr.devices.configuration.evpn.virtual.vfis.timers.carving, null)
      timers_peering                                                  = try(vfi.timers.peering, local.defaults.iosxr.devices.configuration.evpn.virtual.vfis.timers.peering, null)
      timers_recovery                                                 = try(vfi.timers.recovery, local.defaults.iosxr.devices.configuration.evpn.virtual.vfis.timers.recovery, null)
    }]
  } if try(local.device_config[device.name].evpn, null) != null || try(local.defaults.iosxr.devices.configuration.evpn, null) != null }
}

resource "iosxr_evpn" "evpn" {
  for_each                                                  = local.evpn
  device                                                    = each.key
  bgp_rd_two_byte_as_number                                 = try(each.value.bgp_rd.format == "two_byte_as" ? each.value.bgp_rd.as_number : null, null)
  bgp_rd_two_byte_as_index                                  = try(each.value.bgp_rd.format == "two_byte_as" ? each.value.bgp_rd.assigned_number : null, null)
  bgp_rd_four_byte_as_number                                = try(each.value.bgp_rd.format == "four_byte_as" ? each.value.bgp_rd.as_number : null, null)
  bgp_rd_four_byte_as_index                                 = try(each.value.bgp_rd.format == "four_byte_as" ? each.value.bgp_rd.assigned_number : null, null)
  bgp_rd_ipv4_address                                       = try(each.value.bgp_rd.format == "ipv4_address" ? each.value.bgp_rd.ipv4_address : null, null)
  bgp_rd_ipv4_address_index                                 = try(each.value.bgp_rd.format == "ipv4_address" ? each.value.bgp_rd.assigned_number : null, null)
  cost_out                                                  = each.value.cost_out
  enforce_mtu_match                                         = each.value.enforce_mtu_match
  ethernet_segment_type_one_auto_generation_disable         = each.value.ethernet_segment_type_one_auto_generation_disable
  host_ipv4_duplicate_detection_disable                     = each.value.host_ipv4_duplicate_detection_disable
  host_ipv4_duplicate_detection_freeze_time                 = each.value.host_ipv4_duplicate_detection_freeze_time
  host_ipv4_duplicate_detection_move_count                  = each.value.host_ipv4_duplicate_detection_move_count
  host_ipv4_duplicate_detection_move_interval               = each.value.host_ipv4_duplicate_detection_move_interval
  host_ipv4_duplicate_detection_reset_freeze_count_interval = each.value.host_ipv4_duplicate_detection_reset_freeze_count_interval
  host_ipv4_duplicate_detection_retry_count                 = each.value.host_ipv4_duplicate_detection_retry_count
  host_ipv6_duplicate_detection_disable                     = each.value.host_ipv6_duplicate_detection_disable
  host_ipv6_duplicate_detection_freeze_time                 = each.value.host_ipv6_duplicate_detection_freeze_time
  host_ipv6_duplicate_detection_move_count                  = each.value.host_ipv6_duplicate_detection_move_count
  host_ipv6_duplicate_detection_move_interval               = each.value.host_ipv6_duplicate_detection_move_interval
  host_ipv6_duplicate_detection_reset_freeze_count_interval = each.value.host_ipv6_duplicate_detection_reset_freeze_count_interval
  host_ipv6_duplicate_detection_retry_count                 = each.value.host_ipv6_duplicate_detection_retry_count
  ignore_mtu_mismatch                                       = each.value.ignore_mtu_mismatch
  load_balancing_flow_label_static                          = each.value.load_balancing_flow_label_static
  logging_df_election                                       = each.value.logging_df_election
  source_interface                                          = each.value.source_interface
  srv6                                                      = each.value.srv6
  srv6_usid_allocation_wide_local_id_block                  = each.value.srv6_usid_allocation_wide_local_id_block
  staggered_bringup_timer                                   = each.value.staggered_bringup_timer
  startup_cost_in                                           = each.value.startup_cost_in
  timers_ac_debounce                                        = each.value.timers_ac_debounce
  timers_backup_replacement_delay                           = each.value.timers_backup_replacement_delay
  timers_carving                                            = each.value.timers_carving
  timers_mac_postpone                                       = each.value.timers_mac_postpone
  timers_peering                                            = each.value.timers_peering
  timers_recovery                                           = each.value.timers_recovery
  transmit_l2_mtu                                           = each.value.transmit_l2_mtu
  transmit_mtu_zero                                         = each.value.transmit_mtu_zero
  virtual_access_evi_ethernet_segment_bgp_rt                = each.value.virtual_access_evi_ethernet_segment_bgp_rt
  virtual_access_evi_ethernet_segment_esi_zero              = each.value.virtual_access_evi_ethernet_segment_esi_zero
  groups                                                    = each.value.groups
  srv6_locators                                             = each.value.srv6_locators
  virtual_neighbors                                         = each.value.virtual_neighbors
  virtual_vfis                                              = each.value.virtual_vfis

  depends_on = [
    iosxr_route_policy.route_policy
  ]
}

##### EVPN EVI #####

locals {
  evpn_evis = flatten([
    for device in local.devices : [
      for evi in try(local.device_config[device.name].evpn.evis, []) : {
        key                              = format("%s/%s", device.name, evi.id)
        device_name                      = device.name
        vpn_id                           = try(evi.id, local.defaults.iosxr.devices.configuration.evpn.evis.id, null)
        description                      = try(evi.description, local.defaults.iosxr.devices.configuration.evpn.evis.description, null)
        load_balancing                   = try(evi.load_balancing.enabled, local.defaults.iosxr.devices.configuration.evpn.evis.load_balancing.enabled, null)
        load_balancing_flow_label_static = try(evi.load_balancing.flow_label_static, local.defaults.iosxr.devices.configuration.evpn.evis.load_balancing.flow_label_static, null)
        bgp_rd = try(evi.bgp.rd, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.rd, null) != null ? provider::utils::normalize_bgp_rd(
          try(evi.bgp.rd, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.rd)
        ) : null
        bgp_route_policy_import = try(evi.bgp.import_route_policy, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.import_route_policy, null)
        bgp_route_policy_export = try(evi.bgp.export_route_policy, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.export_route_policy, null)
        bgp_route_target_import = try(evi.bgp.route_target_imports, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.route_target_imports, null) != null ? [
          for rt in try(evi.bgp.route_target_imports, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.route_target_imports) : provider::utils::normalize_bgp_rt(rt)
        ] : null
        bgp_route_target_export = try(evi.bgp.route_target_exports, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.route_target_exports, null) != null ? [
          for rt in try(evi.bgp.route_target_exports, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.route_target_exports) : provider::utils::normalize_bgp_rt(rt)
        ] : null
        advertise_mac               = try(evi.advertise_mac, local.defaults.iosxr.devices.configuration.evpn.evis.advertise_mac, null)
        unknown_unicast_suppression = try(evi.unknown_unicast_suppression, local.defaults.iosxr.devices.configuration.evpn.evis.unknown_unicast_suppression, null)
        control_word_disable        = try(evi.control_word_disable, local.defaults.iosxr.devices.configuration.evpn.evis.control_word_disable, null)
        etree                       = try(evi.etree, local.defaults.iosxr.devices.configuration.evpn.evis.etree, null) != null ? true : null
        etree_leaf                  = try(evi.etree, local.defaults.iosxr.devices.configuration.evpn.evis.etree, null) == "leaf" ? true : null
        etree_rt_leaf               = try(evi.etree, local.defaults.iosxr.devices.configuration.evpn.evis.etree, null) == "rt_leaf" ? true : null
      }
    ]
  ])
}

resource "iosxr_evpn_evi" "evpn_evi" {
  for_each                         = { for evi in local.evpn_evis : evi.key => evi }
  device                           = each.value.device_name
  vpn_id                           = each.value.vpn_id
  description                      = each.value.description
  load_balancing                   = each.value.load_balancing
  load_balancing_flow_label_static = each.value.load_balancing_flow_label_static
  bgp_rd_two_byte_as_number        = try(each.value.bgp_rd.format == "two_byte_as" ? each.value.bgp_rd.as_number : null, null)
  bgp_rd_two_byte_as_index         = try(each.value.bgp_rd.format == "two_byte_as" ? each.value.bgp_rd.assigned_number : null, null)
  bgp_rd_four_byte_as_number       = try(each.value.bgp_rd.format == "four_byte_as" ? each.value.bgp_rd.as_number : null, null)
  bgp_rd_four_byte_as_index        = try(each.value.bgp_rd.format == "four_byte_as" ? each.value.bgp_rd.assigned_number : null, null)
  bgp_rd_ipv4_address              = try(each.value.bgp_rd.format == "ipv4_address" ? each.value.bgp_rd.ipv4_address : null, null)
  bgp_rd_ipv4_address_index        = try(each.value.bgp_rd.format == "ipv4_address" ? each.value.bgp_rd.assigned_number : null, null)
  bgp_route_policy_import          = each.value.bgp_route_policy_import
  bgp_route_policy_export          = each.value.bgp_route_policy_export
  advertise_mac                    = each.value.advertise_mac
  unknown_unicast_suppression      = each.value.unknown_unicast_suppression
  control_word_disable             = each.value.control_word_disable
  etree                            = each.value.etree
  etree_leaf                       = each.value.etree_leaf
  etree_rt_leaf                    = each.value.etree_rt_leaf
  bgp_route_target_import_two_byte_as_format = try(length([for rt in each.value.bgp_route_target_import : rt if rt.format == "two_byte_as"]) == 0, true) ? null : [
    for rt in each.value.bgp_route_target_import : {
      as_number       = rt.as_number
      assigned_number = rt.assigned_number
    } if rt.format == "two_byte_as"
  ]
  bgp_route_target_import_four_byte_as_format = try(length([for rt in each.value.bgp_route_target_import : rt if rt.format == "four_byte_as"]) == 0, true) ? null : [
    for rt in each.value.bgp_route_target_import : {
      as_number       = rt.as_number
      assigned_number = rt.assigned_number
    } if rt.format == "four_byte_as"
  ]
  bgp_route_target_import_ipv4_address_format = try(length([for rt in each.value.bgp_route_target_import : rt if rt.format == "ipv4_address"]) == 0, true) ? null : [
    for rt in each.value.bgp_route_target_import : {
      ipv4_address    = rt.ipv4_address
      assigned_number = rt.assigned_number
    } if rt.format == "ipv4_address"
  ]
  bgp_route_target_export_two_byte_as_format = try(length([for rt in each.value.bgp_route_target_export : rt if rt.format == "two_byte_as"]) == 0, true) ? null : [
    for rt in each.value.bgp_route_target_export : {
      as_number       = rt.as_number
      assigned_number = rt.assigned_number
    } if rt.format == "two_byte_as"
  ]
  bgp_route_target_export_four_byte_as_format = try(length([for rt in each.value.bgp_route_target_export : rt if rt.format == "four_byte_as"]) == 0, true) ? null : [
    for rt in each.value.bgp_route_target_export : {
      as_number       = rt.as_number
      assigned_number = rt.assigned_number
    } if rt.format == "four_byte_as"
  ]
  bgp_route_target_export_ipv4_address_format = try(length([for rt in each.value.bgp_route_target_export : rt if rt.format == "ipv4_address"]) == 0, true) ? null : [
    for rt in each.value.bgp_route_target_export : {
      ipv4_address    = rt.ipv4_address
      assigned_number = rt.assigned_number
    } if rt.format == "ipv4_address"
  ]

  depends_on = [
    iosxr_evpn.evpn
  ]
}

##### EVPN Interface #####

locals {
  evpn_interfaces = flatten([
    for device in local.devices : [
      for intf in try(local.device_config[device.name].evpn.interfaces, []) : {
        key                                                             = format("%s/%s", device.name, intf.name)
        device_name                                                     = device.name
        interface_name                                                  = intf.name
        core_isolation_group                                            = try(intf.core_isolation_group, local.defaults.iosxr.devices.configuration.evpn.interfaces.core_isolation_group, null)
        timers_peering                                                  = try(intf.timers.peering, local.defaults.iosxr.devices.configuration.evpn.interfaces.timers.peering, null)
        timers_recovery                                                 = try(intf.timers.recovery, local.defaults.iosxr.devices.configuration.evpn.interfaces.timers.recovery, null)
        timers_carving                                                  = try(intf.timers.carving, local.defaults.iosxr.devices.configuration.evpn.interfaces.timers.carving, null)
        timers_ac_debounce                                              = try(intf.timers.ac_debounce, local.defaults.iosxr.devices.configuration.evpn.interfaces.timers.ac_debounce, null)
        ethernet_segment_esi_zero                                       = try(intf.ethernet_segment.esi_zero, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.esi_zero, null)
        ethernet_segment_load_balancing_mode_all_active                 = try(intf.ethernet_segment.load_balancing_mode, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.load_balancing_mode, null) == "all-active" ? true : null
        ethernet_segment_load_balancing_mode_port_active                = try(intf.ethernet_segment.load_balancing_mode, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.load_balancing_mode, null) == "port-active" ? true : null
        ethernet_segment_load_balancing_mode_single_active              = try(intf.ethernet_segment.load_balancing_mode, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.load_balancing_mode, null) == "single-active" ? true : null
        ethernet_segment_load_balancing_mode_single_flow_active         = try(intf.ethernet_segment.load_balancing_mode, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.load_balancing_mode, null) == "single-flow-active" ? true : null
        ethernet_segment_force_single_homed                             = try(intf.ethernet_segment.force_single_homed, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.force_single_homed, null)
        ethernet_segment_service_carving_hrw                            = try(intf.ethernet_segment.service_carving_hrw, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.service_carving_hrw, null)
        ethernet_segment_service_carving_manual_primary                 = try(intf.ethernet_segment.service_carving_manual.primary, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.service_carving_manual.primary, null)
        ethernet_segment_service_carving_manual_secondary               = try(intf.ethernet_segment.service_carving_manual.secondary, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.service_carving_manual.secondary, null)
        ethernet_segment_service_carving_multicast_hrw_g                = try(intf.ethernet_segment.service_carving_multicast.hrw_g, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.service_carving_multicast.hrw_g, null)
        ethernet_segment_service_carving_multicast_hrw_s_g              = try(intf.ethernet_segment.service_carving_multicast.hrw_s_g, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.service_carving_multicast.hrw_s_g, null)
        ethernet_segment_service_carving_preference_based_weight        = try(intf.ethernet_segment.service_carving_preference.weight, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.service_carving_preference.weight, null)
        ethernet_segment_service_carving_preference_based_access_driven = try(intf.ethernet_segment.service_carving_preference.access_driven, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.service_carving_preference.access_driven, null)
        ethernet_segment_bgp_rt = try(
          provider::utils::normalize_mac(
            try(intf.ethernet_segment.route_target, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.route_target),
            "colon"
          ),
          null
        )
        ethernet_segment_convergence_reroute          = try(intf.ethernet_segment.convergence.reroute, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.convergence.reroute, null)
        ethernet_segment_convergence_mac_mobility     = try(intf.ethernet_segment.convergence.mac_mobility, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.convergence.mac_mobility, null)
        ethernet_segment_convergence_nexthop_tracking = try(intf.ethernet_segment.convergence.nexthop_tracking, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.convergence.nexthop_tracking, null)
        access_signal_bundle_down                     = try(intf.access_signal_bundle_down, local.defaults.iosxr.devices.configuration.evpn.interfaces.access_signal_bundle_down, null)
      }
    ]
  ])
}

resource "iosxr_evpn_interface" "evpn_interface" {
  for_each                                                        = { for intf in local.evpn_interfaces : intf.key => intf }
  device                                                          = each.value.device_name
  interface_name                                                  = each.value.interface_name
  core_isolation_group                                            = each.value.core_isolation_group
  timers_peering                                                  = each.value.timers_peering
  timers_recovery                                                 = each.value.timers_recovery
  timers_carving                                                  = each.value.timers_carving
  timers_ac_debounce                                              = each.value.timers_ac_debounce
  ethernet_segment_esi_zero                                       = each.value.ethernet_segment_esi_zero
  ethernet_segment_load_balancing_mode_all_active                 = each.value.ethernet_segment_load_balancing_mode_all_active
  ethernet_segment_load_balancing_mode_port_active                = each.value.ethernet_segment_load_balancing_mode_port_active
  ethernet_segment_load_balancing_mode_single_active              = each.value.ethernet_segment_load_balancing_mode_single_active
  ethernet_segment_load_balancing_mode_single_flow_active         = each.value.ethernet_segment_load_balancing_mode_single_flow_active
  ethernet_segment_force_single_homed                             = each.value.ethernet_segment_force_single_homed
  ethernet_segment_service_carving_hrw                            = each.value.ethernet_segment_service_carving_hrw
  ethernet_segment_service_carving_manual_primary                 = each.value.ethernet_segment_service_carving_manual_primary
  ethernet_segment_service_carving_manual_secondary               = each.value.ethernet_segment_service_carving_manual_secondary
  ethernet_segment_service_carving_multicast_hrw_g                = each.value.ethernet_segment_service_carving_multicast_hrw_g
  ethernet_segment_service_carving_multicast_hrw_s_g              = each.value.ethernet_segment_service_carving_multicast_hrw_s_g
  ethernet_segment_service_carving_preference_based_weight        = each.value.ethernet_segment_service_carving_preference_based_weight
  ethernet_segment_service_carving_preference_based_access_driven = each.value.ethernet_segment_service_carving_preference_based_access_driven
  ethernet_segment_bgp_rt                                         = each.value.ethernet_segment_bgp_rt
  ethernet_segment_convergence_reroute                            = each.value.ethernet_segment_convergence_reroute
  ethernet_segment_convergence_mac_mobility                       = each.value.ethernet_segment_convergence_mac_mobility
  ethernet_segment_convergence_nexthop_tracking                   = each.value.ethernet_segment_convergence_nexthop_tracking
  access_signal_bundle_down                                       = each.value.access_signal_bundle_down

  depends_on = [
    iosxr_evpn.evpn
  ]
}

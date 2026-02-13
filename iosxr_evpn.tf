##### EVPN #####

resource "iosxr_evpn" "evpn" {
  for_each = {
    for device in local.devices : device.name => device
    if try(local.device_config[device.name].evpn, null) != null ||
    try(local.defaults.iosxr.devices.configuration.evpn, null) != null
  }
  device = each.value.name

  bgp_rd_four_byte_as_index                                 = try(local.device_config[each.value.name].evpn.bgp_rd_four_byte_as_index, local.defaults.iosxr.devices.configuration.evpn.bgp_rd_four_byte_as_index, null)
  bgp_rd_four_byte_as_number                                = try(local.device_config[each.value.name].evpn.bgp_rd_four_byte_as_number, local.defaults.iosxr.devices.configuration.evpn.bgp_rd_four_byte_as_number, null)
  bgp_rd_ipv4_address                                       = try(local.device_config[each.value.name].evpn.bgp_rd_ipv4_address, local.defaults.iosxr.devices.configuration.evpn.bgp_rd_ipv4_address, null)
  bgp_rd_ipv4_address_index                                 = try(local.device_config[each.value.name].evpn.bgp_rd_ipv4_address_index, local.defaults.iosxr.devices.configuration.evpn.bgp_rd_ipv4_address_index, null)
  bgp_rd_two_byte_as_index                                  = try(local.device_config[each.value.name].evpn.bgp_rd_two_byte_as_index, local.defaults.iosxr.devices.configuration.evpn.bgp_rd_two_byte_as_index, null)
  bgp_rd_two_byte_as_number                                 = try(local.device_config[each.value.name].evpn.bgp_rd_two_byte_as_number, local.defaults.iosxr.devices.configuration.evpn.bgp_rd_two_byte_as_number, null)
  cost_out                                                  = try(local.device_config[each.value.name].evpn.cost_out, local.defaults.iosxr.devices.configuration.evpn.cost_out, null)
  enforce_mtu_match                                         = try(local.device_config[each.value.name].evpn.enforce_mtu_match, local.defaults.iosxr.devices.configuration.evpn.enforce_mtu_match, null)
  ethernet_segment_type_one_auto_generation_disable         = try(local.device_config[each.value.name].evpn.ethernet_segment_type_one_auto_generation_disable, local.defaults.iosxr.devices.configuration.evpn.ethernet_segment_type_one_auto_generation_disable, null)
  host_ipv4_duplicate_detection_disable                     = try(local.device_config[each.value.name].evpn.host_ipv4_duplicate_detection_disable, local.defaults.iosxr.devices.configuration.evpn.host_ipv4_duplicate_detection_disable, null)
  host_ipv4_duplicate_detection_freeze_time                 = try(local.device_config[each.value.name].evpn.host_ipv4_duplicate_detection_freeze_time, local.defaults.iosxr.devices.configuration.evpn.host_ipv4_duplicate_detection_freeze_time, null)
  host_ipv4_duplicate_detection_move_count                  = try(local.device_config[each.value.name].evpn.host_ipv4_duplicate_detection_move_count, local.defaults.iosxr.devices.configuration.evpn.host_ipv4_duplicate_detection_move_count, null)
  host_ipv4_duplicate_detection_move_interval               = try(local.device_config[each.value.name].evpn.host_ipv4_duplicate_detection_move_interval, local.defaults.iosxr.devices.configuration.evpn.host_ipv4_duplicate_detection_move_interval, null)
  host_ipv4_duplicate_detection_reset_freeze_count_interval = try(local.device_config[each.value.name].evpn.host_ipv4_duplicate_detection_reset_freeze_count_interval, local.defaults.iosxr.devices.configuration.evpn.host_ipv4_duplicate_detection_reset_freeze_count_interval, null)
  host_ipv4_duplicate_detection_retry_count                 = try(local.device_config[each.value.name].evpn.host_ipv4_duplicate_detection_retry_count, local.defaults.iosxr.devices.configuration.evpn.host_ipv4_duplicate_detection_retry_count, null)
  host_ipv6_duplicate_detection_disable                     = try(local.device_config[each.value.name].evpn.host_ipv6_duplicate_detection_disable, local.defaults.iosxr.devices.configuration.evpn.host_ipv6_duplicate_detection_disable, null)
  host_ipv6_duplicate_detection_freeze_time                 = try(local.device_config[each.value.name].evpn.host_ipv6_duplicate_detection_freeze_time, local.defaults.iosxr.devices.configuration.evpn.host_ipv6_duplicate_detection_freeze_time, null)
  host_ipv6_duplicate_detection_move_count                  = try(local.device_config[each.value.name].evpn.host_ipv6_duplicate_detection_move_count, local.defaults.iosxr.devices.configuration.evpn.host_ipv6_duplicate_detection_move_count, null)
  host_ipv6_duplicate_detection_move_interval               = try(local.device_config[each.value.name].evpn.host_ipv6_duplicate_detection_move_interval, local.defaults.iosxr.devices.configuration.evpn.host_ipv6_duplicate_detection_move_interval, null)
  host_ipv6_duplicate_detection_reset_freeze_count_interval = try(local.device_config[each.value.name].evpn.host_ipv6_duplicate_detection_reset_freeze_count_interval, local.defaults.iosxr.devices.configuration.evpn.host_ipv6_duplicate_detection_reset_freeze_count_interval, null)
  host_ipv6_duplicate_detection_retry_count                 = try(local.device_config[each.value.name].evpn.host_ipv6_duplicate_detection_retry_count, local.defaults.iosxr.devices.configuration.evpn.host_ipv6_duplicate_detection_retry_count, null)
  ignore_mtu_mismatch                                       = try(local.device_config[each.value.name].evpn.ignore_mtu_mismatch, local.defaults.iosxr.devices.configuration.evpn.ignore_mtu_mismatch, null)
  load_balancing_flow_label_static                          = try(local.device_config[each.value.name].evpn.load_balancing_flow_label_static, local.defaults.iosxr.devices.configuration.evpn.load_balancing_flow_label_static, null)
  logging_df_election                                       = try(local.device_config[each.value.name].evpn.logging_df_election, local.defaults.iosxr.devices.configuration.evpn.logging_df_election, null)
  source_interface                                          = try(local.device_config[each.value.name].evpn.source_interface, local.defaults.iosxr.devices.configuration.evpn.source_interface, null)
  srv6                                                      = try(local.device_config[each.value.name].evpn.srv6, local.defaults.iosxr.devices.configuration.evpn.srv6, null)
  srv6_usid_allocation_wide_local_id_block                  = try(local.device_config[each.value.name].evpn.srv6_usid_allocation_wide_local_id_block, local.defaults.iosxr.devices.configuration.evpn.srv6_usid_allocation_wide_local_id_block, null)
  staggered_bringup_timer                                   = try(local.device_config[each.value.name].evpn.staggered_bringup_timer, local.defaults.iosxr.devices.configuration.evpn.staggered_bringup_timer, null)
  startup_cost_in                                           = try(local.device_config[each.value.name].evpn.startup_cost_in, local.defaults.iosxr.devices.configuration.evpn.startup_cost_in, null)
  timers_ac_debounce                                        = try(local.device_config[each.value.name].evpn.timers_ac_debounce, local.defaults.iosxr.devices.configuration.evpn.timers_ac_debounce, null)
  timers_backup_replacement_delay                           = try(local.device_config[each.value.name].evpn.timers_backup_replacement_delay, local.defaults.iosxr.devices.configuration.evpn.timers_backup_replacement_delay, null)
  timers_carving                                            = try(local.device_config[each.value.name].evpn.timers_carving, local.defaults.iosxr.devices.configuration.evpn.timers_carving, null)
  timers_mac_postpone                                       = try(local.device_config[each.value.name].evpn.timers_mac_postpone, local.defaults.iosxr.devices.configuration.evpn.timers_mac_postpone, null)
  timers_peering                                            = try(local.device_config[each.value.name].evpn.timers_peering, local.defaults.iosxr.devices.configuration.evpn.timers_peering, null)
  timers_recovery                                           = try(local.device_config[each.value.name].evpn.timers_recovery, local.defaults.iosxr.devices.configuration.evpn.timers_recovery, null)
  transmit_l2_mtu                                           = try(local.device_config[each.value.name].evpn.transmit_l2_mtu, local.defaults.iosxr.devices.configuration.evpn.transmit_l2_mtu, null)
  transmit_mtu_zero                                         = try(local.device_config[each.value.name].evpn.transmit_mtu_zero, local.defaults.iosxr.devices.configuration.evpn.transmit_mtu_zero, null)
  virtual_access_evi_ethernet_segment_bgp_rt                = try(local.device_config[each.value.name].evpn.virtual_access_evi_ethernet_segment_bgp_rt, local.defaults.iosxr.devices.configuration.evpn.virtual_access_evi_ethernet_segment_bgp_rt, null)
  virtual_access_evi_ethernet_segment_esi_zero              = try(local.device_config[each.value.name].evpn.virtual_access_evi_ethernet_segment_esi_zero, local.defaults.iosxr.devices.configuration.evpn.virtual_access_evi_ethernet_segment_esi_zero, null)

  groups = try(length(local.device_config[each.value.name].evpn.groups) == 0, true) ? null : [
    for group in local.device_config[each.value.name].evpn.groups : {
      group_id = try(group.group_id, local.defaults.iosxr.devices.configuration.evpn.groups.group_id, null)
      core_interfaces = try(length(group.core_interfaces) == 0, true) ? null : [
        for core_interface in group.core_interfaces : {
          interface_name = try(core_interface.interface_name, local.defaults.iosxr.devices.configuration.evpn.groups.core_interfaces.interface_name, null)
        }
      ]
    }
  ]

  srv6_locators = try(length(local.device_config[each.value.name].evpn.srv6_locators) == 0, true) ? null : [
    for locator in local.device_config[each.value.name].evpn.srv6_locators : {
      locator_name                        = try(locator.locator_name, local.defaults.iosxr.devices.configuration.evpn.srv6_locators.locator_name, null)
      usid_allocation_wide_local_id_block = try(locator.usid_allocation_wide_local_id_block, local.defaults.iosxr.devices.configuration.evpn.srv6_locators.usid_allocation_wide_local_id_block, null)
    }
  ]

  virtual_neighbors = try(length(local.device_config[each.value.name].evpn.virtual_neighbors) == 0, true) ? null : [
    for neighbor in local.device_config[each.value.name].evpn.virtual_neighbors : {
      address                                                         = try(neighbor.address, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.address, null)
      pw_id                                                           = try(neighbor.pw_id, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.pw_id, null)
      ethernet_segment_bgp_rt                                         = try(neighbor.ethernet_segment_bgp_rt, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment_bgp_rt, null)
      ethernet_segment_esi_zero                                       = try(neighbor.ethernet_segment_esi_zero, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment_esi_zero, null)
      ethernet_segment_service_carving_hrw                            = try(neighbor.ethernet_segment_service_carving_hrw, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment_service_carving_hrw, null)
      ethernet_segment_service_carving_manual_primary                 = try(neighbor.ethernet_segment_service_carving_manual_primary, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment_service_carving_manual_primary, null)
      ethernet_segment_service_carving_manual_secondary               = try(neighbor.ethernet_segment_service_carving_manual_secondary, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment_service_carving_manual_secondary, null)
      ethernet_segment_service_carving_multicast_hrw_g                = try(neighbor.ethernet_segment_service_carving_multicast_hrw_g, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment_service_carving_multicast_hrw_g, null)
      ethernet_segment_service_carving_multicast_hrw_s_g              = try(neighbor.ethernet_segment_service_carving_multicast_hrw_s_g, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment_service_carving_multicast_hrw_s_g, null)
      ethernet_segment_service_carving_preference_based_access_driven = try(neighbor.ethernet_segment_service_carving_preference_based_access_driven, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment_service_carving_preference_based_access_driven, null)
      ethernet_segment_service_carving_preference_based_weight        = try(neighbor.ethernet_segment_service_carving_preference_based_weight, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment_service_carving_preference_based_weight, null)
      timers_ac_debounce                                              = try(neighbor.timers_ac_debounce, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.timers_ac_debounce, null)
      timers_carving                                                  = try(neighbor.timers_carving, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.timers_carving, null)
      timers_peering                                                  = try(neighbor.timers_peering, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.timers_peering, null)
      timers_recovery                                                 = try(neighbor.timers_recovery, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.timers_recovery, null)
    }
  ]

  virtual_vfis = try(length(local.device_config[each.value.name].evpn.virtual_vfis) == 0, true) ? null : [
    for vfi in local.device_config[each.value.name].evpn.virtual_vfis : {
      vfi_name                                                        = try(vfi.vfi_name, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.vfi_name, null)
      ethernet_segment_bgp_rt                                         = try(vfi.ethernet_segment_bgp_rt, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.ethernet_segment_bgp_rt, null)
      ethernet_segment_esi_zero                                       = try(vfi.ethernet_segment_esi_zero, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.ethernet_segment_esi_zero, null)
      ethernet_segment_service_carving_hrw                            = try(vfi.ethernet_segment_service_carving_hrw, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.ethernet_segment_service_carving_hrw, null)
      ethernet_segment_service_carving_manual_primary                 = try(vfi.ethernet_segment_service_carving_manual_primary, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.ethernet_segment_service_carving_manual_primary, null)
      ethernet_segment_service_carving_manual_secondary               = try(vfi.ethernet_segment_service_carving_manual_secondary, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.ethernet_segment_service_carving_manual_secondary, null)
      ethernet_segment_service_carving_preference_based_access_driven = try(vfi.ethernet_segment_service_carving_preference_based_access_driven, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.ethernet_segment_service_carving_preference_based_access_driven, null)
      ethernet_segment_service_carving_preference_based_weight        = try(vfi.ethernet_segment_service_carving_preference_based_weight, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.ethernet_segment_service_carving_preference_based_weight, null)
      timers_ac_debounce                                              = try(vfi.timers_ac_debounce, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.timers_ac_debounce, null)
      timers_carving                                                  = try(vfi.timers_carving, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.timers_carving, null)
      timers_peering                                                  = try(vfi.timers_peering, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.timers_peering, null)
      timers_recovery                                                 = try(vfi.timers_recovery, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.timers_recovery, null)
    }
  ]

  depends_on = [
    iosxr_route_policy.route_policy
  ]
}

##### EVPN EVI #####

locals {
  evpn_evis = flatten([
    for device in local.devices : [
      for evi in try(local.device_config[device.name].evpn_evis, []) : {
        key                              = format("%s/%s", device.name, evi.vpn_id)
        device_name                      = device.name
        vpn_id                           = try(evi.vpn_id, local.defaults.iosxr.devices.configuration.evpn_evis.vpn_id, null)
        description                      = try(evi.description, local.defaults.iosxr.devices.configuration.evpn_evis.description, null)
        load_balancing                   = try(evi.load_balancing, local.defaults.iosxr.devices.configuration.evpn_evis.load_balancing, null)
        load_balancing_flow_label_static = try(evi.load_balancing_flow_label_static, local.defaults.iosxr.devices.configuration.evpn_evis.load_balancing_flow_label_static, null)
        bgp_rd_two_byte_as_number        = try(evi.bgp_rd_two_byte_as_number, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_rd_two_byte_as_number, null)
        bgp_rd_two_byte_as_index         = try(evi.bgp_rd_two_byte_as_index, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_rd_two_byte_as_index, null)
        bgp_rd_four_byte_as_number       = try(evi.bgp_rd_four_byte_as_number, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_rd_four_byte_as_number, null)
        bgp_rd_four_byte_as_index        = try(evi.bgp_rd_four_byte_as_index, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_rd_four_byte_as_index, null)
        bgp_rd_ipv4_address              = try(evi.bgp_rd_ipv4_address, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_rd_ipv4_address, null)
        bgp_rd_ipv4_address_index        = try(evi.bgp_rd_ipv4_address_index, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_rd_ipv4_address_index, null)
        bgp_route_policy_import          = try(evi.bgp_route_policy_import, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_route_policy_import, null)
        bgp_route_policy_export          = try(evi.bgp_route_policy_export, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_route_policy_export, null)
        advertise_mac                    = try(evi.advertise_mac, local.defaults.iosxr.devices.configuration.evpn_evis.advertise_mac, null)
        unknown_unicast_suppression      = try(evi.unknown_unicast_suppression, local.defaults.iosxr.devices.configuration.evpn_evis.unknown_unicast_suppression, null)
        control_word_disable             = try(evi.control_word_disable, local.defaults.iosxr.devices.configuration.evpn_evis.control_word_disable, null)
        etree                            = try(evi.etree, local.defaults.iosxr.devices.configuration.evpn_evis.etree, null)
        etree_leaf                       = try(evi.etree_leaf, local.defaults.iosxr.devices.configuration.evpn_evis.etree_leaf, null)
        etree_rt_leaf                    = try(evi.etree_rt_leaf, local.defaults.iosxr.devices.configuration.evpn_evis.etree_rt_leaf, null)
        bgp_route_target_import_two_byte_as_format = try(length(evi.bgp_route_target_import_two_byte_as_format) == 0, true) ? null : [for rt in evi.bgp_route_target_import_two_byte_as_format : {
          as_number       = try(rt.as_number, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_route_target_import_two_byte_as_format.as_number, null)
          assigned_number = try(rt.assigned_number, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_route_target_import_two_byte_as_format.assigned_number, null)
          }
        ]
        bgp_route_target_import_four_byte_as_format = try(length(evi.bgp_route_target_import_four_byte_as_format) == 0, true) ? null : [for rt in evi.bgp_route_target_import_four_byte_as_format : {
          as_number       = try(rt.as_number, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_route_target_import_four_byte_as_format.as_number, null)
          assigned_number = try(rt.assigned_number, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_route_target_import_four_byte_as_format.assigned_number, null)
          }
        ]
        bgp_route_target_import_ipv4_address_format = try(length(evi.bgp_route_target_import_ipv4_address_format) == 0, true) ? null : [for rt in evi.bgp_route_target_import_ipv4_address_format : {
          ipv4_address    = try(rt.ipv4_address, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_route_target_import_ipv4_address_format.ipv4_address, null)
          assigned_number = try(rt.assigned_number, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_route_target_import_ipv4_address_format.assigned_number, null)
          }
        ]
        bgp_route_target_export_two_byte_as_format = try(length(evi.bgp_route_target_export_two_byte_as_format) == 0, true) ? null : [for rt in evi.bgp_route_target_export_two_byte_as_format : {
          as_number       = try(rt.as_number, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_route_target_export_two_byte_as_format.as_number, null)
          assigned_number = try(rt.assigned_number, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_route_target_export_two_byte_as_format.assigned_number, null)
          }
        ]
        bgp_route_target_export_four_byte_as_format = try(length(evi.bgp_route_target_export_four_byte_as_format) == 0, true) ? null : [for rt in evi.bgp_route_target_export_four_byte_as_format : {
          as_number       = try(rt.as_number, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_route_target_export_four_byte_as_format.as_number, null)
          assigned_number = try(rt.assigned_number, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_route_target_export_four_byte_as_format.assigned_number, null)
          }
        ]
        bgp_route_target_export_ipv4_address_format = try(length(evi.bgp_route_target_export_ipv4_address_format) == 0, true) ? null : [for rt in evi.bgp_route_target_export_ipv4_address_format : {
          ipv4_address    = try(rt.ipv4_address, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_route_target_export_ipv4_address_format.ipv4_address, null)
          assigned_number = try(rt.assigned_number, local.defaults.iosxr.devices.configuration.evpn_evis.bgp_route_target_export_ipv4_address_format.assigned_number, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_evpn_evi" "evpn_evi" {
  for_each                                    = { for evi in local.evpn_evis : evi.key => evi }
  device                                      = each.value.device_name
  vpn_id                                      = each.value.vpn_id
  description                                 = each.value.description
  load_balancing                              = each.value.load_balancing
  load_balancing_flow_label_static            = each.value.load_balancing_flow_label_static
  bgp_rd_two_byte_as_number                   = each.value.bgp_rd_two_byte_as_number
  bgp_rd_two_byte_as_index                    = each.value.bgp_rd_two_byte_as_index
  bgp_rd_four_byte_as_number                  = each.value.bgp_rd_four_byte_as_number
  bgp_rd_four_byte_as_index                   = each.value.bgp_rd_four_byte_as_index
  bgp_rd_ipv4_address                         = each.value.bgp_rd_ipv4_address
  bgp_rd_ipv4_address_index                   = each.value.bgp_rd_ipv4_address_index
  bgp_route_policy_import                     = each.value.bgp_route_policy_import
  bgp_route_policy_export                     = each.value.bgp_route_policy_export
  advertise_mac                               = each.value.advertise_mac
  unknown_unicast_suppression                 = each.value.unknown_unicast_suppression
  control_word_disable                        = each.value.control_word_disable
  etree                                       = each.value.etree
  etree_leaf                                  = each.value.etree_leaf
  etree_rt_leaf                               = each.value.etree_rt_leaf
  bgp_route_target_import_two_byte_as_format  = each.value.bgp_route_target_import_two_byte_as_format
  bgp_route_target_import_four_byte_as_format = each.value.bgp_route_target_import_four_byte_as_format
  bgp_route_target_import_ipv4_address_format = each.value.bgp_route_target_import_ipv4_address_format
  bgp_route_target_export_two_byte_as_format  = each.value.bgp_route_target_export_two_byte_as_format
  bgp_route_target_export_four_byte_as_format = each.value.bgp_route_target_export_four_byte_as_format
  bgp_route_target_export_ipv4_address_format = each.value.bgp_route_target_export_ipv4_address_format

  depends_on = [
    iosxr_evpn.evpn
  ]
}

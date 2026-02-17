##### EVPN #####

resource "iosxr_evpn" "evpn" {
  for_each         = { for device in local.devices : device.name => device if try(local.device_config[device.name].evpn, null) != null || try(local.defaults.iosxr.devices.configuration.evpn, null) != null }
  device           = each.value.name
  source_interface = try(local.device_config[each.value.name].evpn.source_interface, local.defaults.iosxr.devices.configuration.evpn.source_interface, null)
  groups = try(length(local.device_config[each.value.name].evpn.groups) == 0, true) ? null : [for group in local.device_config[each.value.name].evpn.groups : {
    group_id = try(group.group_id, local.defaults.iosxr.devices.configuration.evpn.groups.group_id, null)
    core_interfaces = try(length(group.core_interfaces) == 0, true) ? null : [for core_interface in group.core_interfaces : {
      interface_name = try(core_interface.interface_name, local.defaults.iosxr.devices.configuration.evpn.groups.core_interfaces.interface_name, null)
    }]
  }]

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

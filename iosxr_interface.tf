locals {
  device_interfaces_group = flatten([
    for device in local.devices : [
      for interface in try(local.device_config[device.name].interface, []) : {
        device_name    = device.name
        interface_name = interface.interface_name
        key            = "${device.name}-${interface.interface_name}"
        configuration = yamldecode(try(provider::utils::yaml_merge(concat(
          [yamlencode(interface)],
          [for ig_name in try(interface.interface_groups, []) : try([for ig in local.interface_groups_config[device.name] : yamlencode(ig.configuration) if ig.name == ig_name][0], "{}")]
        )), yamlencode(interface)))
      }
    ]
  ])

  device_interfaces = flatten([
    for interface_merged in local.device_interfaces_group : {
      device_name    = interface_merged.device_name
      interface_name = interface_merged.interface_name
      key            = interface_merged.key

      l2transport                                              = try(interface_merged.configuration.l2transport, local.defaults.iosxr.configuration.interface_l2transport, null)
      point_to_point                                           = try(interface_merged.configuration.point_to_point, local.defaults.iosxr.configuration.interface_point_to_point, null)
      multipoint                                               = try(interface_merged.configuration.multipoint, local.defaults.iosxr.configuration.interface_multipoint, null)
      dampening_decay_half_life_value                          = try(interface_merged.configuration.dampening_decay_half_life_value, local.defaults.iosxr.configuration.interface_dampening_decay_half_life_value, null)
      ipv4_point_to_point                                      = try(interface_merged.configuration.ipv4_point_to_point, local.defaults.iosxr.configuration.interface_ipv4_point_to_point, null)
      shutdown                                                 = try(interface_merged.configuration.shutdown, local.defaults.iosxr.configuration.interface_shutdown, null)
      mtu                                                      = try(interface_merged.configuration.mtu, local.defaults.iosxr.configuration.interface_mtu, null)
      bandwidth                                                = try(interface_merged.configuration.bandwidth, local.defaults.iosxr.configuration.interface_bandwidth, null)
      description                                              = try(interface_merged.configuration.description, local.defaults.iosxr.configuration.interface_description, null)
      load_interval                                            = try(interface_merged.configuration.load_interval, local.defaults.iosxr.configuration.interface_load_interval, null)
      vrf                                                      = try(interface_merged.configuration.vrf, local.defaults.iosxr.configuration.interface_vrf, null)
      ipv4_address                                             = try(interface_merged.configuration.ipv4_address, local.defaults.iosxr.configuration.interface_ipv4_address, null)
      ipv4_netmask                                             = try(interface_merged.configuration.ipv4_netmask, local.defaults.iosxr.configuration.interface_ipv4_netmask, null)
      ipv4_verify_unicast_source_reachable_via_type            = try(interface_merged.configuration.ipv4_verify_unicast_source_reachable_via_type, local.defaults.iosxr.configuration.interface_ipv4_verify_unicast_source_reachable_via_type, null)
      ipv4_verify_unicast_source_reachable_via_allow_self_ping = try(interface_merged.configuration.ipv4_verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.configuration.interface_ipv4_verify_unicast_source_reachable_via_allow_self_ping, null)
      ipv4_verify_unicast_source_reachable_via_allow_default   = try(interface_merged.configuration.ipv4_verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.configuration.interface_ipv4_verify_unicast_source_reachable_via_allow_default, null)
      ipv4_access_group_ingress_acl1                           = try(interface_merged.configuration.ipv4_access_group_ingress_acl1, local.defaults.iosxr.configuration.interface_ipv4_access_group_ingress_acl1, null)
      ipv4_access_group_ingress_hardware_count                 = try(interface_merged.configuration.ipv4_access_group_ingress_hardware_count, local.defaults.iosxr.configuration.interface_ipv4_access_group_ingress_hardware_count, null)
      ipv4_access_group_ingress_interface_statistics           = try(interface_merged.configuration.ipv4_access_group_ingress_interface_statistics, local.defaults.iosxr.configuration.interface_ipv4_access_group_ingress_interface_statistics, null)
      ipv4_access_group_ingress_compress_level                 = try(interface_merged.configuration.ipv4_access_group_ingress_compress_level, local.defaults.iosxr.configuration.interface_ipv4_access_group_ingress_compress_level, null)
      ipv4_access_group_egress_acl                             = try(interface_merged.configuration.ipv4_access_group_egress_acl, local.defaults.iosxr.configuration.interface_ipv4_access_group_egress_acl, null)
      ipv4_access_group_egress_hardware_count                  = try(interface_merged.configuration.ipv4_access_group_egress_hardware_count, local.defaults.iosxr.configuration.interface_ipv4_access_group_egress_hardware_count, null)
      ipv4_access_group_egress_interface_statistics            = try(interface_merged.configuration.ipv4_access_group_egress_interface_statistics, local.defaults.iosxr.configuration.interface_ipv4_access_group_egress_interface_statistics, null)
      ipv4_access_group_egress_compress_level                  = try(interface_merged.configuration.ipv4_access_group_egress_compress_level, local.defaults.iosxr.configuration.interface_ipv4_access_group_egress_compress_level, null)
      ipv6_verify_unicast_source_reachable_via_type            = try(interface_merged.configuration.ipv6_verify_unicast_source_reachable_via_type, local.defaults.iosxr.configuration.interface_ipv6_verify_unicast_source_reachable_via_type, null)
      ipv6_verify_unicast_source_reachable_via_allow_self_ping = try(interface_merged.configuration.ipv6_verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.configuration.interface_ipv6_verify_unicast_source_reachable_via_allow_self_ping, null)
      ipv6_verify_unicast_source_reachable_via_allow_default   = try(interface_merged.configuration.ipv6_verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.configuration.interface_ipv6_verify_unicast_source_reachable_via_allow_default, null)
      ipv6_link_local_address                                  = try(interface_merged.configuration.ipv6_link_local_address, local.defaults.iosxr.configuration.interface_ipv6_link_local_address, null)
      ipv6_link_local_zone                                     = try(interface_merged.configuration.ipv6_link_local_zone, local.defaults.iosxr.configuration.interface_ipv6_link_local_zone, null)
      ipv6_autoconfig                                          = try(interface_merged.configuration.ipv6_autoconfig, local.defaults.iosxr.configuration.interface_ipv6_autoconfig, null)
      ipv6_enable                                              = try(interface_merged.configuration.ipv6_enable, local.defaults.iosxr.configuration.interface_ipv6_enable, null)
      ipv6_addresses                                           = try(interface_merged.configuration.ipv6_addresses, local.defaults.iosxr.configuration.interface_ipv6_addresses, null)
      ipv6_access_group_ingress_acl1                           = try(interface_merged.configuration.ipv6_access_group_ingress_acl1, local.defaults.iosxr.configuration.interface_ipv6_access_group_ingress_acl1, null)
      ipv6_access_group_ingress_interface_statistics           = try(interface_merged.configuration.ipv6_access_group_ingress_interface_statistics, local.defaults.iosxr.configuration.interface_ipv6_access_group_ingress_interface_statistics, null)
      ipv6_access_group_ingress_compress_level                 = try(interface_merged.configuration.ipv6_access_group_ingress_compress_level, local.defaults.iosxr.configuration.interface_ipv6_access_group_ingress_compress_level, null)
      ipv6_access_group_egress_acl1                            = try(interface_merged.configuration.ipv6_access_group_egress_acl1, local.defaults.iosxr.configuration.interface_ipv6_access_group_egress_acl1, null)
      ipv6_access_group_egress_interface_statistics            = try(interface_merged.configuration.ipv6_access_group_egress_interface_statistics, local.defaults.iosxr.configuration.interface_ipv6_access_group_egress_interface_statistics, null)
      ipv6_access_group_egress_compress_level                  = try(interface_merged.configuration.ipv6_access_group_egress_compress_level, local.defaults.iosxr.configuration.interface_ipv6_access_group_egress_compress_level, null)
      bundle_port_priority                                     = try(interface_merged.configuration.bundle_port_priority, local.defaults.iosxr.configuration.interface_bundle_port_priority, null)
      bfd_mode_ietf                                            = try(interface_merged.configuration.bfd_mode_ietf, local.defaults.iosxr.configuration.interface_bfd_mode_ietf, null)
      bundle_id                                                = try(interface_merged.configuration.bundle_id, local.defaults.iosxr.configuration.interface_bundle_id, null)
      bundle_id_mode                                           = try(interface_merged.configuration.bundle_id_mode, local.defaults.iosxr.configuration.interface_bundle_id_mode, null)
      bundle_load_balancing_hash_dst_ip                        = try(interface_merged.configuration.bundle_load_balancing_hash_dst_ip, local.defaults.iosxr.configuration.interface_bundle_load_balancing_hash_dst_ip, null)
      bundle_load_balancing_hash_src_ip                        = try(interface_merged.configuration.bundle_load_balancing_hash_src_ip, local.defaults.iosxr.configuration.interface_bundle_load_balancing_hash_src_ip, null)
      bundle_maximum_active_links                              = try(interface_merged.configuration.bundle_maximum_active_links, local.defaults.iosxr.configuration.interface_bundle_maximum_active_links, null)
      bundle_minimum_active_links                              = try(interface_merged.configuration.bundle_minimum_active_links, local.defaults.iosxr.configuration.interface_bundle_minimum_active_links, null)
      bundle_shutdown                                          = try(interface_merged.configuration.bundle_shutdown, local.defaults.iosxr.configuration.interface_bundle_shutdown, null)
      cdp                                                      = try(interface_merged.configuration.cdp, local.defaults.iosxr.configuration.interface_cdp, null)
      encapsulation_dot1q_vlan_id                              = try(interface_merged.configuration.encapsulation_dot1q_vlan_id, local.defaults.iosxr.configuration.interface_encapsulation_dot1q_vlan_id, null)
      l2transport_encapsulation_dot1q_second_dot1q             = try(interface_merged.configuration.l2transport_encapsulation_dot1q_second_dot1q, local.defaults.iosxr.configuration.interface_l2transport_encapsulation_dot1q_second_dot1q, null)
      l2transport_encapsulation_dot1q_vlan_id                  = try(interface_merged.configuration.l2transport_encapsulation_dot1q_vlan_id, local.defaults.iosxr.configuration.interface_l2transport_encapsulation_dot1q_vlan_id, null)
      rewrite_ingress_tag_pop_one                              = try(interface_merged.configuration.rewrite_ingress_tag_pop_one, local.defaults.iosxr.configuration.interface_rewrite_ingress_tag_pop_one, null)
      rewrite_ingress_tag_pop_two                              = try(interface_merged.configuration.rewrite_ingress_tag_pop_two, local.defaults.iosxr.configuration.interface_rewrite_ingress_tag_pop_two, null)
      unnumbered                                               = try(interface_merged.configuration.unnumbered, local.defaults.iosxr.configuration.interface_unnumbered, null)
      service_policy_input                                     = try(interface_merged.configuration.service_policy_input, local.defaults.iosxr.configuration.interface_service_policy_input, null)
      service_policy_output                                    = try(interface_merged.configuration.service_policy_output, local.defaults.iosxr.configuration.interface_service_policy_output, null)
      flow_ipv4_egress_monitor_samplers                        = try(interface_merged.configuration.flow_ipv4_egress_monitor_samplers, local.defaults.iosxr.configuration.interface_flow_ipv4_egress_monitor_samplers, null)
      flow_ipv4_egress_monitors                                = try(interface_merged.configuration.flow_ipv4_egress_monitors, local.defaults.iosxr.configuration.interface_flow_ipv4_egress_monitors, null)
      flow_ipv4_ingress_monitor_samplers                       = try(interface_merged.configuration.flow_ipv4_ingress_monitor_samplers, local.defaults.iosxr.configuration.interface_flow_ipv4_ingress_monitor_samplers, null)
      flow_ipv4_ingress_monitors                               = try(interface_merged.configuration.flow_ipv4_ingress_monitors, local.defaults.iosxr.configuration.interface_flow_ipv4_ingress_monitors, null)
      flow_ipv6_egress_monitor_samplers                        = try(interface_merged.configuration.flow_ipv6_egress_monitor_samplers, local.defaults.iosxr.configuration.interface_flow_ipv6_egress_monitor_samplers, null)
      flow_ipv6_egress_monitors                                = try(interface_merged.configuration.flow_ipv6_egress_monitors, local.defaults.iosxr.configuration.interface_flow_ipv6_egress_monitors, null)
      flow_ipv6_ingress_monitor_samplers                       = try(interface_merged.configuration.flow_ipv6_ingress_monitor_samplers, local.defaults.iosxr.configuration.interface_flow_ipv6_ingress_monitor_samplers, null)
      flow_ipv6_ingress_monitors                               = try(interface_merged.configuration.flow_ipv6_ingress_monitors, local.defaults.iosxr.configuration.interface_flow_ipv6_ingress_monitors, null)
    }
  ])
}

resource "iosxr_interface" "interface" {
  for_each = { for interface in local.device_interfaces : interface.key => interface }

  device         = each.value.device_name
  interface_name = each.value.interface_name

  l2transport                                              = each.value.l2transport
  point_to_point                                           = each.value.point_to_point
  multipoint                                               = each.value.multipoint
  dampening_decay_half_life_value                          = each.value.dampening_decay_half_life_value
  ipv4_point_to_point                                      = each.value.ipv4_point_to_point
  shutdown                                                 = each.value.shutdown
  mtu                                                      = each.value.mtu
  bandwidth                                                = each.value.bandwidth
  description                                              = each.value.description
  load_interval                                            = each.value.load_interval
  vrf                                                      = each.value.vrf
  ipv4_address                                             = each.value.ipv4_address
  ipv4_netmask                                             = each.value.ipv4_netmask
  ipv4_verify_unicast_source_reachable_via_type            = each.value.ipv4_verify_unicast_source_reachable_via_type
  ipv4_verify_unicast_source_reachable_via_allow_self_ping = each.value.ipv4_verify_unicast_source_reachable_via_allow_self_ping
  ipv4_verify_unicast_source_reachable_via_allow_default   = each.value.ipv4_verify_unicast_source_reachable_via_allow_default
  ipv4_access_group_ingress_acl1                           = each.value.ipv4_access_group_ingress_acl1
  ipv4_access_group_ingress_hardware_count                 = each.value.ipv4_access_group_ingress_hardware_count
  ipv4_access_group_ingress_interface_statistics           = each.value.ipv4_access_group_ingress_interface_statistics
  ipv4_access_group_ingress_compress_level                 = each.value.ipv4_access_group_ingress_compress_level
  ipv4_access_group_egress_acl                             = each.value.ipv4_access_group_egress_acl
  ipv4_access_group_egress_hardware_count                  = each.value.ipv4_access_group_egress_hardware_count
  ipv4_access_group_egress_interface_statistics            = each.value.ipv4_access_group_egress_interface_statistics
  ipv4_access_group_egress_compress_level                  = each.value.ipv4_access_group_egress_compress_level
  ipv6_verify_unicast_source_reachable_via_type            = each.value.ipv6_verify_unicast_source_reachable_via_type
  ipv6_verify_unicast_source_reachable_via_allow_self_ping = each.value.ipv6_verify_unicast_source_reachable_via_allow_self_ping
  ipv6_verify_unicast_source_reachable_via_allow_default   = each.value.ipv6_verify_unicast_source_reachable_via_allow_default
  ipv6_link_local_address                                  = each.value.ipv6_link_local_address
  ipv6_link_local_zone                                     = each.value.ipv6_link_local_zone
  ipv6_autoconfig                                          = each.value.ipv6_autoconfig
  ipv6_enable                                              = each.value.ipv6_enable
  ipv6_addresses                                           = each.value.ipv6_addresses
  ipv6_access_group_ingress_acl1                           = each.value.ipv6_access_group_ingress_acl1
  ipv6_access_group_ingress_interface_statistics           = each.value.ipv6_access_group_ingress_interface_statistics
  ipv6_access_group_ingress_compress_level                 = each.value.ipv6_access_group_ingress_compress_level
  ipv6_access_group_egress_acl1                            = each.value.ipv6_access_group_egress_acl1
  ipv6_access_group_egress_interface_statistics            = each.value.ipv6_access_group_egress_interface_statistics
  ipv6_access_group_egress_compress_level                  = each.value.ipv6_access_group_egress_compress_level
  bundle_port_priority                                     = each.value.bundle_port_priority
  bfd_mode_ietf                                            = each.value.bfd_mode_ietf
  bundle_id                                                = each.value.bundle_id
  bundle_id_mode                                           = each.value.bundle_id_mode
  bundle_load_balancing_hash_dst_ip                        = each.value.bundle_load_balancing_hash_dst_ip
  bundle_load_balancing_hash_src_ip                        = each.value.bundle_load_balancing_hash_src_ip
  bundle_maximum_active_links                              = each.value.bundle_maximum_active_links
  bundle_minimum_active_links                              = each.value.bundle_minimum_active_links
  bundle_shutdown                                          = each.value.bundle_shutdown
  cdp                                                      = each.value.cdp
  encapsulation_dot1q_vlan_id                              = each.value.encapsulation_dot1q_vlan_id
  l2transport_encapsulation_dot1q_second_dot1q             = each.value.l2transport_encapsulation_dot1q_second_dot1q
  l2transport_encapsulation_dot1q_vlan_id                  = each.value.l2transport_encapsulation_dot1q_vlan_id
  rewrite_ingress_tag_pop_one                              = each.value.rewrite_ingress_tag_pop_one
  rewrite_ingress_tag_pop_two                              = each.value.rewrite_ingress_tag_pop_two
  unnumbered                                               = each.value.unnumbered
  service_policy_input                                     = each.value.service_policy_input
  service_policy_output                                    = each.value.service_policy_output
  flow_ipv4_egress_monitor_samplers                        = each.value.flow_ipv4_egress_monitor_samplers
  flow_ipv4_egress_monitors                                = each.value.flow_ipv4_egress_monitors
  flow_ipv4_ingress_monitor_samplers                       = each.value.flow_ipv4_ingress_monitor_samplers
  flow_ipv4_ingress_monitors                               = each.value.flow_ipv4_ingress_monitors
  flow_ipv6_egress_monitor_samplers                        = each.value.flow_ipv6_egress_monitor_samplers
  flow_ipv6_egress_monitors                                = each.value.flow_ipv6_egress_monitors
  flow_ipv6_ingress_monitor_samplers                       = each.value.flow_ipv6_ingress_monitor_samplers
  flow_ipv6_ingress_monitors                               = each.value.flow_ipv6_ingress_monitors
}

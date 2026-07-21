locals {
  class_map_qos = flatten([
    for device in local.devices : [
      for class_map_qos in try(local.device_config[device.name].class_map_qos, []) : {
        key                                = format("%s/%s", device.name, class_map_qos.class_map_name)
        device_name                        = device.name
        class_map_name                     = try(class_map_qos.class_map_name, null)
        description                        = try(class_map_qos.description, local.defaults.iosxr.devices.configuration.class_map_qos.description, null)
        match_all                          = try(class_map_qos.match_all, local.defaults.iosxr.devices.configuration.class_map_qos.match_all, null)
        match_any                          = try(class_map_qos.match_any, local.defaults.iosxr.devices.configuration.class_map_qos.match_any, null)
        match_access_group_ipv4            = try(class_map_qos.match_access_group_ipv4, local.defaults.iosxr.devices.configuration.class_map_qos.match_access_group_ipv4, null)
        match_access_group_ipv6            = try(class_map_qos.match_access_group_ipv6, local.defaults.iosxr.devices.configuration.class_map_qos.match_access_group_ipv6, null)
        match_cos                          = try(class_map_qos.match_cos, local.defaults.iosxr.devices.configuration.class_map_qos.match_cos, null)
        match_cos_inner                    = try(class_map_qos.match_cos_inner, local.defaults.iosxr.devices.configuration.class_map_qos.match_cos_inner, null)
        match_discard_class                = try(class_map_qos.match_discard_class, local.defaults.iosxr.devices.configuration.class_map_qos.match_discard_class, null)
        match_dscp                         = try(class_map_qos.match_dscp, local.defaults.iosxr.devices.configuration.class_map_qos.match_dscp, null)
        match_dscp_ipv4                    = try(class_map_qos.match_dscp_ipv4, local.defaults.iosxr.devices.configuration.class_map_qos.match_dscp_ipv4, null)
        match_dscp_ipv6                    = try(class_map_qos.match_dscp_ipv6, local.defaults.iosxr.devices.configuration.class_map_qos.match_dscp_ipv6, null)
        match_destination_mac              = try(class_map_qos.match_destination_mac, local.defaults.iosxr.devices.configuration.class_map_qos.match_destination_mac, null)
        match_destination_port             = try(class_map_qos.match_destination_port, local.defaults.iosxr.devices.configuration.class_map_qos.match_destination_port, null)
        match_ethertype                    = try(class_map_qos.match_ethertype, local.defaults.iosxr.devices.configuration.class_map_qos.match_ethertype, null)
        match_fragment_type_dont_fragment  = try(class_map_qos.match_fragment_type_dont_fragment, local.defaults.iosxr.devices.configuration.class_map_qos.match_fragment_type_dont_fragment, null)
        match_fragment_type_first_fragment = try(class_map_qos.match_fragment_type_first_fragment, local.defaults.iosxr.devices.configuration.class_map_qos.match_fragment_type_first_fragment, null)
        match_fragment_type_is_fragment    = try(class_map_qos.match_fragment_type_is_fragment, local.defaults.iosxr.devices.configuration.class_map_qos.match_fragment_type_is_fragment, null)
        match_fragment_type_last_fragment  = try(class_map_qos.match_fragment_type_last_fragment, local.defaults.iosxr.devices.configuration.class_map_qos.match_fragment_type_last_fragment, null)
        match_ipv4_icmp_code               = try(class_map_qos.match_ipv4_icmp_code, local.defaults.iosxr.devices.configuration.class_map_qos.match_ipv4_icmp_code, null)
        match_ipv4_icmp_type               = try(class_map_qos.match_ipv4_icmp_type, local.defaults.iosxr.devices.configuration.class_map_qos.match_ipv4_icmp_type, null)
        match_ipv6_icmp_code               = try(class_map_qos.match_ipv6_icmp_code, local.defaults.iosxr.devices.configuration.class_map_qos.match_ipv6_icmp_code, null)
        match_ipv6_icmp_type               = try(class_map_qos.match_ipv6_icmp_type, local.defaults.iosxr.devices.configuration.class_map_qos.match_ipv6_icmp_type, null)
        match_mpls_experimental_topmost    = try(class_map_qos.match_mpls_experimental_topmost, local.defaults.iosxr.devices.configuration.class_map_qos.match_mpls_experimental_topmost, null)
        match_packet_length                = try(class_map_qos.match_packet_length, local.defaults.iosxr.devices.configuration.class_map_qos.match_packet_length, null)
        match_precedence                   = try(class_map_qos.match_precedence, local.defaults.iosxr.devices.configuration.class_map_qos.match_precedence, null)
        match_precedence_ipv4              = try(class_map_qos.match_precedence_ipv4, local.defaults.iosxr.devices.configuration.class_map_qos.match_precedence_ipv4, null)
        match_precedence_ipv6              = try(class_map_qos.match_precedence_ipv6, local.defaults.iosxr.devices.configuration.class_map_qos.match_precedence_ipv6, null)
        match_protocol                     = try(class_map_qos.match_protocol, local.defaults.iosxr.devices.configuration.class_map_qos.match_protocol, null)
        match_qos_group                    = try(class_map_qos.match_qos_group, local.defaults.iosxr.devices.configuration.class_map_qos.match_qos_group, null)
        match_source_mac                   = try(class_map_qos.match_source_mac, local.defaults.iosxr.devices.configuration.class_map_qos.match_source_mac, null)
        match_source_port                  = try(class_map_qos.match_source_port, local.defaults.iosxr.devices.configuration.class_map_qos.match_source_port, null)
        match_tcp_flag                     = try(class_map_qos.match_tcp_flag, local.defaults.iosxr.devices.configuration.class_map_qos.match_tcp_flag, null)
        match_tcp_flag_any                 = try(class_map_qos.match_tcp_flag_any, local.defaults.iosxr.devices.configuration.class_map_qos.match_tcp_flag_any, null)
        match_traffic_class                = try(class_map_qos.match_traffic_class, local.defaults.iosxr.devices.configuration.class_map_qos.match_traffic_class, null)
        match_vlan                         = try(class_map_qos.match_vlan, local.defaults.iosxr.devices.configuration.class_map_qos.match_vlan, null)
        match_vlan_inner                   = try(class_map_qos.match_vlan_inner, local.defaults.iosxr.devices.configuration.class_map_qos.match_vlan_inner, null)
        match_destination_address_ipv4 = try(length(class_map_qos.match_destination_address_ipv4) == 0, true) ? null : [
          for addr in class_map_qos.match_destination_address_ipv4 : {
            address = try(addr.address, null)
            netmask = try(addr.netmask, null)
          }
        ]
        match_destination_address_ipv6 = try(length(class_map_qos.match_destination_address_ipv6) == 0, true) ? null : [
          for addr in class_map_qos.match_destination_address_ipv6 : {
            address       = try(addr.address, null)
            prefix_length = try(addr.prefix_length, null)
          }
        ]
        match_source_address_ipv4 = try(length(class_map_qos.match_source_address_ipv4) == 0, true) ? null : [
          for addr in class_map_qos.match_source_address_ipv4 : {
            address = try(addr.address, null)
            netmask = try(addr.netmask, null)
          }
        ]
        match_source_address_ipv6 = try(length(class_map_qos.match_source_address_ipv6) == 0, true) ? null : [
          for addr in class_map_qos.match_source_address_ipv6 : {
            address       = try(addr.address, null)
            prefix_length = try(addr.prefix_length, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_class_map_qos" "class_map_qos" {
  for_each = { for class_map in local.class_map_qos : class_map.key => class_map }
  device   = each.value.device_name

  class_map_name = each.value.class_map_name
  description    = each.value.description
  match_all      = each.value.match_all
  match_any      = each.value.match_any

  match_access_group_ipv4 = each.value.match_access_group_ipv4
  match_access_group_ipv6 = each.value.match_access_group_ipv6
  match_cos               = each.value.match_cos
  match_cos_inner         = each.value.match_cos_inner
  match_discard_class     = each.value.match_discard_class
  match_dscp              = each.value.match_dscp
  match_dscp_ipv4         = each.value.match_dscp_ipv4
  match_dscp_ipv6         = each.value.match_dscp_ipv6

  # Note: The following attributes are NOT supported on XRv9K or XRd for class-map type qos.
  # They are kept here as physical hardware platforms may support them.
  # - match_destination_address_ipv4/ipv6, match_source_address_ipv4/ipv6
  # - match_destination_port, match_source_port
  # - match_ethertype
  # - match_fragment_type_dont_fragment/first_fragment/is_fragment/last_fragment
  # - match_ipv4_icmp_code/type, match_ipv6_icmp_code/type
  # - match_packet_length
  # - match_tcp_flag, match_tcp_flag_any
  #
  # Note: The following attributes are NOT supported on XRv9K but ARE supported on XRd:
  # - match_destination_mac, match_source_mac
  # - match_traffic_class
  match_destination_address_ipv4     = each.value.match_destination_address_ipv4
  match_destination_address_ipv6     = each.value.match_destination_address_ipv6
  match_destination_mac              = each.value.match_destination_mac
  match_destination_port             = each.value.match_destination_port
  match_ethertype                    = each.value.match_ethertype
  match_fragment_type_dont_fragment  = each.value.match_fragment_type_dont_fragment
  match_fragment_type_first_fragment = each.value.match_fragment_type_first_fragment
  match_fragment_type_is_fragment    = each.value.match_fragment_type_is_fragment
  match_fragment_type_last_fragment  = each.value.match_fragment_type_last_fragment
  match_ipv4_icmp_code               = each.value.match_ipv4_icmp_code
  match_ipv4_icmp_type               = each.value.match_ipv4_icmp_type
  match_ipv6_icmp_code               = each.value.match_ipv6_icmp_code
  match_ipv6_icmp_type               = each.value.match_ipv6_icmp_type
  match_mpls_experimental_topmost    = each.value.match_mpls_experimental_topmost
  match_packet_length                = each.value.match_packet_length
  match_precedence                   = each.value.match_precedence
  match_precedence_ipv4              = each.value.match_precedence_ipv4
  match_precedence_ipv6              = each.value.match_precedence_ipv6
  match_protocol                     = each.value.match_protocol
  match_qos_group                    = each.value.match_qos_group
  match_source_address_ipv4          = each.value.match_source_address_ipv4
  match_source_address_ipv6          = each.value.match_source_address_ipv6
  match_source_mac                   = each.value.match_source_mac
  match_source_port                  = each.value.match_source_port
  match_tcp_flag                     = each.value.match_tcp_flag
  match_tcp_flag_any                 = each.value.match_tcp_flag_any
  match_traffic_class                = each.value.match_traffic_class
  match_vlan                         = each.value.match_vlan
  match_vlan_inner                   = each.value.match_vlan_inner
}

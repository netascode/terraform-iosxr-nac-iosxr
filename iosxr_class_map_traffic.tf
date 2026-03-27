locals {
  class_map_traffic = flatten([
    for device in local.devices : [
      for class_map in try(local.device_config[device.name].class_map_traffic, []) : {
        key                                = format("%s/%s", device.name, class_map.class_map_name)
        device_name                        = device.name
        class_map_name                     = class_map.class_map_name
        description                        = try(class_map.description, local.defaults.iosxr.devices.configuration.class_map_traffic.description, null)
        match_access_group_ipv4            = try(class_map.match_access_group_ipv4, local.defaults.iosxr.devices.configuration.class_map_traffic.match_access_group_ipv4, null)
        match_access_group_ipv6            = try(class_map.match_access_group_ipv6, local.defaults.iosxr.devices.configuration.class_map_traffic.match_access_group_ipv6, null)
        match_all                          = try(class_map.match_all, local.defaults.iosxr.devices.configuration.class_map_traffic.match_all, null)
        match_any                          = try(class_map.match_any, local.defaults.iosxr.devices.configuration.class_map_traffic.match_any, null)
        match_cos                          = try(class_map.match_cos, local.defaults.iosxr.devices.configuration.class_map_traffic.match_cos, null)
        match_cos_inner                    = try(class_map.match_cos_inner, local.defaults.iosxr.devices.configuration.class_map_traffic.match_cos_inner, null)
        match_destination_address_ipv4     = try(class_map.match_destination_address_ipv4, local.defaults.iosxr.devices.configuration.class_map_traffic.match_destination_address_ipv4, null)
        match_destination_address_ipv6     = try(class_map.match_destination_address_ipv6, local.defaults.iosxr.devices.configuration.class_map_traffic.match_destination_address_ipv6, null)
        match_destination_mac              = try(class_map.match_destination_mac, local.defaults.iosxr.devices.configuration.class_map_traffic.match_destination_mac, null)
        match_destination_port             = try(class_map.match_destination_port, local.defaults.iosxr.devices.configuration.class_map_traffic.match_destination_port, null)
        match_dscp                         = try(class_map.match_dscp, local.defaults.iosxr.devices.configuration.class_map_traffic.match_dscp, null)
        match_dscp_ipv4                    = try(class_map.match_dscp_ipv4, local.defaults.iosxr.devices.configuration.class_map_traffic.match_dscp_ipv4, null)
        match_dscp_ipv6                    = try(class_map.match_dscp_ipv6, local.defaults.iosxr.devices.configuration.class_map_traffic.match_dscp_ipv6, null)
        match_ethertype                    = try(class_map.match_ethertype, local.defaults.iosxr.devices.configuration.class_map_traffic.match_ethertype, null)
        match_flow_tag                     = try(class_map.match_flow_tag, local.defaults.iosxr.devices.configuration.class_map_traffic.match_flow_tag, null)
        match_fragment_type_dont_fragment  = try(class_map.match_fragment_type_dont_fragment, local.defaults.iosxr.devices.configuration.class_map_traffic.match_fragment_type_dont_fragment, null)
        match_fragment_type_first_fragment = try(class_map.match_fragment_type_first_fragment, local.defaults.iosxr.devices.configuration.class_map_traffic.match_fragment_type_first_fragment, null)
        match_fragment_type_is_fragment    = try(class_map.match_fragment_type_is_fragment, local.defaults.iosxr.devices.configuration.class_map_traffic.match_fragment_type_is_fragment, null)
        match_fragment_type_last_fragment  = try(class_map.match_fragment_type_last_fragment, local.defaults.iosxr.devices.configuration.class_map_traffic.match_fragment_type_last_fragment, null)
        match_ipv4_icmp_code               = try(class_map.match_ipv4_icmp_code, local.defaults.iosxr.devices.configuration.class_map_traffic.match_ipv4_icmp_code, null)
        match_ipv4_icmp_type               = try(class_map.match_ipv4_icmp_type, local.defaults.iosxr.devices.configuration.class_map_traffic.match_ipv4_icmp_type, null)
        match_ipv6_icmp_code               = try(class_map.match_ipv6_icmp_code, local.defaults.iosxr.devices.configuration.class_map_traffic.match_ipv6_icmp_code, null)
        match_ipv6_icmp_type               = try(class_map.match_ipv6_icmp_type, local.defaults.iosxr.devices.configuration.class_map_traffic.match_ipv6_icmp_type, null)
        match_mpls_experimental_topmost    = try(class_map.match_mpls_experimental_topmost, local.defaults.iosxr.devices.configuration.class_map_traffic.match_mpls_experimental_topmost, null)
        match_packet_length                = try(class_map.match_packet_length, local.defaults.iosxr.devices.configuration.class_map_traffic.match_packet_length, null)
        match_precedence                   = try(class_map.match_precedence, local.defaults.iosxr.devices.configuration.class_map_traffic.match_precedence, null)
        match_precedence_ipv4              = try(class_map.match_precedence_ipv4, local.defaults.iosxr.devices.configuration.class_map_traffic.match_precedence_ipv4, null)
        match_precedence_ipv6              = try(class_map.match_precedence_ipv6, local.defaults.iosxr.devices.configuration.class_map_traffic.match_precedence_ipv6, null)
        match_protocol                     = try(class_map.match_protocol, local.defaults.iosxr.devices.configuration.class_map_traffic.match_protocol, null)
        match_source_address_ipv4          = try(class_map.match_source_address_ipv4, local.defaults.iosxr.devices.configuration.class_map_traffic.match_source_address_ipv4, null)
        match_source_address_ipv6          = try(class_map.match_source_address_ipv6, local.defaults.iosxr.devices.configuration.class_map_traffic.match_source_address_ipv6, null)
        match_source_mac                   = try(class_map.match_source_mac, local.defaults.iosxr.devices.configuration.class_map_traffic.match_source_mac, null)
        match_source_port                  = try(class_map.match_source_port, local.defaults.iosxr.devices.configuration.class_map_traffic.match_source_port, null)
        match_tcp_flag                     = try(class_map.match_tcp_flag, local.defaults.iosxr.devices.configuration.class_map_traffic.match_tcp_flag, null)
        match_tcp_flag_any                 = try(class_map.match_tcp_flag_any, local.defaults.iosxr.devices.configuration.class_map_traffic.match_tcp_flag_any, null)
        match_vlan                         = try(class_map.match_vlan, local.defaults.iosxr.devices.configuration.class_map_traffic.match_vlan, null)
        match_vlan_inner                   = try(class_map.match_vlan_inner, local.defaults.iosxr.devices.configuration.class_map_traffic.match_vlan_inner, null)
      }
    ]
  ])
}

resource "iosxr_class_map_traffic" "class_map_traffic" {
  for_each                           = { for class_map in local.class_map_traffic : class_map.key => class_map }
  device                             = each.value.device_name
  class_map_name                     = each.value.class_map_name
  description                        = each.value.description
  match_access_group_ipv4            = each.value.match_access_group_ipv4
  match_access_group_ipv6            = each.value.match_access_group_ipv6
  match_all                          = each.value.match_all
  match_any                          = each.value.match_any
  match_cos                          = each.value.match_cos
  match_cos_inner                    = each.value.match_cos_inner
  match_destination_address_ipv4     = each.value.match_destination_address_ipv4
  match_destination_address_ipv6     = each.value.match_destination_address_ipv6
  match_destination_mac              = each.value.match_destination_mac
  match_destination_port             = each.value.match_destination_port
  match_dscp                         = each.value.match_dscp
  match_dscp_ipv4                    = each.value.match_dscp_ipv4
  match_dscp_ipv6                    = each.value.match_dscp_ipv6
  match_ethertype                    = each.value.match_ethertype
  match_flow_tag                     = each.value.match_flow_tag
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
  match_source_address_ipv4          = each.value.match_source_address_ipv4
  match_source_address_ipv6          = each.value.match_source_address_ipv6
  match_source_mac                   = each.value.match_source_mac
  match_source_port                  = each.value.match_source_port
  match_tcp_flag                     = each.value.match_tcp_flag
  match_tcp_flag_any                 = each.value.match_tcp_flag_any
  match_vlan                         = each.value.match_vlan
  match_vlan_inner                   = each.value.match_vlan_inner
}

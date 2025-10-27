locals {
  interfaces_groups = flatten([
    for device in local.devices : [
      for interface in try(local.device_config[device.name].interfaces, []) : {
        key             = format("%s/%s", device.name, interface.interface_name)
        device_name     = device.name
        interface_name  = interface.interface_name
        is_subinterface = can(regex("\\.", interface.interface_name))
        intf_config     = interface
      }
    ]
  ])

  main_interfaces = flatten([
    for interface in local.interfaces_groups : {
      key                                                      = interface.key
      device_name                                              = interface.device_name
      interface_name                                           = interface.interface_name
      l2transport                                              = try(interface.intf_config.l2transport, local.defaults.iosxr.devices.configuration.interfaces.l2transport, null)
      point_to_point                                           = try(interface.intf_config.point_to_point, local.defaults.iosxr.devices.configuration.interfaces.point_to_point, null)
      multipoint                                               = try(interface.intf_config.multipoint, local.defaults.iosxr.devices.configuration.interfaces.multipoint, null)
      dampening_decay_half_life_value                          = try(interface.intf_config.dampening_decay_half_life_value, local.defaults.iosxr.devices.configuration.interfaces.dampening_decay_half_life_value, null)
      ipv4_point_to_point                                      = try(interface.intf_config.ipv4_point_to_point, local.defaults.iosxr.devices.configuration.interfaces.ipv4_point_to_point, null)
      shutdown                                                 = try(interface.intf_config.shutdown, local.defaults.iosxr.devices.configuration.interfaces.shutdown, null)
      mtu                                                      = try(interface.intf_config.mtu, local.defaults.iosxr.devices.configuration.interfaces.mtu, null)
      bandwidth                                                = try(interface.intf_config.bandwidth, local.defaults.iosxr.devices.configuration.interfaces.bandwidth, null)
      description                                              = try(interface.intf_config.description, local.defaults.iosxr.devices.configuration.interfaces.description, null)
      load_interval                                            = try(interface.intf_config.load_interval, local.defaults.iosxr.devices.configuration.interfaces.load_interval, null)
      vrf                                                      = try(interface.intf_config.vrf, local.defaults.iosxr.devices.configuration.interfaces.vrf, null)
      ipv4_address                                             = try(interface.intf_config.ipv4_address, local.defaults.iosxr.devices.configuration.interfaces.ipv4_address, null)
      ipv4_netmask                                             = try(interface.intf_config.ipv4_netmask, local.defaults.iosxr.devices.configuration.interfaces.ipv4_netmask, null)
      ipv4_verify_unicast_source_reachable_via_type            = try(interface.intf_config.ipv4_verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.ipv4_verify_unicast_source_reachable_via_type, null)
      ipv4_verify_unicast_source_reachable_via_allow_self_ping = try(interface.intf_config.ipv4_verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.ipv4_verify_unicast_source_reachable_via_allow_self_ping, null)
      ipv4_verify_unicast_source_reachable_via_allow_default   = try(interface.intf_config.ipv4_verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.ipv4_verify_unicast_source_reachable_via_allow_default, null)
      ipv4_access_group_ingress_acl1                           = try(interface.intf_config.ipv4_access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_ingress_acl1, null)
      ipv4_access_group_ingress_hardware_count                 = try(interface.intf_config.ipv4_access_group_ingress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_ingress_hardware_count, null)
      ipv4_access_group_ingress_interface_statistics           = try(interface.intf_config.ipv4_access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_ingress_interface_statistics, null)
      ipv4_access_group_ingress_compress                       = try(interface.intf_config.ipv4_access_group_ingress_compress, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_ingress_compress, null)
      ipv4_access_group_egress_acl                             = try(interface.intf_config.ipv4_access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_egress_acl, null)
      ipv4_access_group_egress_hardware_count                  = try(interface.intf_config.ipv4_access_group_egress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_egress_hardware_count, null)
      ipv4_access_group_egress_interface_statistics            = try(interface.intf_config.ipv4_access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_egress_interface_statistics, null)
      ipv4_access_group_egress_compress                        = try(interface.intf_config.ipv4_access_group_egress_compress, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_egress_compress, null)
      ipv6_verify_unicast_source_reachable_via_type            = try(interface.intf_config.ipv6_verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.ipv6_verify_unicast_source_reachable_via_type, null)
      ipv6_verify_unicast_source_reachable_via_allow_self_ping = try(interface.intf_config.ipv6_verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.ipv6_verify_unicast_source_reachable_via_allow_self_ping, null)
      ipv6_verify_unicast_source_reachable_via_allow_default   = try(interface.intf_config.ipv6_verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.ipv6_verify_unicast_source_reachable_via_allow_default, null)
      ipv6_link_local_address                                  = try(interface.intf_config.ipv6_link_local_address, local.defaults.iosxr.devices.configuration.interfaces.ipv6_link_local_address, null)
      ipv6_link_local_zone                                     = try(interface.intf_config.ipv6_link_local_zone, local.defaults.iosxr.devices.configuration.interfaces.ipv6_link_local_zone, null)
      ipv6_autoconfig                                          = try(interface.intf_config.ipv6_autoconfig, local.defaults.iosxr.devices.configuration.interfaces.ipv6_autoconfig, null)
      ipv6_enable                                              = try(interface.intf_config.ipv6_enable, local.defaults.iosxr.devices.configuration.interfaces.ipv6_enable, null)
      ipv6_addresses = try(length(interface.intf_config.ipv6_addresses) == 0, true) ? null : [for ipv6_address in interface.intf_config.ipv6_addresses : {
        address       = try(ipv6_address.address, local.defaults.iosxr.devices.configuration.interfaces.ipv6_addresses.address, null)
        prefix_length = try(ipv6_address.prefix_length, local.defaults.iosxr.devices.configuration.interfaces.ipv6_addresses.prefix_length, null)
        zone          = try(ipv6_address.zone, local.defaults.iosxr.devices.configuration.interfaces.ipv6_addresses.zone, null)
      }]
      ipv6_access_group_ingress_acl1                 = try(interface.intf_config.ipv6_access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.ipv6_access_group_ingress_acl1, null)
      ipv6_access_group_ingress_interface_statistics = try(interface.intf_config.ipv6_access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.ipv6_access_group_ingress_interface_statistics, null)
      ipv6_access_group_ingress_compress             = try(interface.intf_config.ipv6_access_group_ingress_compress, local.defaults.iosxr.devices.configuration.interfaces.ipv6_access_group_ingress_compress, null)
      ipv6_access_group_egress_acl                   = try(interface.intf_config.ipv6_access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.ipv6_access_group_egress_acl, null)
      ipv6_access_group_egress_interface_statistics  = try(interface.intf_config.ipv6_access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.ipv6_access_group_egress_interface_statistics, null)
      ipv6_access_group_egress_compress              = try(interface.intf_config.ipv6_access_group_egress_compress, local.defaults.iosxr.devices.configuration.interfaces.ipv6_access_group_egress_compress, null)
      bundle_port_priority                           = try(interface.intf_config.bundle_port_priority, local.defaults.iosxr.devices.configuration.interfaces.bundle_port_priority, null)
      bfd_mode_ietf                                  = try(interface.intf_config.bfd_mode_ietf, local.defaults.iosxr.devices.configuration.interfaces.bfd_mode_ietf, null)
      bundle_id                                      = try(interface.intf_config.bundle_id, local.defaults.iosxr.devices.configuration.interfaces.bundle_id, null)
      bundle_id_mode                                 = try(interface.intf_config.bundle_id_mode, local.defaults.iosxr.devices.configuration.interfaces.bundle_id_mode, null)
      bundle_load_balancing_hash_dst_ip              = try(interface.intf_config.bundle_load_balancing_hash_dst_ip, local.defaults.iosxr.devices.configuration.interfaces.bundle_load_balancing_hash_dst_ip, null)
      bundle_load_balancing_hash_src_ip              = try(interface.intf_config.bundle_load_balancing_hash_src_ip, local.defaults.iosxr.devices.configuration.interfaces.bundle_load_balancing_hash_src_ip, null)
      bundle_maximum_active_links                    = try(interface.intf_config.bundle_maximum_active_links, local.defaults.iosxr.devices.configuration.interfaces.bundle_maximum_active_links, null)
      bundle_minimum_active_links                    = try(interface.intf_config.bundle_minimum_active_links, local.defaults.iosxr.devices.configuration.interfaces.bundle_minimum_active_links, null)
      bundle_shutdown                                = try(interface.intf_config.bundle_shutdown, local.defaults.iosxr.devices.configuration.interfaces.bundle_shutdown, null)
      cdp                                            = try(interface.intf_config.cdp, local.defaults.iosxr.devices.configuration.interfaces.cdp, null)
      encapsulation_dot1q_vlan_id                    = try(interface.intf_config.encapsulation_dot1q_vlan_id, local.defaults.iosxr.devices.configuration.interfaces.encapsulation_dot1q_vlan_id, null)
      l2transport_encapsulation_dot1q_second_dot1q   = try(interface.intf_config.l2transport_encapsulation_dot1q_second_dot1q, local.defaults.iosxr.devices.configuration.interfaces.l2transport_encapsulation_dot1q_second_dot1q, null)
      l2transport_encapsulation_dot1q_vlan_id        = try(interface.intf_config.l2transport_encapsulation_dot1q_vlan_id, local.defaults.iosxr.devices.configuration.interfaces.l2transport_encapsulation_dot1q_vlan_id, null)
      rewrite_ingress_tag_pop_one                    = try(interface.intf_config.rewrite_ingress_tag_pop_one, local.defaults.iosxr.devices.configuration.interfaces.rewrite_ingress_tag_pop_one, null)
      rewrite_ingress_tag_pop_two                    = try(interface.intf_config.rewrite_ingress_tag_pop_two, local.defaults.iosxr.devices.configuration.interfaces.rewrite_ingress_tag_pop_two, null)
      unnumbered                                     = try(interface.intf_config.unnumbered, local.defaults.iosxr.devices.configuration.interfaces.unnumbered, null)
      service_policy_input = try(length(interface.intf_config.service_policy_input) == 0, true) ? null : [for service_policy in interface.intf_config.service_policy_input : {
        name = try(service_policy.name, local.defaults.iosxr.devices.configuration.interfaces.service_policy_input.name, null)
      }]
      service_policy_output = try(length(interface.intf_config.service_policy_output) == 0, true) ? null : [for service_policy in interface.intf_config.service_policy_output : {
        name = try(service_policy.name, local.defaults.iosxr.devices.configuration.interfaces.service_policy_output.name, null)
      }]
      flow_ipv4_egress_monitor_samplers = try(length(interface.intf_config.flow_ipv4_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv4_egress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv4_egress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv4_egress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv4_egress_monitors = try(length(interface.intf_config.flow_ipv4_egress_monitors) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv4_egress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv4_egress_monitors.monitor_map_name, null)
      }]
      flow_ipv4_ingress_monitor_samplers = try(length(interface.intf_config.flow_ipv4_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv4_ingress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv4_ingress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv4_ingress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv4_ingress_monitors = try(length(interface.intf_config.flow_ipv4_ingress_monitors) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv4_ingress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv4_ingress_monitors.monitor_map_name, null)
      }]
      flow_ipv6_egress_monitor_samplers = try(length(interface.intf_config.flow_ipv6_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv6_egress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv6_egress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv6_egress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv6_egress_monitors = try(length(interface.intf_config.flow_ipv6_egress_monitors) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv6_egress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv6_egress_monitors.monitor_map_name, null)
      }]
      flow_ipv6_ingress_monitor_samplers = try(length(interface.intf_config.flow_ipv6_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv6_ingress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv6_ingress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv6_ingress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv6_ingress_monitors = try(length(interface.intf_config.flow_ipv6_ingress_monitors) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv6_ingress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv6_ingress_monitors.monitor_map_name, null)
      }]
    } if !interface.is_subinterface
  ])

  sub_interfaces = flatten([
    for interface in local.interfaces_groups : {
      key                                                      = interface.key
      device_name                                              = interface.device_name
      interface_name                                           = interface.interface_name
      l2transport                                              = try(interface.intf_config.l2transport, local.defaults.iosxr.devices.configuration.interfaces.l2transport, null)
      point_to_point                                           = try(interface.intf_config.point_to_point, local.defaults.iosxr.devices.configuration.interfaces.point_to_point, null)
      multipoint                                               = try(interface.intf_config.multipoint, local.defaults.iosxr.devices.configuration.interfaces.multipoint, null)
      dampening_decay_half_life_value                          = try(interface.intf_config.dampening_decay_half_life_value, local.defaults.iosxr.devices.configuration.interfaces.dampening_decay_half_life_value, null)
      ipv4_point_to_point                                      = try(interface.intf_config.ipv4_point_to_point, local.defaults.iosxr.devices.configuration.interfaces.ipv4_point_to_point, null)
      shutdown                                                 = try(interface.intf_config.shutdown, local.defaults.iosxr.devices.configuration.interfaces.shutdown, null)
      mtu                                                      = try(interface.intf_config.mtu, local.defaults.iosxr.devices.configuration.interfaces.mtu, null)
      bandwidth                                                = try(interface.intf_config.bandwidth, local.defaults.iosxr.devices.configuration.interfaces.bandwidth, null)
      description                                              = try(interface.intf_config.description, local.defaults.iosxr.devices.configuration.interfaces.description, null)
      load_interval                                            = try(interface.intf_config.load_interval, local.defaults.iosxr.devices.configuration.interfaces.load_interval, null)
      vrf                                                      = try(interface.intf_config.vrf, local.defaults.iosxr.devices.configuration.interfaces.vrf, null)
      ipv4_address                                             = try(interface.intf_config.ipv4_address, local.defaults.iosxr.devices.configuration.interfaces.ipv4_address, null)
      ipv4_netmask                                             = try(interface.intf_config.ipv4_netmask, local.defaults.iosxr.devices.configuration.interfaces.ipv4_netmask, null)
      ipv4_verify_unicast_source_reachable_via_type            = try(interface.intf_config.ipv4_verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.ipv4_verify_unicast_source_reachable_via_type, null)
      ipv4_verify_unicast_source_reachable_via_allow_self_ping = try(interface.intf_config.ipv4_verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.ipv4_verify_unicast_source_reachable_via_allow_self_ping, null)
      ipv4_verify_unicast_source_reachable_via_allow_default   = try(interface.intf_config.ipv4_verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.ipv4_verify_unicast_source_reachable_via_allow_default, null)
      ipv4_access_group_ingress_acl1                           = try(interface.intf_config.ipv4_access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_ingress_acl1, null)
      ipv4_access_group_ingress_hardware_count                 = try(interface.intf_config.ipv4_access_group_ingress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_ingress_hardware_count, null)
      ipv4_access_group_ingress_interface_statistics           = try(interface.intf_config.ipv4_access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_ingress_interface_statistics, null)
      ipv4_access_group_ingress_compress                       = try(interface.intf_config.ipv4_access_group_ingress_compress, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_ingress_compress, null)
      ipv4_access_group_egress_acl                             = try(interface.intf_config.ipv4_access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_egress_acl, null)
      ipv4_access_group_egress_hardware_count                  = try(interface.intf_config.ipv4_access_group_egress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_egress_hardware_count, null)
      ipv4_access_group_egress_interface_statistics            = try(interface.intf_config.ipv4_access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_egress_interface_statistics, null)
      ipv4_access_group_egress_compress                        = try(interface.intf_config.ipv4_access_group_egress_compress, local.defaults.iosxr.devices.configuration.interfaces.ipv4_access_group_egress_compress, null)
      ipv6_verify_unicast_source_reachable_via_type            = try(interface.intf_config.ipv6_verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.ipv6_verify_unicast_source_reachable_via_type, null)
      ipv6_verify_unicast_source_reachable_via_allow_self_ping = try(interface.intf_config.ipv6_verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.ipv6_verify_unicast_source_reachable_via_allow_self_ping, null)
      ipv6_verify_unicast_source_reachable_via_allow_default   = try(interface.intf_config.ipv6_verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.ipv6_verify_unicast_source_reachable_via_allow_default, null)
      ipv6_link_local_address                                  = try(interface.intf_config.ipv6_link_local_address, local.defaults.iosxr.devices.configuration.interfaces.ipv6_link_local_address, null)
      ipv6_link_local_zone                                     = try(interface.intf_config.ipv6_link_local_zone, local.defaults.iosxr.devices.configuration.interfaces.ipv6_link_local_zone, null)
      ipv6_autoconfig                                          = try(interface.intf_config.ipv6_autoconfig, local.defaults.iosxr.devices.configuration.interfaces.ipv6_autoconfig, null)
      ipv6_enable                                              = try(interface.intf_config.ipv6_enable, local.defaults.iosxr.devices.configuration.interfaces.ipv6_enable, null)
      ipv6_addresses = try(length(interface.intf_config.ipv6_addresses) == 0, true) ? null : [for ipv6_address in interface.intf_config.ipv6_addresses : {
        address       = try(ipv6_address.address, local.defaults.iosxr.devices.configuration.interfaces.ipv6_addresses.address, null)
        prefix_length = try(ipv6_address.prefix_length, local.defaults.iosxr.devices.configuration.interfaces.ipv6_addresses.prefix_length, null)
        zone          = try(ipv6_address.zone, local.defaults.iosxr.devices.configuration.interfaces.ipv6_addresses.zone, null)
      }]
      ipv6_access_group_ingress_acl1                 = try(interface.intf_config.ipv6_access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.ipv6_access_group_ingress_acl1, null)
      ipv6_access_group_ingress_interface_statistics = try(interface.intf_config.ipv6_access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.ipv6_access_group_ingress_interface_statistics, null)
      ipv6_access_group_ingress_compress             = try(interface.intf_config.ipv6_access_group_ingress_compress, local.defaults.iosxr.devices.configuration.interfaces.ipv6_access_group_ingress_compress, null)
      ipv6_access_group_egress_acl                   = try(interface.intf_config.ipv6_access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.ipv6_access_group_egress_acl, null)
      ipv6_access_group_egress_interface_statistics  = try(interface.intf_config.ipv6_access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interface.ipv6_access_group_egress_interface_statistics, null)
      ipv6_access_group_egress_compress              = try(interface.intf_config.ipv6_access_group_egress_compress, local.defaults.iosxr.devices.configuration.interfaces.ipv6_access_group_egress_compress, null)
      bundle_port_priority                           = try(interface.intf_config.bundle_port_priority, local.defaults.iosxr.devices.configuration.interfaces.bundle_port_priority, null)
      bfd_mode_ietf                                  = try(interface.intf_config.bfd_mode_ietf, local.defaults.iosxr.devices.configuration.interfaces.bfd_mode_ietf, null)
      bundle_id                                      = try(interface.intf_config.bundle_id, local.defaults.iosxr.devices.configuration.interfaces.bundle_id, null)
      bundle_id_mode                                 = try(interface.intf_config.bundle_id_mode, local.defaults.iosxr.devices.configuration.interfaces.bundle_id_mode, null)
      bundle_load_balancing_hash_dst_ip              = try(interface.intf_config.bundle_load_balancing_hash_dst_ip, local.defaults.iosxr.devices.configuration.interfaces.bundle_load_balancing_hash_dst_ip, null)
      bundle_load_balancing_hash_src_ip              = try(interface.intf_config.bundle_load_balancing_hash_src_ip, local.defaults.iosxr.devices.configuration.interfaces.bundle_load_balancing_hash_src_ip, null)
      bundle_maximum_active_links                    = try(interface.intf_config.bundle_maximum_active_links, local.defaults.iosxr.devices.configuration.interfaces.bundle_maximum_active_links, null)
      bundle_minimum_active_links                    = try(interface.intf_config.bundle_minimum_active_links, local.defaults.iosxr.devices.configuration.interfaces.bundle_minimum_active_links, null)
      bundle_shutdown                                = try(interface.intf_config.bundle_shutdown, local.defaults.iosxr.devices.configuration.interfaces.bundle_shutdown, null)
      cdp                                            = try(interface.intf_config.cdp, local.defaults.iosxr.devices.configuration.interfaces.cdp, null)
      encapsulation_dot1q_vlan_id                    = try(interface.intf_config.encapsulation_dot1q_vlan_id, local.defaults.iosxr.devices.configuration.interfaces.encapsulation_dot1q_vlan_id, null)
      l2transport_encapsulation_dot1q_second_dot1q   = try(interface.intf_config.l2transport_encapsulation_dot1q_second_dot1q, local.defaults.iosxr.devices.configuration.interfaces.l2transport_encapsulation_dot1q_second_dot1q, null)
      l2transport_encapsulation_dot1q_vlan_id        = try(interface.intf_config.l2transport_encapsulation_dot1q_vlan_id, local.defaults.iosxr.devices.configuration.interfaces.l2transport_encapsulation_dot1q_vlan_id, null)
      rewrite_ingress_tag_pop_one                    = try(interface.intf_config.rewrite_ingress_tag_pop_one, local.defaults.iosxr.devices.configuration.interfaces.rewrite_ingress_tag_pop_one, null)
      rewrite_ingress_tag_pop_two                    = try(interface.intf_config.rewrite_ingress_tag_pop_two, local.defaults.iosxr.devices.configuration.interfaces.rewrite_ingress_tag_pop_two, null)
      unnumbered                                     = try(interface.intf_config.unnumbered, local.defaults.iosxr.devices.configuration.interfaces.unnumbered, null)
      service_policy_input = try(length(interface.intf_config.service_policy_input) == 0, true) ? null : [for service_policy in interface.intf_config.service_policy_input : {
        name = try(service_policy.name, local.defaults.iosxr.devices.configuration.interfaces.service_policy_input.name, null)
      }]
      service_policy_output = try(length(interface.intf_config.service_policy_output) == 0, true) ? null : [for service_policy in interface.intf_config.service_policy_output : {
        name = try(service_policy.name, local.defaults.iosxr.devices.configuration.interfaces.service_policy_output.name, null)
      }]
      flow_ipv4_egress_monitor_samplers = try(length(interface.intf_config.flow_ipv4_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv4_egress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv4_egress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv4_egress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv4_egress_monitors = try(length(interface.intf_config.flow_ipv4_egress_monitors) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv4_egress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv4_egress_monitors.monitor_map_name, null)
      }]
      flow_ipv4_ingress_monitor_samplers = try(length(interface.intf_config.flow_ipv4_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv4_ingress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv4_ingress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv4_ingress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv4_ingress_monitors = try(length(interface.intf_config.flow_ipv4_ingress_monitors) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv4_ingress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv4_ingress_monitors.monitor_map_name, null)
      }]
      flow_ipv6_egress_monitor_samplers = try(length(interface.intf_config.flow_ipv6_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv6_egress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv6_egress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv6_egress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv6_egress_monitors = try(length(interface.intf_config.flow_ipv6_egress_monitors) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv6_egress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv6_egress_monitors.monitor_map_name, null)
      }]
      flow_ipv6_ingress_monitor_samplers = try(length(interface.intf_config.flow_ipv6_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv6_ingress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv6_ingress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv6_ingress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv6_ingress_monitors = try(length(interface.intf_config.flow_ipv6_ingress_monitors) == 0, true) ? null : [for flow_monitor in interface.intf_config.flow_ipv6_ingress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.flow_ipv6_ingress_monitors.monitor_map_name, null)
      }]
    } if interface.is_subinterface
  ])
}

resource "iosxr_interface" "main_interface" {
  for_each                                                 = { for interface in local.main_interfaces : interface.key => interface }
  device                                                   = each.value.device_name
  interface_name                                           = each.value.interface_name
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
  ipv4_access_group_ingress_compress                       = each.value.ipv4_access_group_ingress_compress
  ipv4_access_group_egress_acl                             = each.value.ipv4_access_group_egress_acl
  ipv4_access_group_egress_hardware_count                  = each.value.ipv4_access_group_egress_hardware_count
  ipv4_access_group_egress_interface_statistics            = each.value.ipv4_access_group_egress_interface_statistics
  ipv4_access_group_egress_compress                        = each.value.ipv4_access_group_egress_compress
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
  ipv6_access_group_ingress_compress                       = each.value.ipv6_access_group_ingress_compress
  ipv6_access_group_egress_acl                             = each.value.ipv6_access_group_egress_acl
  ipv6_access_group_egress_interface_statistics            = each.value.ipv6_access_group_egress_interface_statistics
  ipv6_access_group_egress_compress                        = each.value.ipv6_access_group_egress_compress
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

  depends_on = [
    # Future dependencies - uncomment when resource is created:
    #iosxr_vrf.vrf,
    #iosxr_ipv4_access_list.ipv4_access_list,
    #iosxr_ipv6_access_list.ipv6_access_list,
  ]
}

resource "iosxr_interface" "sub_interface" {
  for_each                                                 = { for interface in local.sub_interfaces : interface.key => interface }
  device                                                   = each.value.device_name
  interface_name                                           = each.value.interface_name
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
  ipv4_access_group_ingress_compress                       = each.value.ipv4_access_group_ingress_compress
  ipv4_access_group_egress_acl                             = each.value.ipv4_access_group_egress_acl
  ipv4_access_group_egress_hardware_count                  = each.value.ipv4_access_group_egress_hardware_count
  ipv4_access_group_egress_interface_statistics            = each.value.ipv4_access_group_egress_interface_statistics
  ipv4_access_group_egress_compress                        = each.value.ipv4_access_group_egress_compress
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
  ipv6_access_group_ingress_compress                       = each.value.ipv6_access_group_ingress_compress
  ipv6_access_group_egress_acl                             = each.value.ipv6_access_group_egress_acl
  ipv6_access_group_egress_interface_statistics            = each.value.ipv6_access_group_egress_interface_statistics
  ipv6_access_group_egress_compress                        = each.value.ipv6_access_group_egress_compress
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

  depends_on = [
    # Future dependencies - uncomment when resource is created:
    #iosxr_vrf.vrf,
    #iosxr_ipv4_access_list.ipv4_access_list,
    #iosxr_ipv6_access_list.ipv6_access_list,
    iosxr_interface.main_interface
  ]
}

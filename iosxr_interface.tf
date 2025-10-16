locals {
  device_interfaces_group = flatten([
    for device in local.devices : [
      for interface in try(local.device_config[device.name].interface, []) : {
        device_name     = device.name
        interface_name  = interface.interface_name
        key             = "${device.name}-${interface.interface_name}"
        is_subinterface = can(regex("\\.", interface.interface_name))
        configuration = yamldecode(try(provider::utils::yaml_merge(concat(
          [yamlencode(interface)],
          [for ig_name in try(interface.interface_groups, []) : try([for ig in local.interface_groups_config[device.name] : yamlencode(ig.configuration) if ig.name == ig_name][0], "{}")]
        )), yamlencode(interface)))
      }
    ]
  ])

  device_main_interfaces = flatten([
    for interface in local.device_interfaces_group : {
      device_name    = interface.device_name
      interface_name = interface.interface_name
      key            = interface.key

      l2transport                                              = try(interface.configuration.l2transport, local.defaults.iosxr.configuration.interface.l2transport, null)
      point_to_point                                           = try(interface.configuration.point_to_point, local.defaults.iosxr.configuration.interface.point_to_point, null)
      multipoint                                               = try(interface.configuration.multipoint, local.defaults.iosxr.configuration.interface.multipoint, null)
      dampening_decay_half_life_value                          = try(interface.configuration.dampening_decay_half_life_value, local.defaults.iosxr.configuration.interface.dampening_decay_half_life_value, null)
      ipv4_point_to_point                                      = try(interface.configuration.ipv4_point_to_point, local.defaults.iosxr.configuration.interface.ipv4_point_to_point, null)
      shutdown                                                 = try(interface.configuration.shutdown, local.defaults.iosxr.configuration.interface.shutdown, null)
      mtu                                                      = try(interface.configuration.mtu, local.defaults.iosxr.configuration.interface.mtu, null)
      bandwidth                                                = try(interface.configuration.bandwidth, local.defaults.iosxr.configuration.interface.bandwidth, null)
      description                                              = try(interface.configuration.description, local.defaults.iosxr.configuration.interface.description, null)
      load_interval                                            = try(interface.configuration.load_interval, local.defaults.iosxr.configuration.interface.load_interval, null)
      vrf                                                      = try(interface.configuration.vrf, local.defaults.iosxr.configuration.interface.vrf, null)
      ipv4_address                                             = try(interface.configuration.ipv4_address, local.defaults.iosxr.configuration.interface.ipv4_address, null)
      ipv4_netmask                                             = try(interface.configuration.ipv4_netmask, local.defaults.iosxr.configuration.interface.ipv4_netmask, null)
      ipv4_verify_unicast_source_reachable_via_type            = try(interface.configuration.ipv4_verify_unicast_source_reachable_via_type, local.defaults.iosxr.configuration.interface.ipv4_verify_unicast_source_reachable_via_type, null)
      ipv4_verify_unicast_source_reachable_via_allow_self_ping = try(interface.configuration.ipv4_verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.configuration.interface.ipv4_verify_unicast_source_reachable_via_allow_self_ping, null)
      ipv4_verify_unicast_source_reachable_via_allow_default   = try(interface.configuration.ipv4_verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.configuration.interface.ipv4_verify_unicast_source_reachable_via_allow_default, null)
      ipv4_access_group_ingress_acl1                           = try(interface.configuration.ipv4_access_group_ingress_acl1, local.defaults.iosxr.configuration.interface.ipv4_access_group_ingress_acl1, null)
      ipv4_access_group_ingress_hardware_count                 = try(interface.configuration.ipv4_access_group_ingress_hardware_count, local.defaults.iosxr.configuration.interface.ipv4_access_group_ingress_hardware_count, null)
      ipv4_access_group_ingress_interface_statistics           = try(interface.configuration.ipv4_access_group_ingress_interface_statistics, local.defaults.iosxr.configuration.interface.ipv4_access_group_ingress_interface_statistics, null)
      ipv4_access_group_ingress_compress                       = try(interface.configuration.ipv4_access_group_ingress_compress, local.defaults.iosxr.configuration.interface.ipv4_access_group_ingress_compress, null)
      ipv4_access_group_egress_acl                             = try(interface.configuration.ipv4_access_group_egress_acl, local.defaults.iosxr.configuration.interface.ipv4_access_group_egress_acl, null)
      ipv4_access_group_egress_hardware_count                  = try(interface.configuration.ipv4_access_group_egress_hardware_count, local.defaults.iosxr.configuration.interface.ipv4_access_group_egress_hardware_count, null)
      ipv4_access_group_egress_interface_statistics            = try(interface.configuration.ipv4_access_group_egress_interface_statistics, local.defaults.iosxr.configuration.interface.ipv4_access_group_egress_interface_statistics, null)
      ipv4_access_group_egress_compress                        = try(interface.configuration.ipv4_access_group_egress_compress, local.defaults.iosxr.configuration.interface.ipv4_access_group_egress_compress, null)
      ipv6_verify_unicast_source_reachable_via_type            = try(interface.configuration.ipv6_verify_unicast_source_reachable_via_type, local.defaults.iosxr.configuration.interface.ipv6_verify_unicast_source_reachable_via_type, null)
      ipv6_verify_unicast_source_reachable_via_allow_self_ping = try(interface.configuration.ipv6_verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.configuration.interface.ipv6_verify_unicast_source_reachable_via_allow_self_ping, null)
      ipv6_verify_unicast_source_reachable_via_allow_default   = try(interface.configuration.ipv6_verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.configuration.interface.ipv6_verify_unicast_source_reachable_via_allow_default, null)
      ipv6_link_local_address                                  = try(interface.configuration.ipv6_link_local_address, local.defaults.iosxr.configuration.interface.ipv6_link_local_address, null)
      ipv6_link_local_zone                                     = try(interface.configuration.ipv6_link_local_zone, local.defaults.iosxr.configuration.interface.ipv6_link_local_zone, null)
      ipv6_autoconfig                                          = try(interface.configuration.ipv6_autoconfig, local.defaults.iosxr.configuration.interface.ipv6_autoconfig, null)
      ipv6_enable                                              = try(interface.configuration.ipv6_enable, local.defaults.iosxr.configuration.interface.ipv6_enable, null)
      ipv6_addresses = try(length(interface.configuration.ipv6_addresses) == 0, true) ? null : [for ipv6_address in interface.configuration.ipv6_addresses : {
        address       = try(ipv6_address.address, local.defaults.iosxr.configuration.interface.ipv6_addresses.address, null)
        prefix_length = try(ipv6_address.prefix_length, local.defaults.iosxr.configuration.interface.ipv6_addresses.prefix_length, null)
        zone          = try(ipv6_address.zone, local.defaults.iosxr.configuration.interface.ipv6_addresses.zone, null)
      }]
      ipv6_access_group_ingress_acl1                 = try(interface.configuration.ipv6_access_group_ingress_acl1, local.defaults.iosxr.configuration.interface.ipv6_access_group_ingress_acl1, null)
      ipv6_access_group_ingress_interface_statistics = try(interface.configuration.ipv6_access_group_ingress_interface_statistics, local.defaults.iosxr.configuration.interface.ipv6_access_group_ingress_interface_statistics, null)
      ipv6_access_group_ingress_compress             = try(interface.configuration.ipv6_access_group_ingress_compress, local.defaults.iosxr.configuration.interface.ipv6_access_group_ingress_compress, null)
      ipv6_access_group_egress_acl                   = try(interface.configuration.ipv6_access_group_egress_acl, local.defaults.iosxr.configuration.interface.ipv6_access_group_egress_acl, null)
      ipv6_access_group_egress_interface_statistics  = try(interface.configuration.ipv6_access_group_egress_interface_statistics, local.defaults.iosxr.configuration.interface.ipv6_access_group_egress_interface_statistics, null)
      ipv6_access_group_egress_compress              = try(interface.configuration.ipv6_access_group_egress_compress, local.defaults.iosxr.configuration.interface.ipv6_access_group_egress_compress, null)
      bundle_port_priority                           = try(interface.configuration.bundle_port_priority, local.defaults.iosxr.configuration.interface.bundle_port_priority, null)
      bfd_mode_ietf                                  = try(interface.configuration.bfd_mode_ietf, local.defaults.iosxr.configuration.interface.bfd_mode_ietf, null)
      bundle_id                                      = try(interface.configuration.bundle_id, local.defaults.iosxr.configuration.interface.bundle_id, null)
      bundle_id_mode                                 = try(interface.configuration.bundle_id_mode, local.defaults.iosxr.configuration.interface.bundle_id_mode, null)
      bundle_load_balancing_hash_dst_ip              = try(interface.configuration.bundle_load_balancing_hash_dst_ip, local.defaults.iosxr.configuration.interface.bundle_load_balancing_hash_dst_ip, null)
      bundle_load_balancing_hash_src_ip              = try(interface.configuration.bundle_load_balancing_hash_src_ip, local.defaults.iosxr.configuration.interface.bundle_load_balancing_hash_src_ip, null)
      bundle_maximum_active_links                    = try(interface.configuration.bundle_maximum_active_links, local.defaults.iosxr.configuration.interface.bundle_maximum_active_links, null)
      bundle_minimum_active_links                    = try(interface.configuration.bundle_minimum_active_links, local.defaults.iosxr.configuration.interface.bundle_minimum_active_links, null)
      bundle_shutdown                                = try(interface.configuration.bundle_shutdown, local.defaults.iosxr.configuration.interface.bundle_shutdown, null)
      cdp                                            = try(interface.configuration.cdp, local.defaults.iosxr.configuration.interface.cdp, null)
      encapsulation_dot1q_vlan_id                    = try(interface.configuration.encapsulation_dot1q_vlan_id, local.defaults.iosxr.configuration.interface.encapsulation_dot1q_vlan_id, null)
      l2transport_encapsulation_dot1q_second_dot1q   = try(interface.configuration.l2transport_encapsulation_dot1q_second_dot1q, local.defaults.iosxr.configuration.interface.l2transport_encapsulation_dot1q_second_dot1q, null)
      l2transport_encapsulation_dot1q_vlan_id        = try(interface.configuration.l2transport_encapsulation_dot1q_vlan_id, local.defaults.iosxr.configuration.interface.l2transport_encapsulation_dot1q_vlan_id, null)
      rewrite_ingress_tag_pop_one                    = try(interface.configuration.rewrite_ingress_tag_pop_one, local.defaults.iosxr.configuration.interface.rewrite_ingress_tag_pop_one, null)
      rewrite_ingress_tag_pop_two                    = try(interface.configuration.rewrite_ingress_tag_pop_two, local.defaults.iosxr.configuration.interface.rewrite_ingress_tag_pop_two, null)
      unnumbered                                     = try(interface.configuration.unnumbered, local.defaults.iosxr.configuration.interface.unnumbered, null)
      service_policy_input = try(length(interface.configuration.service_policy_input) == 0, true) ? null : [for service_policy in interface.configuration.service_policy_input : {
        name = try(service_policy.name, local.defaults.iosxr.configuration.interface.service_policy_input.name, null)
      }]
      service_policy_output = try(length(interface.configuration.service_policy_output) == 0, true) ? null : [for service_policy in interface.configuration.service_policy_output : {
        name = try(service_policy.name, local.defaults.iosxr.configuration.interface.service_policy_output.name, null)
      }]
      flow_ipv4_egress_monitor_samplers = try(length(interface.configuration.flow_ipv4_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv4_egress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv4_egress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.configuration.interface.flow_ipv4_egress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv4_egress_monitors = try(length(interface.configuration.flow_ipv4_egress_monitors) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv4_egress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv4_egress_monitors.monitor_map_name, null)
      }]
      flow_ipv4_ingress_monitor_samplers = try(length(interface.configuration.flow_ipv4_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv4_ingress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv4_ingress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.configuration.interface.flow_ipv4_ingress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv4_ingress_monitors = try(length(interface.configuration.flow_ipv4_ingress_monitors) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv4_ingress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv4_ingress_monitors.monitor_map_name, null)
      }]
      flow_ipv6_egress_monitor_samplers = try(length(interface.configuration.flow_ipv6_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv6_egress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv6_egress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.configuration.interface.flow_ipv6_egress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv6_egress_monitors = try(length(interface.configuration.flow_ipv6_egress_monitors) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv6_egress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv6_egress_monitors.monitor_map_name, null)
      }]
      flow_ipv6_ingress_monitor_samplers = try(length(interface.configuration.flow_ipv6_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv6_ingress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv6_ingress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.configuration.interface.flow_ipv6_ingress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv6_ingress_monitors = try(length(interface.configuration.flow_ipv6_ingress_monitors) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv6_ingress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv6_ingress_monitors.monitor_map_name, null)
      }]
    } if !interface.is_subinterface
  ])

  device_sub_interfaces = flatten([
    for interface in local.device_interfaces_group : {
      device_name    = interface.device_name
      interface_name = interface.interface_name
      key            = interface.key

      l2transport                                              = try(interface.configuration.l2transport, local.defaults.iosxr.configuration.interface.l2transport, null)
      point_to_point                                           = try(interface.configuration.point_to_point, local.defaults.iosxr.configuration.interface.point_to_point, null)
      multipoint                                               = try(interface.configuration.multipoint, local.defaults.iosxr.configuration.interface.multipoint, null)
      dampening_decay_half_life_value                          = try(interface.configuration.dampening_decay_half_life_value, local.defaults.iosxr.configuration.interface.dampening_decay_half_life_value, null)
      ipv4_point_to_point                                      = try(interface.configuration.ipv4_point_to_point, local.defaults.iosxr.configuration.interface.ipv4_point_to_point, null)
      shutdown                                                 = try(interface.configuration.shutdown, local.defaults.iosxr.configuration.interface.shutdown, null)
      mtu                                                      = try(interface.configuration.mtu, local.defaults.iosxr.configuration.interface.mtu, null)
      bandwidth                                                = try(interface.configuration.bandwidth, local.defaults.iosxr.configuration.interface.bandwidth, null)
      description                                              = try(interface.configuration.description, local.defaults.iosxr.configuration.interface.description, null)
      load_interval                                            = try(interface.configuration.load_interval, local.defaults.iosxr.configuration.interface.load_interval, null)
      vrf                                                      = try(interface.configuration.vrf, local.defaults.iosxr.configuration.interface.vrf, null)
      ipv4_address                                             = try(interface.configuration.ipv4_address, local.defaults.iosxr.configuration.interface.ipv4_address, null)
      ipv4_netmask                                             = try(interface.configuration.ipv4_netmask, local.defaults.iosxr.configuration.interface.ipv4_netmask, null)
      ipv4_verify_unicast_source_reachable_via_type            = try(interface.configuration.ipv4_verify_unicast_source_reachable_via_type, local.defaults.iosxr.configuration.interface.ipv4_verify_unicast_source_reachable_via_type, null)
      ipv4_verify_unicast_source_reachable_via_allow_self_ping = try(interface.configuration.ipv4_verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.configuration.interface.ipv4_verify_unicast_source_reachable_via_allow_self_ping, null)
      ipv4_verify_unicast_source_reachable_via_allow_default   = try(interface.configuration.ipv4_verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.configuration.interface.ipv4_verify_unicast_source_reachable_via_allow_default, null)
      ipv4_access_group_ingress_acl1                           = try(interface.configuration.ipv4_access_group_ingress_acl1, local.defaults.iosxr.configuration.interface.ipv4_access_group_ingress_acl1, null)
      ipv4_access_group_ingress_hardware_count                 = try(interface.configuration.ipv4_access_group_ingress_hardware_count, local.defaults.iosxr.configuration.interface.ipv4_access_group_ingress_hardware_count, null)
      ipv4_access_group_ingress_interface_statistics           = try(interface.configuration.ipv4_access_group_ingress_interface_statistics, local.defaults.iosxr.configuration.interface.ipv4_access_group_ingress_interface_statistics, null)
      ipv4_access_group_ingress_compress                       = try(interface.configuration.ipv4_access_group_ingress_compress, local.defaults.iosxr.configuration.interface.ipv4_access_group_ingress_compress, null)
      ipv4_access_group_egress_acl                             = try(interface.configuration.ipv4_access_group_egress_acl, local.defaults.iosxr.configuration.interface.ipv4_access_group_egress_acl, null)
      ipv4_access_group_egress_hardware_count                  = try(interface.configuration.ipv4_access_group_egress_hardware_count, local.defaults.iosxr.configuration.interface.ipv4_access_group_egress_hardware_count, null)
      ipv4_access_group_egress_interface_statistics            = try(interface.configuration.ipv4_access_group_egress_interface_statistics, local.defaults.iosxr.configuration.interface.ipv4_access_group_egress_interface_statistics, null)
      ipv4_access_group_egress_compress                        = try(interface.configuration.ipv4_access_group_egress_compress, local.defaults.iosxr.configuration.interface.ipv4_access_group_egress_compress, null)
      ipv6_verify_unicast_source_reachable_via_type            = try(interface.configuration.ipv6_verify_unicast_source_reachable_via_type, local.defaults.iosxr.configuration.interface.ipv6_verify_unicast_source_reachable_via_type, null)
      ipv6_verify_unicast_source_reachable_via_allow_self_ping = try(interface.configuration.ipv6_verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.configuration.interface.ipv6_verify_unicast_source_reachable_via_allow_self_ping, null)
      ipv6_verify_unicast_source_reachable_via_allow_default   = try(interface.configuration.ipv6_verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.configuration.interface.ipv6_verify_unicast_source_reachable_via_allow_default, null)
      ipv6_link_local_address                                  = try(interface.configuration.ipv6_link_local_address, local.defaults.iosxr.configuration.interface.ipv6_link_local_address, null)
      ipv6_link_local_zone                                     = try(interface.configuration.ipv6_link_local_zone, local.defaults.iosxr.configuration.interface.ipv6_link_local_zone, null)
      ipv6_autoconfig                                          = try(interface.configuration.ipv6_autoconfig, local.defaults.iosxr.configuration.interface.ipv6_autoconfig, null)
      ipv6_enable                                              = try(interface.configuration.ipv6_enable, local.defaults.iosxr.configuration.interface.ipv6_enable, null)
      ipv6_addresses = try(length(interface.configuration.ipv6_addresses) == 0, true) ? null : [for ipv6_address in interface.configuration.ipv6_addresses : {
        address       = try(ipv6_address.address, local.defaults.iosxr.configuration.interface.ipv6_addresses.address, null)
        prefix_length = try(ipv6_address.prefix_length, local.defaults.iosxr.configuration.interface.ipv6_addresses.prefix_length, null)
        zone          = try(ipv6_address.zone, local.defaults.iosxr.configuration.interface.ipv6_addresses.zone, null)
      }]
      ipv6_access_group_ingress_acl1                 = try(interface.configuration.ipv6_access_group_ingress_acl1, local.defaults.iosxr.configuration.interface.ipv6_access_group_ingress_acl1, null)
      ipv6_access_group_ingress_interface_statistics = try(interface.configuration.ipv6_access_group_ingress_interface_statistics, local.defaults.iosxr.configuration.interface.ipv6_access_group_ingress_interface_statistics, null)
      ipv6_access_group_ingress_compress             = try(interface.configuration.ipv6_access_group_ingress_compress, local.defaults.iosxr.configuration.interface.ipv6_access_group_ingress_compress, null)
      ipv6_access_group_egress_acl                   = try(interface.configuration.ipv6_access_group_egress_acl, local.defaults.iosxr.configuration.interface.ipv6_access_group_egress_acl, null)
      ipv6_access_group_egress_interface_statistics  = try(interface.configuration.ipv6_access_group_egress_interface_statistics, local.defaults.iosxr.configuration.interface.ipv6_access_group_egress_interface_statistics, null)
      ipv6_access_group_egress_compress              = try(interface.configuration.ipv6_access_group_egress_compress, local.defaults.iosxr.configuration.interface.ipv6_access_group_egress_compress, null)
      bundle_port_priority                           = try(interface.configuration.bundle_port_priority, local.defaults.iosxr.configuration.interface.bundle_port_priority, null)
      bfd_mode_ietf                                  = try(interface.configuration.bfd_mode_ietf, local.defaults.iosxr.configuration.interface.bfd_mode_ietf, null)
      bundle_id                                      = try(interface.configuration.bundle_id, local.defaults.iosxr.configuration.interface.bundle_id, null)
      bundle_id_mode                                 = try(interface.configuration.bundle_id_mode, local.defaults.iosxr.configuration.interface.bundle_id_mode, null)
      bundle_load_balancing_hash_dst_ip              = try(interface.configuration.bundle_load_balancing_hash_dst_ip, local.defaults.iosxr.configuration.interface.bundle_load_balancing_hash_dst_ip, null)
      bundle_load_balancing_hash_src_ip              = try(interface.configuration.bundle_load_balancing_hash_src_ip, local.defaults.iosxr.configuration.interface.bundle_load_balancing_hash_src_ip, null)
      bundle_maximum_active_links                    = try(interface.configuration.bundle_maximum_active_links, local.defaults.iosxr.configuration.interface.bundle_maximum_active_links, null)
      bundle_minimum_active_links                    = try(interface.configuration.bundle_minimum_active_links, local.defaults.iosxr.configuration.interface.bundle_minimum_active_links, null)
      bundle_shutdown                                = try(interface.configuration.bundle_shutdown, local.defaults.iosxr.configuration.interface.bundle_shutdown, null)
      cdp                                            = try(interface.configuration.cdp, local.defaults.iosxr.configuration.interface.cdp, null)
      encapsulation_dot1q_vlan_id                    = try(interface.configuration.encapsulation_dot1q_vlan_id, local.defaults.iosxr.configuration.interface.encapsulation_dot1q_vlan_id, null)
      l2transport_encapsulation_dot1q_second_dot1q   = try(interface.configuration.l2transport_encapsulation_dot1q_second_dot1q, local.defaults.iosxr.configuration.interface.l2transport_encapsulation_dot1q_second_dot1q, null)
      l2transport_encapsulation_dot1q_vlan_id        = try(interface.configuration.l2transport_encapsulation_dot1q_vlan_id, local.defaults.iosxr.configuration.interface.l2transport_encapsulation_dot1q_vlan_id, null)
      rewrite_ingress_tag_pop_one                    = try(interface.configuration.rewrite_ingress_tag_pop_one, local.defaults.iosxr.configuration.interface.rewrite_ingress_tag_pop_one, null)
      rewrite_ingress_tag_pop_two                    = try(interface.configuration.rewrite_ingress_tag_pop_two, local.defaults.iosxr.configuration.interface.rewrite_ingress_tag_pop_two, null)
      unnumbered                                     = try(interface.configuration.unnumbered, local.defaults.iosxr.configuration.interface.unnumbered, null)
      service_policy_input = try(length(interface.configuration.service_policy_input) == 0, true) ? null : [for service_policy in interface.configuration.service_policy_input : {
        name = try(service_policy.name, local.defaults.iosxr.configuration.interface.service_policy_input.name, null)
      }]
      service_policy_output = try(length(interface.configuration.service_policy_output) == 0, true) ? null : [for service_policy in interface.configuration.service_policy_output : {
        name = try(service_policy.name, local.defaults.iosxr.configuration.interface.service_policy_output.name, null)
      }]
      flow_ipv4_egress_monitor_samplers = try(length(interface.configuration.flow_ipv4_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv4_egress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv4_egress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.configuration.interface.flow_ipv4_egress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv4_egress_monitors = try(length(interface.configuration.flow_ipv4_egress_monitors) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv4_egress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv4_egress_monitors.monitor_map_name, null)
      }]
      flow_ipv4_ingress_monitor_samplers = try(length(interface.configuration.flow_ipv4_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv4_ingress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv4_ingress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.configuration.interface.flow_ipv4_ingress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv4_ingress_monitors = try(length(interface.configuration.flow_ipv4_ingress_monitors) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv4_ingress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv4_ingress_monitors.monitor_map_name, null)
      }]
      flow_ipv6_egress_monitor_samplers = try(length(interface.configuration.flow_ipv6_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv6_egress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv6_egress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.configuration.interface.flow_ipv6_egress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv6_egress_monitors = try(length(interface.configuration.flow_ipv6_egress_monitors) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv6_egress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv6_egress_monitors.monitor_map_name, null)
      }]
      flow_ipv6_ingress_monitor_samplers = try(length(interface.configuration.flow_ipv6_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv6_ingress_monitor_samplers : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv6_ingress_monitor_samplers.monitor_map_name, null)
        sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.configuration.interface.flow_ipv6_ingress_monitor_samplers.sampler_map_name, null)
      }]
      flow_ipv6_ingress_monitors = try(length(interface.configuration.flow_ipv6_ingress_monitors) == 0, true) ? null : [for flow_monitor in interface.configuration.flow_ipv6_ingress_monitors : {
        monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.configuration.interface.flow_ipv6_ingress_monitors.monitor_map_name, null)
      }]
    } if interface.is_subinterface
  ])
}

resource "iosxr_interface" "main_interface" {
  for_each = { for interface in local.device_main_interfaces : interface.key => interface }

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
}

resource "iosxr_interface" "sub_interface" {
  for_each = { for interface in local.device_sub_interfaces : interface.key => interface }

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

  depends_on = [iosxr_interface.main_interface]
}

##### ETHERNETS #####

locals {
  interfaces_ethernets = flatten([
    for device in local.devices : [
      for int in try(local.device_config[device.name].interfaces.ethernets, []) : {
        key                          = format("%s/%s%s", device.name, try(int.type, local.defaults.iosxr.devices.configuration.interfaces.ethernets.type, null), trimprefix(int.id, "$string "))
        device                       = device.name
        type                         = try(int.type, local.defaults.iosxr.devices.configuration.interfaces.ethernets.type, null)
        id                           = trimprefix(int.id, "$string ")
        managed                      = try(int.managed, local.defaults.iosxr.devices.configuration.interfaces.ethernets.managed, true)
        l2transport                  = try(int.l2transport, local.defaults.iosxr.devices.configuration.interfaces.ethernets.l2transport, null)
        point_to_point               = try(int.point_to_point, local.defaults.iosxr.devices.configuration.interfaces.ethernets.point_to_point, null)
        multipoint                   = try(int.multipoint, local.defaults.iosxr.devices.configuration.interfaces.ethernets.multipoint, null)
        dampening                    = try(int.dampening, local.defaults.iosxr.devices.configuration.interfaces.ethernets.dampening, null)
        dampening_decay_half_life    = try(int.dampening_decay_half_life, local.defaults.iosxr.devices.configuration.interfaces.ethernets.dampening_decay_half_life, null)
        dampening_reuse_threshold    = try(int.dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.interfaces.ethernets.dampening_reuse_threshold, null)
        dampening_suppress_threshold = try(int.dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.interfaces.ethernets.dampening_suppress_threshold, null)
        dampening_max_suppress_time  = try(int.dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.interfaces.ethernets.dampening_max_suppress_time, null)
        dampening_restart_penalty    = try(int.dampening_restart_penalty, local.defaults.iosxr.devices.configuration.interfaces.ethernets.dampening_restart_penalty, null)
        service_policy_input = try(length(int.service_policy_input) == 0, true) ? null : [for service_policy in int.service_policy_input : {
          name = try(service_policy.name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.service_policy_input.name, null)
        }]
        service_policy_output = try(length(int.service_policy_output) == 0, true) ? null : [for service_policy in int.service_policy_output : {
          name = try(service_policy.name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.service_policy_output.name, null)
        }]
        encapsulation_dot1q_vlan_id                  = try(int.encapsulation_dot1q_vlan_id, local.defaults.iosxr.devices.configuration.interfaces.ethernets.encapsulation_dot1q_vlan_id, null)
        encapsulation_dot1q_second_dot1q             = try(int.encapsulation_dot1q_second_dot1q, local.defaults.iosxr.devices.configuration.interfaces.ethernets.encapsulation_dot1q_second_dot1q, null)
        l2transport_encapsulation_dot1q_vlan_id      = try(int.l2transport_encapsulation_dot1q_vlan_id, local.defaults.iosxr.devices.configuration.interfaces.ethernets.l2transport_encapsulation_dot1q_vlan_id, null)
        l2transport_encapsulation_dot1q_second_dot1q = try(int.l2transport_encapsulation_dot1q_second_dot1q, local.defaults.iosxr.devices.configuration.interfaces.ethernets.l2transport_encapsulation_dot1q_second_dot1q, null)
        rewrite_ingress_tag_pop_one                  = try(int.rewrite_ingress_tag_pop_one, local.defaults.iosxr.devices.configuration.interfaces.ethernets.rewrite_ingress_tag_pop_one, null)
        rewrite_ingress_tag_pop_two                  = try(int.rewrite_ingress_tag_pop_two, local.defaults.iosxr.devices.configuration.interfaces.ethernets.rewrite_ingress_tag_pop_two, null)
        shutdown                                     = try(int.shutdown, local.defaults.iosxr.devices.configuration.interfaces.ethernets.shutdown, null)
        mtu                                          = try(int.mtu, local.defaults.iosxr.devices.configuration.interfaces.ethernets.mtu, null)
        logging_events_link_status                   = try(int.logging_events_link_status, local.defaults.iosxr.devices.configuration.interfaces.ethernets.logging_events_link_status, null)
        bandwidth                                    = try(int.bandwidth, local.defaults.iosxr.devices.configuration.interfaces.ethernets.bandwidth, null)
        description                                  = try(int.description, local.defaults.iosxr.devices.configuration.interfaces.ethernets.description, null)
        load_interval                                = try(int.load_interval, local.defaults.iosxr.devices.configuration.interfaces.ethernets.load_interval, null)
        vrf                                          = try(int.vrf, local.defaults.iosxr.devices.configuration.interfaces.ethernets.vrf, null)
        ipv4_address                                 = try(int.ipv4.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.address, null)
        ipv4_netmask                                 = try(int.ipv4.netmask, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.netmask, null)
        ipv4_route_tag                               = try(int.ipv4.route_tag, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.route_tag, null)
        ipv4_algorithm                               = try(int.ipv4.algorithm, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.algorithm, null)
        ipv4_secondaries = try(length(int.ipv4.secondaries) == 0, true) ? null : [for secondary in int.ipv4.secondaries : {
          address   = try(secondary.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.secondaries.address, null)
          netmask   = try(secondary.netmask, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.secondaries.netmask, null)
          route_tag = try(secondary.route_tag, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.secondaries.route_tag, null)
          algorithm = try(secondary.algorithm, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.secondaries.algorithm, null)
        }]
        ipv4_unnumbered     = try(int.ipv4.unnumbered, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.unnumbered, null)
        ipv4_point_to_point = try(int.ipv4.point_to_point, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.point_to_point, null)
        ipv4_mtu            = try(int.ipv4.mtu, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.mtu, null)
        ipv4_redirects      = try(int.ipv4.redirects, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.redirects, null)
        ipv4_mask_reply     = try(int.ipv4.mask_reply, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.mask_reply, null)
        ipv4_helper_addresses = try(length(int.ipv4.helper_addresses) == 0, true) ? null : [for helper in int.ipv4.helper_addresses : {
          address = try(helper.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.helper_addresses.address, null)
          vrf     = try(helper.vrf, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.helper_addresses.vrf, null)
        }]
        ipv4_unreachables_disable                                = try(int.ipv4.unreachables_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.unreachables_disable, null)
        ipv4_tcp_mss_adjust                                      = try(int.ipv4.tcp_mss_adjust, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.tcp_mss_adjust, null)
        ipv4_forwarding_enable                                   = try(int.ipv4.forwarding_enable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.forwarding_enable, null)
        ipv4_ttl_propagate_disable                               = try(int.ipv4.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.ttl_propagate_disable, null)
        ipv4_verify_unicast_source_reachable_via_type            = try(int.ipv4.verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.verify_unicast_source_reachable_via_type, null)
        ipv4_verify_unicast_source_reachable_via_allow_self_ping = try(int.ipv4.verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.verify_unicast_source_reachable_via_allow_self_ping, can(int.ipv4.verify_unicast_source_reachable_via_type) ? false : null)
        ipv4_verify_unicast_source_reachable_via_allow_default   = try(int.ipv4.verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.verify_unicast_source_reachable_via_allow_default, can(int.ipv4.verify_unicast_source_reachable_via_type) ? false : null)
        ipv4_access_group_ingress_acl1                           = try(int.ipv4.access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.access_group_ingress_acl1, null)
        ipv4_access_group_ingress_hardware_count                 = try(int.ipv4.access_group_ingress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.access_group_ingress_hardware_count, null)
        ipv4_access_group_ingress_interface_statistics           = try(int.ipv4.access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.access_group_ingress_interface_statistics, null)
        ipv4_access_group_ingress_compress                       = try(int.ipv4.access_group_ingress_compress, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.access_group_ingress_compress, null)
        ipv4_access_group_egress_acl                             = try(int.ipv4.access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.access_group_egress_acl, null)
        ipv4_access_group_egress_hardware_count                  = try(int.ipv4.access_group_egress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.access_group_egress_hardware_count, null)
        ipv4_access_group_egress_interface_statistics            = try(int.ipv4.access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.access_group_egress_interface_statistics, null)
        ipv4_access_group_egress_compress                        = try(int.ipv4.access_group_egress_compress, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv4.access_group_egress_compress, null)
        ipv6_verify_unicast_source_reachable_via_type            = try(int.ipv6.verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.verify_unicast_source_reachable_via_type, null)
        ipv6_verify_unicast_source_reachable_via_allow_self_ping = try(int.ipv6.verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.verify_unicast_source_reachable_via_allow_self_ping, can(int.ipv6.verify_unicast_source_reachable_via_type) ? false : null)
        ipv6_verify_unicast_source_reachable_via_allow_default   = try(int.ipv6.verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.verify_unicast_source_reachable_via_allow_default, can(int.ipv6.verify_unicast_source_reachable_via_type) ? false : null)
        ipv6_access_group_ingress_acl1                           = try(int.ipv6.access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.access_group_ingress_acl1, null)
        ipv6_access_group_ingress_interface_statistics           = try(int.ipv6.access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.access_group_ingress_interface_statistics, null)
        ipv6_access_group_ingress_compress                       = try(int.ipv6.access_group_ingress_compress, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.access_group_ingress_compress, null)
        ipv6_access_group_egress_acl                             = try(int.ipv6.access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.access_group_egress_acl, null)
        ipv6_access_group_egress_interface_statistics            = try(int.ipv6.access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.access_group_egress_interface_statistics, null)
        ipv6_access_group_egress_compress                        = try(int.ipv6.access_group_egress_compress, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.access_group_egress_compress, null)
        ipv6_enable                                              = try(int.ipv6.enable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.enable, null)
        ipv6_ttl_propagate_disable                               = try(int.ipv6.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.ttl_propagate_disable, null)
        ipv6_addresses = try(length(int.ipv6.addresses) == 0, true) ? null : [for ipv6_address in int.ipv6.addresses : {
          address       = try(ipv6_address.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.addresses.address, null)
          prefix_length = try(ipv6_address.prefix_length, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.addresses.prefix_length, null)
          zone          = try(ipv6_address.zone, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.addresses.zone, null)
          route_tag     = try(ipv6_address.route_tag, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.addresses.route_tag, null)
          algorithm     = try(ipv6_address.algorithm, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.addresses.algorithm, null)
        }]
        ipv6_link_local_address   = try(int.ipv6.link_local_address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.link_local_address, null)
        ipv6_link_local_zone      = try(int.ipv6.link_local_zone, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.link_local_zone, can(int.ipv6.link_local_address) ? 0 : null)
        ipv6_link_local_route_tag = try(int.ipv6.link_local_route_tag, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.link_local_route_tag, null)
        ipv6_eui64_addresses = try(length(int.ipv6.eui64_addresses) == 0, true) ? null : [for eui64 in int.ipv6.eui64_addresses : {
          address       = try(eui64.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.eui64_addresses.address, null)
          prefix_length = try(eui64.prefix_length, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.eui64_addresses.prefix_length, null)
          zone          = try(eui64.zone, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.eui64_addresses.zone, null)
          route_tag     = try(eui64.route_tag, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.eui64_addresses.route_tag, null)
          algorithm     = try(eui64.algorithm, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.eui64_addresses.algorithm, null)
        }]
        ipv6_autoconfig                      = try(int.ipv6.autoconfig, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.autoconfig, null)
        ipv6_dhcp                            = try(int.ipv6.dhcp, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.dhcp, null)
        ipv6_mtu                             = try(int.ipv6.mtu, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.mtu, null)
        ipv6_unreachables_disable            = try(int.ipv6.unreachables_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.unreachables_disable, null)
        ipv6_tcp_mss_adjust                  = try(int.ipv6.tcp_mss_adjust, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.tcp_mss_adjust, null)
        ipv6_nd_reachable_time               = try(int.ipv6.nd_reachable_time, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.nd_reachable_time, null)
        ipv6_nd_cache_limit                  = try(int.ipv6.nd_cache_limit, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.nd_cache_limit, null)
        ipv6_nd_dad_attempts                 = try(int.ipv6.nd_dad_attempts, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.nd_dad_attempts, null)
        ipv6_nd_unicast_ra                   = try(int.ipv6.nd_unicast_ra, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.nd_unicast_ra, null)
        ipv6_nd_suppress_ra                  = try(int.ipv6.nd_suppress_ra, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.nd_suppress_ra, null)
        ipv6_nd_managed_config_flag          = try(int.ipv6.nd_managed_config_flag, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.nd_managed_config_flag, null)
        ipv6_nd_other_config_flag            = try(int.ipv6.nd_other_config_flag, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.nd_other_config_flag, null)
        ipv6_nd_ns_interval                  = try(int.ipv6.nd_ns_interval, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.nd_ns_interval, null)
        ipv6_nd_ra_interval_max              = try(int.ipv6.nd_ra_interval_max, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.nd_ra_interval_max, null)
        ipv6_nd_ra_interval_min              = try(int.ipv6.nd_ra_interval_min, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.nd_ra_interval_min, null)
        ipv6_nd_ra_lifetime                  = try(int.ipv6.nd_ra_lifetime, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.nd_ra_lifetime, null)
        ipv6_nd_redirects                    = try(int.ipv6.nd_redirects, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.nd_redirects, null)
        ipv6_nd_prefix_default_no_adv        = try(int.ipv6.nd_prefix_default_no_adv, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.nd_prefix_default_no_adv, null)
        ipv6_nd_prefix_default_no_autoconfig = try(int.ipv6.nd_prefix_default_no_autoconfig, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ipv6.nd_prefix_default_no_autoconfig, null)
        ethernet_cfm_mep_domains = try(length(int.ethernet_cfm.mep_domains) == 0, true) ? null : [for domain in int.ethernet_cfm.mep_domains : {
          domain_name                                        = try(domain.domain_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.domain_name, null)
          service                                            = try(domain.service, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.service, null)
          mep_id                                             = try(domain.mep_id, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.mep_id, null)
          propagate_remote_status                            = try(domain.propagate_remote_status, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.propagate_remote_status, null)
          cos                                                = try(domain.cos, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.cos, null)
          loss_measurement_counters_aggregate                = try(domain.loss_measurement_counters_aggregate, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_aggregate, null)
          loss_measurement_counters_priority_cos_range_start = try(domain.loss_measurement_counters_priority_cos_range_start, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_range_start, null)
          loss_measurement_counters_priority_cos_range_end   = try(domain.loss_measurement_counters_priority_cos_range_end, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_range_end, null)
          loss_measurement_counters_priority_cos_value_1     = try(domain.loss_measurement_counters_priority_cos_value_1, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_1, null)
          loss_measurement_counters_priority_cos_value_2     = try(domain.loss_measurement_counters_priority_cos_value_2, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_2, null)
          loss_measurement_counters_priority_cos_value_3     = try(domain.loss_measurement_counters_priority_cos_value_3, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_3, null)
          loss_measurement_counters_priority_cos_value_4     = try(domain.loss_measurement_counters_priority_cos_value_4, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_4, null)
          loss_measurement_counters_priority_cos_value_5     = try(domain.loss_measurement_counters_priority_cos_value_5, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_5, null)
          loss_measurement_counters_priority_cos_value_6     = try(domain.loss_measurement_counters_priority_cos_value_6, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_6, null)
          loss_measurement_counters_priority_cos_value_7     = try(domain.loss_measurement_counters_priority_cos_value_7, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_7, null)
          sla_operation_profile_target_mep_ids = try(length(domain.sla_operation_profile_target_mep_ids) == 0, true) ? null : [for sla in domain.sla_operation_profile_target_mep_ids : {
            profile_name = try(sla.profile_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.sla_operation_profile_target_mep_ids.profile_name, null)
            mep_id       = try(sla.mep_id, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.sla_operation_profile_target_mep_ids.mep_id, null)
          }]
          sla_operation_profile_target_mac_addresses = try(length(domain.sla_operation_profile_target_mac_addresses) == 0, true) ? null : [for sla in domain.sla_operation_profile_target_mac_addresses : {
            profile_name = try(sla.profile_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.sla_operation_profile_target_mac_addresses.profile_name, null)
            mac_address  = try(sla.mac_address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.mep_domains.sla_operation_profile_target_mac_addresses.mac_address, null)
          }]
        }]
        ethernet_cfm_ais_transmission_up_interval            = try(int.ethernet_cfm.ais_transmission_up_interval, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.ais_transmission_up_interval, null)
        ethernet_cfm_ais_transmission_up_cos                 = try(int.ethernet_cfm.ais_transmission_up_cos, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.ais_transmission_up_cos, null)
        ethernet_cfm_bandwidth_notifications_hold_off        = try(int.ethernet_cfm.bandwidth_notifications_hold_off, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.bandwidth_notifications_hold_off, null)
        ethernet_cfm_bandwidth_notifications_wait_to_restore = try(int.ethernet_cfm.bandwidth_notifications_wait_to_restore, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.bandwidth_notifications_wait_to_restore, null)
        ethernet_cfm_bandwidth_notifications_loss_threshold  = try(int.ethernet_cfm.bandwidth_notifications_loss_threshold, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.bandwidth_notifications_loss_threshold, null)
        ethernet_cfm_bandwidth_notifications_log_changes     = try(int.ethernet_cfm.bandwidth_notifications_log_changes, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ethernet_cfm.bandwidth_notifications_log_changes, null)
        flow_ipv4_ingress_monitors = try(length(int.flow_ipv4_ingress_monitors) == 0, true) ? null : [for flow_monitor in int.flow_ipv4_ingress_monitors : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.flow_ipv4_ingress_monitors.monitor_map_name, null)
        }]
        flow_ipv4_ingress_monitor_samplers = try(length(int.flow_ipv4_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in int.flow_ipv4_ingress_monitor_samplers : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.flow_ipv4_ingress_monitor_samplers.monitor_map_name, null)
          sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.flow_ipv4_ingress_monitor_samplers.sampler_map_name, null)
        }]
        flow_ipv4_egress_monitors = try(length(int.flow_ipv4_egress_monitors) == 0, true) ? null : [for flow_monitor in int.flow_ipv4_egress_monitors : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.flow_ipv4_egress_monitors.monitor_map_name, null)
        }]
        flow_ipv4_egress_monitor_samplers = try(length(int.flow_ipv4_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in int.flow_ipv4_egress_monitor_samplers : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.flow_ipv4_egress_monitor_samplers.monitor_map_name, null)
          sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.flow_ipv4_egress_monitor_samplers.sampler_map_name, null)
        }]

        flow_ipv6_ingress_monitors = try(length(int.flow_ipv6_ingress_monitors) == 0, true) ? null : [for flow_monitor in int.flow_ipv6_ingress_monitors : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.flow_ipv6_ingress_monitors.monitor_map_name, null)
        }]
        flow_ipv6_ingress_monitor_samplers = try(length(int.flow_ipv6_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in int.flow_ipv6_ingress_monitor_samplers : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.flow_ipv6_ingress_monitor_samplers.monitor_map_name, null)
          sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.flow_ipv6_ingress_monitor_samplers.sampler_map_name, null)
        }]
        flow_ipv6_egress_monitors = try(length(int.flow_ipv6_egress_monitors) == 0, true) ? null : [for flow_monitor in int.flow_ipv6_egress_monitors : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.flow_ipv6_egress_monitors.monitor_map_name, null)
        }]
        flow_ipv6_egress_monitor_samplers = try(length(int.flow_ipv6_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in int.flow_ipv6_egress_monitor_samplers : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.flow_ipv6_egress_monitor_samplers.monitor_map_name, null)
          sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.flow_ipv6_egress_monitor_samplers.sampler_map_name, null)
        }]
        frequency_synchronization                                                          = try(int.frequency_synchronization.enabled, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.enabled, null)
        frequency_synchronization_ssm_disable                                              = try(int.frequency_synchronization.ssm_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.ssm_disable, null)
        frequency_synchronization_priority                                                 = try(int.frequency_synchronization.priority, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.priority, null)
        frequency_synchronization_time_of_day_priority                                     = try(int.frequency_synchronization.time_of_day_priority, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.time_of_day_priority, null)
        frequency_synchronization_quality_transmit_lowest_itu_t_option_one                 = try(int.frequency_synchronization.quality_transmit_lowest_itu_t_option_one, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_transmit_lowest_itu_t_option_one, null)
        frequency_synchronization_quality_transmit_lowest_itu_t_option_two_generation_one  = try(int.frequency_synchronization.quality_transmit_lowest_itu_t_option_two_generation_one, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_transmit_lowest_itu_t_option_two_generation_one, null)
        frequency_synchronization_quality_transmit_lowest_itu_t_option_two_generation_two  = try(int.frequency_synchronization.quality_transmit_lowest_itu_t_option_two_generation_two, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_transmit_lowest_itu_t_option_two_generation_two, null)
        frequency_synchronization_quality_transmit_highest_itu_t_option_one                = try(int.frequency_synchronization.quality_transmit_highest_itu_t_option_one, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_transmit_highest_itu_t_option_one, null)
        frequency_synchronization_quality_transmit_highest_itu_t_option_two_generation_one = try(int.frequency_synchronization.quality_transmit_highest_itu_t_option_two_generation_one, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_transmit_highest_itu_t_option_two_generation_one, null)
        frequency_synchronization_quality_transmit_highest_itu_t_option_two_generation_two = try(int.frequency_synchronization.quality_transmit_highest_itu_t_option_two_generation_two, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_transmit_highest_itu_t_option_two_generation_two, null)
        frequency_synchronization_quality_transmit_exact_itu_t_option_one                  = try(int.frequency_synchronization.quality_transmit_exact_itu_t_option_one, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_transmit_exact_itu_t_option_one, null)
        frequency_synchronization_quality_transmit_exact_itu_t_option_two_generation_one   = try(int.frequency_synchronization.quality_transmit_exact_itu_t_option_two_generation_one, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_transmit_exact_itu_t_option_two_generation_one, null)
        frequency_synchronization_quality_transmit_exact_itu_t_option_two_generation_two   = try(int.frequency_synchronization.quality_transmit_exact_itu_t_option_two_generation_two, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_transmit_exact_itu_t_option_two_generation_two, null)
        frequency_synchronization_quality_receive_lowest_itu_t_option_one                  = try(int.frequency_synchronization.quality_receive_lowest_itu_t_option_one, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_receive_lowest_itu_t_option_one, null)
        frequency_synchronization_quality_receive_lowest_itu_t_option_two_generation_one   = try(int.frequency_synchronization.quality_receive_lowest_itu_t_option_two_generation_one, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_receive_lowest_itu_t_option_two_generation_one, null)
        frequency_synchronization_quality_receive_lowest_itu_t_option_two_generation_two   = try(int.frequency_synchronization.quality_receive_lowest_itu_t_option_two_generation_two, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_receive_lowest_itu_t_option_two_generation_two, null)
        frequency_synchronization_quality_receive_highest_itu_t_option_one                 = try(int.frequency_synchronization.quality_receive_highest_itu_t_option_one, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_receive_highest_itu_t_option_one, null)
        frequency_synchronization_quality_receive_highest_itu_t_option_two_generation_one  = try(int.frequency_synchronization.quality_receive_highest_itu_t_option_two_generation_one, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_receive_highest_itu_t_option_two_generation_one, null)
        frequency_synchronization_quality_receive_highest_itu_t_option_two_generation_two  = try(int.frequency_synchronization.quality_receive_highest_itu_t_option_two_generation_two, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_receive_highest_itu_t_option_two_generation_two, null)
        frequency_synchronization_quality_receive_exact_itu_t_option_one                   = try(int.frequency_synchronization.quality_receive_exact_itu_t_option_one, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_receive_exact_itu_t_option_one, null)
        frequency_synchronization_quality_receive_exact_itu_t_option_two_generation_one    = try(int.frequency_synchronization.quality_receive_exact_itu_t_option_two_generation_one, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_receive_exact_itu_t_option_two_generation_one, null)
        frequency_synchronization_quality_receive_exact_itu_t_option_two_generation_two    = try(int.frequency_synchronization.quality_receive_exact_itu_t_option_two_generation_two, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.quality_receive_exact_itu_t_option_two_generation_two, null)
        frequency_synchronization_wait_to_restore                                          = try(int.frequency_synchronization.wait_to_restore, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.wait_to_restore, null)
        frequency_synchronization_selection_input                                          = try(int.frequency_synchronization.selection_input, local.defaults.iosxr.devices.configuration.interfaces.ethernets.frequency_synchronization.selection_input, null)
        arp_timeout                                                                        = try(int.arp_timeout, local.defaults.iosxr.devices.configuration.interfaces.ethernets.arp_timeout, null)
        arp_learning_disable                                                               = try(int.arp_learning_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.arp_learning_disable, null)
        arp_learning_local                                                                 = try(int.arp_learning_local, local.defaults.iosxr.devices.configuration.interfaces.ethernets.arp_learning_local, null)
        arp_gratuitous_ignore                                                              = try(int.arp_gratuitous_ignore, local.defaults.iosxr.devices.configuration.interfaces.ethernets.arp_gratuitous_ignore, null)
        arp_cache_limit                                                                    = try(int.arp_cache_limit, local.defaults.iosxr.devices.configuration.interfaces.ethernets.arp_cache_limit, null)
        proxy_arp                                                                          = try(int.proxy_arp, local.defaults.iosxr.devices.configuration.interfaces.ethernets.proxy_arp, null)
        cdp                                                                                = try(int.cdp, local.defaults.iosxr.devices.configuration.interfaces.ethernets.cdp, null)
        bundle_id                                                                          = try(int.bundle_id, local.defaults.iosxr.devices.configuration.interfaces.ethernets.bundle_id, null)
        bundle_id_mode                                                                     = try(int.bundle_id_mode, local.defaults.iosxr.devices.configuration.interfaces.ethernets.bundle_id_mode, can(int.bundle_id) ? "on" : null)
        bundle_port_priority                                                               = try(int.bundle_port_priority, local.defaults.iosxr.devices.configuration.interfaces.ethernets.bundle_port_priority, null)
        lacp_period_short                                                                  = try(int.lacp_period_short, local.defaults.iosxr.devices.configuration.interfaces.ethernets.lacp_period_short, null)
        lacp_period                                                                        = try(int.lacp_period, local.defaults.iosxr.devices.configuration.interfaces.ethernets.lacp_period, null)
        carrier_delay_up                                                                   = try(int.carrier_delay_up, local.defaults.iosxr.devices.configuration.interfaces.ethernets.carrier_delay_up, null)
        carrier_delay_down                                                                 = try(int.carrier_delay_down, local.defaults.iosxr.devices.configuration.interfaces.ethernets.carrier_delay_down, null)
        mac_address                                                                        = try(int.mac_address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.mac_address, null)
        mpls_mtu                                                                           = try(int.mpls_mtu, local.defaults.iosxr.devices.configuration.interfaces.ethernets.mpls_mtu, null)
        speed                                                                              = try(int.speed, local.defaults.iosxr.devices.configuration.interfaces.ethernets.speed, null)
        duplex                                                                             = try(int.duplex, local.defaults.iosxr.devices.configuration.interfaces.ethernets.duplex, null)
        flow_control                                                                       = try(int.flow_control, local.defaults.iosxr.devices.configuration.interfaces.ethernets.flow_control, null)
        fec                                                                                = try(int.fec, local.defaults.iosxr.devices.configuration.interfaces.ethernets.fec, null)
        negotiation_auto                                                                   = try(int.negotiation_auto, local.defaults.iosxr.devices.configuration.interfaces.ethernets.negotiation_auto, null)
        negotiation_auto_allow_overrides                                                   = try(int.negotiation_auto_allow_overrides, local.defaults.iosxr.devices.configuration.interfaces.ethernets.negotiation_auto_allow_overrides, null)
        lldp                                                                               = try(int.lldp, local.defaults.iosxr.devices.configuration.interfaces.ethernets.lldp, null)
        lldp_transmit_disable                                                              = try(int.lldp_transmit_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.lldp_transmit_disable, null)
        lldp_receive_disable                                                               = try(int.lldp_receive_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.lldp_receive_disable, null)
        lldp_tagged                                                                        = try(int.lldp_tagged, local.defaults.iosxr.devices.configuration.interfaces.ethernets.lldp_tagged, null)
        macsec_psk_keychain_name                                                           = try(int.macsec_psk_keychain_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.macsec_psk_keychain_name, null)
        macsec_fallback_psk_keychain                                                       = try(int.macsec_fallback_psk_keychain, local.defaults.iosxr.devices.configuration.interfaces.ethernets.macsec_fallback_psk_keychain, null)
        macsec_policy                                                                      = try(int.macsec_policy, local.defaults.iosxr.devices.configuration.interfaces.ethernets.macsec_policy, null)
        macsec_eap_policy                                                                  = try(int.macsec_eap_policy, local.defaults.iosxr.devices.configuration.interfaces.ethernets.macsec_eap_policy, null)
        monitor_sessions = try(length(int.monitor_sessions) == 0, true) ? null : [for session in int.monitor_sessions : {
          session_name      = try(session.session_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.monitor_sessions.session_name, null)
          ethernet          = try(session.ethernet, local.defaults.iosxr.devices.configuration.interfaces.ethernets.monitor_sessions.ethernet, null)
          direction_rx_only = try(session.direction_rx_only, local.defaults.iosxr.devices.configuration.interfaces.ethernets.monitor_sessions.direction_rx_only, null)
          direction_tx_only = try(session.direction_tx_only, local.defaults.iosxr.devices.configuration.interfaces.ethernets.monitor_sessions.direction_tx_only, null)
          port_level        = try(session.port_level, local.defaults.iosxr.devices.configuration.interfaces.ethernets.monitor_sessions.port_level, null)
          acl               = try(session.acl, local.defaults.iosxr.devices.configuration.interfaces.ethernets.monitor_sessions.acl, null)
          acl_ipv4_name     = try(session.acl_ipv4_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.monitor_sessions.acl_ipv4_name, null)
          acl_ipv6_name     = try(session.acl_ipv6_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.monitor_sessions.acl_ipv6_name, null)
          mirror_first      = try(session.mirror_first, local.defaults.iosxr.devices.configuration.interfaces.ethernets.monitor_sessions.mirror_first, null)
          mirror_interval   = try(session.mirror_interval, local.defaults.iosxr.devices.configuration.interfaces.ethernets.monitor_sessions.mirror_interval, null)
        }]
        ptp                                              = try(int.ptp.enable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.enable, null)
        ptp_profile                                      = try(int.ptp.profile, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.profile, null)
        ptp_transport_ipv4                               = try(int.ptp.transport_ipv4, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.transport_ipv4, null)
        ptp_transport_ethernet                           = try(int.ptp.transport_ethernet, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.transport_ethernet, null)
        ptp_transport_ipv6                               = try(int.ptp.transport_ipv6, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.transport_ipv6, null)
        ptp_clock_operation_one_step                     = try(int.ptp.clock_operation_one_step, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.clock_operation_one_step, null)
        ptp_clock_operation_two_step                     = try(int.ptp.clock_operation_two_step, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.clock_operation_two_step, null)
        ptp_announce_interval                            = try(int.ptp.announce_interval, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.announce_interval, null)
        ptp_announce_frequency                           = try(int.ptp.announce_frequency, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.announce_frequency, null)
        ptp_announce_timeout                             = try(int.ptp.announce_timeout, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.announce_timeout, null)
        ptp_announce_grant_duration                      = try(int.ptp.announce_grant_duration, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.announce_grant_duration, null)
        ptp_sync_interval                                = try(int.ptp.sync_interval, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.sync_interval, null)
        ptp_sync_frequency                               = try(int.ptp.sync_frequency, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.sync_frequency, null)
        ptp_sync_grant_duration                          = try(int.ptp.sync_grant_duration, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.sync_grant_duration, null)
        ptp_sync_timeout                                 = try(int.ptp.sync_timeout, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.sync_timeout, null)
        ptp_delay_request_interval                       = try(int.ptp.delay_request_interval, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.delay_request_interval, null)
        ptp_delay_request_frequency                      = try(int.ptp.delay_request_frequency, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.delay_request_frequency, null)
        ptp_cos                                          = try(int.ptp.cos, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.cos, null)
        ptp_cos_event                                    = try(int.ptp.cos_event, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.cos_event, null)
        ptp_cos_general                                  = try(int.ptp.cos_general, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.cos_general, null)
        ptp_dscp                                         = try(int.ptp.dscp, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.dscp, null)
        ptp_dscp_event                                   = try(int.ptp.dscp_event, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.dscp_event, null)
        ptp_dscp_general                                 = try(int.ptp.dscp_general, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.dscp_general, null)
        ptp_ipv4_ttl                                     = try(int.ptp.ipv4_ttl, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.ipv4_ttl, null)
        ptp_ipv6_hop_limit                               = try(int.ptp.ipv6_hop_limit, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.ipv6_hop_limit, null)
        ptp_delay_asymmetry_value                        = try(int.ptp.delay_asymmetry_value, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.delay_asymmetry_value, null)
        ptp_delay_asymmetry_unit_nanoseconds             = try(int.ptp.delay_asymmetry_unit_nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.delay_asymmetry_unit_nanoseconds, null)
        ptp_delay_asymmetry_unit_microseconds            = try(int.ptp.delay_asymmetry_unit_microseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.delay_asymmetry_unit_microseconds, null)
        ptp_delay_asymmetry_unit_milliseconds            = try(int.ptp.delay_asymmetry_unit_milliseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.delay_asymmetry_unit_milliseconds, null)
        ptp_delay_response_grant_duration                = try(int.ptp.delay_response_grant_duration, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.delay_response_grant_duration, null)
        ptp_delay_response_timeout                       = try(int.ptp.delay_response_timeout, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.delay_response_timeout, null)
        ptp_unicast_grant_invalid_request_reduce         = try(int.ptp.unicast_grant_invalid_request_reduce, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.unicast_grant_invalid_request_reduce, null)
        ptp_unicast_grant_invalid_request_deny           = try(int.ptp.unicast_grant_invalid_request_deny, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.unicast_grant_invalid_request_deny, null)
        ptp_multicast                                    = try(int.ptp.multicast, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.multicast, null)
        ptp_multicast_mixed                              = try(int.ptp.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.multicast_mixed, null)
        ptp_multicast_disable                            = try(int.ptp.multicast_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.multicast_disable, null)
        ptp_multicast_target_address_mac_forwardable     = try(int.ptp.multicast_target_address_mac_forwardable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.multicast_target_address_mac_forwardable, null)
        ptp_multicast_target_address_mac_non_forwardable = try(int.ptp.multicast_target_address_mac_non_forwardable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.multicast_target_address_mac_non_forwardable, null)
        ptp_port_state_slave_only                        = try(int.ptp.port_state_slave_only, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.port_state_slave_only, null)
        ptp_port_state_master_only                       = try(int.ptp.port_state_master_only, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.port_state_master_only, null)
        ptp_port_state_any                               = try(int.ptp.port_state_any, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.port_state_any, null)
        ptp_source_ipv4_address                          = try(int.ptp.source_ipv4_address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.source_ipv4_address, null)
        ptp_source_ipv4_address_disable                  = try(int.ptp.source_ipv4_address_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.source_ipv4_address_disable, null)
        ptp_source_ipv6_address                          = try(int.ptp.source_ipv6_address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.source_ipv6_address, null)
        ptp_source_ipv6_address_disable                  = try(int.ptp.source_ipv6_address_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.source_ipv6_address_disable, null)
        ptp_local_priority                               = try(int.ptp.local_priority, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.local_priority, null)
        ptp_slave_ipv4s = try(length(int.ptp.slave_ipv4s) == 0, true) ? null : [for slave in int.ptp.slave_ipv4s : {
          address        = try(slave.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.slave_ipv4s.address, null)
          non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.slave_ipv4s.non_negotiated, null)
        }]
        ptp_slave_ipv6s = try(length(int.ptp.slave_ipv6s) == 0, true) ? null : [for slave in int.ptp.slave_ipv6s : {
          address        = try(slave.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.slave_ipv6s.address, null)
          non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.slave_ipv6s.non_negotiated, null)
        }]
        ptp_slave_ethernets = try(length(int.ptp.slave_ethernets) == 0, true) ? null : [for slave in int.ptp.slave_ethernets : {
          address        = try(slave.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.slave_ethernets.address, null)
          non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.slave_ethernets.non_negotiated, null)
        }]
        ptp_master_ipv4s = try(length(int.ptp.master_ipv4s) == 0, true) ? null : [for master in int.ptp.master_ipv4s : {
          address         = try(master.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv4s.address, null)
          priority        = try(master.priority, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv4s.priority, null)
          clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv4s.clock_class, null)
          multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv4s.multicast, null)
          multicast_mixed = try(master.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv4s.multicast_mixed, null)
          non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv4s.non_negotiated, null)
          delay_asymmetry = try(master.delay_asymmetry, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv4s.delay_asymmetry, null)
          nanoseconds     = try(master.nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv4s.nanoseconds, null)
          microseconds    = try(master.microseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv4s.microseconds, null)
          milliseconds    = try(master.milliseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv4s.milliseconds, null)
        }]
        ptp_master_ipv6s = try(length(int.ptp.master_ipv6s) == 0, true) ? null : [for master in int.ptp.master_ipv6s : {
          address         = try(master.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv6s.address, null)
          priority        = try(master.priority, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv6s.priority, null)
          clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv6s.clock_class, null)
          multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv6s.multicast, null)
          multicast_mixed = try(master.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv6s.multicast_mixed, null)
          non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv6s.non_negotiated, null)
          delay_asymmetry = try(master.delay_asymmetry, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv6s.delay_asymmetry, null)
          nanoseconds     = try(master.nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv6s.nanoseconds, null)
          microseconds    = try(master.microseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv6s.microseconds, null)
          milliseconds    = try(master.milliseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ipv6s.milliseconds, null)
        }]
        ptp_master_ethernets = try(length(int.ptp.master_ethernets) == 0, true) ? null : [for master in int.ptp.master_ethernets : {
          address         = try(master.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ethernets.address, null)
          priority        = try(master.priority, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ethernets.priority, null)
          clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ethernets.clock_class, null)
          multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ethernets.multicast, null)
          multicast_mixed = try(master.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ethernets.multicast_mixed, null)
          non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ethernets.non_negotiated, null)
          delay_asymmetry = try(master.delay_asymmetry, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ethernets.delay_asymmetry, null)
          nanoseconds     = try(master.nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ethernets.nanoseconds, null)
          microseconds    = try(master.microseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ethernets.microseconds, null)
          milliseconds    = try(master.milliseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.master_ethernets.milliseconds, null)
        }]
        ptp_interop_profile_default                              = try(int.ptp.interop_profile_default, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_profile_default, null)
        ptp_interop_profile_g_8265_1                             = try(int.ptp.interop_profile_g_8265_1, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_profile_g_8265_1, null)
        ptp_interop_profile_g_8275_1                             = try(int.ptp.interop_profile_g_8275_1, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_profile_g_8275_1, null)
        ptp_interop_profile_g_8275_2                             = try(int.ptp.interop_profile_g_8275_2, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_profile_g_8275_2, null)
        ptp_interop_domain                                       = try(int.ptp.interop_domain, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_domain, null)
        ptp_interop_egress_conversion_priority1                  = try(int.ptp.interop_egress_conversion_priority1, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_egress_conversion_priority1, null)
        ptp_interop_egress_conversion_priority2                  = try(int.ptp.interop_egress_conversion_priority2, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_egress_conversion_priority2, null)
        ptp_interop_egress_conversion_clock_accuracy             = try(int.ptp.interop_egress_conversion_clock_accuracy, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_egress_conversion_clock_accuracy, null)
        ptp_interop_egress_conversion_offset_scaled_log_variance = try(int.ptp.interop_egress_conversion_offset_scaled_log_variance, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_egress_conversion_offset_scaled_log_variance, null)
        ptp_interop_egress_conversion_clock_class_default        = try(int.ptp.interop_egress_conversion_clock_class_default, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_egress_conversion_clock_class_default, null)
        ptp_interop_egress_conversion_clock_class_mappings = try(length(int.ptp.interop_egress_conversion_clock_class_mappings) == 0, true) ? null : [for mapping in int.ptp.interop_egress_conversion_clock_class_mappings : {
          clock_class_to_map_from = try(mapping.clock_class_to_map_from, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_egress_conversion_clock_class_mappings.clock_class_to_map_from, null)
          clock_class_to_map_to   = try(mapping.clock_class_to_map_to, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_egress_conversion_clock_class_mappings.clock_class_to_map_to, null)
        }]
        ptp_interop_ingress_conversion_priority1                  = try(int.ptp.interop_ingress_conversion_priority1, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_ingress_conversion_priority1, null)
        ptp_interop_ingress_conversion_priority2                  = try(int.ptp.interop_ingress_conversion_priority2, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_ingress_conversion_priority2, null)
        ptp_interop_ingress_conversion_clock_accuracy             = try(int.ptp.interop_ingress_conversion_clock_accuracy, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_ingress_conversion_clock_accuracy, null)
        ptp_interop_ingress_conversion_offset_scaled_log_variance = try(int.ptp.interop_ingress_conversion_offset_scaled_log_variance, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_ingress_conversion_offset_scaled_log_variance, null)
        ptp_interop_ingress_conversion_clock_class_default        = try(int.ptp.interop_ingress_conversion_clock_class_default, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_ingress_conversion_clock_class_default, null)
        ptp_interop_ingress_conversion_clock_class_mappings = try(length(int.ptp.interop_ingress_conversion_clock_class_mappings) == 0, true) ? null : [for mapping in int.ptp.interop_ingress_conversion_clock_class_mappings : {
          clock_class_to_map_from = try(mapping.clock_class_to_map_from, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_ingress_conversion_clock_class_mappings.clock_class_to_map_from, null)
          clock_class_to_map_to   = try(mapping.clock_class_to_map_to, local.defaults.iosxr.devices.configuration.interfaces.ethernets.ptp.interop_ingress_conversion_clock_class_mappings.clock_class_to_map_to, null)
        }]
      }
    ]
  ])
}

resource "iosxr_interface_ethernet" "ethernet" {
  for_each = { for int in local.interfaces_ethernets : int.key => int if int.managed }
  device   = each.value.device
  type     = each.value.type
  name     = each.value.id

  l2transport                                                                        = each.value.l2transport
  point_to_point                                                                     = each.value.point_to_point
  multipoint                                                                         = each.value.multipoint
  dampening                                                                          = each.value.dampening
  dampening_decay_half_life                                                          = each.value.dampening_decay_half_life
  dampening_reuse_threshold                                                          = each.value.dampening_reuse_threshold
  dampening_suppress_threshold                                                       = each.value.dampening_suppress_threshold
  dampening_max_suppress_time                                                        = each.value.dampening_max_suppress_time
  dampening_restart_penalty                                                          = each.value.dampening_restart_penalty
  service_policy_input                                                               = each.value.service_policy_input
  service_policy_output                                                              = each.value.service_policy_output
  encapsulation_dot1q_vlan_id                                                        = each.value.encapsulation_dot1q_vlan_id
  encapsulation_dot1q_second_dot1q                                                   = each.value.encapsulation_dot1q_second_dot1q
  l2transport_encapsulation_dot1q_vlan_id                                            = each.value.l2transport_encapsulation_dot1q_vlan_id
  l2transport_encapsulation_dot1q_second_dot1q                                       = each.value.l2transport_encapsulation_dot1q_second_dot1q
  rewrite_ingress_tag_pop_one                                                        = each.value.rewrite_ingress_tag_pop_one
  rewrite_ingress_tag_pop_two                                                        = each.value.rewrite_ingress_tag_pop_two
  shutdown                                                                           = each.value.shutdown
  mtu                                                                                = each.value.mtu
  logging_events_link_status                                                         = each.value.logging_events_link_status
  bandwidth                                                                          = each.value.bandwidth
  description                                                                        = each.value.description
  load_interval                                                                      = each.value.load_interval
  vrf                                                                                = each.value.vrf
  ipv4_address                                                                       = each.value.ipv4_address
  ipv4_netmask                                                                       = each.value.ipv4_netmask
  ipv4_route_tag                                                                     = each.value.ipv4_route_tag
  ipv4_algorithm                                                                     = each.value.ipv4_algorithm
  ipv4_secondaries                                                                   = each.value.ipv4_secondaries
  ipv4_unnumbered                                                                    = each.value.ipv4_unnumbered
  ipv4_point_to_point                                                                = each.value.ipv4_point_to_point
  ipv4_mtu                                                                           = each.value.ipv4_mtu
  ipv4_redirects                                                                     = each.value.ipv4_redirects
  ipv4_mask_reply                                                                    = each.value.ipv4_mask_reply
  ipv4_helper_addresses                                                              = each.value.ipv4_helper_addresses
  ipv4_unreachables_disable                                                          = each.value.ipv4_unreachables_disable
  ipv4_tcp_mss_adjust                                                                = each.value.ipv4_tcp_mss_adjust
  ipv4_forwarding_enable                                                             = each.value.ipv4_forwarding_enable
  ipv4_ttl_propagate_disable                                                         = each.value.ipv4_ttl_propagate_disable
  ipv4_verify_unicast_source_reachable_via_type                                      = each.value.ipv4_verify_unicast_source_reachable_via_type
  ipv4_verify_unicast_source_reachable_via_allow_self_ping                           = each.value.ipv4_verify_unicast_source_reachable_via_allow_self_ping
  ipv4_verify_unicast_source_reachable_via_allow_default                             = each.value.ipv4_verify_unicast_source_reachable_via_allow_default
  ipv4_access_group_ingress_acl1                                                     = each.value.ipv4_access_group_ingress_acl1
  ipv4_access_group_ingress_hardware_count                                           = each.value.ipv4_access_group_ingress_hardware_count
  ipv4_access_group_ingress_interface_statistics                                     = each.value.ipv4_access_group_ingress_interface_statistics
  ipv4_access_group_ingress_compress                                                 = each.value.ipv4_access_group_ingress_compress
  ipv4_access_group_egress_acl                                                       = each.value.ipv4_access_group_egress_acl
  ipv4_access_group_egress_hardware_count                                            = each.value.ipv4_access_group_egress_hardware_count
  ipv4_access_group_egress_interface_statistics                                      = each.value.ipv4_access_group_egress_interface_statistics
  ipv4_access_group_egress_compress                                                  = each.value.ipv4_access_group_egress_compress
  ipv6_verify_unicast_source_reachable_via_type                                      = each.value.ipv6_verify_unicast_source_reachable_via_type
  ipv6_verify_unicast_source_reachable_via_allow_self_ping                           = each.value.ipv6_verify_unicast_source_reachable_via_allow_self_ping
  ipv6_verify_unicast_source_reachable_via_allow_default                             = each.value.ipv6_verify_unicast_source_reachable_via_allow_default
  ipv6_access_group_ingress_acl1                                                     = each.value.ipv6_access_group_ingress_acl1
  ipv6_access_group_ingress_interface_statistics                                     = each.value.ipv6_access_group_ingress_interface_statistics
  ipv6_access_group_ingress_compress                                                 = each.value.ipv6_access_group_ingress_compress
  ipv6_access_group_egress_acl                                                       = each.value.ipv6_access_group_egress_acl
  ipv6_access_group_egress_interface_statistics                                      = each.value.ipv6_access_group_egress_interface_statistics
  ipv6_access_group_egress_compress                                                  = each.value.ipv6_access_group_egress_compress
  ipv6_enable                                                                        = each.value.ipv6_enable
  ipv6_ttl_propagate_disable                                                         = each.value.ipv6_ttl_propagate_disable
  ipv6_addresses                                                                     = each.value.ipv6_addresses
  ipv6_link_local_address                                                            = each.value.ipv6_link_local_address
  ipv6_link_local_zone                                                               = each.value.ipv6_link_local_zone
  ipv6_link_local_route_tag                                                          = each.value.ipv6_link_local_route_tag
  ipv6_eui64_addresses                                                               = each.value.ipv6_eui64_addresses
  ipv6_autoconfig                                                                    = each.value.ipv6_autoconfig
  ipv6_dhcp                                                                          = each.value.ipv6_dhcp
  ipv6_mtu                                                                           = each.value.ipv6_mtu
  ipv6_unreachables_disable                                                          = each.value.ipv6_unreachables_disable
  ipv6_tcp_mss_adjust                                                                = each.value.ipv6_tcp_mss_adjust
  ipv6_nd_reachable_time                                                             = each.value.ipv6_nd_reachable_time
  ipv6_nd_cache_limit                                                                = each.value.ipv6_nd_cache_limit
  ipv6_nd_dad_attempts                                                               = each.value.ipv6_nd_dad_attempts
  ipv6_nd_unicast_ra                                                                 = each.value.ipv6_nd_unicast_ra
  ipv6_nd_suppress_ra                                                                = each.value.ipv6_nd_suppress_ra
  ipv6_nd_managed_config_flag                                                        = each.value.ipv6_nd_managed_config_flag
  ipv6_nd_other_config_flag                                                          = each.value.ipv6_nd_other_config_flag
  ipv6_nd_ns_interval                                                                = each.value.ipv6_nd_ns_interval
  ipv6_nd_ra_interval_max                                                            = each.value.ipv6_nd_ra_interval_max
  ipv6_nd_ra_interval_min                                                            = each.value.ipv6_nd_ra_interval_min
  ipv6_nd_ra_lifetime                                                                = each.value.ipv6_nd_ra_lifetime
  ipv6_nd_redirects                                                                  = each.value.ipv6_nd_redirects
  ipv6_nd_prefix_default_no_adv                                                      = each.value.ipv6_nd_prefix_default_no_adv
  ipv6_nd_prefix_default_no_autoconfig                                               = each.value.ipv6_nd_prefix_default_no_autoconfig
  ethernet_cfm_mep_domains                                                           = each.value.ethernet_cfm_mep_domains
  ethernet_cfm_ais_transmission_up_interval                                          = each.value.ethernet_cfm_ais_transmission_up_interval
  ethernet_cfm_ais_transmission_up_cos                                               = each.value.ethernet_cfm_ais_transmission_up_cos
  ethernet_cfm_bandwidth_notifications_hold_off                                      = each.value.ethernet_cfm_bandwidth_notifications_hold_off
  ethernet_cfm_bandwidth_notifications_wait_to_restore                               = each.value.ethernet_cfm_bandwidth_notifications_wait_to_restore
  ethernet_cfm_bandwidth_notifications_loss_threshold                                = each.value.ethernet_cfm_bandwidth_notifications_loss_threshold
  ethernet_cfm_bandwidth_notifications_log_changes                                   = each.value.ethernet_cfm_bandwidth_notifications_log_changes
  flow_ipv4_ingress_monitors                                                         = each.value.flow_ipv4_ingress_monitors
  flow_ipv4_ingress_monitor_samplers                                                 = each.value.flow_ipv4_ingress_monitor_samplers
  flow_ipv4_egress_monitors                                                          = each.value.flow_ipv4_egress_monitors
  flow_ipv4_egress_monitor_samplers                                                  = each.value.flow_ipv4_egress_monitor_samplers
  flow_ipv6_ingress_monitors                                                         = each.value.flow_ipv6_ingress_monitors
  flow_ipv6_ingress_monitor_samplers                                                 = each.value.flow_ipv6_ingress_monitor_samplers
  flow_ipv6_egress_monitors                                                          = each.value.flow_ipv6_egress_monitors
  flow_ipv6_egress_monitor_samplers                                                  = each.value.flow_ipv6_egress_monitor_samplers
  frequency_synchronization                                                          = each.value.frequency_synchronization
  frequency_synchronization_ssm_disable                                              = each.value.frequency_synchronization_ssm_disable
  frequency_synchronization_priority                                                 = each.value.frequency_synchronization_priority
  frequency_synchronization_time_of_day_priority                                     = each.value.frequency_synchronization_time_of_day_priority
  frequency_synchronization_quality_transmit_lowest_itu_t_option_one                 = each.value.frequency_synchronization_quality_transmit_lowest_itu_t_option_one
  frequency_synchronization_quality_transmit_lowest_itu_t_option_two_generation_one  = each.value.frequency_synchronization_quality_transmit_lowest_itu_t_option_two_generation_one
  frequency_synchronization_quality_transmit_lowest_itu_t_option_two_generation_two  = each.value.frequency_synchronization_quality_transmit_lowest_itu_t_option_two_generation_two
  frequency_synchronization_quality_transmit_highest_itu_t_option_one                = each.value.frequency_synchronization_quality_transmit_highest_itu_t_option_one
  frequency_synchronization_quality_transmit_highest_itu_t_option_two_generation_one = each.value.frequency_synchronization_quality_transmit_highest_itu_t_option_two_generation_one
  frequency_synchronization_quality_transmit_highest_itu_t_option_two_generation_two = each.value.frequency_synchronization_quality_transmit_highest_itu_t_option_two_generation_two
  frequency_synchronization_quality_transmit_exact_itu_t_option_one                  = each.value.frequency_synchronization_quality_transmit_exact_itu_t_option_one
  frequency_synchronization_quality_transmit_exact_itu_t_option_two_generation_one   = each.value.frequency_synchronization_quality_transmit_exact_itu_t_option_two_generation_one
  frequency_synchronization_quality_transmit_exact_itu_t_option_two_generation_two   = each.value.frequency_synchronization_quality_transmit_exact_itu_t_option_two_generation_two
  frequency_synchronization_quality_receive_lowest_itu_t_option_one                  = each.value.frequency_synchronization_quality_receive_lowest_itu_t_option_one
  frequency_synchronization_quality_receive_lowest_itu_t_option_two_generation_one   = each.value.frequency_synchronization_quality_receive_lowest_itu_t_option_two_generation_one
  frequency_synchronization_quality_receive_lowest_itu_t_option_two_generation_two   = each.value.frequency_synchronization_quality_receive_lowest_itu_t_option_two_generation_two
  frequency_synchronization_quality_receive_highest_itu_t_option_one                 = each.value.frequency_synchronization_quality_receive_highest_itu_t_option_one
  frequency_synchronization_quality_receive_highest_itu_t_option_two_generation_one  = each.value.frequency_synchronization_quality_receive_highest_itu_t_option_two_generation_one
  frequency_synchronization_quality_receive_highest_itu_t_option_two_generation_two  = each.value.frequency_synchronization_quality_receive_highest_itu_t_option_two_generation_two
  frequency_synchronization_quality_receive_exact_itu_t_option_one                   = each.value.frequency_synchronization_quality_receive_exact_itu_t_option_one
  frequency_synchronization_quality_receive_exact_itu_t_option_two_generation_one    = each.value.frequency_synchronization_quality_receive_exact_itu_t_option_two_generation_one
  frequency_synchronization_quality_receive_exact_itu_t_option_two_generation_two    = each.value.frequency_synchronization_quality_receive_exact_itu_t_option_two_generation_two
  frequency_synchronization_wait_to_restore                                          = each.value.frequency_synchronization_wait_to_restore
  frequency_synchronization_selection_input                                          = each.value.frequency_synchronization_selection_input
  arp_timeout                                                                        = each.value.arp_timeout
  arp_learning_disable                                                               = each.value.arp_learning_disable
  arp_learning_local                                                                 = each.value.arp_learning_local
  arp_gratuitous_ignore                                                              = each.value.arp_gratuitous_ignore
  arp_cache_limit                                                                    = each.value.arp_cache_limit
  proxy_arp                                                                          = each.value.proxy_arp
  cdp                                                                                = each.value.cdp
  bundle_id                                                                          = each.value.bundle_id
  bundle_id_mode                                                                     = each.value.bundle_id_mode
  bundle_port_priority                                                               = each.value.bundle_port_priority
  lacp_period_short                                                                  = each.value.lacp_period_short
  lacp_period                                                                        = each.value.lacp_period
  carrier_delay_up                                                                   = each.value.carrier_delay_up
  carrier_delay_down                                                                 = each.value.carrier_delay_down
  mac_address                                                                        = each.value.mac_address
  mpls_mtu                                                                           = each.value.mpls_mtu
  speed                                                                              = each.value.speed
  duplex                                                                             = each.value.duplex
  flow_control                                                                       = each.value.flow_control
  fec                                                                                = each.value.fec
  negotiation_auto                                                                   = each.value.negotiation_auto
  negotiation_auto_allow_overrides                                                   = each.value.negotiation_auto_allow_overrides
  lldp                                                                               = each.value.lldp
  lldp_transmit_disable                                                              = each.value.lldp_transmit_disable
  lldp_receive_disable                                                               = each.value.lldp_receive_disable
  lldp_tagged                                                                        = each.value.lldp_tagged
  macsec_psk_keychain_name                                                           = each.value.macsec_psk_keychain_name
  macsec_fallback_psk_keychain                                                       = each.value.macsec_fallback_psk_keychain
  macsec_policy                                                                      = each.value.macsec_policy
  macsec_eap_policy                                                                  = each.value.macsec_eap_policy
  monitor_sessions                                                                   = each.value.monitor_sessions
  ptp                                                                                = each.value.ptp
  ptp_profile                                                                        = each.value.ptp_profile
  ptp_transport_ipv4                                                                 = each.value.ptp_transport_ipv4
  ptp_transport_ethernet                                                             = each.value.ptp_transport_ethernet
  ptp_transport_ipv6                                                                 = each.value.ptp_transport_ipv6
  ptp_clock_operation_one_step                                                       = each.value.ptp_clock_operation_one_step
  ptp_clock_operation_two_step                                                       = each.value.ptp_clock_operation_two_step
  ptp_announce_interval                                                              = each.value.ptp_announce_interval
  ptp_announce_frequency                                                             = each.value.ptp_announce_frequency
  ptp_announce_timeout                                                               = each.value.ptp_announce_timeout
  ptp_announce_grant_duration                                                        = each.value.ptp_announce_grant_duration
  ptp_sync_interval                                                                  = each.value.ptp_sync_interval
  ptp_sync_frequency                                                                 = each.value.ptp_sync_frequency
  ptp_sync_grant_duration                                                            = each.value.ptp_sync_grant_duration
  ptp_sync_timeout                                                                   = each.value.ptp_sync_timeout
  ptp_delay_request_interval                                                         = each.value.ptp_delay_request_interval
  ptp_delay_request_frequency                                                        = each.value.ptp_delay_request_frequency
  ptp_cos                                                                            = each.value.ptp_cos
  ptp_cos_event                                                                      = each.value.ptp_cos_event
  ptp_cos_general                                                                    = each.value.ptp_cos_general
  ptp_dscp                                                                           = each.value.ptp_dscp
  ptp_dscp_event                                                                     = each.value.ptp_dscp_event
  ptp_dscp_general                                                                   = each.value.ptp_dscp_general
  ptp_ipv4_ttl                                                                       = each.value.ptp_ipv4_ttl
  ptp_ipv6_hop_limit                                                                 = each.value.ptp_ipv6_hop_limit
  ptp_delay_asymmetry_value                                                          = each.value.ptp_delay_asymmetry_value
  ptp_delay_asymmetry_unit_nanoseconds                                               = each.value.ptp_delay_asymmetry_unit_nanoseconds
  ptp_delay_asymmetry_unit_microseconds                                              = each.value.ptp_delay_asymmetry_unit_microseconds
  ptp_delay_asymmetry_unit_milliseconds                                              = each.value.ptp_delay_asymmetry_unit_milliseconds
  ptp_delay_response_grant_duration                                                  = each.value.ptp_delay_response_grant_duration
  ptp_delay_response_timeout                                                         = each.value.ptp_delay_response_timeout
  ptp_unicast_grant_invalid_request_reduce                                           = each.value.ptp_unicast_grant_invalid_request_reduce
  ptp_unicast_grant_invalid_request_deny                                             = each.value.ptp_unicast_grant_invalid_request_deny
  ptp_multicast                                                                      = each.value.ptp_multicast
  ptp_multicast_mixed                                                                = each.value.ptp_multicast_mixed
  ptp_multicast_disable                                                              = each.value.ptp_multicast_disable
  ptp_multicast_target_address_mac_forwardable                                       = each.value.ptp_multicast_target_address_mac_forwardable
  ptp_multicast_target_address_mac_non_forwardable                                   = each.value.ptp_multicast_target_address_mac_non_forwardable
  ptp_port_state_slave_only                                                          = each.value.ptp_port_state_slave_only
  ptp_port_state_master_only                                                         = each.value.ptp_port_state_master_only
  ptp_port_state_any                                                                 = each.value.ptp_port_state_any
  ptp_source_ipv4_address                                                            = each.value.ptp_source_ipv4_address
  ptp_source_ipv4_address_disable                                                    = each.value.ptp_source_ipv4_address_disable
  ptp_source_ipv6_address                                                            = each.value.ptp_source_ipv6_address
  ptp_source_ipv6_address_disable                                                    = each.value.ptp_source_ipv6_address_disable
  ptp_local_priority                                                                 = each.value.ptp_local_priority
  ptp_slave_ipv4s                                                                    = each.value.ptp_slave_ipv4s
  ptp_slave_ipv6s                                                                    = each.value.ptp_slave_ipv6s
  ptp_slave_ethernets                                                                = each.value.ptp_slave_ethernets
  ptp_master_ipv4s                                                                   = each.value.ptp_master_ipv4s
  ptp_master_ipv6s                                                                   = each.value.ptp_master_ipv6s
  ptp_master_ethernets                                                               = each.value.ptp_master_ethernets
  ptp_interop_profile_default                                                        = each.value.ptp_interop_profile_default
  ptp_interop_profile_g_8265_1                                                       = each.value.ptp_interop_profile_g_8265_1
  ptp_interop_profile_g_8275_1                                                       = each.value.ptp_interop_profile_g_8275_1
  ptp_interop_profile_g_8275_2                                                       = each.value.ptp_interop_profile_g_8275_2
  ptp_interop_domain                                                                 = each.value.ptp_interop_domain
  ptp_interop_egress_conversion_priority1                                            = each.value.ptp_interop_egress_conversion_priority1
  ptp_interop_egress_conversion_priority2                                            = each.value.ptp_interop_egress_conversion_priority2
  ptp_interop_egress_conversion_clock_accuracy                                       = each.value.ptp_interop_egress_conversion_clock_accuracy
  ptp_interop_egress_conversion_offset_scaled_log_variance                           = each.value.ptp_interop_egress_conversion_offset_scaled_log_variance
  ptp_interop_egress_conversion_clock_class_default                                  = each.value.ptp_interop_egress_conversion_clock_class_default
  ptp_interop_egress_conversion_clock_class_mappings                                 = each.value.ptp_interop_egress_conversion_clock_class_mappings
  ptp_interop_ingress_conversion_priority1                                           = each.value.ptp_interop_ingress_conversion_priority1
  ptp_interop_ingress_conversion_priority2                                           = each.value.ptp_interop_ingress_conversion_priority2
  ptp_interop_ingress_conversion_clock_accuracy                                      = each.value.ptp_interop_ingress_conversion_clock_accuracy
  ptp_interop_ingress_conversion_offset_scaled_log_variance                          = each.value.ptp_interop_ingress_conversion_offset_scaled_log_variance
  ptp_interop_ingress_conversion_clock_class_default                                 = each.value.ptp_interop_ingress_conversion_clock_class_default
  ptp_interop_ingress_conversion_clock_class_mappings                                = each.value.ptp_interop_ingress_conversion_clock_class_mappings

  lifecycle {
    precondition {
      condition     = (each.value.ipv4_address == null && each.value.ipv4_netmask == null) || (each.value.ipv4_address != null && each.value.ipv4_netmask != null)
      error_message = "Interface ${each.key}: ipv4_address and ipv4_netmask must both be specified or both be omitted."
    }
  }

  depends_on = [
    # Future dependencies - uncomment when resource is created:
    #iosxr_vrf.vrf,
    #iosxr_ipv4_access_list.ipv4_access_list,
    #iosxr_ipv6_access_list.ipv6_access_list,
  ]
}

##### UNMANAGED ETHERNETS #####

resource "iosxr_interface_ethernet" "ethernet_unmanaged" {
  for_each = { for int in local.interfaces_ethernets : int.key => int if !int.managed }
  device   = each.value.device
  type     = each.value.type
  name     = each.value.id

  l2transport                                                                        = each.value.l2transport
  point_to_point                                                                     = each.value.point_to_point
  multipoint                                                                         = each.value.multipoint
  dampening                                                                          = each.value.dampening
  dampening_decay_half_life                                                          = each.value.dampening_decay_half_life
  dampening_reuse_threshold                                                          = each.value.dampening_reuse_threshold
  dampening_suppress_threshold                                                       = each.value.dampening_suppress_threshold
  dampening_max_suppress_time                                                        = each.value.dampening_max_suppress_time
  dampening_restart_penalty                                                          = each.value.dampening_restart_penalty
  service_policy_input                                                               = each.value.service_policy_input
  service_policy_output                                                              = each.value.service_policy_output
  encapsulation_dot1q_vlan_id                                                        = each.value.encapsulation_dot1q_vlan_id
  encapsulation_dot1q_second_dot1q                                                   = each.value.encapsulation_dot1q_second_dot1q
  l2transport_encapsulation_dot1q_vlan_id                                            = each.value.l2transport_encapsulation_dot1q_vlan_id
  l2transport_encapsulation_dot1q_second_dot1q                                       = each.value.l2transport_encapsulation_dot1q_second_dot1q
  rewrite_ingress_tag_pop_one                                                        = each.value.rewrite_ingress_tag_pop_one
  rewrite_ingress_tag_pop_two                                                        = each.value.rewrite_ingress_tag_pop_two
  shutdown                                                                           = each.value.shutdown
  mtu                                                                                = each.value.mtu
  logging_events_link_status                                                         = each.value.logging_events_link_status
  bandwidth                                                                          = each.value.bandwidth
  description                                                                        = each.value.description
  load_interval                                                                      = each.value.load_interval
  vrf                                                                                = each.value.vrf
  ipv4_address                                                                       = each.value.ipv4_address
  ipv4_netmask                                                                       = each.value.ipv4_netmask
  ipv4_route_tag                                                                     = each.value.ipv4_route_tag
  ipv4_algorithm                                                                     = each.value.ipv4_algorithm
  ipv4_secondaries                                                                   = each.value.ipv4_secondaries
  ipv4_unnumbered                                                                    = each.value.ipv4_unnumbered
  ipv4_point_to_point                                                                = each.value.ipv4_point_to_point
  ipv4_mtu                                                                           = each.value.ipv4_mtu
  ipv4_redirects                                                                     = each.value.ipv4_redirects
  ipv4_mask_reply                                                                    = each.value.ipv4_mask_reply
  ipv4_helper_addresses                                                              = each.value.ipv4_helper_addresses
  ipv4_unreachables_disable                                                          = each.value.ipv4_unreachables_disable
  ipv4_tcp_mss_adjust                                                                = each.value.ipv4_tcp_mss_adjust
  ipv4_forwarding_enable                                                             = each.value.ipv4_forwarding_enable
  ipv4_ttl_propagate_disable                                                         = each.value.ipv4_ttl_propagate_disable
  ipv4_verify_unicast_source_reachable_via_type                                      = each.value.ipv4_verify_unicast_source_reachable_via_type
  ipv4_verify_unicast_source_reachable_via_allow_self_ping                           = each.value.ipv4_verify_unicast_source_reachable_via_allow_self_ping
  ipv4_verify_unicast_source_reachable_via_allow_default                             = each.value.ipv4_verify_unicast_source_reachable_via_allow_default
  ipv4_access_group_ingress_acl1                                                     = each.value.ipv4_access_group_ingress_acl1
  ipv4_access_group_ingress_hardware_count                                           = each.value.ipv4_access_group_ingress_hardware_count
  ipv4_access_group_ingress_interface_statistics                                     = each.value.ipv4_access_group_ingress_interface_statistics
  ipv4_access_group_ingress_compress                                                 = each.value.ipv4_access_group_ingress_compress
  ipv4_access_group_egress_acl                                                       = each.value.ipv4_access_group_egress_acl
  ipv4_access_group_egress_hardware_count                                            = each.value.ipv4_access_group_egress_hardware_count
  ipv4_access_group_egress_interface_statistics                                      = each.value.ipv4_access_group_egress_interface_statistics
  ipv4_access_group_egress_compress                                                  = each.value.ipv4_access_group_egress_compress
  ipv6_verify_unicast_source_reachable_via_type                                      = each.value.ipv6_verify_unicast_source_reachable_via_type
  ipv6_verify_unicast_source_reachable_via_allow_self_ping                           = each.value.ipv6_verify_unicast_source_reachable_via_allow_self_ping
  ipv6_verify_unicast_source_reachable_via_allow_default                             = each.value.ipv6_verify_unicast_source_reachable_via_allow_default
  ipv6_access_group_ingress_acl1                                                     = each.value.ipv6_access_group_ingress_acl1
  ipv6_access_group_ingress_interface_statistics                                     = each.value.ipv6_access_group_ingress_interface_statistics
  ipv6_access_group_ingress_compress                                                 = each.value.ipv6_access_group_ingress_compress
  ipv6_access_group_egress_acl                                                       = each.value.ipv6_access_group_egress_acl
  ipv6_access_group_egress_interface_statistics                                      = each.value.ipv6_access_group_egress_interface_statistics
  ipv6_access_group_egress_compress                                                  = each.value.ipv6_access_group_egress_compress
  ipv6_enable                                                                        = each.value.ipv6_enable
  ipv6_ttl_propagate_disable                                                         = each.value.ipv6_ttl_propagate_disable
  ipv6_addresses                                                                     = each.value.ipv6_addresses
  ipv6_link_local_address                                                            = each.value.ipv6_link_local_address
  ipv6_link_local_zone                                                               = each.value.ipv6_link_local_zone
  ipv6_link_local_route_tag                                                          = each.value.ipv6_link_local_route_tag
  ipv6_eui64_addresses                                                               = each.value.ipv6_eui64_addresses
  ipv6_autoconfig                                                                    = each.value.ipv6_autoconfig
  ipv6_dhcp                                                                          = each.value.ipv6_dhcp
  ipv6_mtu                                                                           = each.value.ipv6_mtu
  ipv6_unreachables_disable                                                          = each.value.ipv6_unreachables_disable
  ipv6_tcp_mss_adjust                                                                = each.value.ipv6_tcp_mss_adjust
  ipv6_nd_reachable_time                                                             = each.value.ipv6_nd_reachable_time
  ipv6_nd_cache_limit                                                                = each.value.ipv6_nd_cache_limit
  ipv6_nd_dad_attempts                                                               = each.value.ipv6_nd_dad_attempts
  ipv6_nd_unicast_ra                                                                 = each.value.ipv6_nd_unicast_ra
  ipv6_nd_suppress_ra                                                                = each.value.ipv6_nd_suppress_ra
  ipv6_nd_managed_config_flag                                                        = each.value.ipv6_nd_managed_config_flag
  ipv6_nd_other_config_flag                                                          = each.value.ipv6_nd_other_config_flag
  ipv6_nd_ns_interval                                                                = each.value.ipv6_nd_ns_interval
  ipv6_nd_ra_interval_max                                                            = each.value.ipv6_nd_ra_interval_max
  ipv6_nd_ra_interval_min                                                            = each.value.ipv6_nd_ra_interval_min
  ipv6_nd_ra_lifetime                                                                = each.value.ipv6_nd_ra_lifetime
  ipv6_nd_redirects                                                                  = each.value.ipv6_nd_redirects
  ipv6_nd_prefix_default_no_adv                                                      = each.value.ipv6_nd_prefix_default_no_adv
  ipv6_nd_prefix_default_no_autoconfig                                               = each.value.ipv6_nd_prefix_default_no_autoconfig
  ethernet_cfm_mep_domains                                                           = each.value.ethernet_cfm_mep_domains
  ethernet_cfm_ais_transmission_up_interval                                          = each.value.ethernet_cfm_ais_transmission_up_interval
  ethernet_cfm_ais_transmission_up_cos                                               = each.value.ethernet_cfm_ais_transmission_up_cos
  ethernet_cfm_bandwidth_notifications_hold_off                                      = each.value.ethernet_cfm_bandwidth_notifications_hold_off
  ethernet_cfm_bandwidth_notifications_wait_to_restore                               = each.value.ethernet_cfm_bandwidth_notifications_wait_to_restore
  ethernet_cfm_bandwidth_notifications_loss_threshold                                = each.value.ethernet_cfm_bandwidth_notifications_loss_threshold
  ethernet_cfm_bandwidth_notifications_log_changes                                   = each.value.ethernet_cfm_bandwidth_notifications_log_changes
  flow_ipv4_ingress_monitors                                                         = each.value.flow_ipv4_ingress_monitors
  flow_ipv4_ingress_monitor_samplers                                                 = each.value.flow_ipv4_ingress_monitor_samplers
  flow_ipv4_egress_monitors                                                          = each.value.flow_ipv4_egress_monitors
  flow_ipv4_egress_monitor_samplers                                                  = each.value.flow_ipv4_egress_monitor_samplers
  flow_ipv6_ingress_monitors                                                         = each.value.flow_ipv6_ingress_monitors
  flow_ipv6_ingress_monitor_samplers                                                 = each.value.flow_ipv6_ingress_monitor_samplers
  flow_ipv6_egress_monitors                                                          = each.value.flow_ipv6_egress_monitors
  flow_ipv6_egress_monitor_samplers                                                  = each.value.flow_ipv6_egress_monitor_samplers
  frequency_synchronization                                                          = each.value.frequency_synchronization
  frequency_synchronization_ssm_disable                                              = each.value.frequency_synchronization_ssm_disable
  frequency_synchronization_priority                                                 = each.value.frequency_synchronization_priority
  frequency_synchronization_time_of_day_priority                                     = each.value.frequency_synchronization_time_of_day_priority
  frequency_synchronization_quality_transmit_lowest_itu_t_option_one                 = each.value.frequency_synchronization_quality_transmit_lowest_itu_t_option_one
  frequency_synchronization_quality_transmit_lowest_itu_t_option_two_generation_one  = each.value.frequency_synchronization_quality_transmit_lowest_itu_t_option_two_generation_one
  frequency_synchronization_quality_transmit_lowest_itu_t_option_two_generation_two  = each.value.frequency_synchronization_quality_transmit_lowest_itu_t_option_two_generation_two
  frequency_synchronization_quality_transmit_highest_itu_t_option_one                = each.value.frequency_synchronization_quality_transmit_highest_itu_t_option_one
  frequency_synchronization_quality_transmit_highest_itu_t_option_two_generation_one = each.value.frequency_synchronization_quality_transmit_highest_itu_t_option_two_generation_one
  frequency_synchronization_quality_transmit_highest_itu_t_option_two_generation_two = each.value.frequency_synchronization_quality_transmit_highest_itu_t_option_two_generation_two
  frequency_synchronization_quality_transmit_exact_itu_t_option_one                  = each.value.frequency_synchronization_quality_transmit_exact_itu_t_option_one
  frequency_synchronization_quality_transmit_exact_itu_t_option_two_generation_one   = each.value.frequency_synchronization_quality_transmit_exact_itu_t_option_two_generation_one
  frequency_synchronization_quality_transmit_exact_itu_t_option_two_generation_two   = each.value.frequency_synchronization_quality_transmit_exact_itu_t_option_two_generation_two
  frequency_synchronization_quality_receive_lowest_itu_t_option_one                  = each.value.frequency_synchronization_quality_receive_lowest_itu_t_option_one
  frequency_synchronization_quality_receive_lowest_itu_t_option_two_generation_one   = each.value.frequency_synchronization_quality_receive_lowest_itu_t_option_two_generation_one
  frequency_synchronization_quality_receive_lowest_itu_t_option_two_generation_two   = each.value.frequency_synchronization_quality_receive_lowest_itu_t_option_two_generation_two
  frequency_synchronization_quality_receive_highest_itu_t_option_one                 = each.value.frequency_synchronization_quality_receive_highest_itu_t_option_one
  frequency_synchronization_quality_receive_highest_itu_t_option_two_generation_one  = each.value.frequency_synchronization_quality_receive_highest_itu_t_option_two_generation_one
  frequency_synchronization_quality_receive_highest_itu_t_option_two_generation_two  = each.value.frequency_synchronization_quality_receive_highest_itu_t_option_two_generation_two
  frequency_synchronization_quality_receive_exact_itu_t_option_one                   = each.value.frequency_synchronization_quality_receive_exact_itu_t_option_one
  frequency_synchronization_quality_receive_exact_itu_t_option_two_generation_one    = each.value.frequency_synchronization_quality_receive_exact_itu_t_option_two_generation_one
  frequency_synchronization_quality_receive_exact_itu_t_option_two_generation_two    = each.value.frequency_synchronization_quality_receive_exact_itu_t_option_two_generation_two
  frequency_synchronization_wait_to_restore                                          = each.value.frequency_synchronization_wait_to_restore
  frequency_synchronization_selection_input                                          = each.value.frequency_synchronization_selection_input
  arp_timeout                                                                        = each.value.arp_timeout
  arp_learning_disable                                                               = each.value.arp_learning_disable
  arp_learning_local                                                                 = each.value.arp_learning_local
  arp_gratuitous_ignore                                                              = each.value.arp_gratuitous_ignore
  arp_cache_limit                                                                    = each.value.arp_cache_limit
  proxy_arp                                                                          = each.value.proxy_arp
  cdp                                                                                = each.value.cdp
  bundle_id                                                                          = each.value.bundle_id
  bundle_id_mode                                                                     = each.value.bundle_id_mode
  bundle_port_priority                                                               = each.value.bundle_port_priority
  lacp_period_short                                                                  = each.value.lacp_period_short
  lacp_period                                                                        = each.value.lacp_period
  carrier_delay_up                                                                   = each.value.carrier_delay_up
  carrier_delay_down                                                                 = each.value.carrier_delay_down
  mac_address                                                                        = each.value.mac_address
  mpls_mtu                                                                           = each.value.mpls_mtu
  speed                                                                              = each.value.speed
  duplex                                                                             = each.value.duplex
  flow_control                                                                       = each.value.flow_control
  fec                                                                                = each.value.fec
  negotiation_auto                                                                   = each.value.negotiation_auto
  negotiation_auto_allow_overrides                                                   = each.value.negotiation_auto_allow_overrides
  lldp                                                                               = each.value.lldp
  lldp_transmit_disable                                                              = each.value.lldp_transmit_disable
  lldp_receive_disable                                                               = each.value.lldp_receive_disable
  lldp_tagged                                                                        = each.value.lldp_tagged
  macsec_psk_keychain_name                                                           = each.value.macsec_psk_keychain_name
  macsec_fallback_psk_keychain                                                       = each.value.macsec_fallback_psk_keychain
  macsec_policy                                                                      = each.value.macsec_policy
  macsec_eap_policy                                                                  = each.value.macsec_eap_policy
  monitor_sessions                                                                   = each.value.monitor_sessions
  ptp                                                                                = each.value.ptp
  ptp_profile                                                                        = each.value.ptp_profile
  ptp_transport_ipv4                                                                 = each.value.ptp_transport_ipv4
  ptp_transport_ethernet                                                             = each.value.ptp_transport_ethernet
  ptp_transport_ipv6                                                                 = each.value.ptp_transport_ipv6
  ptp_clock_operation_one_step                                                       = each.value.ptp_clock_operation_one_step
  ptp_clock_operation_two_step                                                       = each.value.ptp_clock_operation_two_step
  ptp_announce_interval                                                              = each.value.ptp_announce_interval
  ptp_announce_frequency                                                             = each.value.ptp_announce_frequency
  ptp_announce_timeout                                                               = each.value.ptp_announce_timeout
  ptp_announce_grant_duration                                                        = each.value.ptp_announce_grant_duration
  ptp_sync_interval                                                                  = each.value.ptp_sync_interval
  ptp_sync_frequency                                                                 = each.value.ptp_sync_frequency
  ptp_sync_grant_duration                                                            = each.value.ptp_sync_grant_duration
  ptp_sync_timeout                                                                   = each.value.ptp_sync_timeout
  ptp_delay_request_interval                                                         = each.value.ptp_delay_request_interval
  ptp_delay_request_frequency                                                        = each.value.ptp_delay_request_frequency
  ptp_cos                                                                            = each.value.ptp_cos
  ptp_cos_event                                                                      = each.value.ptp_cos_event
  ptp_cos_general                                                                    = each.value.ptp_cos_general
  ptp_dscp                                                                           = each.value.ptp_dscp
  ptp_dscp_event                                                                     = each.value.ptp_dscp_event
  ptp_dscp_general                                                                   = each.value.ptp_dscp_general
  ptp_ipv4_ttl                                                                       = each.value.ptp_ipv4_ttl
  ptp_ipv6_hop_limit                                                                 = each.value.ptp_ipv6_hop_limit
  ptp_delay_asymmetry_value                                                          = each.value.ptp_delay_asymmetry_value
  ptp_delay_asymmetry_unit_nanoseconds                                               = each.value.ptp_delay_asymmetry_unit_nanoseconds
  ptp_delay_asymmetry_unit_microseconds                                              = each.value.ptp_delay_asymmetry_unit_microseconds
  ptp_delay_asymmetry_unit_milliseconds                                              = each.value.ptp_delay_asymmetry_unit_milliseconds
  ptp_delay_response_grant_duration                                                  = each.value.ptp_delay_response_grant_duration
  ptp_delay_response_timeout                                                         = each.value.ptp_delay_response_timeout
  ptp_unicast_grant_invalid_request_reduce                                           = each.value.ptp_unicast_grant_invalid_request_reduce
  ptp_unicast_grant_invalid_request_deny                                             = each.value.ptp_unicast_grant_invalid_request_deny
  ptp_multicast                                                                      = each.value.ptp_multicast
  ptp_multicast_mixed                                                                = each.value.ptp_multicast_mixed
  ptp_multicast_disable                                                              = each.value.ptp_multicast_disable
  ptp_multicast_target_address_mac_forwardable                                       = each.value.ptp_multicast_target_address_mac_forwardable
  ptp_multicast_target_address_mac_non_forwardable                                   = each.value.ptp_multicast_target_address_mac_non_forwardable
  ptp_port_state_slave_only                                                          = each.value.ptp_port_state_slave_only
  ptp_port_state_master_only                                                         = each.value.ptp_port_state_master_only
  ptp_port_state_any                                                                 = each.value.ptp_port_state_any
  ptp_source_ipv4_address                                                            = each.value.ptp_source_ipv4_address
  ptp_source_ipv4_address_disable                                                    = each.value.ptp_source_ipv4_address_disable
  ptp_source_ipv6_address                                                            = each.value.ptp_source_ipv6_address
  ptp_source_ipv6_address_disable                                                    = each.value.ptp_source_ipv6_address_disable
  ptp_local_priority                                                                 = each.value.ptp_local_priority
  ptp_slave_ipv4s                                                                    = each.value.ptp_slave_ipv4s
  ptp_slave_ipv6s                                                                    = each.value.ptp_slave_ipv6s
  ptp_slave_ethernets                                                                = each.value.ptp_slave_ethernets
  ptp_master_ipv4s                                                                   = each.value.ptp_master_ipv4s
  ptp_master_ipv6s                                                                   = each.value.ptp_master_ipv6s
  ptp_master_ethernets                                                               = each.value.ptp_master_ethernets
  ptp_interop_profile_default                                                        = each.value.ptp_interop_profile_default
  ptp_interop_profile_g_8265_1                                                       = each.value.ptp_interop_profile_g_8265_1
  ptp_interop_profile_g_8275_1                                                       = each.value.ptp_interop_profile_g_8275_1
  ptp_interop_profile_g_8275_2                                                       = each.value.ptp_interop_profile_g_8275_2
  ptp_interop_domain                                                                 = each.value.ptp_interop_domain
  ptp_interop_egress_conversion_priority1                                            = each.value.ptp_interop_egress_conversion_priority1
  ptp_interop_egress_conversion_priority2                                            = each.value.ptp_interop_egress_conversion_priority2
  ptp_interop_egress_conversion_clock_accuracy                                       = each.value.ptp_interop_egress_conversion_clock_accuracy
  ptp_interop_egress_conversion_offset_scaled_log_variance                           = each.value.ptp_interop_egress_conversion_offset_scaled_log_variance
  ptp_interop_egress_conversion_clock_class_default                                  = each.value.ptp_interop_egress_conversion_clock_class_default
  ptp_interop_egress_conversion_clock_class_mappings                                 = each.value.ptp_interop_egress_conversion_clock_class_mappings
  ptp_interop_ingress_conversion_priority1                                           = each.value.ptp_interop_ingress_conversion_priority1
  ptp_interop_ingress_conversion_priority2                                           = each.value.ptp_interop_ingress_conversion_priority2
  ptp_interop_ingress_conversion_clock_accuracy                                      = each.value.ptp_interop_ingress_conversion_clock_accuracy
  ptp_interop_ingress_conversion_offset_scaled_log_variance                          = each.value.ptp_interop_ingress_conversion_offset_scaled_log_variance
  ptp_interop_ingress_conversion_clock_class_default                                 = each.value.ptp_interop_ingress_conversion_clock_class_default
  ptp_interop_ingress_conversion_clock_class_mappings                                = each.value.ptp_interop_ingress_conversion_clock_class_mappings

  depends_on = [
    # Future dependencies - uncomment when resource is created:
    #iosxr_vrf.vrf,
    #iosxr_ipv4_access_list.ipv4_access_list,
    #iosxr_ipv6_access_list.ipv6_access_list,
  ]

  lifecycle {
    ignore_changes = all
  }
}

##### ETHERNET SUBINTERFACES #####

locals {
  interfaces_ethernet_subinterfaces = flatten([
    for device in local.devices : [
      for int in try(local.device_config[device.name].interfaces.ethernets, []) : [
        for subint in try(int.subinterfaces, []) : {
          key                          = format("%s/%s%s", device.name, int.type, trimprefix(subint.id, "$string "))
          device                       = device.name
          type                         = int.type
          id                           = trimprefix(subint.id, "$string ")
          l2transport                  = try(subint.l2transport, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.l2transport, null)
          point_to_point               = try(subint.point_to_point, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.point_to_point, null)
          multipoint                   = try(subint.multipoint, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.multipoint, null)
          dampening                    = try(subint.dampening, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.dampening, null)
          dampening_decay_half_life    = try(subint.dampening_decay_half_life, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.dampening_decay_half_life, null)
          dampening_reuse_threshold    = try(subint.dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.dampening_reuse_threshold, null)
          dampening_suppress_threshold = try(subint.dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.dampening_suppress_threshold, null)
          dampening_max_suppress_time  = try(subint.dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.dampening_max_suppress_time, null)
          service_policy_input = try(length(subint.service_policy_input) == 0, true) ? null : [for service_policy in subint.service_policy_input : {
            name = try(service_policy.name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.service_policy_input.name, null)
          }]
          service_policy_output = try(length(subint.service_policy_output) == 0, true) ? null : [for service_policy in subint.service_policy_output : {
            name = try(service_policy.name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.service_policy_output.name, null)
          }]
          encapsulation_dot1q_vlan_id                  = try(subint.encapsulation_dot1q_vlan_id, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.encapsulation_dot1q_vlan_id, null)
          encapsulation_dot1q_second_dot1q             = try(subint.encapsulation_dot1q_second_dot1q, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.encapsulation_dot1q_second_dot1q, null)
          l2transport_encapsulation_dot1q_vlan_id      = try(subint.l2transport_encapsulation_dot1q_vlan_id, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.l2transport_encapsulation_dot1q_vlan_id, null)
          l2transport_encapsulation_dot1q_second_dot1q = try(subint.l2transport_encapsulation_dot1q_second_dot1q, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.l2transport_encapsulation_dot1q_second_dot1q, null)
          rewrite_ingress_tag_pop_one                  = try(subint.rewrite_ingress_tag_pop_one, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.rewrite_ingress_tag_pop_one, null)
          rewrite_ingress_tag_pop_two                  = try(subint.rewrite_ingress_tag_pop_two, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.rewrite_ingress_tag_pop_two, null)
          shutdown                                     = try(subint.shutdown, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.shutdown, null)
          mtu                                          = try(subint.mtu, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.mtu, null)
          logging_events_link_status                   = try(subint.logging_events_link_status, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.logging_events_link_status, null)
          bandwidth                                    = try(subint.bandwidth, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.bandwidth, null)
          description                                  = try(subint.description, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.description, null)
          load_interval                                = try(subint.load_interval, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.load_interval, null)
          vrf                                          = try(subint.vrf, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.vrf, null)
          ipv4_address                                 = try(subint.ipv4.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.address, null)
          ipv4_netmask                                 = try(subint.ipv4.netmask, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.netmask, null)
          ipv4_route_tag                               = try(subint.ipv4.route_tag, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.route_tag, null)
          ipv4_algorithm                               = try(subint.ipv4.algorithm, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.algorithm, null)
          ipv4_secondaries = try(length(subint.ipv4.secondaries) == 0, true) ? null : [for secondary in subint.ipv4.secondaries : {
            address   = try(secondary.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.secondaries.address, null)
            netmask   = try(secondary.netmask, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.secondaries.netmask, null)
            route_tag = try(secondary.route_tag, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.secondaries.route_tag, null)
            algorithm = try(secondary.algorithm, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.secondaries.algorithm, null)
          }]
          ipv4_unnumbered     = try(subint.ipv4.unnumbered, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.unnumbered, null)
          ipv4_point_to_point = try(subint.ipv4.point_to_point, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.point_to_point, null)
          ipv4_mtu            = try(subint.ipv4.mtu, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.mtu, null)
          ipv4_redirects      = try(subint.ipv4.redirects, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.redirects, null)
          ipv4_mask_reply     = try(subint.ipv4.mask_reply, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.mask_reply, null)
          ipv4_helper_addresses = try(length(subint.ipv4.helper_addresses) == 0, true) ? null : [for helper in subint.ipv4.helper_addresses : {
            address = try(helper.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.helper_addresses.address, null)
            vrf     = try(helper.vrf, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.helper_addresses.vrf, null)
          }]
          ipv4_unreachables_disable                                = try(subint.ipv4.unreachables_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.unreachables_disable, null)
          ipv4_tcp_mss_adjust                                      = try(subint.ipv4.tcp_mss_adjust, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.tcp_mss_adjust, null)
          ipv4_forwarding_enable                                   = try(subint.ipv4.forwarding_enable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.forwarding_enable, null)
          ipv4_ttl_propagate_disable                               = try(subint.ipv4.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.ttl_propagate_disable, null)
          ipv4_verify_unicast_source_reachable_via_type            = try(subint.ipv4.verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.verify_unicast_source_reachable_via_type, null)
          ipv4_verify_unicast_source_reachable_via_allow_self_ping = try(subint.ipv4.verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.verify_unicast_source_reachable_via_allow_self_ping, can(subint.ipv4.verify_unicast_source_reachable_via_type) ? false : null)
          ipv4_verify_unicast_source_reachable_via_allow_default   = try(subint.ipv4.verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.verify_unicast_source_reachable_via_allow_default, can(subint.ipv4.verify_unicast_source_reachable_via_type) ? false : null)
          ipv4_access_group_ingress_acl1                           = try(subint.ipv4.access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.access_group_ingress_acl1, null)
          ipv4_access_group_ingress_hardware_count                 = try(subint.ipv4.access_group_ingress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.access_group_ingress_hardware_count, null)
          ipv4_access_group_ingress_interface_statistics           = try(subint.ipv4.access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.access_group_ingress_interface_statistics, null)
          ipv4_access_group_ingress_compress                       = try(subint.ipv4.access_group_ingress_compress, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.access_group_ingress_compress, null)
          ipv4_access_group_egress_acl                             = try(subint.ipv4.access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.access_group_egress_acl, null)
          ipv4_access_group_egress_hardware_count                  = try(subint.ipv4.access_group_egress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.access_group_egress_hardware_count, null)
          ipv4_access_group_egress_interface_statistics            = try(subint.ipv4.access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.access_group_egress_interface_statistics, null)
          ipv4_access_group_egress_compress                        = try(subint.ipv4.access_group_egress_compress, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv4.access_group_egress_compress, null)
          ipv6_verify_unicast_source_reachable_via_type            = try(subint.ipv6.verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.verify_unicast_source_reachable_via_type, null)
          ipv6_verify_unicast_source_reachable_via_allow_self_ping = try(subint.ipv6.verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.verify_unicast_source_reachable_via_allow_self_ping, can(subint.ipv6.verify_unicast_source_reachable_via_type) ? false : null)
          ipv6_verify_unicast_source_reachable_via_allow_default   = try(subint.ipv6.verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.verify_unicast_source_reachable_via_allow_default, can(subint.ipv6.verify_unicast_source_reachable_via_type) ? false : null)
          ipv6_access_group_ingress_acl1                           = try(subint.ipv6.access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.access_group_ingress_acl1, null)
          ipv6_access_group_ingress_interface_statistics           = try(subint.ipv6.access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.access_group_ingress_interface_statistics, null)
          ipv6_access_group_ingress_compress                       = try(subint.ipv6.access_group_ingress_compress, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.access_group_ingress_compress, null)
          ipv6_access_group_egress_acl                             = try(subint.ipv6.access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.access_group_egress_acl, null)
          ipv6_access_group_egress_interface_statistics            = try(subint.ipv6.access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.access_group_egress_interface_statistics, null)
          ipv6_access_group_egress_compress                        = try(subint.ipv6.access_group_egress_compress, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.access_group_egress_compress, null)
          ipv6_enable                                              = try(subint.ipv6.enable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.enable, null)
          ipv6_ttl_propagate_disable                               = try(subint.ipv6.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.ttl_propagate_disable, null)
          ipv6_addresses = try(length(subint.ipv6.addresses) == 0, true) ? null : [for ipv6_address in subint.ipv6.addresses : {
            address       = try(ipv6_address.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.addresses.address, null)
            prefix_length = try(ipv6_address.prefix_length, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.addresses.prefix_length, null)
            zone          = try(ipv6_address.zone, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.addresses.zone, null)
            route_tag     = try(ipv6_address.route_tag, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.addresses.route_tag, null)
            algorithm     = try(ipv6_address.algorithm, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.addresses.algorithm, null)
          }]
          ipv6_link_local_address   = try(subint.ipv6.link_local_address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.link_local_address, null)
          ipv6_link_local_zone      = try(subint.ipv6.link_local_zone, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.link_local_zone, can(subint.ipv6.link_local_address) ? 0 : null)
          ipv6_link_local_route_tag = try(subint.ipv6.link_local_route_tag, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.link_local_route_tag, null)
          ipv6_eui64_addresses = try(length(subint.ipv6.eui64_addresses) == 0, true) ? null : [for eui64 in subint.ipv6.eui64_addresses : {
            address       = try(eui64.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.eui64_addresses.address, null)
            prefix_length = try(eui64.prefix_length, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.eui64_addresses.prefix_length, null)
            zone          = try(eui64.zone, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.eui64_addresses.zone, null)
            route_tag     = try(eui64.route_tag, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.eui64_addresses.route_tag, null)
            algorithm     = try(eui64.algorithm, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.eui64_addresses.algorithm, null)
          }]
          ipv6_autoconfig                      = try(subint.ipv6.autoconfig, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.autoconfig, null)
          ipv6_dhcp                            = try(subint.ipv6.dhcp, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.dhcp, null)
          ipv6_mtu                             = try(subint.ipv6.mtu, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.mtu, null)
          ipv6_unreachables_disable            = try(subint.ipv6.unreachables_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.unreachables_disable, null)
          ipv6_tcp_mss_adjust                  = try(subint.ipv6.tcp_mss_adjust, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.tcp_mss_adjust, null)
          ipv6_nd_reachable_time               = try(subint.ipv6.nd_reachable_time, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.nd_reachable_time, null)
          ipv6_nd_cache_limit                  = try(subint.ipv6.nd_cache_limit, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.nd_cache_limit, null)
          ipv6_nd_dad_attempts                 = try(subint.ipv6.nd_dad_attempts, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.nd_dad_attempts, null)
          ipv6_nd_unicast_ra                   = try(subint.ipv6.nd_unicast_ra, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.nd_unicast_ra, null)
          ipv6_nd_suppress_ra                  = try(subint.ipv6.nd_suppress_ra, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.nd_suppress_ra, null)
          ipv6_nd_managed_config_flag          = try(subint.ipv6.nd_managed_config_flag, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.nd_managed_config_flag, null)
          ipv6_nd_other_config_flag            = try(subint.ipv6.nd_other_config_flag, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.nd_other_config_flag, null)
          ipv6_nd_ns_interval                  = try(subint.ipv6.nd_ns_interval, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.nd_ns_interval, null)
          ipv6_nd_ra_interval_max              = try(subint.ipv6.nd_ra_interval_max, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.nd_ra_interval_max, null)
          ipv6_nd_ra_interval_min              = try(subint.ipv6.nd_ra_interval_min, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.nd_ra_interval_min, null)
          ipv6_nd_ra_lifetime                  = try(subint.ipv6.nd_ra_lifetime, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.nd_ra_lifetime, null)
          ipv6_nd_redirects                    = try(subint.ipv6.nd_redirects, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.nd_redirects, null)
          ipv6_nd_prefix_default_no_adv        = try(subint.ipv6.nd_prefix_default_no_adv, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.nd_prefix_default_no_adv, null)
          ipv6_nd_prefix_default_no_autoconfig = try(subint.ipv6.nd_prefix_default_no_autoconfig, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ipv6.nd_prefix_default_no_autoconfig, null)
          ethernet_cfm_mep_domains = try(length(subint.ethernet_cfm.mep_domains) == 0, true) ? null : [for mep in subint.ethernet_cfm.mep_domains : {
            domain_name                                        = try(mep.domain_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.domain_name, null)
            service                                            = try(mep.service, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.service, null)
            mep_id                                             = try(mep.mep_id, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.mep_id, null)
            cos                                                = try(mep.cos, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.cos, null)
            loss_measurement_counters_aggregate                = try(mep.loss_measurement_counters_aggregate, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_aggregate, null)
            loss_measurement_counters_priority_cos_range_start = try(mep.loss_measurement_counters_priority_cos_range_start, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_range_start, null)
            loss_measurement_counters_priority_cos_range_end   = try(mep.loss_measurement_counters_priority_cos_range_end, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_range_end, null)
            loss_measurement_counters_priority_cos_value_1     = try(mep.loss_measurement_counters_priority_cos_value_1, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_1, null)
            loss_measurement_counters_priority_cos_value_2     = try(mep.loss_measurement_counters_priority_cos_value_2, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_2, null)
            loss_measurement_counters_priority_cos_value_3     = try(mep.loss_measurement_counters_priority_cos_value_3, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_3, null)
            loss_measurement_counters_priority_cos_value_4     = try(mep.loss_measurement_counters_priority_cos_value_4, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_4, null)
            loss_measurement_counters_priority_cos_value_5     = try(mep.loss_measurement_counters_priority_cos_value_5, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_5, null)
            loss_measurement_counters_priority_cos_value_6     = try(mep.loss_measurement_counters_priority_cos_value_6, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_6, null)
            loss_measurement_counters_priority_cos_value_7     = try(mep.loss_measurement_counters_priority_cos_value_7, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_7, null)
            sla_operation_profile_target_mep_ids = try(length(mep.sla_operation_profile_target_mep_ids) == 0, true) ? null : [for profile in mep.sla_operation_profile_target_mep_ids : {
              profile_name = try(profile.profile_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.sla_operation_profile_target_mep_ids.profile_name, null)
              mep_id       = try(profile.mep_id, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.sla_operation_profile_target_mep_ids.mep_id, null)
            }]
            sla_operation_profile_target_mac_addresses = try(length(mep.sla_operation_profile_target_mac_addresses) == 0, true) ? null : [for profile in mep.sla_operation_profile_target_mac_addresses : {
              profile_name = try(profile.profile_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.sla_operation_profile_target_mac_addresses.profile_name, null)
              mac_address  = try(profile.mac_address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.mep_domains.sla_operation_profile_target_mac_addresses.mac_address, null)
            }]
          }]
          ethernet_cfm_ais_transmission_up_interval            = try(subint.ethernet_cfm.ais_transmission_up_interval, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.ais_transmission_up_interval, null)
          ethernet_cfm_ais_transmission_up_cos                 = try(subint.ethernet_cfm.ais_transmission_up_cos, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.ais_transmission_up_cos, null)
          ethernet_cfm_bandwidth_notifications_hold_off        = try(subint.ethernet_cfm.bandwidth_notifications_hold_off, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.bandwidth_notifications_hold_off, null)
          ethernet_cfm_bandwidth_notifications_wait_to_restore = try(subint.ethernet_cfm.bandwidth_notifications_wait_to_restore, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.bandwidth_notifications_wait_to_restore, null)
          ethernet_cfm_bandwidth_notifications_loss_threshold  = try(subint.ethernet_cfm.bandwidth_notifications_loss_threshold, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.bandwidth_notifications_loss_threshold, null)
          ethernet_cfm_bandwidth_notifications_log_changes     = try(subint.ethernet_cfm.bandwidth_notifications_log_changes, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ethernet_cfm.bandwidth_notifications_log_changes, null)
          flow_ipv4_ingress_monitors = try(length(subint.flow_ipv4_ingress_monitors) == 0, true) ? null : [for flow_monitor in subint.flow_ipv4_ingress_monitors : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.flow_ipv4_ingress_monitors.monitor_map_name, null)
          }]
          flow_ipv4_ingress_monitor_samplers = try(length(subint.flow_ipv4_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in subint.flow_ipv4_ingress_monitor_samplers : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.flow_ipv4_ingress_monitor_samplers.monitor_map_name, null)
            sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.flow_ipv4_ingress_monitor_samplers.sampler_map_name, null)
          }]
          flow_ipv4_egress_monitors = try(length(subint.flow_ipv4_egress_monitors) == 0, true) ? null : [for flow_monitor in subint.flow_ipv4_egress_monitors : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.flow_ipv4_egress_monitors.monitor_map_name, null)
          }]
          flow_ipv4_egress_monitor_samplers = try(length(subint.flow_ipv4_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in subint.flow_ipv4_egress_monitor_samplers : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.flow_ipv4_egress_monitor_samplers.monitor_map_name, null)
            sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.flow_ipv4_egress_monitor_samplers.sampler_map_name, null)
          }]
          flow_ipv6_ingress_monitors = try(length(subint.flow_ipv6_ingress_monitors) == 0, true) ? null : [for flow_monitor in subint.flow_ipv6_ingress_monitors : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.flow_ipv6_ingress_monitors.monitor_map_name, null)
          }]
          flow_ipv6_ingress_monitor_samplers = try(length(subint.flow_ipv6_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in subint.flow_ipv6_ingress_monitor_samplers : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.flow_ipv6_ingress_monitor_samplers.monitor_map_name, null)
            sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.flow_ipv6_ingress_monitor_samplers.sampler_map_name, null)
          }]
          flow_ipv6_egress_monitors = try(length(subint.flow_ipv6_egress_monitors) == 0, true) ? null : [for flow_monitor in subint.flow_ipv6_egress_monitors : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.flow_ipv6_egress_monitors.monitor_map_name, null)
          }]
          flow_ipv6_egress_monitor_samplers = try(length(subint.flow_ipv6_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in subint.flow_ipv6_egress_monitor_samplers : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.flow_ipv6_egress_monitor_samplers.monitor_map_name, null)
            sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.flow_ipv6_egress_monitor_samplers.sampler_map_name, null)
          }]
          arp_timeout                  = try(subint.arp_timeout, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.arp_timeout, null)
          arp_learning_disable         = try(subint.arp_learning_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.arp_learning_disable, null)
          arp_learning_local           = try(subint.arp_learning_local, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.arp_learning_local, null)
          arp_gratuitous_ignore        = try(subint.arp_gratuitous_ignore, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.arp_gratuitous_ignore, null)
          arp_cache_limit              = try(subint.arp_cache_limit, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.arp_cache_limit, null)
          proxy_arp                    = try(subint.proxy_arp, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.proxy_arp, null)
          cdp                          = try(subint.cdp, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.cdp, null)
          mpls_mtu                     = try(subint.mpls_mtu, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.mpls_mtu, null)
          lldp                         = try(subint.lldp, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.lldp, null)
          lldp_transmit_disable        = try(subint.lldp_transmit_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.lldp_transmit_disable, null)
          lldp_receive_disable         = try(subint.lldp_receive_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.lldp_receive_disable, null)
          lldp_tagged                  = try(subint.lldp_tagged, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.lldp_tagged, null)
          macsec_psk_keychain_name     = try(subint.macsec_psk_keychain_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.macsec_psk_keychain_name, null)
          macsec_fallback_psk_keychain = try(subint.macsec_fallback_psk_keychain, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.macsec_fallback_psk_keychain, null)
          macsec_policy                = try(subint.macsec_policy, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.macsec_policy, null)
          macsec_eap_policy            = try(subint.macsec_eap_policy, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.macsec_eap_policy, null)
          monitor_sessions = try(length(subint.monitor_sessions) == 0, true) ? null : [for session in subint.monitor_sessions : {
            session_name      = try(session.session_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.monitor_sessions.session_name, null)
            ethernet          = try(session.ethernet, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.monitor_sessions.ethernet, null)
            direction_rx_only = try(session.direction_rx_only, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.monitor_sessions.direction_rx_only, null)
            direction_tx_only = try(session.direction_tx_only, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.monitor_sessions.direction_tx_only, null)
            acl               = try(session.acl, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.monitor_sessions.acl, null)
            acl_ipv4_name     = try(session.acl_ipv4_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.monitor_sessions.acl_ipv4_name, null)
            acl_ipv6_name     = try(session.acl_ipv6_name, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.monitor_sessions.acl_ipv6_name, null)
            mirror_first      = try(session.mirror_first, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.monitor_sessions.mirror_first, null)
            mirror_interval   = try(session.mirror_interval, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.monitor_sessions.mirror_interval, null)
          }]
          ptp                                              = try(subint.ptp.enable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.enable, null)
          ptp_profile                                      = try(subint.ptp.profile, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.profile, null)
          ptp_transport_ipv4                               = try(subint.ptp.transport_ipv4, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.transport_ipv4, null)
          ptp_transport_ethernet                           = try(subint.ptp.transport_ethernet, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.transport_ethernet, null)
          ptp_transport_ipv6                               = try(subint.ptp.transport_ipv6, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.transport_ipv6, null)
          ptp_clock_operation_one_step                     = try(subint.ptp.clock_operation_one_step, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.clock_operation_one_step, null)
          ptp_clock_operation_two_step                     = try(subint.ptp.clock_operation_two_step, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.clock_operation_two_step, null)
          ptp_announce_interval                            = try(subint.ptp.announce_interval, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.announce_interval, null)
          ptp_announce_frequency                           = try(subint.ptp.announce_frequency, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.announce_frequency, null)
          ptp_announce_timeout                             = try(subint.ptp.announce_timeout, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.announce_timeout, null)
          ptp_announce_grant_duration                      = try(subint.ptp.announce_grant_duration, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.announce_grant_duration, null)
          ptp_sync_interval                                = try(subint.ptp.sync_interval, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.sync_interval, null)
          ptp_sync_frequency                               = try(subint.ptp.sync_frequency, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.sync_frequency, null)
          ptp_sync_grant_duration                          = try(subint.ptp.sync_grant_duration, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.sync_grant_duration, null)
          ptp_sync_timeout                                 = try(subint.ptp.sync_timeout, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.sync_timeout, null)
          ptp_delay_request_interval                       = try(subint.ptp.delay_request_interval, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.delay_request_interval, null)
          ptp_delay_request_frequency                      = try(subint.ptp.delay_request_frequency, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.delay_request_frequency, null)
          ptp_cos                                          = try(subint.ptp.cos, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.cos, null)
          ptp_cos_event                                    = try(subint.ptp.cos_event, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.cos_event, null)
          ptp_cos_general                                  = try(subint.ptp.cos_general, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.cos_general, null)
          ptp_dscp                                         = try(subint.ptp.dscp, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.dscp, null)
          ptp_dscp_event                                   = try(subint.ptp.dscp_event, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.dscp_event, null)
          ptp_dscp_general                                 = try(subint.ptp.dscp_general, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.dscp_general, null)
          ptp_ipv4_ttl                                     = try(subint.ptp.ipv4_ttl, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.ipv4_ttl, null)
          ptp_ipv6_hop_limit                               = try(subint.ptp.ipv6_hop_limit, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.ipv6_hop_limit, null)
          ptp_delay_asymmetry_value                        = try(subint.ptp.delay_asymmetry_value, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.delay_asymmetry_value, null)
          ptp_delay_asymmetry_unit_nanoseconds             = try(subint.ptp.delay_asymmetry_unit_nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.delay_asymmetry_unit_nanoseconds, null)
          ptp_delay_asymmetry_unit_microseconds            = try(subint.ptp.delay_asymmetry_unit_microseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.delay_asymmetry_unit_microseconds, null)
          ptp_delay_asymmetry_unit_milliseconds            = try(subint.ptp.delay_asymmetry_unit_milliseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.delay_asymmetry_unit_milliseconds, null)
          ptp_delay_response_grant_duration                = try(subint.ptp.delay_response_grant_duration, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.delay_response_grant_duration, null)
          ptp_delay_response_timeout                       = try(subint.ptp.delay_response_timeout, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.delay_response_timeout, null)
          ptp_unicast_grant_invalid_request_reduce         = try(subint.ptp.unicast_grant_invalid_request_reduce, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.unicast_grant_invalid_request_reduce, null)
          ptp_unicast_grant_invalid_request_deny           = try(subint.ptp.unicast_grant_invalid_request_deny, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.unicast_grant_invalid_request_deny, null)
          ptp_multicast                                    = try(subint.ptp.multicast, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.multicast, null)
          ptp_multicast_mixed                              = try(subint.ptp.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.multicast_mixed, null)
          ptp_multicast_disable                            = try(subint.ptp.multicast_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.multicast_disable, null)
          ptp_multicast_target_address_mac_forwardable     = try(subint.ptp.multicast_target_address_mac_forwardable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.multicast_target_address_mac_forwardable, null)
          ptp_multicast_target_address_mac_non_forwardable = try(subint.ptp.multicast_target_address_mac_non_forwardable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.multicast_target_address_mac_non_forwardable, null)
          ptp_port_state_slave_only                        = try(subint.ptp.port_state_slave_only, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.port_state_slave_only, null)
          ptp_port_state_master_only                       = try(subint.ptp.port_state_master_only, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.port_state_master_only, null)
          ptp_port_state_any                               = try(subint.ptp.port_state_any, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.port_state_any, null)
          ptp_source_ipv4_address                          = try(subint.ptp.source_ipv4_address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.source_ipv4_address, null)
          ptp_source_ipv4_address_disable                  = try(subint.ptp.source_ipv4_address_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.source_ipv4_address_disable, null)
          ptp_source_ipv6_address                          = try(subint.ptp.source_ipv6_address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.source_ipv6_address, null)
          ptp_source_ipv6_address_disable                  = try(subint.ptp.source_ipv6_address_disable, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.source_ipv6_address_disable, null)
          ptp_local_priority                               = try(subint.ptp.local_priority, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.local_priority, null)
          ptp_slave_ipv4s = try(length(subint.ptp.slave_ipv4s) == 0, true) ? null : [for slave in subint.ptp.slave_ipv4s : {
            address        = try(slave.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.slave_ipv4s.address, null)
            non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.slave_ipv4s.non_negotiated, null)
          }]
          ptp_slave_ipv6s = try(length(subint.ptp.slave_ipv6s) == 0, true) ? null : [for slave in subint.ptp.slave_ipv6s : {
            address        = try(slave.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.slave_ipv6s.address, null)
            non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.slave_ipv6s.non_negotiated, null)
          }]
          ptp_slave_ethernets = try(length(subint.ptp.slave_ethernets) == 0, true) ? null : [for slave in subint.ptp.slave_ethernets : {
            address        = try(slave.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.slave_ethernets.address, null)
            non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.slave_ethernets.non_negotiated, null)
          }]
          ptp_master_ipv4s = try(length(subint.ptp.master_ipv4s) == 0, true) ? null : [for master in subint.ptp.master_ipv4s : {
            address         = try(master.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv4s.address, null)
            priority        = try(master.priority, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv4s.priority, null)
            clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv4s.clock_class, null)
            multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv4s.multicast, null)
            multicast_mixed = try(master.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv4s.multicast_mixed, null)
            non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv4s.non_negotiated, null)
            delay_asymmetry = try(master.delay_asymmetry, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv4s.delay_asymmetry, null)
            nanoseconds     = try(master.nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv4s.nanoseconds, null)
            microseconds    = try(master.microseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv4s.microseconds, null)
            milliseconds    = try(master.milliseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv4s.milliseconds, null)
          }]
          ptp_master_ipv6s = try(length(subint.ptp.master_ipv6s) == 0, true) ? null : [for master in subint.ptp.master_ipv6s : {
            address         = try(master.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv6s.address, null)
            priority        = try(master.priority, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv6s.priority, null)
            clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv6s.clock_class, null)
            multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv6s.multicast, null)
            multicast_mixed = try(master.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv6s.multicast_mixed, null)
            non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv6s.non_negotiated, null)
            delay_asymmetry = try(master.delay_asymmetry, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv6s.delay_asymmetry, null)
            nanoseconds     = try(master.nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv6s.nanoseconds, null)
            microseconds    = try(master.microseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv6s.microseconds, null)
            milliseconds    = try(master.milliseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ipv6s.milliseconds, null)
          }]
          ptp_master_ethernets = try(length(subint.ptp.master_ethernets) == 0, true) ? null : [for master in subint.ptp.master_ethernets : {
            address         = try(master.address, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ethernets.address, null)
            priority        = try(master.priority, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ethernets.priority, null)
            clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ethernets.clock_class, null)
            multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ethernets.multicast, null)
            multicast_mixed = try(master.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ethernets.multicast_mixed, null)
            non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ethernets.non_negotiated, null)
            delay_asymmetry = try(master.delay_asymmetry, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ethernets.delay_asymmetry, null)
            nanoseconds     = try(master.nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ethernets.nanoseconds, null)
            microseconds    = try(master.microseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ethernets.microseconds, null)
            milliseconds    = try(master.milliseconds, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.master_ethernets.milliseconds, null)
          }]
          ptp_interop_profile_default                              = try(subint.ptp.interop_profile_default, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_profile_default, null)
          ptp_interop_profile_g_8265_1                             = try(subint.ptp.interop_profile_g_8265_1, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_profile_g_8265_1, null)
          ptp_interop_profile_g_8275_1                             = try(subint.ptp.interop_profile_g_8275_1, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_profile_g_8275_1, null)
          ptp_interop_profile_g_8275_2                             = try(subint.ptp.interop_profile_g_8275_2, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_profile_g_8275_2, null)
          ptp_interop_domain                                       = try(subint.ptp.interop_domain, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_domain, null)
          ptp_interop_egress_conversion_priority1                  = try(subint.ptp.interop_egress_conversion_priority1, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_egress_conversion_priority1, null)
          ptp_interop_egress_conversion_priority2                  = try(subint.ptp.interop_egress_conversion_priority2, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_egress_conversion_priority2, null)
          ptp_interop_egress_conversion_clock_accuracy             = try(subint.ptp.interop_egress_conversion_clock_accuracy, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_egress_conversion_clock_accuracy, null)
          ptp_interop_egress_conversion_offset_scaled_log_variance = try(subint.ptp.interop_egress_conversion_offset_scaled_log_variance, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_egress_conversion_offset_scaled_log_variance, null)
          ptp_interop_egress_conversion_clock_class_default        = try(subint.ptp.interop_egress_conversion_clock_class_default, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_egress_conversion_clock_class_default, null)
          ptp_interop_egress_conversion_clock_class_mappings = try(length(subint.ptp.interop_egress_conversion_clock_class_mappings) == 0, true) ? null : [for mapping in subint.ptp.interop_egress_conversion_clock_class_mappings : {
            clock_class_to_map_from = try(mapping.clock_class_to_map_from, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_egress_conversion_clock_class_mappings.clock_class_to_map_from, null)
            clock_class_to_map_to   = try(mapping.clock_class_to_map_to, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_egress_conversion_clock_class_mappings.clock_class_to_map_to, null)
          }]
          ptp_interop_ingress_conversion_priority1                  = try(subint.ptp.interop_ingress_conversion_priority1, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_ingress_conversion_priority1, null)
          ptp_interop_ingress_conversion_priority2                  = try(subint.ptp.interop_ingress_conversion_priority2, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_ingress_conversion_priority2, null)
          ptp_interop_ingress_conversion_clock_accuracy             = try(subint.ptp.interop_ingress_conversion_clock_accuracy, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_ingress_conversion_clock_accuracy, null)
          ptp_interop_ingress_conversion_offset_scaled_log_variance = try(subint.ptp.interop_ingress_conversion_offset_scaled_log_variance, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_ingress_conversion_offset_scaled_log_variance, null)
          ptp_interop_ingress_conversion_clock_class_default        = try(subint.ptp.interop_ingress_conversion_clock_class_default, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_ingress_conversion_clock_class_default, null)
          ptp_interop_ingress_conversion_clock_class_mappings = try(length(subint.ptp.interop_ingress_conversion_clock_class_mappings) == 0, true) ? null : [for mapping in subint.ptp.interop_ingress_conversion_clock_class_mappings : {
            clock_class_to_map_from = try(mapping.clock_class_to_map_from, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_ingress_conversion_clock_class_mappings.clock_class_to_map_from, null)
            clock_class_to_map_to   = try(mapping.clock_class_to_map_to, local.defaults.iosxr.devices.configuration.interfaces.ethernets.subinterfaces.ptp.interop_ingress_conversion_clock_class_mappings.clock_class_to_map_to, null)
          }]
        }
      ]
    ]
  ])
}

resource "iosxr_interface_ethernet_subinterface" "ethernet_subinterface" {
  for_each = { for int in local.interfaces_ethernet_subinterfaces : int.key => int }
  device   = each.value.device

  type                                                      = each.value.type
  name                                                      = each.value.id
  l2transport                                               = each.value.l2transport
  point_to_point                                            = each.value.point_to_point
  multipoint                                                = each.value.multipoint
  dampening                                                 = each.value.dampening
  dampening_decay_half_life                                 = each.value.dampening_decay_half_life
  dampening_reuse_threshold                                 = each.value.dampening_reuse_threshold
  dampening_suppress_threshold                              = each.value.dampening_suppress_threshold
  dampening_max_suppress_time                               = each.value.dampening_max_suppress_time
  service_policy_input                                      = each.value.service_policy_input
  service_policy_output                                     = each.value.service_policy_output
  encapsulation_dot1q_vlan_id                               = each.value.encapsulation_dot1q_vlan_id
  encapsulation_dot1q_second_dot1q                          = each.value.encapsulation_dot1q_second_dot1q
  l2transport_encapsulation_dot1q_vlan_id                   = each.value.l2transport_encapsulation_dot1q_vlan_id
  l2transport_encapsulation_dot1q_second_dot1q              = each.value.l2transport_encapsulation_dot1q_second_dot1q
  rewrite_ingress_tag_pop_one                               = each.value.rewrite_ingress_tag_pop_one
  rewrite_ingress_tag_pop_two                               = each.value.rewrite_ingress_tag_pop_two
  shutdown                                                  = each.value.shutdown
  mtu                                                       = each.value.mtu
  logging_events_link_status                                = each.value.logging_events_link_status
  bandwidth                                                 = each.value.bandwidth
  description                                               = each.value.description
  load_interval                                             = each.value.load_interval
  vrf                                                       = each.value.vrf
  ipv4_address                                              = each.value.ipv4_address
  ipv4_netmask                                              = each.value.ipv4_netmask
  ipv4_route_tag                                            = each.value.ipv4_route_tag
  ipv4_algorithm                                            = each.value.ipv4_algorithm
  ipv4_secondaries                                          = each.value.ipv4_secondaries
  ipv4_unnumbered                                           = each.value.ipv4_unnumbered
  ipv4_point_to_point                                       = each.value.ipv4_point_to_point
  ipv4_mtu                                                  = each.value.ipv4_mtu
  ipv4_redirects                                            = each.value.ipv4_redirects
  ipv4_mask_reply                                           = each.value.ipv4_mask_reply
  ipv4_helper_addresses                                     = each.value.ipv4_helper_addresses
  ipv4_unreachables_disable                                 = each.value.ipv4_unreachables_disable
  ipv4_tcp_mss_adjust                                       = each.value.ipv4_tcp_mss_adjust
  ipv4_forwarding_enable                                    = each.value.ipv4_forwarding_enable
  ipv4_ttl_propagate_disable                                = each.value.ipv4_ttl_propagate_disable
  ipv4_verify_unicast_source_reachable_via_type             = each.value.ipv4_verify_unicast_source_reachable_via_type
  ipv4_verify_unicast_source_reachable_via_allow_self_ping  = each.value.ipv4_verify_unicast_source_reachable_via_allow_self_ping
  ipv4_verify_unicast_source_reachable_via_allow_default    = each.value.ipv4_verify_unicast_source_reachable_via_allow_default
  ipv4_access_group_ingress_acl1                            = each.value.ipv4_access_group_ingress_acl1
  ipv4_access_group_ingress_hardware_count                  = each.value.ipv4_access_group_ingress_hardware_count
  ipv4_access_group_ingress_interface_statistics            = each.value.ipv4_access_group_ingress_interface_statistics
  ipv4_access_group_ingress_compress                        = each.value.ipv4_access_group_ingress_compress
  ipv4_access_group_egress_acl                              = each.value.ipv4_access_group_egress_acl
  ipv4_access_group_egress_hardware_count                   = each.value.ipv4_access_group_egress_hardware_count
  ipv4_access_group_egress_interface_statistics             = each.value.ipv4_access_group_egress_interface_statistics
  ipv4_access_group_egress_compress                         = each.value.ipv4_access_group_egress_compress
  ipv6_verify_unicast_source_reachable_via_type             = each.value.ipv6_verify_unicast_source_reachable_via_type
  ipv6_verify_unicast_source_reachable_via_allow_self_ping  = each.value.ipv6_verify_unicast_source_reachable_via_allow_self_ping
  ipv6_verify_unicast_source_reachable_via_allow_default    = each.value.ipv6_verify_unicast_source_reachable_via_allow_default
  ipv6_access_group_ingress_acl1                            = each.value.ipv6_access_group_ingress_acl1
  ipv6_access_group_ingress_interface_statistics            = each.value.ipv6_access_group_ingress_interface_statistics
  ipv6_access_group_ingress_compress                        = each.value.ipv6_access_group_ingress_compress
  ipv6_access_group_egress_acl                              = each.value.ipv6_access_group_egress_acl
  ipv6_access_group_egress_interface_statistics             = each.value.ipv6_access_group_egress_interface_statistics
  ipv6_access_group_egress_compress                         = each.value.ipv6_access_group_egress_compress
  ipv6_enable                                               = each.value.ipv6_enable
  ipv6_ttl_propagate_disable                                = each.value.ipv6_ttl_propagate_disable
  ipv6_addresses                                            = each.value.ipv6_addresses
  ipv6_link_local_address                                   = each.value.ipv6_link_local_address
  ipv6_link_local_zone                                      = each.value.ipv6_link_local_zone
  ipv6_link_local_route_tag                                 = each.value.ipv6_link_local_route_tag
  ipv6_eui64_addresses                                      = each.value.ipv6_eui64_addresses
  ipv6_autoconfig                                           = each.value.ipv6_autoconfig
  ipv6_dhcp                                                 = each.value.ipv6_dhcp
  ipv6_mtu                                                  = each.value.ipv6_mtu
  ipv6_unreachables_disable                                 = each.value.ipv6_unreachables_disable
  ipv6_tcp_mss_adjust                                       = each.value.ipv6_tcp_mss_adjust
  ipv6_nd_reachable_time                                    = each.value.ipv6_nd_reachable_time
  ipv6_nd_cache_limit                                       = each.value.ipv6_nd_cache_limit
  ipv6_nd_dad_attempts                                      = each.value.ipv6_nd_dad_attempts
  ipv6_nd_unicast_ra                                        = each.value.ipv6_nd_unicast_ra
  ipv6_nd_suppress_ra                                       = each.value.ipv6_nd_suppress_ra
  ipv6_nd_managed_config_flag                               = each.value.ipv6_nd_managed_config_flag
  ipv6_nd_other_config_flag                                 = each.value.ipv6_nd_other_config_flag
  ipv6_nd_ns_interval                                       = each.value.ipv6_nd_ns_interval
  ipv6_nd_ra_interval_max                                   = each.value.ipv6_nd_ra_interval_max
  ipv6_nd_ra_interval_min                                   = each.value.ipv6_nd_ra_interval_min
  ipv6_nd_ra_lifetime                                       = each.value.ipv6_nd_ra_lifetime
  ipv6_nd_redirects                                         = each.value.ipv6_nd_redirects
  ipv6_nd_prefix_default_no_adv                             = each.value.ipv6_nd_prefix_default_no_adv
  ipv6_nd_prefix_default_no_autoconfig                      = each.value.ipv6_nd_prefix_default_no_autoconfig
  ethernet_cfm_mep_domains                                  = each.value.ethernet_cfm_mep_domains
  ethernet_cfm_ais_transmission_up_interval                 = each.value.ethernet_cfm_ais_transmission_up_interval
  ethernet_cfm_ais_transmission_up_cos                      = each.value.ethernet_cfm_ais_transmission_up_cos
  ethernet_cfm_bandwidth_notifications_hold_off             = each.value.ethernet_cfm_bandwidth_notifications_hold_off
  ethernet_cfm_bandwidth_notifications_wait_to_restore      = each.value.ethernet_cfm_bandwidth_notifications_wait_to_restore
  ethernet_cfm_bandwidth_notifications_loss_threshold       = each.value.ethernet_cfm_bandwidth_notifications_loss_threshold
  ethernet_cfm_bandwidth_notifications_log_changes          = each.value.ethernet_cfm_bandwidth_notifications_log_changes
  flow_ipv4_ingress_monitors                                = each.value.flow_ipv4_ingress_monitors
  flow_ipv4_ingress_monitor_samplers                        = each.value.flow_ipv4_ingress_monitor_samplers
  flow_ipv4_egress_monitors                                 = each.value.flow_ipv4_egress_monitors
  flow_ipv4_egress_monitor_samplers                         = each.value.flow_ipv4_egress_monitor_samplers
  flow_ipv6_ingress_monitors                                = each.value.flow_ipv6_ingress_monitors
  flow_ipv6_ingress_monitor_samplers                        = each.value.flow_ipv6_ingress_monitor_samplers
  flow_ipv6_egress_monitors                                 = each.value.flow_ipv6_egress_monitors
  flow_ipv6_egress_monitor_samplers                         = each.value.flow_ipv6_egress_monitor_samplers
  arp_timeout                                               = each.value.arp_timeout
  arp_learning_disable                                      = each.value.arp_learning_disable
  arp_learning_local                                        = each.value.arp_learning_local
  arp_gratuitous_ignore                                     = each.value.arp_gratuitous_ignore
  arp_cache_limit                                           = each.value.arp_cache_limit
  proxy_arp                                                 = each.value.proxy_arp
  cdp                                                       = each.value.cdp
  mpls_mtu                                                  = each.value.mpls_mtu
  lldp                                                      = each.value.lldp
  lldp_transmit_disable                                     = each.value.lldp_transmit_disable
  lldp_receive_disable                                      = each.value.lldp_receive_disable
  lldp_tagged                                               = each.value.lldp_tagged
  macsec_psk_keychain_name                                  = each.value.macsec_psk_keychain_name
  macsec_fallback_psk_keychain                              = each.value.macsec_fallback_psk_keychain
  macsec_policy                                             = each.value.macsec_policy
  macsec_eap_policy                                         = each.value.macsec_eap_policy
  monitor_sessions                                          = each.value.monitor_sessions
  ptp                                                       = each.value.ptp
  ptp_profile                                               = each.value.ptp_profile
  ptp_transport_ipv4                                        = each.value.ptp_transport_ipv4
  ptp_transport_ethernet                                    = each.value.ptp_transport_ethernet
  ptp_transport_ipv6                                        = each.value.ptp_transport_ipv6
  ptp_clock_operation_one_step                              = each.value.ptp_clock_operation_one_step
  ptp_clock_operation_two_step                              = each.value.ptp_clock_operation_two_step
  ptp_announce_interval                                     = each.value.ptp_announce_interval
  ptp_announce_frequency                                    = each.value.ptp_announce_frequency
  ptp_announce_timeout                                      = each.value.ptp_announce_timeout
  ptp_announce_grant_duration                               = each.value.ptp_announce_grant_duration
  ptp_sync_interval                                         = each.value.ptp_sync_interval
  ptp_sync_frequency                                        = each.value.ptp_sync_frequency
  ptp_sync_grant_duration                                   = each.value.ptp_sync_grant_duration
  ptp_sync_timeout                                          = each.value.ptp_sync_timeout
  ptp_delay_request_interval                                = each.value.ptp_delay_request_interval
  ptp_delay_request_frequency                               = each.value.ptp_delay_request_frequency
  ptp_cos                                                   = each.value.ptp_cos
  ptp_cos_event                                             = each.value.ptp_cos_event
  ptp_cos_general                                           = each.value.ptp_cos_general
  ptp_dscp                                                  = each.value.ptp_dscp
  ptp_dscp_event                                            = each.value.ptp_dscp_event
  ptp_dscp_general                                          = each.value.ptp_dscp_general
  ptp_ipv4_ttl                                              = each.value.ptp_ipv4_ttl
  ptp_ipv6_hop_limit                                        = each.value.ptp_ipv6_hop_limit
  ptp_delay_asymmetry_value                                 = each.value.ptp_delay_asymmetry_value
  ptp_delay_asymmetry_unit_nanoseconds                      = each.value.ptp_delay_asymmetry_unit_nanoseconds
  ptp_delay_asymmetry_unit_microseconds                     = each.value.ptp_delay_asymmetry_unit_microseconds
  ptp_delay_asymmetry_unit_milliseconds                     = each.value.ptp_delay_asymmetry_unit_milliseconds
  ptp_delay_response_grant_duration                         = each.value.ptp_delay_response_grant_duration
  ptp_delay_response_timeout                                = each.value.ptp_delay_response_timeout
  ptp_unicast_grant_invalid_request_reduce                  = each.value.ptp_unicast_grant_invalid_request_reduce
  ptp_unicast_grant_invalid_request_deny                    = each.value.ptp_unicast_grant_invalid_request_deny
  ptp_multicast                                             = each.value.ptp_multicast
  ptp_multicast_mixed                                       = each.value.ptp_multicast_mixed
  ptp_multicast_disable                                     = each.value.ptp_multicast_disable
  ptp_multicast_target_address_mac_forwardable              = each.value.ptp_multicast_target_address_mac_forwardable
  ptp_multicast_target_address_mac_non_forwardable          = each.value.ptp_multicast_target_address_mac_non_forwardable
  ptp_port_state_slave_only                                 = each.value.ptp_port_state_slave_only
  ptp_port_state_master_only                                = each.value.ptp_port_state_master_only
  ptp_port_state_any                                        = each.value.ptp_port_state_any
  ptp_source_ipv4_address                                   = each.value.ptp_source_ipv4_address
  ptp_source_ipv4_address_disable                           = each.value.ptp_source_ipv4_address_disable
  ptp_source_ipv6_address                                   = each.value.ptp_source_ipv6_address
  ptp_source_ipv6_address_disable                           = each.value.ptp_source_ipv6_address_disable
  ptp_local_priority                                        = each.value.ptp_local_priority
  ptp_slave_ipv4s                                           = each.value.ptp_slave_ipv4s
  ptp_slave_ipv6s                                           = each.value.ptp_slave_ipv6s
  ptp_slave_ethernets                                       = each.value.ptp_slave_ethernets
  ptp_master_ipv4s                                          = each.value.ptp_master_ipv4s
  ptp_master_ipv6s                                          = each.value.ptp_master_ipv6s
  ptp_master_ethernets                                      = each.value.ptp_master_ethernets
  ptp_interop_profile_default                               = each.value.ptp_interop_profile_default
  ptp_interop_profile_g_8265_1                              = each.value.ptp_interop_profile_g_8265_1
  ptp_interop_profile_g_8275_1                              = each.value.ptp_interop_profile_g_8275_1
  ptp_interop_profile_g_8275_2                              = each.value.ptp_interop_profile_g_8275_2
  ptp_interop_domain                                        = each.value.ptp_interop_domain
  ptp_interop_egress_conversion_priority1                   = each.value.ptp_interop_egress_conversion_priority1
  ptp_interop_egress_conversion_priority2                   = each.value.ptp_interop_egress_conversion_priority2
  ptp_interop_egress_conversion_clock_accuracy              = each.value.ptp_interop_egress_conversion_clock_accuracy
  ptp_interop_egress_conversion_offset_scaled_log_variance  = each.value.ptp_interop_egress_conversion_offset_scaled_log_variance
  ptp_interop_egress_conversion_clock_class_default         = each.value.ptp_interop_egress_conversion_clock_class_default
  ptp_interop_egress_conversion_clock_class_mappings        = each.value.ptp_interop_egress_conversion_clock_class_mappings
  ptp_interop_ingress_conversion_priority1                  = each.value.ptp_interop_ingress_conversion_priority1
  ptp_interop_ingress_conversion_priority2                  = each.value.ptp_interop_ingress_conversion_priority2
  ptp_interop_ingress_conversion_clock_accuracy             = each.value.ptp_interop_ingress_conversion_clock_accuracy
  ptp_interop_ingress_conversion_offset_scaled_log_variance = each.value.ptp_interop_ingress_conversion_offset_scaled_log_variance
  ptp_interop_ingress_conversion_clock_class_default        = each.value.ptp_interop_ingress_conversion_clock_class_default
  ptp_interop_ingress_conversion_clock_class_mappings       = each.value.ptp_interop_ingress_conversion_clock_class_mappings

  lifecycle {
    precondition {
      condition     = (each.value.ipv4_address == null && each.value.ipv4_netmask == null) || (each.value.ipv4_address != null && each.value.ipv4_netmask != null)
      error_message = "Interface ${each.key}: ipv4_address and ipv4_netmask must both be specified or both be omitted."
    }
  }

  depends_on = [
    # Future dependencies - uncomment when resource is created:
    iosxr_interface_ethernet.ethernet
    #iosxr_vrf.vrf,
    #iosxr_ipv4_access_list.ipv4_access_list,
    #iosxr_ipv6_access_list.ipv6_access_list,
  ]
}

##### BUNDLE-ETHERNETS #####

locals {
  interfaces_bundle_ethernets = flatten([
    for device in local.devices : [
      for be in try(local.device_config[device.name].interfaces.bundle_ethernets, []) : {
        key                          = format("%s/Bundle-Ether%s", device.name, trimprefix(be.id, "$string "))
        device                       = device.name
        id                           = trimprefix(be.id, "$string ")
        point_to_point               = try(be.point_to_point, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.point_to_point, null)
        multipoint                   = try(be.multipoint, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.multipoint, null)
        dampening                    = try(be.dampening, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.dampening, null)
        dampening_decay_half_life    = try(be.dampening_decay_half_life, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.dampening_decay_half_life, null)
        dampening_reuse_threshold    = try(be.dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.dampening_reuse_threshold, null)
        dampening_suppress_threshold = try(be.dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.dampening_suppress_threshold, null)
        dampening_max_suppress_time  = try(be.dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.dampening_max_suppress_time, null)
        service_policy_input = try(length(be.service_policy_input) == 0, true) ? null : [for service_policy in be.service_policy_input : {
          name = try(service_policy.name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.service_policy_input.name, null)
        }]
        service_policy_output = try(length(be.service_policy_output) == 0, true) ? null : [for service_policy in be.service_policy_output : {
          name = try(service_policy.name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.service_policy_output.name, null)
        }]
        shutdown                   = try(be.shutdown, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.shutdown, null)
        mtu                        = try(be.mtu, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.mtu, null)
        logging_events_link_status = try(be.logging_events_link_status, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.logging_events_link_status, null)
        bandwidth                  = try(be.bandwidth, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bandwidth, null)
        description                = try(be.description, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.description, null)
        load_interval              = try(be.load_interval, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.load_interval, null)
        vrf                        = try(be.vrf, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.vrf, null)
        ipv4_address               = try(be.ipv4.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.address, null)
        ipv4_netmask               = try(be.ipv4.netmask, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.netmask, null)
        ipv4_route_tag             = try(be.ipv4.route_tag, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.route_tag, null)
        ipv4_algorithm             = try(be.ipv4.algorithm, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.algorithm, null)
        ipv4_secondaries = try(length(be.ipv4.secondaries) == 0, true) ? null : [for secondary in be.ipv4.secondaries : {
          address   = try(secondary.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.secondaries.address, null)
          netmask   = try(secondary.netmask, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.secondaries.netmask, null)
          route_tag = try(secondary.route_tag, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.secondaries.route_tag, null)
          algorithm = try(secondary.algorithm, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.secondaries.algorithm, null)
        }]
        ipv4_unnumbered     = try(be.ipv4.unnumbered, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.unnumbered, null)
        ipv4_point_to_point = try(be.ipv4.point_to_point, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.point_to_point, null)
        ipv4_mtu            = try(be.ipv4.mtu, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.mtu, null)
        ipv4_redirects      = try(be.ipv4.redirects, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.redirects, null)
        ipv4_mask_reply     = try(be.ipv4.mask_reply, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.mask_reply, null)
        ipv4_helper_addresses = try(length(be.ipv4.helper_addresses) == 0, true) ? null : [for helper in be.ipv4.helper_addresses : {
          address = try(helper.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.helper_addresses.address, null)
          vrf     = try(helper.vrf, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.helper_addresses.vrf, null)
        }]
        ipv4_unreachables_disable                                = try(be.ipv4.unreachables_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.unreachables_disable, null)
        ipv4_tcp_mss_adjust                                      = try(be.ipv4.tcp_mss_adjust, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.tcp_mss_adjust, null)
        ipv4_forwarding_enable                                   = try(be.ipv4.forwarding_enable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.forwarding_enable, null)
        ipv4_ttl_propagate_disable                               = try(be.ipv4.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.ttl_propagate_disable, null)
        ipv4_verify_unicast_source_reachable_via_type            = try(be.ipv4.verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.verify_unicast_source_reachable_via_type, null)
        ipv4_verify_unicast_source_reachable_via_allow_self_ping = try(be.ipv4.verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.verify_unicast_source_reachable_via_allow_self_ping, can(be.ipv4.verify_unicast_source_reachable_via_type) ? false : null)
        ipv4_verify_unicast_source_reachable_via_allow_default   = try(be.ipv4.verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.verify_unicast_source_reachable_via_allow_default, can(be.ipv4.verify_unicast_source_reachable_via_type) ? false : null)
        ipv4_access_group_ingress_acl1                           = try(be.ipv4.access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.access_group_ingress_acl1, null)
        ipv4_access_group_ingress_hardware_count                 = try(be.ipv4.access_group_ingress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.access_group_ingress_hardware_count, null)
        ipv4_access_group_ingress_interface_statistics           = try(be.ipv4.access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.access_group_ingress_interface_statistics, null)
        ipv4_access_group_ingress_compress                       = try(be.ipv4.access_group_ingress_compress, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.access_group_ingress_compress, null)
        ipv4_access_group_egress_acl                             = try(be.ipv4.access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.access_group_egress_acl, null)
        ipv4_access_group_egress_hardware_count                  = try(be.ipv4.access_group_egress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.access_group_egress_hardware_count, null)
        ipv4_access_group_egress_interface_statistics            = try(be.ipv4.access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.access_group_egress_interface_statistics, null)
        ipv4_access_group_egress_compress                        = try(be.ipv4.access_group_egress_compress, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv4.access_group_egress_compress, null)
        ipv6_verify_unicast_source_reachable_via_type            = try(be.ipv6.verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.verify_unicast_source_reachable_via_type, null)
        ipv6_verify_unicast_source_reachable_via_allow_self_ping = try(be.ipv6.verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.verify_unicast_source_reachable_via_allow_self_ping, can(be.ipv6.verify_unicast_source_reachable_via_type) ? false : null)
        ipv6_verify_unicast_source_reachable_via_allow_default   = try(be.ipv6.verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.verify_unicast_source_reachable_via_allow_default, can(be.ipv6.verify_unicast_source_reachable_via_type) ? false : null)
        ipv6_access_group_ingress_acl1                           = try(be.ipv6.access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.access_group_ingress_acl1, null)
        ipv6_access_group_ingress_interface_statistics           = try(be.ipv6.access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.access_group_ingress_interface_statistics, null)
        ipv6_access_group_ingress_compress                       = try(be.ipv6.access_group_ingress_compress, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.access_group_ingress_compress, null)
        ipv6_access_group_egress_acl                             = try(be.ipv6.access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.access_group_egress_acl, null)
        ipv6_access_group_egress_interface_statistics            = try(be.ipv6.access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.access_group_egress_interface_statistics, null)
        ipv6_access_group_egress_compress                        = try(be.ipv6.access_group_egress_compress, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.access_group_egress_compress, null)
        ipv6_enable                                              = try(be.ipv6.enable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.enable, null)
        ipv6_ttl_propagate_disable                               = try(be.ipv6.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.ttl_propagate_disable, null)
        ipv6_addresses = try(length(be.ipv6.addresses) == 0, true) ? null : [for ipv6_address in be.ipv6.addresses : {
          address       = try(ipv6_address.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.addresses.address, null)
          prefix_length = try(ipv6_address.prefix_length, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.addresses.prefix_length, null)
          zone          = try(ipv6_address.zone, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.addresses.zone, null)
          route_tag     = try(ipv6_address.route_tag, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.addresses.route_tag, null)
          algorithm     = try(ipv6_address.algorithm, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.addresses.algorithm, null)
        }]
        ipv6_link_local_address   = try(be.ipv6.link_local_address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.link_local_address, null)
        ipv6_link_local_zone      = try(be.ipv6.link_local_zone, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.link_local_zone, can(be.ipv6.link_local_address) ? 0 : null)
        ipv6_link_local_route_tag = try(be.ipv6.link_local_route_tag, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.link_local_route_tag, null)
        ipv6_eui64_addresses = try(length(be.ipv6.eui64_addresses) == 0, true) ? null : [for eui64 in be.ipv6.eui64_addresses : {
          address       = try(eui64.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.eui64_addresses.address, null)
          prefix_length = try(eui64.prefix_length, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.eui64_addresses.prefix_length, null)
          zone          = try(eui64.zone, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.eui64_addresses.zone, null)
          route_tag     = try(eui64.route_tag, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.eui64_addresses.route_tag, null)
          algorithm     = try(eui64.algorithm, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.eui64_addresses.algorithm, null)
        }]
        ipv6_autoconfig                      = try(be.ipv6.autoconfig, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.autoconfig, null)
        ipv6_dhcp                            = try(be.ipv6.dhcp, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.dhcp, null)
        ipv6_mtu                             = try(be.ipv6.mtu, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.mtu, null)
        ipv6_unreachables_disable            = try(be.ipv6.unreachables_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.unreachables_disable, null)
        ipv6_tcp_mss_adjust                  = try(be.ipv6.tcp_mss_adjust, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.tcp_mss_adjust, null)
        ipv6_nd_reachable_time               = try(be.ipv6.nd_reachable_time, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.nd_reachable_time, null)
        ipv6_nd_cache_limit                  = try(be.ipv6.nd_cache_limit, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.nd_cache_limit, null)
        ipv6_nd_dad_attempts                 = try(be.ipv6.nd_dad_attempts, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.nd_dad_attempts, null)
        ipv6_nd_unicast_ra                   = try(be.ipv6.nd_unicast_ra, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.nd_unicast_ra, null)
        ipv6_nd_suppress_ra                  = try(be.ipv6.nd_suppress_ra, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.nd_suppress_ra, null)
        ipv6_nd_managed_config_flag          = try(be.ipv6.nd_managed_config_flag, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.nd_managed_config_flag, null)
        ipv6_nd_other_config_flag            = try(be.ipv6.nd_other_config_flag, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.nd_other_config_flag, null)
        ipv6_nd_ns_interval                  = try(be.ipv6.nd_ns_interval, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.nd_ns_interval, null)
        ipv6_nd_ra_interval_max              = try(be.ipv6.nd_ra_interval_max, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.nd_ra_interval_max, null)
        ipv6_nd_ra_interval_min              = try(be.ipv6.nd_ra_interval_min, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.nd_ra_interval_min, null)
        ipv6_nd_ra_lifetime                  = try(be.ipv6.nd_ra_lifetime, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.nd_ra_lifetime, null)
        ipv6_nd_redirects                    = try(be.ipv6.nd_redirects, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.nd_redirects, null)
        ipv6_nd_prefix_default_no_adv        = try(be.ipv6.nd_prefix_default_no_adv, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.nd_prefix_default_no_adv, null)
        ipv6_nd_prefix_default_no_autoconfig = try(be.ipv6.nd_prefix_default_no_autoconfig, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ipv6.nd_prefix_default_no_autoconfig, null)
        ethernet_cfm_mep_domains = try(length(be.ethernet_cfm.mep_domains) == 0, true) ? null : [for mep in be.ethernet_cfm.mep_domains : {
          domain_name                                        = try(mep.domain_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.domain_name, null)
          service                                            = try(mep.service, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.service, null)
          mep_id                                             = try(mep.mep_id, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.mep_id, null)
          propagate_remote_status                            = try(mep.propagate_remote_status, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.propagate_remote_status, null)
          cos                                                = try(mep.cos, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.cos, null)
          loss_measurement_counters_aggregate                = try(mep.loss_measurement_counters_aggregate, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_aggregate, null)
          loss_measurement_counters_priority_cos_range_start = try(mep.loss_measurement_counters_priority_cos_range_start, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_range_start, null)
          loss_measurement_counters_priority_cos_range_end   = try(mep.loss_measurement_counters_priority_cos_range_end, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_range_end, null)
          loss_measurement_counters_priority_cos_value_1     = try(mep.loss_measurement_counters_priority_cos_value_1, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_1, null)
          loss_measurement_counters_priority_cos_value_2     = try(mep.loss_measurement_counters_priority_cos_value_2, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_2, null)
          loss_measurement_counters_priority_cos_value_3     = try(mep.loss_measurement_counters_priority_cos_value_3, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_3, null)
          loss_measurement_counters_priority_cos_value_4     = try(mep.loss_measurement_counters_priority_cos_value_4, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_4, null)
          loss_measurement_counters_priority_cos_value_5     = try(mep.loss_measurement_counters_priority_cos_value_5, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_5, null)
          loss_measurement_counters_priority_cos_value_6     = try(mep.loss_measurement_counters_priority_cos_value_6, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_6, null)
          loss_measurement_counters_priority_cos_value_7     = try(mep.loss_measurement_counters_priority_cos_value_7, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_7, null)
          sla_operation_profile_target_mep_ids = try(length(mep.sla_operation_profile_target_mep_ids) == 0, true) ? null : [for profile in mep.sla_operation_profile_target_mep_ids : {
            profile_name = try(profile.profile_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.sla_operation_profile_target_mep_ids.profile_name, null)
            mep_id       = try(profile.mep_id, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.sla_operation_profile_target_mep_ids.mep_id, null)
          }]
          sla_operation_profile_target_mac_addresses = try(length(mep.sla_operation_profile_target_mac_addresses) == 0, true) ? null : [for profile in mep.sla_operation_profile_target_mac_addresses : {
            profile_name = try(profile.profile_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.sla_operation_profile_target_mac_addresses.profile_name, null)
            mac_address  = try(profile.mac_address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.mep_domains.sla_operation_profile_target_mac_addresses.mac_address, null)
          }]
        }]
        ethernet_cfm_ais_transmission_up_interval            = try(be.ethernet_cfm.ais_transmission_up_interval, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.ais_transmission_up_interval, null)
        ethernet_cfm_ais_transmission_up_cos                 = try(be.ethernet_cfm.ais_transmission_up_cos, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.ais_transmission_up_cos, null)
        ethernet_cfm_bandwidth_notifications_hold_off        = try(be.ethernet_cfm.bandwidth_notifications_hold_off, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.bandwidth_notifications_hold_off, null)
        ethernet_cfm_bandwidth_notifications_wait_to_restore = try(be.ethernet_cfm.bandwidth_notifications_wait_to_restore, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.bandwidth_notifications_wait_to_restore, null)
        ethernet_cfm_bandwidth_notifications_loss_threshold  = try(be.ethernet_cfm.bandwidth_notifications_loss_threshold, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.bandwidth_notifications_loss_threshold, null)
        ethernet_cfm_bandwidth_notifications_log_changes     = try(be.ethernet_cfm.bandwidth_notifications_log_changes, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.ethernet_cfm.bandwidth_notifications_log_changes, null)
        flow_ipv4_ingress_monitors = try(length(be.flow_ipv4_ingress_monitors) == 0, true) ? null : [for flow_monitor in be.flow_ipv4_ingress_monitors : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.flow_ipv4_ingress_monitors.monitor_map_name, null)
        }]
        flow_ipv4_ingress_monitor_samplers = try(length(be.flow_ipv4_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in be.flow_ipv4_ingress_monitor_samplers : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.flow_ipv4_ingress_monitor_samplers.monitor_map_name, null)
          sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.flow_ipv4_ingress_monitor_samplers.sampler_map_name, null)
        }]
        flow_ipv4_egress_monitors = try(length(be.flow_ipv4_egress_monitors) == 0, true) ? null : [for flow_monitor in be.flow_ipv4_egress_monitors : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.flow_ipv4_egress_monitors.monitor_map_name, null)
        }]
        flow_ipv4_egress_monitor_samplers = try(length(be.flow_ipv4_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in be.flow_ipv4_egress_monitor_samplers : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.flow_ipv4_egress_monitor_samplers.monitor_map_name, null)
          sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.flow_ipv4_egress_monitor_samplers.sampler_map_name, null)
        }]
        flow_ipv6_ingress_monitors = try(length(be.flow_ipv6_ingress_monitors) == 0, true) ? null : [for flow_monitor in be.flow_ipv6_ingress_monitors : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.flow_ipv6_ingress_monitors.monitor_map_name, null)
        }]
        flow_ipv6_ingress_monitor_samplers = try(length(be.flow_ipv6_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in be.flow_ipv6_ingress_monitor_samplers : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.flow_ipv6_ingress_monitor_samplers.monitor_map_name, null)
          sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.flow_ipv6_ingress_monitor_samplers.sampler_map_name, null)
        }]
        flow_ipv6_egress_monitors = try(length(be.flow_ipv6_egress_monitors) == 0, true) ? null : [for flow_monitor in be.flow_ipv6_egress_monitors : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.flow_ipv6_egress_monitors.monitor_map_name, null)
        }]
        flow_ipv6_egress_monitor_samplers = try(length(be.flow_ipv6_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in be.flow_ipv6_egress_monitor_samplers : {
          monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.flow_ipv6_egress_monitor_samplers.monitor_map_name, null)
          sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.flow_ipv6_egress_monitor_samplers.sampler_map_name, null)
        }]
        arp_timeout                                      = try(be.arp_timeout, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.arp_timeout, null)
        arp_learning_disable                             = try(be.arp_learning_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.arp_learning_disable, null)
        arp_learning_local                               = try(be.arp_learning_local, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.arp_learning_local, null)
        arp_gratuitous_ignore                            = try(be.arp_gratuitous_ignore, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.arp_gratuitous_ignore, null)
        arp_cache_limit                                  = try(be.arp_cache_limit, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.arp_cache_limit, null)
        proxy_arp                                        = try(be.proxy_arp, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.proxy_arp, null)
        bundle_minimum_active_links                      = try(be.bundle_minimum_active_links, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bundle_minimum_active_links, null)
        bundle_maximum_active_links                      = try(be.bundle_maximum_active_links, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bundle_maximum_active_links, null)
        bundle_shutdown                                  = try(be.bundle_shutdown, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bundle_shutdown, null)
        bundle_load_balancing_hash_src_ip                = try(be.bundle_load_balancing_hash, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bundle_load_balancing_hash, null) == "src_ip" ? true : null
        bundle_load_balancing_hash_dst_ip                = try(be.bundle_load_balancing_hash, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bundle_load_balancing_hash, null) == "dst_ip" ? true : null
        bundle_lacp_delay                                = try(be.bundle_lacp_delay, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bundle_lacp_delay, null)
        bundle_lacp_fallback_timeout                     = try(be.bundle_lacp_fallback_timeout, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bundle_lacp_fallback_timeout, null)
        lacp_switchover_suppress_flaps                   = try(be.lacp_switchover_suppress_flaps, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.lacp_switchover_suppress_flaps, null)
        lacp_churn_logging                               = try(be.lacp_churn_logging, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.lacp_churn_logging, null)
        lacp_cisco_enable                                = try(be.lacp_cisco_enable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.lacp_cisco_enable, null)
        lacp_cisco_enable_link_order_signaled            = try(be.lacp_cisco_enable_link_order_signaled, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.lacp_cisco_enable_link_order_signaled, null)
        lacp_non_revertive                               = try(be.lacp_non_revertive, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.lacp_non_revertive, null)
        lacp_mode                                        = try(be.lacp_mode, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.lacp_mode, null)
        lacp_system_priority                             = try(be.lacp_system_priority, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.lacp_system_priority, null)
        lacp_system_mac                                  = try(be.lacp_system_mac, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.lacp_system_mac, null)
        lacp_period_short                                = try(be.lacp_period_short, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.lacp_period_short, null)
        lacp_period                                      = try(be.lacp_period, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.lacp_period, null)
        bfd_mode_ietf                                    = try(be.bfd_mode_ietf, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bfd_mode_ietf, null)
        bfd_mode_cisco                                   = try(be.bfd_mode_cisco, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bfd_mode_cisco, null)
        bfd_address_family_ipv4_destination              = try(be.bfd_address_family_ipv4_destination, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bfd_address_family_ipv4_destination, null)
        bfd_address_family_ipv4_minimum_interval         = try(be.bfd_address_family_ipv4_minimum_interval, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bfd_address_family_ipv4_minimum_interval, null)
        bfd_address_family_ipv4_multiplier               = try(be.bfd_address_family_ipv4_multiplier, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bfd_address_family_ipv4_multiplier, null)
        bfd_address_family_ipv4_fast_detect              = try(be.bfd_address_family_ipv4_fast_detect, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bfd_address_family_ipv4_fast_detect, null)
        bfd_address_family_ipv4_echo_minimum_interval    = try(be.bfd_address_family_ipv4_echo_minimum_interval, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bfd_address_family_ipv4_echo_minimum_interval, null)
        bfd_address_family_ipv4_timers_start             = try(be.bfd_address_family_ipv4_timers_start, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bfd_address_family_ipv4_timers_start, null)
        bfd_address_family_ipv4_timers_nbr_unconfig      = try(be.bfd_address_family_ipv4_timers_nbr_unconfig, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bfd_address_family_ipv4_timers_nbr_unconfig, null)
        bfd_address_family_ipv6_destination              = try(be.bfd_address_family_ipv6_destination, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bfd_address_family_ipv6_destination, null)
        bfd_address_family_ipv6_minimum_interval         = try(be.bfd_address_family_ipv6_minimum_interval, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bfd_address_family_ipv6_minimum_interval, null)
        bfd_address_family_ipv6_multiplier               = try(be.bfd_address_family_ipv6_multiplier, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bfd_address_family_ipv6_multiplier, null)
        bfd_address_family_ipv6_fast_detect              = try(be.bfd_address_family_ipv6_fast_detect, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bfd_address_family_ipv6_fast_detect, null)
        bfd_address_family_ipv6_timers_start             = try(be.bfd_address_family_ipv6_timers_start, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bfd_address_family_ipv6_timers_start, null)
        bfd_address_family_ipv6_timers_nbr_unconfig      = try(be.bfd_address_family_ipv6_timers_nbr_unconfig, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.bfd_address_family_ipv6_timers_nbr_unconfig, null)
        mac_address                                      = try(be.mac_address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.mac_address, null)
        mpls_mtu                                         = try(be.mpls_mtu, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.mpls_mtu, null)
        lldp                                             = try(be.lldp, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.lldp, null)
        lldp_transmit_disable                            = try(be.lldp_transmit_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.lldp_transmit_disable, null)
        lldp_receive_disable                             = try(be.lldp_receive_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.lldp_receive_disable, null)
        ptp                                              = try(be.ptp.enable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.enable, null)
        ptp_profile                                      = try(be.ptp.profile, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.profile, null)
        ptp_transport_ipv4                               = try(be.ptp.transport_ipv4, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.transport_ipv4, null)
        ptp_transport_ethernet                           = try(be.ptp.transport_ethernet, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.transport_ethernet, null)
        ptp_transport_ipv6                               = try(be.ptp.transport_ipv6, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.transport_ipv6, null)
        ptp_clock_operation_one_step                     = try(be.ptp.clock_operation_one_step, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.clock_operation_one_step, null)
        ptp_clock_operation_two_step                     = try(be.ptp.clock_operation_two_step, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.clock_operation_two_step, null)
        ptp_announce_interval                            = try(be.ptp.announce_interval, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.announce_interval, null)
        ptp_announce_frequency                           = try(be.ptp.announce_frequency, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.announce_frequency, null)
        ptp_announce_timeout                             = try(be.ptp.announce_timeout, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.announce_timeout, null)
        ptp_announce_grant_duration                      = try(be.ptp.announce_grant_duration, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.announce_grant_duration, null)
        ptp_sync_interval                                = try(be.ptp.sync_interval, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.sync_interval, null)
        ptp_sync_frequency                               = try(be.ptp.sync_frequency, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.sync_frequency, null)
        ptp_sync_grant_duration                          = try(be.ptp.sync_grant_duration, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.sync_grant_duration, null)
        ptp_sync_timeout                                 = try(be.ptp.sync_timeout, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.sync_timeout, null)
        ptp_delay_request_interval                       = try(be.ptp.delay_request_interval, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.delay_request_interval, null)
        ptp_delay_request_frequency                      = try(be.ptp.delay_request_frequency, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.delay_request_frequency, null)
        ptp_cos                                          = try(be.ptp.cos, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.cos, null)
        ptp_cos_event                                    = try(be.ptp.cos_event, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.cos_event, null)
        ptp_cos_general                                  = try(be.ptp.cos_general, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.cos_general, null)
        ptp_dscp                                         = try(be.ptp.dscp, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.dscp, null)
        ptp_dscp_event                                   = try(be.ptp.dscp_event, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.dscp_event, null)
        ptp_dscp_general                                 = try(be.ptp.dscp_general, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.dscp_general, null)
        ptp_ipv4_ttl                                     = try(be.ptp.ipv4_ttl, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.ipv4_ttl, null)
        ptp_ipv6_hop_limit                               = try(be.ptp.ipv6_hop_limit, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.ipv6_hop_limit, null)
        ptp_delay_asymmetry_value                        = try(be.ptp.delay_asymmetry_value, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.delay_asymmetry_value, null)
        ptp_delay_asymmetry_unit_nanoseconds             = try(be.ptp.delay_asymmetry_unit_nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.delay_asymmetry_unit_nanoseconds, null)
        ptp_delay_asymmetry_unit_microseconds            = try(be.ptp.delay_asymmetry_unit_microseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.delay_asymmetry_unit_microseconds, null)
        ptp_delay_asymmetry_unit_milliseconds            = try(be.ptp.delay_asymmetry_unit_milliseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.delay_asymmetry_unit_milliseconds, null)
        ptp_delay_response_grant_duration                = try(be.ptp.delay_response_grant_duration, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.delay_response_grant_duration, null)
        ptp_delay_response_timeout                       = try(be.ptp.delay_response_timeout, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.delay_response_timeout, null)
        ptp_unicast_grant_invalid_request_reduce         = try(be.ptp.unicast_grant_invalid_request_reduce, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.unicast_grant_invalid_request_reduce, null)
        ptp_unicast_grant_invalid_request_deny           = try(be.ptp.unicast_grant_invalid_request_deny, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.unicast_grant_invalid_request_deny, null)
        ptp_multicast                                    = try(be.ptp.multicast, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.multicast, null)
        ptp_multicast_mixed                              = try(be.ptp.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.multicast_mixed, null)
        ptp_multicast_disable                            = try(be.ptp.multicast_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.multicast_disable, null)
        ptp_multicast_target_address_mac_forwardable     = try(be.ptp.multicast_target_address_mac_forwardable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.multicast_target_address_mac_forwardable, null)
        ptp_multicast_target_address_mac_non_forwardable = try(be.ptp.multicast_target_address_mac_non_forwardable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.multicast_target_address_mac_non_forwardable, null)
        ptp_port_state_slave_only                        = try(be.ptp.port_state_slave_only, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.port_state_slave_only, null)
        ptp_port_state_master_only                       = try(be.ptp.port_state_master_only, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.port_state_master_only, null)
        ptp_port_state_any                               = try(be.ptp.port_state_any, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.port_state_any, null)
        ptp_source_ipv4_address                          = try(be.ptp.source_ipv4_address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.source_ipv4_address, null)
        ptp_source_ipv4_address_disable                  = try(be.ptp.source_ipv4_address_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.source_ipv4_address_disable, null)
        ptp_source_ipv6_address                          = try(be.ptp.source_ipv6_address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.source_ipv6_address, null)
        ptp_source_ipv6_address_disable                  = try(be.ptp.source_ipv6_address_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.source_ipv6_address_disable, null)
        ptp_local_priority                               = try(be.ptp.local_priority, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.local_priority, null)
        ptp_slave_ipv4s = try(length(be.ptp.slave_ipv4s) == 0, true) ? null : [for slave in be.ptp.slave_ipv4s : {
          address        = try(slave.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.slave_ipv4s.address, null)
          non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.slave_ipv4s.non_negotiated, null)
        }]
        ptp_slave_ipv6s = try(length(be.ptp.slave_ipv6s) == 0, true) ? null : [for slave in be.ptp.slave_ipv6s : {
          address        = try(slave.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.slave_ipv6s.address, null)
          non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.slave_ipv6s.non_negotiated, null)
        }]
        ptp_slave_ethernets = try(length(be.ptp.slave_ethernets) == 0, true) ? null : [for slave in be.ptp.slave_ethernets : {
          address        = try(slave.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.slave_ethernets.address, null)
          non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.slave_ethernets.non_negotiated, null)
        }]
        ptp_master_ipv4s = try(length(be.ptp.master_ipv4s) == 0, true) ? null : [for master in be.ptp.master_ipv4s : {
          address         = try(master.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv4s.address, null)
          priority        = try(master.priority, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv4s.priority, null)
          clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv4s.clock_class, null)
          multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv4s.multicast, null)
          multicast_mixed = try(master.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv4s.multicast_mixed, null)
          non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv4s.non_negotiated, null)
          delay_asymmetry = try(master.delay_asymmetry, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv4s.delay_asymmetry, null)
          nanoseconds     = try(master.nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv4s.nanoseconds, null)
          microseconds    = try(master.microseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv4s.microseconds, null)
          milliseconds    = try(master.milliseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv4s.milliseconds, null)
        }]
        ptp_master_ipv6s = try(length(be.ptp.master_ipv6s) == 0, true) ? null : [for master in be.ptp.master_ipv6s : {
          address         = try(master.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv6s.address, null)
          priority        = try(master.priority, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv6s.priority, null)
          clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv6s.clock_class, null)
          multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv6s.multicast, null)
          multicast_mixed = try(master.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv6s.multicast_mixed, null)
          non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv6s.non_negotiated, null)
          delay_asymmetry = try(master.delay_asymmetry, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv6s.delay_asymmetry, null)
          nanoseconds     = try(master.nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv6s.nanoseconds, null)
          microseconds    = try(master.microseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv6s.microseconds, null)
          milliseconds    = try(master.milliseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ipv6s.milliseconds, null)
        }]
        ptp_master_ethernets = try(length(be.ptp.master_ethernets) == 0, true) ? null : [for master in be.ptp.master_ethernets : {
          address         = try(master.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ethernets.address, null)
          priority        = try(master.priority, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ethernets.priority, null)
          clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ethernets.clock_class, null)
          multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ethernets.multicast, null)
          multicast_mixed = try(master.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ethernets.multicast_mixed, null)
          non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ethernets.non_negotiated, null)
          delay_asymmetry = try(master.delay_asymmetry, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ethernets.delay_asymmetry, null)
          nanoseconds     = try(master.nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ethernets.nanoseconds, null)
          microseconds    = try(master.microseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ethernets.microseconds, null)
          milliseconds    = try(master.milliseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.master_ethernets.milliseconds, null)
        }]
        ptp_interop_profile_default                              = try(be.ptp.interop_profile_default, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_profile_default, null)
        ptp_interop_profile_g_8265_1                             = try(be.ptp.interop_profile_g_8265_1, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_profile_g_8265_1, null)
        ptp_interop_profile_g_8275_1                             = try(be.ptp.interop_profile_g_8275_1, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_profile_g_8275_1, null)
        ptp_interop_profile_g_8275_2                             = try(be.ptp.interop_profile_g_8275_2, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_profile_g_8275_2, null)
        ptp_interop_domain                                       = try(be.ptp.interop_domain, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_domain, null)
        ptp_interop_egress_conversion_priority1                  = try(be.ptp.interop_egress_conversion_priority1, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_egress_conversion_priority1, null)
        ptp_interop_egress_conversion_priority2                  = try(be.ptp.interop_egress_conversion_priority2, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_egress_conversion_priority2, null)
        ptp_interop_egress_conversion_clock_accuracy             = try(be.ptp.interop_egress_conversion_clock_accuracy, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_egress_conversion_clock_accuracy, null)
        ptp_interop_egress_conversion_offset_scaled_log_variance = try(be.ptp.interop_egress_conversion_offset_scaled_log_variance, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_egress_conversion_offset_scaled_log_variance, null)
        ptp_interop_egress_conversion_clock_class_default        = try(be.ptp.interop_egress_conversion_clock_class_default, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_egress_conversion_clock_class_default, null)
        ptp_interop_egress_conversion_clock_class_mappings = try(length(be.ptp.interop_egress_conversion_clock_class_mappings) == 0, true) ? null : [for mapping in be.ptp.interop_egress_conversion_clock_class_mappings : {
          clock_class_to_map_from = try(mapping.clock_class_to_map_from, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_egress_conversion_clock_class_mappings.clock_class_to_map_from, null)
          clock_class_to_map_to   = try(mapping.clock_class_to_map_to, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_egress_conversion_clock_class_mappings.clock_class_to_map_to, null)
        }]
        ptp_interop_ingress_conversion_priority1                  = try(be.ptp.interop_ingress_conversion_priority1, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_ingress_conversion_priority1, null)
        ptp_interop_ingress_conversion_priority2                  = try(be.ptp.interop_ingress_conversion_priority2, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_ingress_conversion_priority2, null)
        ptp_interop_ingress_conversion_clock_accuracy             = try(be.ptp.interop_ingress_conversion_clock_accuracy, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_ingress_conversion_clock_accuracy, null)
        ptp_interop_ingress_conversion_offset_scaled_log_variance = try(be.ptp.interop_ingress_conversion_offset_scaled_log_variance, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_ingress_conversion_offset_scaled_log_variance, null)
        ptp_interop_ingress_conversion_clock_class_default        = try(be.ptp.interop_ingress_conversion_clock_class_default, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_ingress_conversion_clock_class_default, null)
        ptp_interop_ingress_conversion_clock_class_mappings = try(length(be.ptp.interop_ingress_conversion_clock_class_mappings) == 0, true) ? null : [for mapping in be.ptp.interop_ingress_conversion_clock_class_mappings : {
          clock_class_to_map_from = try(mapping.clock_class_to_map_from, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_ingress_conversion_clock_class_mappings.clock_class_to_map_from, null)
          clock_class_to_map_to   = try(mapping.clock_class_to_map_to, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.bundle_ethernets.ptp.interop_ingress_conversion_clock_class_mappings.clock_class_to_map_to, null)
        }]
      }
    ]
  ])
}

resource "iosxr_interface_bundle_ether" "bundle_ether" {
  for_each = { for be in local.interfaces_bundle_ethernets : be.key => be }
  device   = each.value.device

  name                                                      = each.value.id
  point_to_point                                            = each.value.point_to_point
  multipoint                                                = each.value.multipoint
  dampening                                                 = each.value.dampening
  dampening_decay_half_life                                 = each.value.dampening_decay_half_life
  dampening_reuse_threshold                                 = each.value.dampening_reuse_threshold
  dampening_suppress_threshold                              = each.value.dampening_suppress_threshold
  dampening_max_suppress_time                               = each.value.dampening_max_suppress_time
  service_policy_input                                      = each.value.service_policy_input
  service_policy_output                                     = each.value.service_policy_output
  shutdown                                                  = each.value.shutdown
  mtu                                                       = each.value.mtu
  logging_events_link_status                                = each.value.logging_events_link_status
  bandwidth                                                 = each.value.bandwidth
  description                                               = each.value.description
  load_interval                                             = each.value.load_interval
  vrf                                                       = each.value.vrf
  ipv4_address                                              = each.value.ipv4_address
  ipv4_netmask                                              = each.value.ipv4_netmask
  ipv4_route_tag                                            = each.value.ipv4_route_tag
  ipv4_algorithm                                            = each.value.ipv4_algorithm
  ipv4_secondaries                                          = each.value.ipv4_secondaries
  ipv4_unnumbered                                           = each.value.ipv4_unnumbered
  ipv4_point_to_point                                       = each.value.ipv4_point_to_point
  ipv4_mtu                                                  = each.value.ipv4_mtu
  ipv4_redirects                                            = each.value.ipv4_redirects
  ipv4_mask_reply                                           = each.value.ipv4_mask_reply
  ipv4_helper_addresses                                     = each.value.ipv4_helper_addresses
  ipv4_unreachables_disable                                 = each.value.ipv4_unreachables_disable
  ipv4_tcp_mss_adjust                                       = each.value.ipv4_tcp_mss_adjust
  ipv4_forwarding_enable                                    = each.value.ipv4_forwarding_enable
  ipv4_ttl_propagate_disable                                = each.value.ipv4_ttl_propagate_disable
  ipv4_verify_unicast_source_reachable_via_type             = each.value.ipv4_verify_unicast_source_reachable_via_type
  ipv4_verify_unicast_source_reachable_via_allow_self_ping  = each.value.ipv4_verify_unicast_source_reachable_via_allow_self_ping
  ipv4_verify_unicast_source_reachable_via_allow_default    = each.value.ipv4_verify_unicast_source_reachable_via_allow_default
  ipv4_access_group_ingress_acl1                            = each.value.ipv4_access_group_ingress_acl1
  ipv4_access_group_ingress_hardware_count                  = each.value.ipv4_access_group_ingress_hardware_count
  ipv4_access_group_ingress_interface_statistics            = each.value.ipv4_access_group_ingress_interface_statistics
  ipv4_access_group_ingress_compress                        = each.value.ipv4_access_group_ingress_compress
  ipv4_access_group_egress_acl                              = each.value.ipv4_access_group_egress_acl
  ipv4_access_group_egress_hardware_count                   = each.value.ipv4_access_group_egress_hardware_count
  ipv4_access_group_egress_interface_statistics             = each.value.ipv4_access_group_egress_interface_statistics
  ipv4_access_group_egress_compress                         = each.value.ipv4_access_group_egress_compress
  ipv6_verify_unicast_source_reachable_via_type             = each.value.ipv6_verify_unicast_source_reachable_via_type
  ipv6_verify_unicast_source_reachable_via_allow_self_ping  = each.value.ipv6_verify_unicast_source_reachable_via_allow_self_ping
  ipv6_verify_unicast_source_reachable_via_allow_default    = each.value.ipv6_verify_unicast_source_reachable_via_allow_default
  ipv6_access_group_ingress_acl1                            = each.value.ipv6_access_group_ingress_acl1
  ipv6_access_group_ingress_interface_statistics            = each.value.ipv6_access_group_ingress_interface_statistics
  ipv6_access_group_ingress_compress                        = each.value.ipv6_access_group_ingress_compress
  ipv6_access_group_egress_acl                              = each.value.ipv6_access_group_egress_acl
  ipv6_access_group_egress_interface_statistics             = each.value.ipv6_access_group_egress_interface_statistics
  ipv6_access_group_egress_compress                         = each.value.ipv6_access_group_egress_compress
  ipv6_enable                                               = each.value.ipv6_enable
  ipv6_ttl_propagate_disable                                = each.value.ipv6_ttl_propagate_disable
  ipv6_addresses                                            = each.value.ipv6_addresses
  ipv6_link_local_address                                   = each.value.ipv6_link_local_address
  ipv6_link_local_zone                                      = each.value.ipv6_link_local_zone
  ipv6_link_local_route_tag                                 = each.value.ipv6_link_local_route_tag
  ipv6_eui64_addresses                                      = each.value.ipv6_eui64_addresses
  ipv6_autoconfig                                           = each.value.ipv6_autoconfig
  ipv6_dhcp                                                 = each.value.ipv6_dhcp
  ipv6_mtu                                                  = each.value.ipv6_mtu
  ipv6_unreachables_disable                                 = each.value.ipv6_unreachables_disable
  ipv6_tcp_mss_adjust                                       = each.value.ipv6_tcp_mss_adjust
  ipv6_nd_reachable_time                                    = each.value.ipv6_nd_reachable_time
  ipv6_nd_cache_limit                                       = each.value.ipv6_nd_cache_limit
  ipv6_nd_dad_attempts                                      = each.value.ipv6_nd_dad_attempts
  ipv6_nd_unicast_ra                                        = each.value.ipv6_nd_unicast_ra
  ipv6_nd_suppress_ra                                       = each.value.ipv6_nd_suppress_ra
  ipv6_nd_managed_config_flag                               = each.value.ipv6_nd_managed_config_flag
  ipv6_nd_other_config_flag                                 = each.value.ipv6_nd_other_config_flag
  ipv6_nd_ns_interval                                       = each.value.ipv6_nd_ns_interval
  ipv6_nd_ra_interval_max                                   = each.value.ipv6_nd_ra_interval_max
  ipv6_nd_ra_interval_min                                   = each.value.ipv6_nd_ra_interval_min
  ipv6_nd_ra_lifetime                                       = each.value.ipv6_nd_ra_lifetime
  ipv6_nd_redirects                                         = each.value.ipv6_nd_redirects
  ipv6_nd_prefix_default_no_adv                             = each.value.ipv6_nd_prefix_default_no_adv
  ipv6_nd_prefix_default_no_autoconfig                      = each.value.ipv6_nd_prefix_default_no_autoconfig
  ethernet_cfm_mep_domains                                  = each.value.ethernet_cfm_mep_domains
  ethernet_cfm_ais_transmission_up_interval                 = each.value.ethernet_cfm_ais_transmission_up_interval
  ethernet_cfm_ais_transmission_up_cos                      = each.value.ethernet_cfm_ais_transmission_up_cos
  ethernet_cfm_bandwidth_notifications_hold_off             = each.value.ethernet_cfm_bandwidth_notifications_hold_off
  ethernet_cfm_bandwidth_notifications_wait_to_restore      = each.value.ethernet_cfm_bandwidth_notifications_wait_to_restore
  ethernet_cfm_bandwidth_notifications_loss_threshold       = each.value.ethernet_cfm_bandwidth_notifications_loss_threshold
  ethernet_cfm_bandwidth_notifications_log_changes          = each.value.ethernet_cfm_bandwidth_notifications_log_changes
  flow_ipv4_ingress_monitors                                = each.value.flow_ipv4_ingress_monitors
  flow_ipv4_ingress_monitor_samplers                        = each.value.flow_ipv4_ingress_monitor_samplers
  flow_ipv4_egress_monitors                                 = each.value.flow_ipv4_egress_monitors
  flow_ipv4_egress_monitor_samplers                         = each.value.flow_ipv4_egress_monitor_samplers
  flow_ipv6_ingress_monitors                                = each.value.flow_ipv6_ingress_monitors
  flow_ipv6_ingress_monitor_samplers                        = each.value.flow_ipv6_ingress_monitor_samplers
  flow_ipv6_egress_monitors                                 = each.value.flow_ipv6_egress_monitors
  flow_ipv6_egress_monitor_samplers                         = each.value.flow_ipv6_egress_monitor_samplers
  arp_timeout                                               = each.value.arp_timeout
  arp_learning_disable                                      = each.value.arp_learning_disable
  arp_learning_local                                        = each.value.arp_learning_local
  arp_gratuitous_ignore                                     = each.value.arp_gratuitous_ignore
  arp_cache_limit                                           = each.value.arp_cache_limit
  proxy_arp                                                 = each.value.proxy_arp
  bundle_minimum_active_links                               = each.value.bundle_minimum_active_links
  bundle_maximum_active_links                               = each.value.bundle_maximum_active_links
  bundle_shutdown                                           = each.value.bundle_shutdown
  bundle_load_balancing_hash_src_ip                         = each.value.bundle_load_balancing_hash_src_ip
  bundle_load_balancing_hash_dst_ip                         = each.value.bundle_load_balancing_hash_dst_ip
  bundle_lacp_delay                                         = each.value.bundle_lacp_delay
  bundle_lacp_fallback_timeout                              = each.value.bundle_lacp_fallback_timeout
  lacp_switchover_suppress_flaps                            = each.value.lacp_switchover_suppress_flaps
  lacp_churn_logging                                        = each.value.lacp_churn_logging
  lacp_cisco_enable                                         = each.value.lacp_cisco_enable
  lacp_cisco_enable_link_order_signaled                     = each.value.lacp_cisco_enable_link_order_signaled
  lacp_non_revertive                                        = each.value.lacp_non_revertive
  lacp_mode                                                 = each.value.lacp_mode
  lacp_system_priority                                      = each.value.lacp_system_priority
  lacp_system_mac                                           = each.value.lacp_system_mac
  lacp_period_short                                         = each.value.lacp_period_short
  lacp_period                                               = each.value.lacp_period
  bfd_mode_ietf                                             = each.value.bfd_mode_ietf
  bfd_mode_cisco                                            = each.value.bfd_mode_cisco
  bfd_address_family_ipv4_destination                       = each.value.bfd_address_family_ipv4_destination
  bfd_address_family_ipv4_minimum_interval                  = each.value.bfd_address_family_ipv4_minimum_interval
  bfd_address_family_ipv4_multiplier                        = each.value.bfd_address_family_ipv4_multiplier
  bfd_address_family_ipv4_fast_detect                       = each.value.bfd_address_family_ipv4_fast_detect
  bfd_address_family_ipv4_echo_minimum_interval             = each.value.bfd_address_family_ipv4_echo_minimum_interval
  bfd_address_family_ipv4_timers_start                      = each.value.bfd_address_family_ipv4_timers_start
  bfd_address_family_ipv4_timers_nbr_unconfig               = each.value.bfd_address_family_ipv4_timers_nbr_unconfig
  bfd_address_family_ipv6_destination                       = each.value.bfd_address_family_ipv6_destination
  bfd_address_family_ipv6_minimum_interval                  = each.value.bfd_address_family_ipv6_minimum_interval
  bfd_address_family_ipv6_multiplier                        = each.value.bfd_address_family_ipv6_multiplier
  bfd_address_family_ipv6_fast_detect                       = each.value.bfd_address_family_ipv6_fast_detect
  bfd_address_family_ipv6_timers_start                      = each.value.bfd_address_family_ipv6_timers_start
  bfd_address_family_ipv6_timers_nbr_unconfig               = each.value.bfd_address_family_ipv6_timers_nbr_unconfig
  mac_address                                               = each.value.mac_address
  mpls_mtu                                                  = each.value.mpls_mtu
  lldp                                                      = each.value.lldp
  lldp_transmit_disable                                     = each.value.lldp_transmit_disable
  lldp_receive_disable                                      = each.value.lldp_receive_disable
  ptp                                                       = each.value.ptp
  ptp_profile                                               = each.value.ptp_profile
  ptp_transport_ipv4                                        = each.value.ptp_transport_ipv4
  ptp_transport_ethernet                                    = each.value.ptp_transport_ethernet
  ptp_transport_ipv6                                        = each.value.ptp_transport_ipv6
  ptp_clock_operation_one_step                              = each.value.ptp_clock_operation_one_step
  ptp_clock_operation_two_step                              = each.value.ptp_clock_operation_two_step
  ptp_announce_interval                                     = each.value.ptp_announce_interval
  ptp_announce_frequency                                    = each.value.ptp_announce_frequency
  ptp_announce_timeout                                      = each.value.ptp_announce_timeout
  ptp_announce_grant_duration                               = each.value.ptp_announce_grant_duration
  ptp_sync_interval                                         = each.value.ptp_sync_interval
  ptp_sync_frequency                                        = each.value.ptp_sync_frequency
  ptp_sync_grant_duration                                   = each.value.ptp_sync_grant_duration
  ptp_sync_timeout                                          = each.value.ptp_sync_timeout
  ptp_delay_request_interval                                = each.value.ptp_delay_request_interval
  ptp_delay_request_frequency                               = each.value.ptp_delay_request_frequency
  ptp_cos                                                   = each.value.ptp_cos
  ptp_cos_event                                             = each.value.ptp_cos_event
  ptp_cos_general                                           = each.value.ptp_cos_general
  ptp_dscp                                                  = each.value.ptp_dscp
  ptp_dscp_event                                            = each.value.ptp_dscp_event
  ptp_dscp_general                                          = each.value.ptp_dscp_general
  ptp_ipv4_ttl                                              = each.value.ptp_ipv4_ttl
  ptp_ipv6_hop_limit                                        = each.value.ptp_ipv6_hop_limit
  ptp_delay_asymmetry_value                                 = each.value.ptp_delay_asymmetry_value
  ptp_delay_asymmetry_unit_nanoseconds                      = each.value.ptp_delay_asymmetry_unit_nanoseconds
  ptp_delay_asymmetry_unit_microseconds                     = each.value.ptp_delay_asymmetry_unit_microseconds
  ptp_delay_asymmetry_unit_milliseconds                     = each.value.ptp_delay_asymmetry_unit_milliseconds
  ptp_delay_response_grant_duration                         = each.value.ptp_delay_response_grant_duration
  ptp_delay_response_timeout                                = each.value.ptp_delay_response_timeout
  ptp_unicast_grant_invalid_request_reduce                  = each.value.ptp_unicast_grant_invalid_request_reduce
  ptp_unicast_grant_invalid_request_deny                    = each.value.ptp_unicast_grant_invalid_request_deny
  ptp_multicast                                             = each.value.ptp_multicast
  ptp_multicast_mixed                                       = each.value.ptp_multicast_mixed
  ptp_multicast_disable                                     = each.value.ptp_multicast_disable
  ptp_multicast_target_address_mac_forwardable              = each.value.ptp_multicast_target_address_mac_forwardable
  ptp_multicast_target_address_mac_non_forwardable          = each.value.ptp_multicast_target_address_mac_non_forwardable
  ptp_port_state_slave_only                                 = each.value.ptp_port_state_slave_only
  ptp_port_state_master_only                                = each.value.ptp_port_state_master_only
  ptp_port_state_any                                        = each.value.ptp_port_state_any
  ptp_source_ipv4_address                                   = each.value.ptp_source_ipv4_address
  ptp_source_ipv4_address_disable                           = each.value.ptp_source_ipv4_address_disable
  ptp_source_ipv6_address                                   = each.value.ptp_source_ipv6_address
  ptp_source_ipv6_address_disable                           = each.value.ptp_source_ipv6_address_disable
  ptp_local_priority                                        = each.value.ptp_local_priority
  ptp_slave_ipv4s                                           = each.value.ptp_slave_ipv4s
  ptp_slave_ipv6s                                           = each.value.ptp_slave_ipv6s
  ptp_slave_ethernets                                       = each.value.ptp_slave_ethernets
  ptp_master_ipv4s                                          = each.value.ptp_master_ipv4s
  ptp_master_ipv6s                                          = each.value.ptp_master_ipv6s
  ptp_master_ethernets                                      = each.value.ptp_master_ethernets
  ptp_interop_profile_default                               = each.value.ptp_interop_profile_default
  ptp_interop_profile_g_8265_1                              = each.value.ptp_interop_profile_g_8265_1
  ptp_interop_profile_g_8275_1                              = each.value.ptp_interop_profile_g_8275_1
  ptp_interop_profile_g_8275_2                              = each.value.ptp_interop_profile_g_8275_2
  ptp_interop_domain                                        = each.value.ptp_interop_domain
  ptp_interop_egress_conversion_priority1                   = each.value.ptp_interop_egress_conversion_priority1
  ptp_interop_egress_conversion_priority2                   = each.value.ptp_interop_egress_conversion_priority2
  ptp_interop_egress_conversion_clock_accuracy              = each.value.ptp_interop_egress_conversion_clock_accuracy
  ptp_interop_egress_conversion_offset_scaled_log_variance  = each.value.ptp_interop_egress_conversion_offset_scaled_log_variance
  ptp_interop_egress_conversion_clock_class_default         = each.value.ptp_interop_egress_conversion_clock_class_default
  ptp_interop_egress_conversion_clock_class_mappings        = each.value.ptp_interop_egress_conversion_clock_class_mappings
  ptp_interop_ingress_conversion_priority1                  = each.value.ptp_interop_ingress_conversion_priority1
  ptp_interop_ingress_conversion_priority2                  = each.value.ptp_interop_ingress_conversion_priority2
  ptp_interop_ingress_conversion_clock_accuracy             = each.value.ptp_interop_ingress_conversion_clock_accuracy
  ptp_interop_ingress_conversion_offset_scaled_log_variance = each.value.ptp_interop_ingress_conversion_offset_scaled_log_variance
  ptp_interop_ingress_conversion_clock_class_default        = each.value.ptp_interop_ingress_conversion_clock_class_default
  ptp_interop_ingress_conversion_clock_class_mappings       = each.value.ptp_interop_ingress_conversion_clock_class_mappings

  lifecycle {
    precondition {
      condition     = (each.value.ipv4_address == null && each.value.ipv4_netmask == null) || (each.value.ipv4_address != null && each.value.ipv4_netmask != null)
      error_message = "Interface ${each.key}: ipv4_address and ipv4_netmask must both be specified or both be omitted."
    }
  }

  depends_on = [
    # Future dependencies - uncomment when resource is created:
    #iosxr_vrf.vrf,
    iosxr_interface_ethernet.ethernet,
    iosxr_interface_ethernet_subinterface.ethernet_subinterface
    #iosxr_ipv4_access_list.ipv4_access_list,
    #iosxr_ipv6_access_list.ipv6_access_list,
  ]
}

##### BUNDLE-ETHERNET SUBINTERFACES #####

locals {
  interfaces_bundle_ethernet_subinterfaces = flatten([
    for device in local.devices : [
      for be in try(local.device_config[device.name].interfaces.bundle_ethernets, []) : [
        for subint in try(be.subinterfaces, []) : {
          key                          = format("%s/Bundle-Ether%s", device.name, trimprefix(subint.id, "$string "))
          device                       = device.name
          id                           = trimprefix(subint.id, "$string ")
          point_to_point               = try(subint.point_to_point, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.point_to_point, null)
          multipoint                   = try(subint.multipoint, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.multipoint, null)
          dampening                    = try(subint.dampening, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.dampening, null)
          dampening_decay_half_life    = try(subint.dampening_decay_half_life, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.dampening_decay_half_life, null)
          dampening_reuse_threshold    = try(subint.dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.dampening_reuse_threshold, null)
          dampening_suppress_threshold = try(subint.dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.dampening_suppress_threshold, null)
          dampening_max_suppress_time  = try(subint.dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.dampening_max_suppress_time, null)
          service_policy_input = try(length(subint.service_policy_input) == 0, true) ? null : [for service_policy in subint.service_policy_input : {
            name = try(service_policy.name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.service_policy_input.name, null)
          }]
          service_policy_output = try(length(subint.service_policy_output) == 0, true) ? null : [for service_policy in subint.service_policy_output : {
            name = try(service_policy.name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.service_policy_output.name, null)
          }]
          encapsulation_dot1q_vlan_id                  = try(subint.encapsulation_dot1q_vlan_id, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.encapsulation_dot1q_vlan_id, null)
          encapsulation_dot1q_second_dot1q             = try(subint.encapsulation_dot1q_second_dot1q, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.encapsulation_dot1q_second_dot1q, null)
          l2transport_encapsulation_dot1q_vlan_id      = try(subint.l2transport_encapsulation_dot1q_vlan_id, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.l2transport_encapsulation_dot1q_vlan_id, null)
          l2transport_encapsulation_dot1q_second_dot1q = try(subint.l2transport_encapsulation_dot1q_second_dot1q, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.l2transport_encapsulation_dot1q_second_dot1q, null)
          rewrite_ingress_tag_pop_one                  = try(subint.rewrite_ingress_tag_pop_one, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.rewrite_ingress_tag_pop_one, null)
          rewrite_ingress_tag_pop_two                  = try(subint.rewrite_ingress_tag_pop_two, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.rewrite_ingress_tag_pop_two, null)
          shutdown                                     = try(subint.shutdown, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.shutdown, null)
          mtu                                          = try(subint.mtu, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.mtu, null)
          logging_events_link_status                   = try(subint.logging_events_link_status, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.logging_events_link_status, null)
          bandwidth                                    = try(subint.bandwidth, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.bandwidth, null)
          description                                  = try(subint.description, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.description, null)
          load_interval                                = try(subint.load_interval, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.load_interval, null)
          vrf                                          = try(subint.vrf, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.vrf, null)
          ipv4_address                                 = try(subint.ipv4.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.address, null)
          ipv4_netmask                                 = try(subint.ipv4.netmask, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.netmask, null)
          ipv4_route_tag                               = try(subint.ipv4.route_tag, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.route_tag, null)
          ipv4_algorithm                               = try(subint.ipv4.algorithm, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.algorithm, null)
          ipv4_secondaries = try(length(subint.ipv4.secondaries) == 0, true) ? null : [for secondary in subint.ipv4.secondaries : {
            address   = try(secondary.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.secondaries.address, null)
            netmask   = try(secondary.netmask, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.secondaries.netmask, null)
            route_tag = try(secondary.route_tag, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.secondaries.route_tag, null)
            algorithm = try(secondary.algorithm, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.secondaries.algorithm, null)
          }]
          ipv4_unnumbered     = try(subint.ipv4.unnumbered, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.unnumbered, null)
          ipv4_point_to_point = try(subint.ipv4.point_to_point, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.point_to_point, null)
          ipv4_mtu            = try(subint.ipv4.mtu, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.mtu, null)
          ipv4_redirects      = try(subint.ipv4.redirects, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.redirects, null)
          ipv4_mask_reply     = try(subint.ipv4.mask_reply, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.mask_reply, null)
          ipv4_helper_addresses = try(length(subint.ipv4.helper_addresses) == 0, true) ? null : [for helper in subint.ipv4.helper_addresses : {
            address = try(helper.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.helper_addresses.address, null)
            vrf     = try(helper.vrf, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.helper_addresses.vrf, null)
          }]
          ipv4_unreachables_disable                                = try(subint.ipv4.unreachables_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.unreachables_disable, null)
          ipv4_tcp_mss_adjust                                      = try(subint.ipv4.tcp_mss_adjust, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.tcp_mss_adjust, null)
          ipv4_forwarding_enable                                   = try(subint.ipv4.forwarding_enable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.forwarding_enable, null)
          ipv4_ttl_propagate_disable                               = try(subint.ipv4.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.ttl_propagate_disable, null)
          ipv4_verify_unicast_source_reachable_via_type            = try(subint.ipv4.verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.verify_unicast_source_reachable_via_type, null)
          ipv4_verify_unicast_source_reachable_via_allow_self_ping = try(subint.ipv4.verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.verify_unicast_source_reachable_via_allow_self_ping, can(subint.ipv4.verify_unicast_source_reachable_via_type) ? false : null)
          ipv4_verify_unicast_source_reachable_via_allow_default   = try(subint.ipv4.verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.verify_unicast_source_reachable_via_allow_default, can(subint.ipv4.verify_unicast_source_reachable_via_type) ? false : null)
          ipv4_access_group_ingress_acl1                           = try(subint.ipv4.access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.access_group_ingress_acl1, null)
          ipv4_access_group_ingress_hardware_count                 = try(subint.ipv4.access_group_ingress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.access_group_ingress_hardware_count, null)
          ipv4_access_group_ingress_interface_statistics           = try(subint.ipv4.access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.access_group_ingress_interface_statistics, null)
          ipv4_access_group_ingress_compress                       = try(subint.ipv4.access_group_ingress_compress, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.access_group_ingress_compress, null)
          ipv4_access_group_egress_acl                             = try(subint.ipv4.access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.access_group_egress_acl, null)
          ipv4_access_group_egress_hardware_count                  = try(subint.ipv4.access_group_egress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.access_group_egress_hardware_count, null)
          ipv4_access_group_egress_interface_statistics            = try(subint.ipv4.access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.access_group_egress_interface_statistics, null)
          ipv4_access_group_egress_compress                        = try(subint.ipv4.access_group_egress_compress, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv4.access_group_egress_compress, null)
          ipv6_verify_unicast_source_reachable_via_type            = try(subint.ipv6.verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.verify_unicast_source_reachable_via_type, null)
          ipv6_verify_unicast_source_reachable_via_allow_self_ping = try(subint.ipv6.verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.verify_unicast_source_reachable_via_allow_self_ping, can(subint.ipv6.verify_unicast_source_reachable_via_type) ? false : null)
          ipv6_verify_unicast_source_reachable_via_allow_default   = try(subint.ipv6.verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.verify_unicast_source_reachable_via_allow_default, can(subint.ipv6.verify_unicast_source_reachable_via_type) ? false : null)
          ipv6_access_group_ingress_acl1                           = try(subint.ipv6.access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.access_group_ingress_acl1, null)
          ipv6_access_group_ingress_interface_statistics           = try(subint.ipv6.access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.access_group_ingress_interface_statistics, null)
          ipv6_access_group_ingress_compress                       = try(subint.ipv6.access_group_ingress_compress, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.access_group_ingress_compress, null)
          ipv6_access_group_egress_acl                             = try(subint.ipv6.access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.access_group_egress_acl, null)
          ipv6_access_group_egress_interface_statistics            = try(subint.ipv6.access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.access_group_egress_interface_statistics, null)
          ipv6_access_group_egress_compress                        = try(subint.ipv6.access_group_egress_compress, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.access_group_egress_compress, null)
          ipv6_enable                                              = try(subint.ipv6.enable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.enable, null)
          ipv6_ttl_propagate_disable                               = try(subint.ipv6.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.ttl_propagate_disable, null)
          ipv6_addresses = try(length(subint.ipv6.addresses) == 0, true) ? null : [for ipv6_address in subint.ipv6.addresses : {
            address       = try(ipv6_address.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.addresses.address, null)
            prefix_length = try(ipv6_address.prefix_length, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.addresses.prefix_length, null)
            zone          = try(ipv6_address.zone, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.addresses.zone, null)
            route_tag     = try(ipv6_address.route_tag, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.addresses.route_tag, null)
            algorithm     = try(ipv6_address.algorithm, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.addresses.algorithm, null)
          }]
          ipv6_link_local_address   = try(subint.ipv6.link_local_address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.link_local_address, null)
          ipv6_link_local_zone      = try(subint.ipv6.link_local_zone, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.link_local_zone, can(subint.ipv6.link_local_address) ? 0 : null)
          ipv6_link_local_route_tag = try(subint.ipv6.link_local_route_tag, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.link_local_route_tag, null)
          ipv6_eui64_addresses = try(length(subint.ipv6.eui64_addresses) == 0, true) ? null : [for eui64 in subint.ipv6.eui64_addresses : {
            address       = try(eui64.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.eui64_addresses.address, null)
            prefix_length = try(eui64.prefix_length, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.eui64_addresses.prefix_length, null)
            zone          = try(eui64.zone, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.eui64_addresses.zone, null)
            route_tag     = try(eui64.route_tag, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.eui64_addresses.route_tag, null)
            algorithm     = try(eui64.algorithm, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.eui64_addresses.algorithm, null)
          }]
          ipv6_autoconfig                      = try(subint.ipv6.autoconfig, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.autoconfig, null)
          ipv6_dhcp                            = try(subint.ipv6.dhcp, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.dhcp, null)
          ipv6_mtu                             = try(subint.ipv6.mtu, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.mtu, null)
          ipv6_unreachables_disable            = try(subint.ipv6.unreachables_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.unreachables_disable, null)
          ipv6_tcp_mss_adjust                  = try(subint.ipv6.tcp_mss_adjust, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.tcp_mss_adjust, null)
          ipv6_nd_reachable_time               = try(subint.ipv6.nd_reachable_time, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.nd_reachable_time, null)
          ipv6_nd_cache_limit                  = try(subint.ipv6.nd_cache_limit, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.nd_cache_limit, null)
          ipv6_nd_dad_attempts                 = try(subint.ipv6.nd_dad_attempts, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.nd_dad_attempts, null)
          ipv6_nd_unicast_ra                   = try(subint.ipv6.nd_unicast_ra, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.nd_unicast_ra, null)
          ipv6_nd_suppress_ra                  = try(subint.ipv6.nd_suppress_ra, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.nd_suppress_ra, null)
          ipv6_nd_managed_config_flag          = try(subint.ipv6.nd_managed_config_flag, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.nd_managed_config_flag, null)
          ipv6_nd_other_config_flag            = try(subint.ipv6.nd_other_config_flag, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.nd_other_config_flag, null)
          ipv6_nd_ns_interval                  = try(subint.ipv6.nd_ns_interval, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.nd_ns_interval, null)
          ipv6_nd_ra_interval_max              = try(subint.ipv6.nd_ra_interval_max, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.nd_ra_interval_max, null)
          ipv6_nd_ra_interval_min              = try(subint.ipv6.nd_ra_interval_min, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.nd_ra_interval_min, null)
          ipv6_nd_ra_lifetime                  = try(subint.ipv6.nd_ra_lifetime, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.nd_ra_lifetime, null)
          ipv6_nd_redirects                    = try(subint.ipv6.nd_redirects, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.nd_redirects, null)
          ipv6_nd_prefix_default_no_adv        = try(subint.ipv6.nd_prefix_default_no_adv, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.nd_prefix_default_no_adv, null)
          ipv6_nd_prefix_default_no_autoconfig = try(subint.ipv6.nd_prefix_default_no_autoconfig, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ipv6.nd_prefix_default_no_autoconfig, null)
          ethernet_cfm_mep_domains = try(length(subint.ethernet_cfm.mep_domains) == 0, true) ? null : [for domain in subint.ethernet_cfm.mep_domains : {
            domain_name                                        = try(domain.domain_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.domain_name, null)
            service                                            = try(domain.service, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.service, null)
            mep_id                                             = try(domain.mep_id, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.mep_id, null)
            cos                                                = try(domain.cos, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.cos, null)
            loss_measurement_counters_aggregate                = try(domain.loss_measurement_counters_aggregate, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_aggregate, null)
            loss_measurement_counters_priority_cos_range_start = try(domain.loss_measurement_counters_priority_cos_range_start, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_range_start, null)
            loss_measurement_counters_priority_cos_range_end   = try(domain.loss_measurement_counters_priority_cos_range_end, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_range_end, null)
            loss_measurement_counters_priority_cos_value_1     = try(domain.loss_measurement_counters_priority_cos_value_1, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_1, null)
            loss_measurement_counters_priority_cos_value_2     = try(domain.loss_measurement_counters_priority_cos_value_2, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_2, null)
            loss_measurement_counters_priority_cos_value_3     = try(domain.loss_measurement_counters_priority_cos_value_3, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_3, null)
            loss_measurement_counters_priority_cos_value_4     = try(domain.loss_measurement_counters_priority_cos_value_4, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_4, null)
            loss_measurement_counters_priority_cos_value_5     = try(domain.loss_measurement_counters_priority_cos_value_5, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_5, null)
            loss_measurement_counters_priority_cos_value_6     = try(domain.loss_measurement_counters_priority_cos_value_6, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_6, null)
            loss_measurement_counters_priority_cos_value_7     = try(domain.loss_measurement_counters_priority_cos_value_7, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.loss_measurement_counters_priority_cos_value_7, null)
            sla_operation_profile_target_mep_ids = try(length(domain.sla_operation_profile_target_mep_ids) == 0, true) ? null : [for sla_mep in domain.sla_operation_profile_target_mep_ids : {
              profile_name = try(sla_mep.profile_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.sla_operation_profile_target_mep_ids.profile_name, null)
              mep_id       = try(sla_mep.mep_id, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.sla_operation_profile_target_mep_ids.mep_id, null)
            }]
            sla_operation_profile_target_mac_addresses = try(length(domain.sla_operation_profile_target_mac_addresses) == 0, true) ? null : [for sla_mac in domain.sla_operation_profile_target_mac_addresses : {
              profile_name = try(sla_mac.profile_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.sla_operation_profile_target_mac_addresses.profile_name, null)
              mac_address  = try(sla_mac.mac_address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.mep_domains.sla_operation_profile_target_mac_addresses.mac_address, null)
            }]
          }]
          ethernet_cfm_ais_transmission_up_interval            = try(subint.ethernet_cfm.ais_transmission_up_interval, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.ais_transmission_up_interval, null)
          ethernet_cfm_ais_transmission_up_cos                 = try(subint.ethernet_cfm.ais_transmission_up_cos, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.ais_transmission_up_cos, null)
          ethernet_cfm_bandwidth_notifications_hold_off        = try(subint.ethernet_cfm.bandwidth_notifications_hold_off, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.bandwidth_notifications_hold_off, null)
          ethernet_cfm_bandwidth_notifications_wait_to_restore = try(subint.ethernet_cfm.bandwidth_notifications_wait_to_restore, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.bandwidth_notifications_wait_to_restore, null)
          ethernet_cfm_bandwidth_notifications_loss_threshold  = try(subint.ethernet_cfm.bandwidth_notifications_loss_threshold, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.bandwidth_notifications_loss_threshold, null)
          ethernet_cfm_bandwidth_notifications_log_changes     = try(subint.ethernet_cfm.bandwidth_notifications_log_changes, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ethernet_cfm.bandwidth_notifications_log_changes, null)
          flow_ipv4_ingress_monitors = try(length(subint.flow_ipv4_ingress_monitors) == 0, true) ? null : [for flow_monitor in subint.flow_ipv4_ingress_monitors : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.flow_ipv4_ingress_monitors.monitor_map_name, null)
          }]
          flow_ipv4_ingress_monitor_samplers = try(length(subint.flow_ipv4_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in subint.flow_ipv4_ingress_monitor_samplers : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.flow_ipv4_ingress_monitor_samplers.monitor_map_name, null)
            sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.flow_ipv4_ingress_monitor_samplers.sampler_map_name, null)
          }]
          flow_ipv4_egress_monitors = try(length(subint.flow_ipv4_egress_monitors) == 0, true) ? null : [for flow_monitor in subint.flow_ipv4_egress_monitors : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.flow_ipv4_egress_monitors.monitor_map_name, null)
          }]
          flow_ipv4_egress_monitor_samplers = try(length(subint.flow_ipv4_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in subint.flow_ipv4_egress_monitor_samplers : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.flow_ipv4_egress_monitor_samplers.monitor_map_name, null)
            sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.flow_ipv4_egress_monitor_samplers.sampler_map_name, null)
          }]
          flow_ipv6_ingress_monitors = try(length(subint.flow_ipv6_ingress_monitors) == 0, true) ? null : [for flow_monitor in subint.flow_ipv6_ingress_monitors : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.flow_ipv6_ingress_monitors.monitor_map_name, null)
          }]
          flow_ipv6_ingress_monitor_samplers = try(length(subint.flow_ipv6_ingress_monitor_samplers) == 0, true) ? null : [for flow_monitor in subint.flow_ipv6_ingress_monitor_samplers : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.flow_ipv6_ingress_monitor_samplers.monitor_map_name, null)
            sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.flow_ipv6_ingress_monitor_samplers.sampler_map_name, null)
          }]
          flow_ipv6_egress_monitors = try(length(subint.flow_ipv6_egress_monitors) == 0, true) ? null : [for flow_monitor in subint.flow_ipv6_egress_monitors : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.flow_ipv6_egress_monitors.monitor_map_name, null)
          }]
          flow_ipv6_egress_monitor_samplers = try(length(subint.flow_ipv6_egress_monitor_samplers) == 0, true) ? null : [for flow_monitor in subint.flow_ipv6_egress_monitor_samplers : {
            monitor_map_name = try(flow_monitor.monitor_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.flow_ipv6_egress_monitor_samplers.monitor_map_name, null)
            sampler_map_name = try(flow_monitor.sampler_map_name, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.flow_ipv6_egress_monitor_samplers.sampler_map_name, null)
          }]
          arp_timeout                                      = try(subint.arp_timeout, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.arp_timeout, null)
          arp_learning_disable                             = try(subint.arp_learning_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.arp_learning_disable, null)
          arp_learning_local                               = try(subint.arp_learning_local, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.arp_learning_local, null)
          arp_gratuitous_ignore                            = try(subint.arp_gratuitous_ignore, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.arp_gratuitous_ignore, null)
          arp_cache_limit                                  = try(subint.arp_cache_limit, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.arp_cache_limit, null)
          proxy_arp                                        = try(subint.proxy_arp, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.proxy_arp, null)
          mpls_mtu                                         = try(subint.mpls_mtu, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.mpls_mtu, null)
          lldp                                             = try(subint.lldp, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.lldp, null)
          lldp_transmit_disable                            = try(subint.lldp_transmit_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.lldp_transmit_disable, null)
          lldp_receive_disable                             = try(subint.lldp_receive_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.lldp_receive_disable, null)
          ptp                                              = try(subint.ptp.enable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.enable, null)
          ptp_profile                                      = try(subint.ptp.profile, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.profile, null)
          ptp_transport_ipv4                               = try(subint.ptp.transport_ipv4, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.transport_ipv4, null)
          ptp_transport_ethernet                           = try(subint.ptp.transport_ethernet, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.transport_ethernet, null)
          ptp_transport_ipv6                               = try(subint.ptp.transport_ipv6, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.transport_ipv6, null)
          ptp_clock_operation_one_step                     = try(subint.ptp.clock_operation_one_step, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.clock_operation_one_step, null)
          ptp_clock_operation_two_step                     = try(subint.ptp.clock_operation_two_step, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.clock_operation_two_step, null)
          ptp_announce_interval                            = try(subint.ptp.announce_interval, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.announce_interval, null)
          ptp_announce_frequency                           = try(subint.ptp.announce_frequency, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.announce_frequency, null)
          ptp_announce_timeout                             = try(subint.ptp.announce_timeout, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.announce_timeout, null)
          ptp_announce_grant_duration                      = try(subint.ptp.announce_grant_duration, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.announce_grant_duration, null)
          ptp_sync_interval                                = try(subint.ptp.sync_interval, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.sync_interval, null)
          ptp_sync_frequency                               = try(subint.ptp.sync_frequency, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.sync_frequency, null)
          ptp_sync_grant_duration                          = try(subint.ptp.sync_grant_duration, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.sync_grant_duration, null)
          ptp_sync_timeout                                 = try(subint.ptp.sync_timeout, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.sync_timeout, null)
          ptp_delay_request_interval                       = try(subint.ptp.delay_request_interval, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.delay_request_interval, null)
          ptp_delay_request_frequency                      = try(subint.ptp.delay_request_frequency, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.delay_request_frequency, null)
          ptp_cos                                          = try(subint.ptp.cos, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.cos, null)
          ptp_cos_event                                    = try(subint.ptp.cos_event, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.cos_event, null)
          ptp_cos_general                                  = try(subint.ptp.cos_general, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.cos_general, null)
          ptp_dscp                                         = try(subint.ptp.dscp, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.dscp, null)
          ptp_dscp_event                                   = try(subint.ptp.dscp_event, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.dscp_event, null)
          ptp_dscp_general                                 = try(subint.ptp.dscp_general, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.dscp_general, null)
          ptp_ipv4_ttl                                     = try(subint.ptp.ipv4_ttl, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.ipv4_ttl, null)
          ptp_ipv6_hop_limit                               = try(subint.ptp.ipv6_hop_limit, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.ipv6_hop_limit, null)
          ptp_delay_asymmetry_value                        = try(subint.ptp.delay_asymmetry_value, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.delay_asymmetry_value, null)
          ptp_delay_asymmetry_unit_nanoseconds             = try(subint.ptp.delay_asymmetry_unit_nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.delay_asymmetry_unit_nanoseconds, null)
          ptp_delay_asymmetry_unit_microseconds            = try(subint.ptp.delay_asymmetry_unit_microseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.delay_asymmetry_unit_microseconds, null)
          ptp_delay_asymmetry_unit_milliseconds            = try(subint.ptp.delay_asymmetry_unit_milliseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.delay_asymmetry_unit_milliseconds, null)
          ptp_delay_response_grant_duration                = try(subint.ptp.delay_response_grant_duration, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.delay_response_grant_duration, null)
          ptp_delay_response_timeout                       = try(subint.ptp.delay_response_timeout, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.delay_response_timeout, null)
          ptp_unicast_grant_invalid_request_reduce         = try(subint.ptp.unicast_grant_invalid_request_reduce, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.unicast_grant_invalid_request_reduce, null)
          ptp_unicast_grant_invalid_request_deny           = try(subint.ptp.unicast_grant_invalid_request_deny, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.unicast_grant_invalid_request_deny, null)
          ptp_multicast                                    = try(subint.ptp.multicast, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.multicast, null)
          ptp_multicast_mixed                              = try(subint.ptp.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.multicast_mixed, null)
          ptp_multicast_disable                            = try(subint.ptp.multicast_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.multicast_disable, null)
          ptp_multicast_target_address_mac_forwardable     = try(subint.ptp.multicast_target_address_mac_forwardable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.multicast_target_address_mac_forwardable, null)
          ptp_multicast_target_address_mac_non_forwardable = try(subint.ptp.multicast_target_address_mac_non_forwardable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.multicast_target_address_mac_non_forwardable, null)
          ptp_port_state_slave_only                        = try(subint.ptp.port_state_slave_only, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.port_state_slave_only, null)
          ptp_port_state_master_only                       = try(subint.ptp.port_state_master_only, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.port_state_master_only, null)
          ptp_port_state_any                               = try(subint.ptp.port_state_any, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.port_state_any, null)
          ptp_source_ipv4_address                          = try(subint.ptp.source_ipv4_address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.source_ipv4_address, null)
          ptp_source_ipv4_address_disable                  = try(subint.ptp.source_ipv4_address_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.source_ipv4_address_disable, null)
          ptp_source_ipv6_address                          = try(subint.ptp.source_ipv6_address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.source_ipv6_address, null)
          ptp_source_ipv6_address_disable                  = try(subint.ptp.source_ipv6_address_disable, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.source_ipv6_address_disable, null)
          ptp_local_priority                               = try(subint.ptp.local_priority, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.local_priority, null)
          ptp_slave_ipv4s = try(length(subint.ptp.slave_ipv4s) == 0, true) ? null : [for slave in subint.ptp.slave_ipv4s : {
            address        = try(slave.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.slave_ipv4s.address, null)
            non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.slave_ipv4s.non_negotiated, null)
          }]
          ptp_slave_ipv6s = try(length(subint.ptp.slave_ipv6s) == 0, true) ? null : [for slave in subint.ptp.slave_ipv6s : {
            address        = try(slave.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.slave_ipv6s.address, null)
            non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.slave_ipv6s.non_negotiated, null)
          }]
          ptp_slave_ethernets = try(length(subint.ptp.slave_ethernets) == 0, true) ? null : [for slave in subint.ptp.slave_ethernets : {
            address        = try(slave.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.slave_ethernets.address, null)
            non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.slave_ethernets.non_negotiated, null)
          }]
          ptp_master_ipv4s = try(length(subint.ptp.master_ipv4s) == 0, true) ? null : [for master in subint.ptp.master_ipv4s : {
            address         = try(master.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv4s.address, null)
            priority        = try(master.priority, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv4s.priority, null)
            clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv4s.clock_class, null)
            multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv4s.multicast, null)
            multicast_mixed = try(master.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv4s.multicast_mixed, null)
            non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv4s.non_negotiated, null)
            delay_asymmetry = try(master.delay_asymmetry, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv4s.delay_asymmetry, null)
            nanoseconds     = try(master.nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv4s.nanoseconds, null)
            microseconds    = try(master.microseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv4s.microseconds, null)
            milliseconds    = try(master.milliseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv4s.milliseconds, null)
          }]
          ptp_master_ipv6s = try(length(subint.ptp.master_ipv6s) == 0, true) ? null : [for master in subint.ptp.master_ipv6s : {
            address         = try(master.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv6s.address, null)
            priority        = try(master.priority, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv6s.priority, null)
            clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv6s.clock_class, null)
            multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv6s.multicast, null)
            multicast_mixed = try(master.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv6s.multicast_mixed, null)
            non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv6s.non_negotiated, null)
            delay_asymmetry = try(master.delay_asymmetry, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv6s.delay_asymmetry, null)
            nanoseconds     = try(master.nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv6s.nanoseconds, null)
            microseconds    = try(master.microseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv6s.microseconds, null)
            milliseconds    = try(master.milliseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ipv6s.milliseconds, null)
          }]
          ptp_master_ethernets = try(length(subint.ptp.master_ethernets) == 0, true) ? null : [for master in subint.ptp.master_ethernets : {
            address         = try(master.address, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ethernets.address, null)
            priority        = try(master.priority, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ethernets.priority, null)
            clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ethernets.clock_class, null)
            multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ethernets.multicast, null)
            multicast_mixed = try(master.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ethernets.multicast_mixed, null)
            non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ethernets.non_negotiated, null)
            delay_asymmetry = try(master.delay_asymmetry, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ethernets.delay_asymmetry, null)
            nanoseconds     = try(master.nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ethernets.nanoseconds, null)
            microseconds    = try(master.microseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ethernets.microseconds, null)
            milliseconds    = try(master.milliseconds, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.master_ethernets.milliseconds, null)
          }]
          ptp_interop_profile_default                              = try(subint.ptp.interop_profile_default, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_profile_default, null)
          ptp_interop_profile_g_8265_1                             = try(subint.ptp.interop_profile_g_8265_1, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_profile_g_8265_1, null)
          ptp_interop_profile_g_8275_1                             = try(subint.ptp.interop_profile_g_8275_1, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_profile_g_8275_1, null)
          ptp_interop_profile_g_8275_2                             = try(subint.ptp.interop_profile_g_8275_2, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_profile_g_8275_2, null)
          ptp_interop_domain                                       = try(subint.ptp.interop_domain, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_domain, null)
          ptp_interop_egress_conversion_priority1                  = try(subint.ptp.interop_egress_conversion_priority1, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_egress_conversion_priority1, null)
          ptp_interop_egress_conversion_priority2                  = try(subint.ptp.interop_egress_conversion_priority2, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_egress_conversion_priority2, null)
          ptp_interop_egress_conversion_clock_accuracy             = try(subint.ptp.interop_egress_conversion_clock_accuracy, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_egress_conversion_clock_accuracy, null)
          ptp_interop_egress_conversion_offset_scaled_log_variance = try(subint.ptp.interop_egress_conversion_offset_scaled_log_variance, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_egress_conversion_offset_scaled_log_variance, null)
          ptp_interop_egress_conversion_clock_class_default        = try(subint.ptp.interop_egress_conversion_clock_class_default, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_egress_conversion_clock_class_default, null)
          ptp_interop_egress_conversion_clock_class_mappings = try(length(subint.ptp.interop_egress_conversion_clock_class_mappings) == 0, true) ? null : [for mapping in subint.ptp.interop_egress_conversion_clock_class_mappings : {
            clock_class_to_map_from = try(mapping.clock_class_to_map_from, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_egress_conversion_clock_class_mappings.clock_class_to_map_from, null)
            clock_class_to_map_to   = try(mapping.clock_class_to_map_to, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_egress_conversion_clock_class_mappings.clock_class_to_map_to, null)
          }]
          ptp_interop_ingress_conversion_priority1                  = try(subint.ptp.interop_ingress_conversion_priority1, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_ingress_conversion_priority1, null)
          ptp_interop_ingress_conversion_priority2                  = try(subint.ptp.interop_ingress_conversion_priority2, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_ingress_conversion_priority2, null)
          ptp_interop_ingress_conversion_clock_accuracy             = try(subint.ptp.interop_ingress_conversion_clock_accuracy, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_ingress_conversion_clock_accuracy, null)
          ptp_interop_ingress_conversion_offset_scaled_log_variance = try(subint.ptp.interop_ingress_conversion_offset_scaled_log_variance, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_ingress_conversion_offset_scaled_log_variance, null)
          ptp_interop_ingress_conversion_clock_class_default        = try(subint.ptp.interop_ingress_conversion_clock_class_default, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_ingress_conversion_clock_class_default, null)
          ptp_interop_ingress_conversion_clock_class_mappings = try(length(subint.ptp.interop_ingress_conversion_clock_class_mappings) == 0, true) ? null : [for mapping in subint.ptp.interop_ingress_conversion_clock_class_mappings : {
            clock_class_to_map_from = try(mapping.clock_class_to_map_from, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_ingress_conversion_clock_class_mappings.clock_class_to_map_from, null)
            clock_class_to_map_to   = try(mapping.clock_class_to_map_to, local.defaults.iosxr.devices.configuration.interfaces.bundle_ethernets.subinterfaces.ptp.interop_ingress_conversion_clock_class_mappings.clock_class_to_map_to, null)
          }]
        }
      ]
    ]
  ])
}

resource "iosxr_interface_bundle_ether_subinterface" "bundle_ether_subinterface" {
  for_each = { for subint in local.interfaces_bundle_ethernet_subinterfaces : subint.key => subint }
  device   = each.value.device

  name                                                      = each.value.id
  point_to_point                                            = each.value.point_to_point
  multipoint                                                = each.value.multipoint
  dampening                                                 = each.value.dampening
  dampening_decay_half_life                                 = each.value.dampening_decay_half_life
  dampening_reuse_threshold                                 = each.value.dampening_reuse_threshold
  dampening_suppress_threshold                              = each.value.dampening_suppress_threshold
  dampening_max_suppress_time                               = each.value.dampening_max_suppress_time
  service_policy_input                                      = each.value.service_policy_input
  service_policy_output                                     = each.value.service_policy_output
  encapsulation_dot1q_vlan_id                               = each.value.encapsulation_dot1q_vlan_id
  encapsulation_dot1q_second_dot1q                          = each.value.encapsulation_dot1q_second_dot1q
  l2transport_encapsulation_dot1q_vlan_id                   = each.value.l2transport_encapsulation_dot1q_vlan_id
  l2transport_encapsulation_dot1q_second_dot1q              = each.value.l2transport_encapsulation_dot1q_second_dot1q
  rewrite_ingress_tag_pop_one                               = each.value.rewrite_ingress_tag_pop_one
  rewrite_ingress_tag_pop_two                               = each.value.rewrite_ingress_tag_pop_two
  shutdown                                                  = each.value.shutdown
  mtu                                                       = each.value.mtu
  logging_events_link_status                                = each.value.logging_events_link_status
  bandwidth                                                 = each.value.bandwidth
  description                                               = each.value.description
  load_interval                                             = each.value.load_interval
  vrf                                                       = each.value.vrf
  ipv4_address                                              = each.value.ipv4_address
  ipv4_netmask                                              = each.value.ipv4_netmask
  ipv4_route_tag                                            = each.value.ipv4_route_tag
  ipv4_algorithm                                            = each.value.ipv4_algorithm
  ipv4_secondaries                                          = each.value.ipv4_secondaries
  ipv4_unnumbered                                           = each.value.ipv4_unnumbered
  ipv4_point_to_point                                       = each.value.ipv4_point_to_point
  ipv4_mtu                                                  = each.value.ipv4_mtu
  ipv4_redirects                                            = each.value.ipv4_redirects
  ipv4_mask_reply                                           = each.value.ipv4_mask_reply
  ipv4_helper_addresses                                     = each.value.ipv4_helper_addresses
  ipv4_unreachables_disable                                 = each.value.ipv4_unreachables_disable
  ipv4_tcp_mss_adjust                                       = each.value.ipv4_tcp_mss_adjust
  ipv4_forwarding_enable                                    = each.value.ipv4_forwarding_enable
  ipv4_ttl_propagate_disable                                = each.value.ipv4_ttl_propagate_disable
  ipv4_verify_unicast_source_reachable_via_type             = each.value.ipv4_verify_unicast_source_reachable_via_type
  ipv4_verify_unicast_source_reachable_via_allow_self_ping  = each.value.ipv4_verify_unicast_source_reachable_via_allow_self_ping
  ipv4_verify_unicast_source_reachable_via_allow_default    = each.value.ipv4_verify_unicast_source_reachable_via_allow_default
  ipv4_access_group_ingress_acl1                            = each.value.ipv4_access_group_ingress_acl1
  ipv4_access_group_ingress_hardware_count                  = each.value.ipv4_access_group_ingress_hardware_count
  ipv4_access_group_ingress_interface_statistics            = each.value.ipv4_access_group_ingress_interface_statistics
  ipv4_access_group_ingress_compress                        = each.value.ipv4_access_group_ingress_compress
  ipv4_access_group_egress_acl                              = each.value.ipv4_access_group_egress_acl
  ipv4_access_group_egress_hardware_count                   = each.value.ipv4_access_group_egress_hardware_count
  ipv4_access_group_egress_interface_statistics             = each.value.ipv4_access_group_egress_interface_statistics
  ipv4_access_group_egress_compress                         = each.value.ipv4_access_group_egress_compress
  ipv6_verify_unicast_source_reachable_via_type             = each.value.ipv6_verify_unicast_source_reachable_via_type
  ipv6_verify_unicast_source_reachable_via_allow_self_ping  = each.value.ipv6_verify_unicast_source_reachable_via_allow_self_ping
  ipv6_verify_unicast_source_reachable_via_allow_default    = each.value.ipv6_verify_unicast_source_reachable_via_allow_default
  ipv6_access_group_ingress_acl1                            = each.value.ipv6_access_group_ingress_acl1
  ipv6_access_group_ingress_interface_statistics            = each.value.ipv6_access_group_ingress_interface_statistics
  ipv6_access_group_ingress_compress                        = each.value.ipv6_access_group_ingress_compress
  ipv6_access_group_egress_acl                              = each.value.ipv6_access_group_egress_acl
  ipv6_access_group_egress_interface_statistics             = each.value.ipv6_access_group_egress_interface_statistics
  ipv6_access_group_egress_compress                         = each.value.ipv6_access_group_egress_compress
  ipv6_enable                                               = each.value.ipv6_enable
  ipv6_ttl_propagate_disable                                = each.value.ipv6_ttl_propagate_disable
  ipv6_addresses                                            = each.value.ipv6_addresses
  ipv6_link_local_address                                   = each.value.ipv6_link_local_address
  ipv6_link_local_zone                                      = each.value.ipv6_link_local_zone
  ipv6_link_local_route_tag                                 = each.value.ipv6_link_local_route_tag
  ipv6_eui64_addresses                                      = each.value.ipv6_eui64_addresses
  ipv6_autoconfig                                           = each.value.ipv6_autoconfig
  ipv6_dhcp                                                 = each.value.ipv6_dhcp
  ipv6_mtu                                                  = each.value.ipv6_mtu
  ipv6_unreachables_disable                                 = each.value.ipv6_unreachables_disable
  ipv6_tcp_mss_adjust                                       = each.value.ipv6_tcp_mss_adjust
  ipv6_nd_reachable_time                                    = each.value.ipv6_nd_reachable_time
  ipv6_nd_cache_limit                                       = each.value.ipv6_nd_cache_limit
  ipv6_nd_dad_attempts                                      = each.value.ipv6_nd_dad_attempts
  ipv6_nd_unicast_ra                                        = each.value.ipv6_nd_unicast_ra
  ipv6_nd_suppress_ra                                       = each.value.ipv6_nd_suppress_ra
  ipv6_nd_managed_config_flag                               = each.value.ipv6_nd_managed_config_flag
  ipv6_nd_other_config_flag                                 = each.value.ipv6_nd_other_config_flag
  ipv6_nd_ns_interval                                       = each.value.ipv6_nd_ns_interval
  ipv6_nd_ra_interval_max                                   = each.value.ipv6_nd_ra_interval_max
  ipv6_nd_ra_interval_min                                   = each.value.ipv6_nd_ra_interval_min
  ipv6_nd_ra_lifetime                                       = each.value.ipv6_nd_ra_lifetime
  ipv6_nd_redirects                                         = each.value.ipv6_nd_redirects
  ipv6_nd_prefix_default_no_adv                             = each.value.ipv6_nd_prefix_default_no_adv
  ipv6_nd_prefix_default_no_autoconfig                      = each.value.ipv6_nd_prefix_default_no_autoconfig
  ethernet_cfm_mep_domains                                  = each.value.ethernet_cfm_mep_domains
  ethernet_cfm_ais_transmission_up_interval                 = each.value.ethernet_cfm_ais_transmission_up_interval
  ethernet_cfm_ais_transmission_up_cos                      = each.value.ethernet_cfm_ais_transmission_up_cos
  ethernet_cfm_bandwidth_notifications_hold_off             = each.value.ethernet_cfm_bandwidth_notifications_hold_off
  ethernet_cfm_bandwidth_notifications_wait_to_restore      = each.value.ethernet_cfm_bandwidth_notifications_wait_to_restore
  ethernet_cfm_bandwidth_notifications_loss_threshold       = each.value.ethernet_cfm_bandwidth_notifications_loss_threshold
  ethernet_cfm_bandwidth_notifications_log_changes          = each.value.ethernet_cfm_bandwidth_notifications_log_changes
  flow_ipv4_ingress_monitors                                = each.value.flow_ipv4_ingress_monitors
  flow_ipv4_ingress_monitor_samplers                        = each.value.flow_ipv4_ingress_monitor_samplers
  flow_ipv4_egress_monitors                                 = each.value.flow_ipv4_egress_monitors
  flow_ipv4_egress_monitor_samplers                         = each.value.flow_ipv4_egress_monitor_samplers
  flow_ipv6_ingress_monitors                                = each.value.flow_ipv6_ingress_monitors
  flow_ipv6_ingress_monitor_samplers                        = each.value.flow_ipv6_ingress_monitor_samplers
  flow_ipv6_egress_monitors                                 = each.value.flow_ipv6_egress_monitors
  flow_ipv6_egress_monitor_samplers                         = each.value.flow_ipv6_egress_monitor_samplers
  arp_timeout                                               = each.value.arp_timeout
  arp_learning_disable                                      = each.value.arp_learning_disable
  arp_learning_local                                        = each.value.arp_learning_local
  arp_gratuitous_ignore                                     = each.value.arp_gratuitous_ignore
  arp_cache_limit                                           = each.value.arp_cache_limit
  proxy_arp                                                 = each.value.proxy_arp
  mpls_mtu                                                  = each.value.mpls_mtu
  lldp                                                      = each.value.lldp
  lldp_transmit_disable                                     = each.value.lldp_transmit_disable
  lldp_receive_disable                                      = each.value.lldp_receive_disable
  ptp                                                       = each.value.ptp
  ptp_profile                                               = each.value.ptp_profile
  ptp_transport_ipv4                                        = each.value.ptp_transport_ipv4
  ptp_transport_ethernet                                    = each.value.ptp_transport_ethernet
  ptp_transport_ipv6                                        = each.value.ptp_transport_ipv6
  ptp_clock_operation_one_step                              = each.value.ptp_clock_operation_one_step
  ptp_clock_operation_two_step                              = each.value.ptp_clock_operation_two_step
  ptp_announce_interval                                     = each.value.ptp_announce_interval
  ptp_announce_frequency                                    = each.value.ptp_announce_frequency
  ptp_announce_timeout                                      = each.value.ptp_announce_timeout
  ptp_announce_grant_duration                               = each.value.ptp_announce_grant_duration
  ptp_sync_interval                                         = each.value.ptp_sync_interval
  ptp_sync_frequency                                        = each.value.ptp_sync_frequency
  ptp_sync_grant_duration                                   = each.value.ptp_sync_grant_duration
  ptp_sync_timeout                                          = each.value.ptp_sync_timeout
  ptp_delay_request_interval                                = each.value.ptp_delay_request_interval
  ptp_delay_request_frequency                               = each.value.ptp_delay_request_frequency
  ptp_cos                                                   = each.value.ptp_cos
  ptp_cos_event                                             = each.value.ptp_cos_event
  ptp_cos_general                                           = each.value.ptp_cos_general
  ptp_dscp                                                  = each.value.ptp_dscp
  ptp_dscp_event                                            = each.value.ptp_dscp_event
  ptp_dscp_general                                          = each.value.ptp_dscp_general
  ptp_ipv4_ttl                                              = each.value.ptp_ipv4_ttl
  ptp_ipv6_hop_limit                                        = each.value.ptp_ipv6_hop_limit
  ptp_delay_asymmetry_value                                 = each.value.ptp_delay_asymmetry_value
  ptp_delay_asymmetry_unit_nanoseconds                      = each.value.ptp_delay_asymmetry_unit_nanoseconds
  ptp_delay_asymmetry_unit_microseconds                     = each.value.ptp_delay_asymmetry_unit_microseconds
  ptp_delay_asymmetry_unit_milliseconds                     = each.value.ptp_delay_asymmetry_unit_milliseconds
  ptp_delay_response_grant_duration                         = each.value.ptp_delay_response_grant_duration
  ptp_delay_response_timeout                                = each.value.ptp_delay_response_timeout
  ptp_unicast_grant_invalid_request_reduce                  = each.value.ptp_unicast_grant_invalid_request_reduce
  ptp_unicast_grant_invalid_request_deny                    = each.value.ptp_unicast_grant_invalid_request_deny
  ptp_multicast                                             = each.value.ptp_multicast
  ptp_multicast_mixed                                       = each.value.ptp_multicast_mixed
  ptp_multicast_disable                                     = each.value.ptp_multicast_disable
  ptp_multicast_target_address_mac_forwardable              = each.value.ptp_multicast_target_address_mac_forwardable
  ptp_multicast_target_address_mac_non_forwardable          = each.value.ptp_multicast_target_address_mac_non_forwardable
  ptp_port_state_slave_only                                 = each.value.ptp_port_state_slave_only
  ptp_port_state_master_only                                = each.value.ptp_port_state_master_only
  ptp_port_state_any                                        = each.value.ptp_port_state_any
  ptp_source_ipv4_address                                   = each.value.ptp_source_ipv4_address
  ptp_source_ipv4_address_disable                           = each.value.ptp_source_ipv4_address_disable
  ptp_source_ipv6_address                                   = each.value.ptp_source_ipv6_address
  ptp_source_ipv6_address_disable                           = each.value.ptp_source_ipv6_address_disable
  ptp_local_priority                                        = each.value.ptp_local_priority
  ptp_slave_ipv4s                                           = each.value.ptp_slave_ipv4s
  ptp_slave_ipv6s                                           = each.value.ptp_slave_ipv6s
  ptp_slave_ethernets                                       = each.value.ptp_slave_ethernets
  ptp_master_ipv4s                                          = each.value.ptp_master_ipv4s
  ptp_master_ipv6s                                          = each.value.ptp_master_ipv6s
  ptp_master_ethernets                                      = each.value.ptp_master_ethernets
  ptp_interop_profile_default                               = each.value.ptp_interop_profile_default
  ptp_interop_profile_g_8265_1                              = each.value.ptp_interop_profile_g_8265_1
  ptp_interop_profile_g_8275_1                              = each.value.ptp_interop_profile_g_8275_1
  ptp_interop_profile_g_8275_2                              = each.value.ptp_interop_profile_g_8275_2
  ptp_interop_domain                                        = each.value.ptp_interop_domain
  ptp_interop_egress_conversion_priority1                   = each.value.ptp_interop_egress_conversion_priority1
  ptp_interop_egress_conversion_priority2                   = each.value.ptp_interop_egress_conversion_priority2
  ptp_interop_egress_conversion_clock_accuracy              = each.value.ptp_interop_egress_conversion_clock_accuracy
  ptp_interop_egress_conversion_offset_scaled_log_variance  = each.value.ptp_interop_egress_conversion_offset_scaled_log_variance
  ptp_interop_egress_conversion_clock_class_default         = each.value.ptp_interop_egress_conversion_clock_class_default
  ptp_interop_egress_conversion_clock_class_mappings        = each.value.ptp_interop_egress_conversion_clock_class_mappings
  ptp_interop_ingress_conversion_priority1                  = each.value.ptp_interop_ingress_conversion_priority1
  ptp_interop_ingress_conversion_priority2                  = each.value.ptp_interop_ingress_conversion_priority2
  ptp_interop_ingress_conversion_clock_accuracy             = each.value.ptp_interop_ingress_conversion_clock_accuracy
  ptp_interop_ingress_conversion_offset_scaled_log_variance = each.value.ptp_interop_ingress_conversion_offset_scaled_log_variance
  ptp_interop_ingress_conversion_clock_class_default        = each.value.ptp_interop_ingress_conversion_clock_class_default
  ptp_interop_ingress_conversion_clock_class_mappings       = each.value.ptp_interop_ingress_conversion_clock_class_mappings

  lifecycle {
    precondition {
      condition     = (each.value.ipv4_address == null && each.value.ipv4_netmask == null) || (each.value.ipv4_address != null && each.value.ipv4_netmask != null)
      error_message = "Interface ${each.key}: ipv4_address and ipv4_netmask must both be specified or both be omitted."
    }
  }

  depends_on = [
    # Future dependencies - uncomment when resource is created:
    #iosxr_vrf.vrf,
    iosxr_interface_bundle_ether.bundle_ether
    #iosxr_ipv4_access_list.ipv4_access_list,
    #iosxr_ipv6_access_list.ipv6_access_list,
  ]
}

##### BVIS #####

locals {
  interfaces_bvis = flatten([
    for device in local.devices : [
      for bvi in try(local.device_config[device.name].interfaces.bvis, []) : {
        key                          = format("%s/BVI%s", device.name, trimprefix(bvi.id, "$string "))
        device                       = device.name
        id                           = trimprefix(bvi.id, "$string ")
        point_to_point               = try(bvi.point_to_point, local.defaults.iosxr.devices.configuration.interfaces.bvis.point_to_point, null)
        multipoint                   = try(bvi.multipoint, local.defaults.iosxr.devices.configuration.interfaces.bvis.multipoint, null)
        dampening                    = try(bvi.dampening, local.defaults.iosxr.devices.configuration.interfaces.bvis.dampening, null)
        dampening_decay_half_life    = try(bvi.dampening_decay_half_life, local.defaults.iosxr.devices.configuration.interfaces.bvis.dampening_decay_half_life, null)
        dampening_reuse_threshold    = try(bvi.dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.interfaces.bvis.dampening_reuse_threshold, null)
        dampening_suppress_threshold = try(bvi.dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.interfaces.bvis.dampening_suppress_threshold, null)
        dampening_max_suppress_time  = try(bvi.dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.interfaces.bvis.dampening_max_suppress_time, null)
        service_policy_input = try(length(bvi.service_policy_input) == 0, true) ? null : [for service_policy in bvi.service_policy_input : {
          name = try(service_policy.name, local.defaults.iosxr.devices.configuration.interfaces.bvis.service_policy_input.name, null)
        }]
        service_policy_output = try(length(bvi.service_policy_output) == 0, true) ? null : [for service_policy in bvi.service_policy_output : {
          name = try(service_policy.name, local.defaults.iosxr.devices.configuration.interfaces.bvis.service_policy_output.name, null)
        }]
        shutdown                   = try(bvi.shutdown, local.defaults.iosxr.devices.configuration.interfaces.bvis.shutdown, null)
        mtu                        = try(bvi.mtu, local.defaults.iosxr.devices.configuration.interfaces.bvis.mtu, null)
        logging_events_link_status = try(bvi.logging_events_link_status, local.defaults.iosxr.devices.configuration.interfaces.bvis.logging_events_link_status, null)
        bandwidth                  = try(bvi.bandwidth, local.defaults.iosxr.devices.configuration.interfaces.bvis.bandwidth, null)
        description                = try(bvi.description, local.defaults.iosxr.devices.configuration.interfaces.bvis.description, null)
        load_interval              = try(bvi.load_interval, local.defaults.iosxr.devices.configuration.interfaces.bvis.load_interval, null)
        vrf                        = try(bvi.vrf, local.defaults.iosxr.devices.configuration.interfaces.bvis.vrf, null)
        ipv4_address               = try(bvi.ipv4.address, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.address, null)
        ipv4_netmask               = try(bvi.ipv4.netmask, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.netmask, null)
        ipv4_route_tag             = try(bvi.ipv4.route_tag, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.route_tag, null)
        ipv4_algorithm             = try(bvi.ipv4.algorithm, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.algorithm, null)
        ipv4_secondaries = try(length(bvi.ipv4.secondaries) == 0, true) ? null : [for secondary in bvi.ipv4.secondaries : {
          address   = try(secondary.address, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.secondaries.address, null)
          netmask   = try(secondary.netmask, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.secondaries.netmask, null)
          route_tag = try(secondary.route_tag, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.secondaries.route_tag, null)
          algorithm = try(secondary.algorithm, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.secondaries.algorithm, null)
        }]
        ipv4_unnumbered     = try(bvi.ipv4.unnumbered, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.unnumbered, null)
        ipv4_point_to_point = try(bvi.ipv4.point_to_point, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.point_to_point, null)
        ipv4_mtu            = try(bvi.ipv4.mtu, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.mtu, null)
        ipv4_redirects      = try(bvi.ipv4.redirects, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.redirects, null)
        ipv4_mask_reply     = try(bvi.ipv4.mask_reply, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.mask_reply, null)
        ipv4_helper_addresses = try(length(bvi.ipv4.helper_addresses) == 0, true) ? null : [for helper in bvi.ipv4.helper_addresses : {
          address = try(helper.address, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.helper_addresses.address, null)
          vrf     = try(helper.vrf, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.helper_addresses.vrf, null)
        }]
        ipv4_unreachables_disable                                = try(bvi.ipv4.unreachables_disable, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.unreachables_disable, null)
        ipv4_tcp_mss_adjust                                      = try(bvi.ipv4.tcp_mss_adjust, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.tcp_mss_adjust, null)
        ipv4_forwarding_enable                                   = try(bvi.ipv4.forwarding_enable, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.forwarding_enable, null)
        ipv4_ttl_propagate_disable                               = try(bvi.ipv4.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.ttl_propagate_disable, null)
        ipv4_verify_unicast_source_reachable_via_type            = try(bvi.ipv4.verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.verify_unicast_source_reachable_via_type, null)
        ipv4_verify_unicast_source_reachable_via_allow_self_ping = try(bvi.ipv4.verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.verify_unicast_source_reachable_via_allow_self_ping, can(bvi.ipv4.verify_unicast_source_reachable_via_type) ? false : null)
        ipv4_verify_unicast_source_reachable_via_allow_default   = try(bvi.ipv4.verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.verify_unicast_source_reachable_via_allow_default, can(bvi.ipv4.verify_unicast_source_reachable_via_type) ? false : null)
        ipv4_access_group_ingress_acl1                           = try(bvi.ipv4.access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.access_group_ingress_acl1, null)
        ipv4_access_group_ingress_hardware_count                 = try(bvi.ipv4.access_group_ingress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.access_group_ingress_hardware_count, null)
        ipv4_access_group_ingress_interface_statistics           = try(bvi.ipv4.access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.access_group_ingress_interface_statistics, null)
        ipv4_access_group_ingress_compress                       = try(bvi.ipv4.access_group_ingress_compress, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.access_group_ingress_compress, null)
        ipv4_access_group_egress_acl                             = try(bvi.ipv4.access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.access_group_egress_acl, null)
        ipv4_access_group_egress_hardware_count                  = try(bvi.ipv4.access_group_egress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.access_group_egress_hardware_count, null)
        ipv4_access_group_egress_interface_statistics            = try(bvi.ipv4.access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.access_group_egress_interface_statistics, null)
        ipv4_access_group_egress_compress                        = try(bvi.ipv4.access_group_egress_compress, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv4.access_group_egress_compress, null)
        ipv6_verify_unicast_source_reachable_via_type            = try(bvi.ipv6.verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.verify_unicast_source_reachable_via_type, null)
        ipv6_verify_unicast_source_reachable_via_allow_self_ping = try(bvi.ipv6.verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.verify_unicast_source_reachable_via_allow_self_ping, can(bvi.ipv6.verify_unicast_source_reachable_via_type) ? false : null)
        ipv6_verify_unicast_source_reachable_via_allow_default   = try(bvi.ipv6.verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.verify_unicast_source_reachable_via_allow_default, can(bvi.ipv6.verify_unicast_source_reachable_via_type) ? false : null)
        ipv6_access_group_ingress_acl1                           = try(bvi.ipv6.access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.access_group_ingress_acl1, null)
        ipv6_access_group_ingress_interface_statistics           = try(bvi.ipv6.access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.access_group_ingress_interface_statistics, null)
        ipv6_access_group_ingress_compress                       = try(bvi.ipv6.access_group_ingress_compress, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.access_group_ingress_compress, null)
        ipv6_access_group_egress_acl                             = try(bvi.ipv6.access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.access_group_egress_acl, null)
        ipv6_access_group_egress_interface_statistics            = try(bvi.ipv6.access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.access_group_egress_interface_statistics, null)
        ipv6_access_group_egress_compress                        = try(bvi.ipv6.access_group_egress_compress, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.access_group_egress_compress, null)
        ipv6_enable                                              = try(bvi.ipv6.enable, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.enable, null)
        ipv6_ttl_propagate_disable                               = try(bvi.ipv6.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.ttl_propagate_disable, null)
        ipv6_addresses = try(length(bvi.ipv6.addresses) == 0, true) ? null : [for ipv6_address in bvi.ipv6.addresses : {
          address       = try(ipv6_address.address, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.addresses.address, null)
          prefix_length = try(ipv6_address.prefix_length, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.addresses.prefix_length, null)
          zone          = try(ipv6_address.zone, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.addresses.zone, null)
          route_tag     = try(ipv6_address.route_tag, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.addresses.route_tag, null)
          algorithm     = try(ipv6_address.algorithm, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.addresses.algorithm, null)
        }]
        ipv6_link_local_address   = try(bvi.ipv6.link_local_address, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.link_local_address, null)
        ipv6_link_local_zone      = try(bvi.ipv6.link_local_zone, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.link_local_zone, can(bvi.ipv6.link_local_address) ? 0 : null)
        ipv6_link_local_route_tag = try(bvi.ipv6.link_local_route_tag, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.link_local_route_tag, null)
        ipv6_eui64_addresses = try(length(bvi.ipv6.eui64_addresses) == 0, true) ? null : [for eui64 in bvi.ipv6.eui64_addresses : {
          address       = try(eui64.address, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.eui64_addresses.address, null)
          prefix_length = try(eui64.prefix_length, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.eui64_addresses.prefix_length, null)
          zone          = try(eui64.zone, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.eui64_addresses.zone, null)
          route_tag     = try(eui64.route_tag, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.eui64_addresses.route_tag, null)
          algorithm     = try(eui64.algorithm, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.eui64_addresses.algorithm, null)
        }]
        ipv6_autoconfig                                  = try(bvi.ipv6.autoconfig, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.autoconfig, null)
        ipv6_dhcp                                        = try(bvi.ipv6.dhcp, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.dhcp, null)
        ipv6_mtu                                         = try(bvi.ipv6.mtu, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.mtu, null)
        ipv6_unreachables_disable                        = try(bvi.ipv6.unreachables_disable, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.unreachables_disable, null)
        ipv6_tcp_mss_adjust                              = try(bvi.ipv6.tcp_mss_adjust, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.tcp_mss_adjust, null)
        ipv6_nd_reachable_time                           = try(bvi.ipv6.nd_reachable_time, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.nd_reachable_time, null)
        ipv6_nd_cache_limit                              = try(bvi.ipv6.nd_cache_limit, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.nd_cache_limit, null)
        ipv6_nd_dad_attempts                             = try(bvi.ipv6.nd_dad_attempts, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.nd_dad_attempts, null)
        ipv6_nd_unicast_ra                               = try(bvi.ipv6.nd_unicast_ra, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.nd_unicast_ra, null)
        ipv6_nd_suppress_ra                              = try(bvi.ipv6.nd_suppress_ra, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.nd_suppress_ra, null)
        ipv6_nd_managed_config_flag                      = try(bvi.ipv6.nd_managed_config_flag, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.nd_managed_config_flag, null)
        ipv6_nd_other_config_flag                        = try(bvi.ipv6.nd_other_config_flag, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.nd_other_config_flag, null)
        ipv6_nd_ns_interval                              = try(bvi.ipv6.nd_ns_interval, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.nd_ns_interval, null)
        ipv6_nd_ra_interval_max                          = try(bvi.ipv6.nd_ra_interval_max, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.nd_ra_interval_max, null)
        ipv6_nd_ra_interval_min                          = try(bvi.ipv6.nd_ra_interval_min, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.nd_ra_interval_min, null)
        ipv6_nd_ra_lifetime                              = try(bvi.ipv6.nd_ra_lifetime, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.nd_ra_lifetime, null)
        ipv6_nd_redirects                                = try(bvi.ipv6.nd_redirects, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.nd_redirects, null)
        ipv6_nd_prefix_default_no_adv                    = try(bvi.ipv6.nd_prefix_default_no_adv, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.nd_prefix_default_no_adv, null)
        ipv6_nd_prefix_default_no_autoconfig             = try(bvi.ipv6.nd_prefix_default_no_autoconfig, local.defaults.iosxr.devices.configuration.interfaces.bvis.ipv6.nd_prefix_default_no_autoconfig, null)
        arp_timeout                                      = try(bvi.arp_timeout, local.defaults.iosxr.devices.configuration.interfaces.bvis.arp_timeout, null)
        arp_learning_disable                             = try(bvi.arp_learning_disable, local.defaults.iosxr.devices.configuration.interfaces.bvis.arp_learning_disable, null)
        arp_learning_local                               = try(bvi.arp_learning_local, local.defaults.iosxr.devices.configuration.interfaces.bvis.arp_learning_local, null)
        arp_gratuitous_ignore                            = try(bvi.arp_gratuitous_ignore, local.defaults.iosxr.devices.configuration.interfaces.bvis.arp_gratuitous_ignore, null)
        arp_cache_limit                                  = try(bvi.arp_cache_limit, local.defaults.iosxr.devices.configuration.interfaces.bvis.arp_cache_limit, null)
        proxy_arp                                        = try(bvi.proxy_arp, local.defaults.iosxr.devices.configuration.interfaces.bvis.proxy_arp, null)
        host_routing                                     = try(bvi.host_routing, local.defaults.iosxr.devices.configuration.interfaces.bvis.host_routing, null)
        mac_address                                      = try(bvi.mac_address, local.defaults.iosxr.devices.configuration.interfaces.bvis.mac_address, null)
        ptp                                              = try(bvi.ptp.enable, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.enable, null)
        ptp_profile                                      = try(bvi.ptp.profile, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.profile, null)
        ptp_transport_ipv4                               = try(bvi.ptp.transport_ipv4, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.transport_ipv4, null)
        ptp_transport_ethernet                           = try(bvi.ptp.transport_ethernet, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.transport_ethernet, null)
        ptp_transport_ipv6                               = try(bvi.ptp.transport_ipv6, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.transport_ipv6, null)
        ptp_clock_operation_one_step                     = try(bvi.ptp.clock_operation_one_step, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.clock_operation_one_step, null)
        ptp_clock_operation_two_step                     = try(bvi.ptp.clock_operation_two_step, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.clock_operation_two_step, null)
        ptp_announce_interval                            = try(bvi.ptp.announce_interval, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.announce_interval, null)
        ptp_announce_frequency                           = try(bvi.ptp.announce_frequency, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.announce_frequency, null)
        ptp_announce_timeout                             = try(bvi.ptp.announce_timeout, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.announce_timeout, null)
        ptp_announce_grant_duration                      = try(bvi.ptp.announce_grant_duration, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.announce_grant_duration, null)
        ptp_sync_interval                                = try(bvi.ptp.sync_interval, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.sync_interval, null)
        ptp_sync_frequency                               = try(bvi.ptp.sync_frequency, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.sync_frequency, null)
        ptp_sync_grant_duration                          = try(bvi.ptp.sync_grant_duration, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.sync_grant_duration, null)
        ptp_sync_timeout                                 = try(bvi.ptp.sync_timeout, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.sync_timeout, null)
        ptp_delay_request_interval                       = try(bvi.ptp.delay_request_interval, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.delay_request_interval, null)
        ptp_delay_request_frequency                      = try(bvi.ptp.delay_request_frequency, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.delay_request_frequency, null)
        ptp_cos                                          = try(bvi.ptp.cos, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.cos, null)
        ptp_cos_event                                    = try(bvi.ptp.cos_event, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.cos_event, null)
        ptp_cos_general                                  = try(bvi.ptp.cos_general, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.cos_general, null)
        ptp_dscp                                         = try(bvi.ptp.dscp, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.dscp, null)
        ptp_dscp_event                                   = try(bvi.ptp.dscp_event, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.dscp_event, null)
        ptp_dscp_general                                 = try(bvi.ptp.dscp_general, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.dscp_general, null)
        ptp_ipv4_ttl                                     = try(bvi.ptp.ipv4_ttl, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.ipv4_ttl, null)
        ptp_ipv6_hop_limit                               = try(bvi.ptp.ipv6_hop_limit, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.ipv6_hop_limit, null)
        ptp_delay_asymmetry_value                        = try(bvi.ptp.delay_asymmetry_value, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.delay_asymmetry_value, null)
        ptp_delay_asymmetry_unit_nanoseconds             = try(bvi.ptp.delay_asymmetry_unit_nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.delay_asymmetry_unit_nanoseconds, null)
        ptp_delay_asymmetry_unit_microseconds            = try(bvi.ptp.delay_asymmetry_unit_microseconds, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.delay_asymmetry_unit_microseconds, null)
        ptp_delay_asymmetry_unit_milliseconds            = try(bvi.ptp.delay_asymmetry_unit_milliseconds, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.delay_asymmetry_unit_milliseconds, null)
        ptp_delay_response_grant_duration                = try(bvi.ptp.delay_response_grant_duration, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.delay_response_grant_duration, null)
        ptp_delay_response_timeout                       = try(bvi.ptp.delay_response_timeout, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.delay_response_timeout, null)
        ptp_unicast_grant_invalid_request_reduce         = try(bvi.ptp.unicast_grant_invalid_request_reduce, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.unicast_grant_invalid_request_reduce, null)
        ptp_unicast_grant_invalid_request_deny           = try(bvi.ptp.unicast_grant_invalid_request_deny, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.unicast_grant_invalid_request_deny, null)
        ptp_multicast                                    = try(bvi.ptp.multicast, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.multicast, null)
        ptp_multicast_mixed                              = try(bvi.ptp.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.multicast_mixed, null)
        ptp_multicast_disable                            = try(bvi.ptp.multicast_disable, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.multicast_disable, null)
        ptp_multicast_target_address_mac_forwardable     = try(bvi.ptp.multicast_target_address_mac_forwardable, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.multicast_target_address_mac_forwardable, null)
        ptp_multicast_target_address_mac_non_forwardable = try(bvi.ptp.multicast_target_address_mac_non_forwardable, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.multicast_target_address_mac_non_forwardable, null)
        ptp_port_state_slave_only                        = try(bvi.ptp.port_state_slave_only, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.port_state_slave_only, null)
        ptp_port_state_master_only                       = try(bvi.ptp.port_state_master_only, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.port_state_master_only, null)
        ptp_port_state_any                               = try(bvi.ptp.port_state_any, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.port_state_any, null)
        ptp_source_ipv4_address                          = try(bvi.ptp.source_ipv4_address, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.source_ipv4_address, null)
        ptp_source_ipv4_address_disable                  = try(bvi.ptp.source_ipv4_address_disable, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.source_ipv4_address_disable, null)
        ptp_source_ipv6_address                          = try(bvi.ptp.source_ipv6_address, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.source_ipv6_address, null)
        ptp_source_ipv6_address_disable                  = try(bvi.ptp.source_ipv6_address_disable, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.source_ipv6_address_disable, null)
        ptp_local_priority                               = try(bvi.ptp.local_priority, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.local_priority, null)
        ptp_slave_ipv4s = try(length(bvi.ptp.slave_ipv4s) == 0, true) ? null : [for slave in bvi.ptp.slave_ipv4s : {
          address        = try(slave.address, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.slave_ipv4s.address, null)
          non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.slave_ipv4s.non_negotiated, null)
        }]
        ptp_slave_ipv6s = try(length(bvi.ptp.slave_ipv6s) == 0, true) ? null : [for slave in bvi.ptp.slave_ipv6s : {
          address        = try(slave.address, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.slave_ipv6s.address, null)
          non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.slave_ipv6s.non_negotiated, null)
        }]
        ptp_slave_ethernets = try(length(bvi.ptp.slave_ethernets) == 0, true) ? null : [for slave in bvi.ptp.slave_ethernets : {
          address        = try(slave.address, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.slave_ethernets.address, null)
          non_negotiated = try(slave.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.slave_ethernets.non_negotiated, null)
        }]
        ptp_master_ipv4s = try(length(bvi.ptp.master_ipv4s) == 0, true) ? null : [for master in bvi.ptp.master_ipv4s : {
          address         = try(master.address, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv4s.address, null)
          priority        = try(master.priority, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv4s.priority, null)
          clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv4s.clock_class, null)
          multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv4s.multicast, null)
          multicast_mixed = try(master.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv4s.multicast_mixed, null)
          non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv4s.non_negotiated, null)
          delay_asymmetry = try(master.delay_asymmetry, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv4s.delay_asymmetry, null)
          nanoseconds     = try(master.nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv4s.nanoseconds, null)
          microseconds    = try(master.microseconds, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv4s.microseconds, null)
          milliseconds    = try(master.milliseconds, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv4s.milliseconds, null)
        }]
        ptp_master_ipv6s = try(length(bvi.ptp.master_ipv6s) == 0, true) ? null : [for master in bvi.ptp.master_ipv6s : {
          address         = try(master.address, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv6s.address, null)
          priority        = try(master.priority, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv6s.priority, null)
          clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv6s.clock_class, null)
          multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv6s.multicast, null)
          multicast_mixed = try(master.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv6s.multicast_mixed, null)
          non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv6s.non_negotiated, null)
          delay_asymmetry = try(master.delay_asymmetry, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv6s.delay_asymmetry, null)
          nanoseconds     = try(master.nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv6s.nanoseconds, null)
          microseconds    = try(master.microseconds, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv6s.microseconds, null)
          milliseconds    = try(master.milliseconds, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ipv6s.milliseconds, null)
        }]
        ptp_master_ethernets = try(length(bvi.ptp.master_ethernets) == 0, true) ? null : [for master in bvi.ptp.master_ethernets : {
          address         = try(master.address, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ethernets.address, null)
          priority        = try(master.priority, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ethernets.priority, null)
          clock_class     = try(master.clock_class, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ethernets.clock_class, null)
          multicast       = try(master.multicast, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ethernets.multicast, null)
          multicast_mixed = try(master.multicast_mixed, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ethernets.multicast_mixed, null)
          non_negotiated  = try(master.non_negotiated, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ethernets.non_negotiated, null)
          delay_asymmetry = try(master.delay_asymmetry, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ethernets.delay_asymmetry, null)
          nanoseconds     = try(master.nanoseconds, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ethernets.nanoseconds, null)
          microseconds    = try(master.microseconds, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ethernets.microseconds, null)
          milliseconds    = try(master.milliseconds, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.master_ethernets.milliseconds, null)
        }]
        ptp_interop_profile_default                              = try(bvi.ptp.interop_profile_default, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_profile_default, null)
        ptp_interop_profile_g_8265_1                             = try(bvi.ptp.interop_profile_g_8265_1, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_profile_g_8265_1, null)
        ptp_interop_profile_g_8275_1                             = try(bvi.ptp.interop_profile_g_8275_1, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_profile_g_8275_1, null)
        ptp_interop_profile_g_8275_2                             = try(bvi.ptp.interop_profile_g_8275_2, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_profile_g_8275_2, null)
        ptp_interop_domain                                       = try(bvi.ptp.interop_domain, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_domain, null)
        ptp_interop_egress_conversion_priority1                  = try(bvi.ptp.interop_egress_conversion_priority1, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_egress_conversion_priority1, null)
        ptp_interop_egress_conversion_priority2                  = try(bvi.ptp.interop_egress_conversion_priority2, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_egress_conversion_priority2, null)
        ptp_interop_egress_conversion_clock_accuracy             = try(bvi.ptp.interop_egress_conversion_clock_accuracy, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_egress_conversion_clock_accuracy, null)
        ptp_interop_egress_conversion_offset_scaled_log_variance = try(bvi.ptp.interop_egress_conversion_offset_scaled_log_variance, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_egress_conversion_offset_scaled_log_variance, null)
        ptp_interop_egress_conversion_clock_class_default        = try(bvi.ptp.interop_egress_conversion_clock_class_default, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_egress_conversion_clock_class_default, null)
        ptp_interop_egress_conversion_clock_class_mappings = try(length(bvi.ptp.interop_egress_conversion_clock_class_mappings) == 0, true) ? null : [for mapping in bvi.ptp.interop_egress_conversion_clock_class_mappings : {
          clock_class_to_map_from = try(mapping.clock_class_to_map_from, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_egress_conversion_clock_class_mappings.clock_class_to_map_from, null)
          clock_class_to_map_to   = try(mapping.clock_class_to_map_to, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_egress_conversion_clock_class_mappings.clock_class_to_map_to, null)
        }]
        ptp_interop_ingress_conversion_priority1                  = try(bvi.ptp.interop_ingress_conversion_priority1, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_ingress_conversion_priority1, null)
        ptp_interop_ingress_conversion_priority2                  = try(bvi.ptp.interop_ingress_conversion_priority2, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_ingress_conversion_priority2, null)
        ptp_interop_ingress_conversion_clock_accuracy             = try(bvi.ptp.interop_ingress_conversion_clock_accuracy, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_ingress_conversion_clock_accuracy, null)
        ptp_interop_ingress_conversion_offset_scaled_log_variance = try(bvi.ptp.interop_ingress_conversion_offset_scaled_log_variance, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_ingress_conversion_offset_scaled_log_variance, null)
        ptp_interop_ingress_conversion_clock_class_default        = try(bvi.ptp.interop_ingress_conversion_clock_class_default, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_ingress_conversion_clock_class_default, null)
        ptp_interop_ingress_conversion_clock_class_mappings = try(length(bvi.ptp.interop_ingress_conversion_clock_class_mappings) == 0, true) ? null : [for mapping in bvi.ptp.interop_ingress_conversion_clock_class_mappings : {
          clock_class_to_map_from = try(mapping.clock_class_to_map_from, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_ingress_conversion_clock_class_mappings.clock_class_to_map_from, null)
          clock_class_to_map_to   = try(mapping.clock_class_to_map_to, local.defaults.iosxr.devices.configuration.interfaces.bvis.ptp.interop_ingress_conversion_clock_class_mappings.clock_class_to_map_to, null)
        }]
      }
    ]
  ])
}

resource "iosxr_interface_bvi" "bvi" {
  for_each = { for bvi in local.interfaces_bvis : bvi.key => bvi }
  device   = each.value.device

  name                                                      = each.value.id
  point_to_point                                            = each.value.point_to_point
  multipoint                                                = each.value.multipoint
  dampening                                                 = each.value.dampening
  dampening_decay_half_life                                 = each.value.dampening_decay_half_life
  dampening_reuse_threshold                                 = each.value.dampening_reuse_threshold
  dampening_suppress_threshold                              = each.value.dampening_suppress_threshold
  dampening_max_suppress_time                               = each.value.dampening_max_suppress_time
  service_policy_input                                      = each.value.service_policy_input
  service_policy_output                                     = each.value.service_policy_output
  shutdown                                                  = each.value.shutdown
  mtu                                                       = each.value.mtu
  logging_events_link_status                                = each.value.logging_events_link_status
  bandwidth                                                 = each.value.bandwidth
  description                                               = each.value.description
  load_interval                                             = each.value.load_interval
  vrf                                                       = each.value.vrf
  ipv4_address                                              = each.value.ipv4_address
  ipv4_netmask                                              = each.value.ipv4_netmask
  ipv4_route_tag                                            = each.value.ipv4_route_tag
  ipv4_algorithm                                            = each.value.ipv4_algorithm
  ipv4_secondaries                                          = each.value.ipv4_secondaries
  ipv4_unnumbered                                           = each.value.ipv4_unnumbered
  ipv4_point_to_point                                       = each.value.ipv4_point_to_point
  ipv4_mtu                                                  = each.value.ipv4_mtu
  ipv4_redirects                                            = each.value.ipv4_redirects
  ipv4_mask_reply                                           = each.value.ipv4_mask_reply
  ipv4_helper_addresses                                     = each.value.ipv4_helper_addresses
  ipv4_unreachables_disable                                 = each.value.ipv4_unreachables_disable
  ipv4_tcp_mss_adjust                                       = each.value.ipv4_tcp_mss_adjust
  ipv4_forwarding_enable                                    = each.value.ipv4_forwarding_enable
  ipv4_ttl_propagate_disable                                = each.value.ipv4_ttl_propagate_disable
  ipv4_verify_unicast_source_reachable_via_type             = each.value.ipv4_verify_unicast_source_reachable_via_type
  ipv4_verify_unicast_source_reachable_via_allow_self_ping  = each.value.ipv4_verify_unicast_source_reachable_via_allow_self_ping
  ipv4_verify_unicast_source_reachable_via_allow_default    = each.value.ipv4_verify_unicast_source_reachable_via_allow_default
  ipv4_access_group_ingress_acl1                            = each.value.ipv4_access_group_ingress_acl1
  ipv4_access_group_ingress_hardware_count                  = each.value.ipv4_access_group_ingress_hardware_count
  ipv4_access_group_ingress_interface_statistics            = each.value.ipv4_access_group_ingress_interface_statistics
  ipv4_access_group_ingress_compress                        = each.value.ipv4_access_group_ingress_compress
  ipv4_access_group_egress_acl                              = each.value.ipv4_access_group_egress_acl
  ipv4_access_group_egress_hardware_count                   = each.value.ipv4_access_group_egress_hardware_count
  ipv4_access_group_egress_interface_statistics             = each.value.ipv4_access_group_egress_interface_statistics
  ipv4_access_group_egress_compress                         = each.value.ipv4_access_group_egress_compress
  ipv6_verify_unicast_source_reachable_via_type             = each.value.ipv6_verify_unicast_source_reachable_via_type
  ipv6_verify_unicast_source_reachable_via_allow_self_ping  = each.value.ipv6_verify_unicast_source_reachable_via_allow_self_ping
  ipv6_verify_unicast_source_reachable_via_allow_default    = each.value.ipv6_verify_unicast_source_reachable_via_allow_default
  ipv6_access_group_ingress_acl1                            = each.value.ipv6_access_group_ingress_acl1
  ipv6_access_group_ingress_interface_statistics            = each.value.ipv6_access_group_ingress_interface_statistics
  ipv6_access_group_ingress_compress                        = each.value.ipv6_access_group_ingress_compress
  ipv6_access_group_egress_acl                              = each.value.ipv6_access_group_egress_acl
  ipv6_access_group_egress_interface_statistics             = each.value.ipv6_access_group_egress_interface_statistics
  ipv6_access_group_egress_compress                         = each.value.ipv6_access_group_egress_compress
  ipv6_enable                                               = each.value.ipv6_enable
  ipv6_ttl_propagate_disable                                = each.value.ipv6_ttl_propagate_disable
  ipv6_addresses                                            = each.value.ipv6_addresses
  ipv6_link_local_address                                   = each.value.ipv6_link_local_address
  ipv6_link_local_zone                                      = each.value.ipv6_link_local_zone
  ipv6_link_local_route_tag                                 = each.value.ipv6_link_local_route_tag
  ipv6_eui64_addresses                                      = each.value.ipv6_eui64_addresses
  ipv6_autoconfig                                           = each.value.ipv6_autoconfig
  ipv6_dhcp                                                 = each.value.ipv6_dhcp
  ipv6_mtu                                                  = each.value.ipv6_mtu
  ipv6_unreachables_disable                                 = each.value.ipv6_unreachables_disable
  ipv6_tcp_mss_adjust                                       = each.value.ipv6_tcp_mss_adjust
  ipv6_nd_reachable_time                                    = each.value.ipv6_nd_reachable_time
  ipv6_nd_cache_limit                                       = each.value.ipv6_nd_cache_limit
  ipv6_nd_dad_attempts                                      = each.value.ipv6_nd_dad_attempts
  ipv6_nd_unicast_ra                                        = each.value.ipv6_nd_unicast_ra
  ipv6_nd_suppress_ra                                       = each.value.ipv6_nd_suppress_ra
  ipv6_nd_managed_config_flag                               = each.value.ipv6_nd_managed_config_flag
  ipv6_nd_other_config_flag                                 = each.value.ipv6_nd_other_config_flag
  ipv6_nd_ns_interval                                       = each.value.ipv6_nd_ns_interval
  ipv6_nd_ra_interval_max                                   = each.value.ipv6_nd_ra_interval_max
  ipv6_nd_ra_interval_min                                   = each.value.ipv6_nd_ra_interval_min
  ipv6_nd_ra_lifetime                                       = each.value.ipv6_nd_ra_lifetime
  ipv6_nd_redirects                                         = each.value.ipv6_nd_redirects
  ipv6_nd_prefix_default_no_adv                             = each.value.ipv6_nd_prefix_default_no_adv
  ipv6_nd_prefix_default_no_autoconfig                      = each.value.ipv6_nd_prefix_default_no_autoconfig
  arp_timeout                                               = each.value.arp_timeout
  arp_learning_disable                                      = each.value.arp_learning_disable
  arp_learning_local                                        = each.value.arp_learning_local
  arp_gratuitous_ignore                                     = each.value.arp_gratuitous_ignore
  arp_cache_limit                                           = each.value.arp_cache_limit
  proxy_arp                                                 = each.value.proxy_arp
  host_routing                                              = each.value.host_routing
  mac_address                                               = each.value.mac_address
  ptp                                                       = each.value.ptp
  ptp_profile                                               = each.value.ptp_profile
  ptp_transport_ipv4                                        = each.value.ptp_transport_ipv4
  ptp_transport_ethernet                                    = each.value.ptp_transport_ethernet
  ptp_transport_ipv6                                        = each.value.ptp_transport_ipv6
  ptp_clock_operation_one_step                              = each.value.ptp_clock_operation_one_step
  ptp_clock_operation_two_step                              = each.value.ptp_clock_operation_two_step
  ptp_announce_interval                                     = each.value.ptp_announce_interval
  ptp_announce_frequency                                    = each.value.ptp_announce_frequency
  ptp_announce_timeout                                      = each.value.ptp_announce_timeout
  ptp_announce_grant_duration                               = each.value.ptp_announce_grant_duration
  ptp_sync_interval                                         = each.value.ptp_sync_interval
  ptp_sync_frequency                                        = each.value.ptp_sync_frequency
  ptp_sync_grant_duration                                   = each.value.ptp_sync_grant_duration
  ptp_sync_timeout                                          = each.value.ptp_sync_timeout
  ptp_delay_request_interval                                = each.value.ptp_delay_request_interval
  ptp_delay_request_frequency                               = each.value.ptp_delay_request_frequency
  ptp_cos                                                   = each.value.ptp_cos
  ptp_cos_event                                             = each.value.ptp_cos_event
  ptp_cos_general                                           = each.value.ptp_cos_general
  ptp_dscp                                                  = each.value.ptp_dscp
  ptp_dscp_event                                            = each.value.ptp_dscp_event
  ptp_dscp_general                                          = each.value.ptp_dscp_general
  ptp_ipv4_ttl                                              = each.value.ptp_ipv4_ttl
  ptp_ipv6_hop_limit                                        = each.value.ptp_ipv6_hop_limit
  ptp_delay_asymmetry_value                                 = each.value.ptp_delay_asymmetry_value
  ptp_delay_asymmetry_unit_nanoseconds                      = each.value.ptp_delay_asymmetry_unit_nanoseconds
  ptp_delay_asymmetry_unit_microseconds                     = each.value.ptp_delay_asymmetry_unit_microseconds
  ptp_delay_asymmetry_unit_milliseconds                     = each.value.ptp_delay_asymmetry_unit_milliseconds
  ptp_delay_response_grant_duration                         = each.value.ptp_delay_response_grant_duration
  ptp_delay_response_timeout                                = each.value.ptp_delay_response_timeout
  ptp_unicast_grant_invalid_request_reduce                  = each.value.ptp_unicast_grant_invalid_request_reduce
  ptp_unicast_grant_invalid_request_deny                    = each.value.ptp_unicast_grant_invalid_request_deny
  ptp_multicast                                             = each.value.ptp_multicast
  ptp_multicast_mixed                                       = each.value.ptp_multicast_mixed
  ptp_multicast_disable                                     = each.value.ptp_multicast_disable
  ptp_multicast_target_address_mac_forwardable              = each.value.ptp_multicast_target_address_mac_forwardable
  ptp_multicast_target_address_mac_non_forwardable          = each.value.ptp_multicast_target_address_mac_non_forwardable
  ptp_port_state_slave_only                                 = each.value.ptp_port_state_slave_only
  ptp_port_state_master_only                                = each.value.ptp_port_state_master_only
  ptp_port_state_any                                        = each.value.ptp_port_state_any
  ptp_source_ipv4_address                                   = each.value.ptp_source_ipv4_address
  ptp_source_ipv4_address_disable                           = each.value.ptp_source_ipv4_address_disable
  ptp_source_ipv6_address                                   = each.value.ptp_source_ipv6_address
  ptp_source_ipv6_address_disable                           = each.value.ptp_source_ipv6_address_disable
  ptp_local_priority                                        = each.value.ptp_local_priority
  ptp_slave_ipv4s                                           = each.value.ptp_slave_ipv4s
  ptp_slave_ipv6s                                           = each.value.ptp_slave_ipv6s
  ptp_slave_ethernets                                       = each.value.ptp_slave_ethernets
  ptp_master_ipv4s                                          = each.value.ptp_master_ipv4s
  ptp_master_ipv6s                                          = each.value.ptp_master_ipv6s
  ptp_master_ethernets                                      = each.value.ptp_master_ethernets
  ptp_interop_profile_default                               = each.value.ptp_interop_profile_default
  ptp_interop_profile_g_8265_1                              = each.value.ptp_interop_profile_g_8265_1
  ptp_interop_profile_g_8275_1                              = each.value.ptp_interop_profile_g_8275_1
  ptp_interop_profile_g_8275_2                              = each.value.ptp_interop_profile_g_8275_2
  ptp_interop_domain                                        = each.value.ptp_interop_domain
  ptp_interop_egress_conversion_priority1                   = each.value.ptp_interop_egress_conversion_priority1
  ptp_interop_egress_conversion_priority2                   = each.value.ptp_interop_egress_conversion_priority2
  ptp_interop_egress_conversion_clock_accuracy              = each.value.ptp_interop_egress_conversion_clock_accuracy
  ptp_interop_egress_conversion_offset_scaled_log_variance  = each.value.ptp_interop_egress_conversion_offset_scaled_log_variance
  ptp_interop_egress_conversion_clock_class_default         = each.value.ptp_interop_egress_conversion_clock_class_default
  ptp_interop_egress_conversion_clock_class_mappings        = each.value.ptp_interop_egress_conversion_clock_class_mappings
  ptp_interop_ingress_conversion_priority1                  = each.value.ptp_interop_ingress_conversion_priority1
  ptp_interop_ingress_conversion_priority2                  = each.value.ptp_interop_ingress_conversion_priority2
  ptp_interop_ingress_conversion_clock_accuracy             = each.value.ptp_interop_ingress_conversion_clock_accuracy
  ptp_interop_ingress_conversion_offset_scaled_log_variance = each.value.ptp_interop_ingress_conversion_offset_scaled_log_variance
  ptp_interop_ingress_conversion_clock_class_default        = each.value.ptp_interop_ingress_conversion_clock_class_default
  ptp_interop_ingress_conversion_clock_class_mappings       = each.value.ptp_interop_ingress_conversion_clock_class_mappings

  lifecycle {
    precondition {
      condition     = (each.value.ipv4_address == null && each.value.ipv4_netmask == null) || (each.value.ipv4_address != null && each.value.ipv4_netmask != null)
      error_message = "Interface ${each.key}: ipv4_address and ipv4_netmask must both be specified or both be omitted."
    }
  }

  depends_on = [
    # Future dependencies - uncomment when resource is created:
    #iosxr_vrf.vrf,
    iosxr_interface_ethernet.ethernet,
    iosxr_interface_ethernet_subinterface.ethernet_subinterface,
    #iosxr_ipv4_access_list.ipv4_access_list,
    #iosxr_ipv6_access_list.ipv6_access_list,
  ]
}

##### LOOPBACKS #####

locals {
  interfaces_loopbacks = flatten([
    for device in local.devices : [
      for lb in try(local.device_config[device.name].interfaces.loopbacks, []) : {
        key                          = format("%s/Loopback%s", device.name, trimprefix(lb.id, "$string "))
        device                       = device.name
        id                           = trimprefix(lb.id, "$string ")
        dampening                    = try(lb.dampening, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.dampening, null)
        dampening_decay_half_life    = try(lb.dampening_decay_half_life, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.dampening_decay_half_life, null)
        dampening_reuse_threshold    = try(lb.dampening_reuse_threshold, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.dampening_reuse_threshold, null)
        dampening_suppress_threshold = try(lb.dampening_suppress_threshold, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.dampening_suppress_threshold, null)
        dampening_max_suppress_time  = try(lb.dampening_max_suppress_time, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.dampening_max_suppress_time, null)
        shutdown                     = try(lb.shutdown, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.shutdown, null)
        mtu                          = try(lb.mtu, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.mtu, null)
        logging_events_link_status   = try(lb.logging_events_link_status, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.logging_events_link_status, null)
        bandwidth                    = try(lb.bandwidth, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.bandwidth, null)
        description                  = try(lb.description, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.description, null)
        load_interval                = try(lb.load_interval, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.load_interval, null)
        vrf                          = try(lb.vrf, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.vrf, null)
        ipv4_address                 = try(lb.ipv4.address, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.address, null)
        ipv4_netmask                 = try(lb.ipv4.netmask, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.netmask, null)
        ipv4_route_tag               = try(lb.ipv4.route_tag, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.route_tag, null)
        ipv4_algorithm               = try(lb.ipv4.algorithm, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.algorithm, null)
        ipv4_secondaries = try(length(lb.ipv4.secondaries) == 0, true) ? null : [for secondary in lb.ipv4.secondaries : {
          address   = try(secondary.address, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.secondaries.address, null)
          netmask   = try(secondary.netmask, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.secondaries.netmask, null)
          route_tag = try(secondary.route_tag, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.secondaries.route_tag, null)
          algorithm = try(secondary.algorithm, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.secondaries.algorithm, null)
        }]
        ipv4_unnumbered            = try(lb.ipv4.unnumbered, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.unnumbered, null)
        ipv4_forwarding_enable     = try(lb.ipv4.forwarding_enable, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.forwarding_enable, null)
        ipv4_ttl_propagate_disable = try(lb.ipv4.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.ttl_propagate_disable, null)
        ipv4_mtu                   = try(lb.ipv4.mtu, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.mtu, null)
        ipv4_redirects             = try(lb.ipv4.redirects, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.redirects, null)
        ipv4_mask_reply            = try(lb.ipv4.mask_reply, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.mask_reply, null)
        ipv4_helper_addresses = try(length(lb.ipv4.helper_addresses) == 0, true) ? null : [for helper in lb.ipv4.helper_addresses : {
          address = try(helper.address, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.helper_addresses.address, null)
          vrf     = try(helper.vrf, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.helper_addresses.vrf, null)
        }]
        ipv4_tcp_mss_adjust                                      = try(lb.ipv4.tcp_mss_adjust, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.tcp_mss_adjust, null)
        ipv4_verify_unicast_source_reachable_via_type            = try(lb.ipv4.verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.verify_unicast_source_reachable_via_type, null)
        ipv4_verify_unicast_source_reachable_via_allow_self_ping = try(lb.ipv4.verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.verify_unicast_source_reachable_via_allow_self_ping, can(lb.ipv4.verify_unicast_source_reachable_via_type) ? false : null)
        ipv4_verify_unicast_source_reachable_via_allow_default   = try(lb.ipv4.verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv4.verify_unicast_source_reachable_via_allow_default, can(lb.ipv4.verify_unicast_source_reachable_via_type) ? false : null)
        ipv6_verify_unicast_source_reachable_via_type            = try(lb.ipv6.verify_unicast_source_reachable_via_type, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.verify_unicast_source_reachable_via_type, null)
        ipv6_verify_unicast_source_reachable_via_allow_self_ping = try(lb.ipv6.verify_unicast_source_reachable_via_allow_self_ping, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.verify_unicast_source_reachable_via_allow_self_ping, can(lb.ipv6.verify_unicast_source_reachable_via_type) ? false : null)
        ipv6_verify_unicast_source_reachable_via_allow_default   = try(lb.ipv6.verify_unicast_source_reachable_via_allow_default, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.verify_unicast_source_reachable_via_allow_default, can(lb.ipv6.verify_unicast_source_reachable_via_type) ? false : null)
        ipv6_enable                                              = try(lb.ipv6.enable, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.enable, null)
        ipv6_ttl_propagate_disable                               = try(lb.ipv6.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.ttl_propagate_disable, null)
        ipv6_addresses = try(length(lb.ipv6.addresses) == 0, true) ? null : [for ipv6_address in lb.ipv6.addresses : {
          address       = try(ipv6_address.address, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.addresses.address, null)
          prefix_length = try(ipv6_address.prefix_length, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.addresses.prefix_length, null)
          zone          = try(ipv6_address.zone, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.addresses.zone, null)
          route_tag     = try(ipv6_address.route_tag, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.addresses.route_tag, null)
          algorithm     = try(ipv6_address.algorithm, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.addresses.algorithm, null)
        }]
        ipv6_link_local_address   = try(lb.ipv6.link_local_address, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.link_local_address, null)
        ipv6_link_local_zone      = try(lb.ipv6.link_local_zone, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.link_local_zone, can(lb.ipv6.link_local_address) ? 0 : null)
        ipv6_link_local_route_tag = try(lb.ipv6.link_local_route_tag, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.link_local_route_tag, null)
        ipv6_eui64_addresses = try(length(lb.ipv6.eui64_addresses) == 0, true) ? null : [for eui64 in lb.ipv6.eui64_addresses : {
          address       = try(eui64.address, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.eui64_addresses.address, null)
          prefix_length = try(eui64.prefix_length, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.eui64_addresses.prefix_length, null)
          zone          = try(eui64.zone, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.eui64_addresses.zone, null)
          route_tag     = try(eui64.route_tag, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.eui64_addresses.route_tag, null)
          algorithm     = try(eui64.algorithm, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.eui64_addresses.algorithm, null)
        }]
        ipv6_autoconfig                      = try(lb.ipv6.autoconfig, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.autoconfig, null)
        ipv6_mtu                             = try(lb.ipv6.mtu, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.mtu, null)
        ipv6_tcp_mss_adjust                  = try(lb.ipv6.tcp_mss_adjust, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.tcp_mss_adjust, null)
        ipv6_nd_cache_limit                  = try(lb.ipv6.nd_cache_limit, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.nd_cache_limit, null)
        ipv6_nd_prefix_default_no_adv        = try(lb.ipv6.nd_prefix_default_no_adv, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.nd_prefix_default_no_adv, null)
        ipv6_nd_prefix_default_no_autoconfig = try(lb.ipv6.nd_prefix_default_no_autoconfig, local.defaults.iosxr.devices.configuration.interfaces.loopbacks.ipv6.nd_prefix_default_no_autoconfig, null)
      }
    ]
  ])
}

resource "iosxr_interface_loopback" "loopback" {
  for_each                                                 = { for lb in local.interfaces_loopbacks : lb.key => lb }
  device                                                   = each.value.device
  name                                                     = each.value.id
  dampening                                                = each.value.dampening
  dampening_decay_half_life                                = each.value.dampening_decay_half_life
  dampening_reuse_threshold                                = each.value.dampening_reuse_threshold
  dampening_suppress_threshold                             = each.value.dampening_suppress_threshold
  dampening_max_suppress_time                              = each.value.dampening_max_suppress_time
  shutdown                                                 = each.value.shutdown
  mtu                                                      = each.value.mtu
  logging_events_link_status                               = each.value.logging_events_link_status
  bandwidth                                                = each.value.bandwidth
  description                                              = each.value.description
  load_interval                                            = each.value.load_interval
  vrf                                                      = each.value.vrf
  ipv4_address                                             = each.value.ipv4_address
  ipv4_netmask                                             = each.value.ipv4_netmask
  ipv4_route_tag                                           = each.value.ipv4_route_tag
  ipv4_algorithm                                           = each.value.ipv4_algorithm
  ipv4_secondaries                                         = each.value.ipv4_secondaries
  ipv4_unnumbered                                          = each.value.ipv4_unnumbered
  ipv4_forwarding_enable                                   = each.value.ipv4_forwarding_enable
  ipv4_ttl_propagate_disable                               = each.value.ipv4_ttl_propagate_disable
  ipv4_mtu                                                 = each.value.ipv4_mtu
  ipv4_redirects                                           = each.value.ipv4_redirects
  ipv4_mask_reply                                          = each.value.ipv4_mask_reply
  ipv4_helper_addresses                                    = each.value.ipv4_helper_addresses
  ipv4_tcp_mss_adjust                                      = each.value.ipv4_tcp_mss_adjust
  ipv4_verify_unicast_source_reachable_via_type            = each.value.ipv4_verify_unicast_source_reachable_via_type
  ipv4_verify_unicast_source_reachable_via_allow_self_ping = each.value.ipv4_verify_unicast_source_reachable_via_allow_self_ping
  ipv4_verify_unicast_source_reachable_via_allow_default   = each.value.ipv4_verify_unicast_source_reachable_via_allow_default
  ipv6_verify_unicast_source_reachable_via_type            = each.value.ipv6_verify_unicast_source_reachable_via_type
  ipv6_verify_unicast_source_reachable_via_allow_self_ping = each.value.ipv6_verify_unicast_source_reachable_via_allow_self_ping
  ipv6_verify_unicast_source_reachable_via_allow_default   = each.value.ipv6_verify_unicast_source_reachable_via_allow_default
  ipv6_enable                                              = each.value.ipv6_enable
  ipv6_ttl_propagate_disable                               = each.value.ipv6_ttl_propagate_disable
  ipv6_addresses                                           = each.value.ipv6_addresses
  ipv6_link_local_address                                  = each.value.ipv6_link_local_address
  ipv6_link_local_zone                                     = each.value.ipv6_link_local_zone
  ipv6_link_local_route_tag                                = each.value.ipv6_link_local_route_tag
  ipv6_eui64_addresses                                     = each.value.ipv6_eui64_addresses
  ipv6_autoconfig                                          = each.value.ipv6_autoconfig
  ipv6_mtu                                                 = each.value.ipv6_mtu
  ipv6_tcp_mss_adjust                                      = each.value.ipv6_tcp_mss_adjust
  ipv6_nd_cache_limit                                      = each.value.ipv6_nd_cache_limit
  ipv6_nd_prefix_default_no_adv                            = each.value.ipv6_nd_prefix_default_no_adv
  ipv6_nd_prefix_default_no_autoconfig                     = each.value.ipv6_nd_prefix_default_no_autoconfig

  lifecycle {
    precondition {
      condition     = (each.value.ipv4_address == null && each.value.ipv4_netmask == null) || (each.value.ipv4_address != null && each.value.ipv4_netmask != null)
      error_message = "Interface ${each.key}: ipv4_address and ipv4_netmask must both be specified or both be omitted."
    }
  }

  depends_on = [
    # Future dependencies - uncomment when resource is created:
    #iosxr_vrf.vrf,
  ]
}

##### TUNNELS - TUNNEL-IP #####

locals {
  interfaces_tunnel_ip = flatten([
    for device in local.devices : [
      for tunnel in try(local.device_config[device.name].interfaces.tunnels, []) : {
        key                                            = format("%s/tunnel-ip%s", device.name, trimprefix(tunnel.id, "$string "))
        device                                         = device.name
        id                                             = trimprefix(tunnel.id, "$string ")
        shutdown                                       = try(tunnel.shutdown, local.defaults.iosxr.devices.configuration.interfaces.tunnels.shutdown, null)
        mtu                                            = try(tunnel.mtu, local.defaults.iosxr.devices.configuration.interfaces.tunnels.mtu, null)
        logging_events_link_status                     = try(tunnel.logging_events_link_status, local.defaults.iosxr.devices.configuration.interfaces.tunnels.logging_events_link_status, null)
        bandwidth                                      = try(tunnel.bandwidth, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bandwidth, null)
        description                                    = try(tunnel.description, local.defaults.iosxr.devices.configuration.interfaces.tunnels.description, null)
        load_interval                                  = try(tunnel.load_interval, local.defaults.iosxr.devices.configuration.interfaces.tunnels.load_interval, null)
        vrf                                            = try(tunnel.vrf, local.defaults.iosxr.devices.configuration.interfaces.tunnels.vrf, null)
        ipv4_address                                   = try(tunnel.ipv4.address, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.address, null)
        ipv4_netmask                                   = try(tunnel.ipv4.netmask, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.netmask, null)
        ipv4_unnumbered                                = try(tunnel.ipv4.unnumbered, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.unnumbered, null)
        ipv4_forwarding_enable                         = try(tunnel.ipv4.forwarding_enable, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.forwarding_enable, null)
        ipv4_ttl_propagate_disable                     = try(tunnel.ipv4.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.ttl_propagate_disable, null)
        ipv4_access_group_ingress_acl1                 = try(tunnel.ipv4.access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.access_group_ingress_acl1, null)
        ipv4_access_group_ingress_hardware_count       = try(tunnel.ipv4.access_group_ingress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.access_group_ingress_hardware_count, null)
        ipv4_access_group_ingress_interface_statistics = try(tunnel.ipv4.access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.access_group_ingress_interface_statistics, null)
        ipv4_access_group_egress_acl                   = try(tunnel.ipv4.access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.access_group_egress_acl, null)
        ipv4_access_group_egress_hardware_count        = try(tunnel.ipv4.access_group_egress_hardware_count, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.access_group_egress_hardware_count, null)
        ipv4_access_group_egress_interface_statistics  = try(tunnel.ipv4.access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.access_group_egress_interface_statistics, null)
        ipv6_access_group_ingress_acl1                 = try(tunnel.ipv6.access_group_ingress_acl1, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv6.access_group_ingress_acl1, null)
        ipv6_access_group_ingress_interface_statistics = try(tunnel.ipv6.access_group_ingress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv6.access_group_ingress_interface_statistics, null)
        ipv6_access_group_egress_acl                   = try(tunnel.ipv6.access_group_egress_acl, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv6.access_group_egress_acl, null)
        ipv6_access_group_egress_interface_statistics  = try(tunnel.ipv6.access_group_egress_interface_statistics, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv6.access_group_egress_interface_statistics, null)
        ipv6_link_local_address                        = try(tunnel.ipv6.link_local_address, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv6.link_local_address, null)
        ipv6_link_local_zone                           = try(tunnel.ipv6.link_local_zone, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv6.link_local_zone, can(tunnel.ipv6.link_local_address) ? 0 : null)
        ipv6_autoconfig                                = try(tunnel.ipv6.autoconfig, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv6.autoconfig, null)
        ipv6_enable                                    = try(tunnel.ipv6.enable, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv6.enable, null)
        ipv6_ttl_propagate_disable                     = try(tunnel.ipv6.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv6.ttl_propagate_disable, null)
        ipv6_addresses = try(length(tunnel.ipv6.addresses) == 0, true) ? null : [for ipv6_address in try(tunnel.ipv6.addresses, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv6.addresses, []) : {
          address       = try(ipv6_address.address, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv6.addresses.address, null)
          prefix_length = try(ipv6_address.prefix_length, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv6.addresses.prefix_length, null)
          zone          = try(ipv6_address.zone, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv6.addresses.zone, null)
        }]
        tunnel_source_interface        = try(tunnel.tunnel_source_interface, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_source_interface, null)
        tunnel_source_ipv4             = try(tunnel.tunnel_source_ipv4, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_source_ipv4, null)
        tunnel_source_ipv6             = try(tunnel.tunnel_source_ipv6, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_source_ipv6, null)
        tunnel_destination_ipv4        = try(tunnel.tunnel_destination_ipv4, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_destination_ipv4, null)
        tunnel_destination_ipv6        = try(tunnel.tunnel_destination_ipv6, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_destination_ipv6, null)
        tunnel_destination_prefix_list = try(tunnel.tunnel_destination_prefix_list, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_destination_prefix_list, null)
        tunnel_bfd_destination_ipv4    = try(tunnel.tunnel_bfd_destination_ipv4, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_bfd_destination_ipv4, null)
        tunnel_bfd_destination_ipv6    = try(tunnel.tunnel_bfd_destination_ipv6, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_bfd_destination_ipv6, null)
        tunnel_bfd_period              = try(tunnel.tunnel_bfd_period, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_bfd_period, null)
        tunnel_bfd_retry               = try(tunnel.tunnel_bfd_retry, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_bfd_retry, null)
        tunnel_bfd_minimum_interval    = try(tunnel.tunnel_bfd_minimum_interval, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_bfd_minimum_interval, null)
        tunnel_bfd_multiplier          = try(tunnel.tunnel_bfd_multiplier, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_bfd_multiplier, null)
        tunnel_mode_gre_ipv4           = try(tunnel.tunnel_mode_gre_ipv4, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_mode_gre_ipv4, null)
        tunnel_mode_gre_ipv6           = try(tunnel.tunnel_mode_gre_ipv6, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_mode_gre_ipv6, null)
        tunnel_mode_ipv4               = try(tunnel.tunnel_mode_ipv4, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_mode_ipv4, null)
        tunnel_mode_ipv6               = try(tunnel.tunnel_mode_ipv6, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_mode_ipv6, null)
        tunnel_tos                     = try(tunnel.tunnel_tos, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_tos, null)
        tunnel_ttl_value               = try(tunnel.tunnel_ttl_value, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_ttl_value, null)
        tunnel_ttl_disable             = try(tunnel.tunnel_ttl_disable, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_ttl_disable, null)
        tunnel_df_disable              = try(tunnel.tunnel_df_disable, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_df_disable, null)
        tunnel_key                     = try(tunnel.tunnel_key, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_key, null)
        tunnel_vrf                     = try(tunnel.tunnel_vrf, local.defaults.iosxr.devices.configuration.interfaces.tunnels.tunnel_vrf, null)
        keepalive_period               = try(tunnel.keepalive_period, local.defaults.iosxr.devices.configuration.interfaces.tunnels.keepalive_period, null)
      } if try(tunnel.type, null) == "tunnel-ip"
    ]
  ])
}

resource "iosxr_interface_tunnel_ip" "tunnel_ip" {
  for_each = { for tunnel in local.interfaces_tunnel_ip : tunnel.key => tunnel }
  device   = each.value.device

  name                                           = each.value.id
  shutdown                                       = each.value.shutdown
  mtu                                            = each.value.mtu
  logging_events_link_status                     = each.value.logging_events_link_status
  bandwidth                                      = each.value.bandwidth
  description                                    = each.value.description
  load_interval                                  = each.value.load_interval
  vrf                                            = each.value.vrf
  ipv4_address                                   = each.value.ipv4_address
  ipv4_netmask                                   = each.value.ipv4_netmask
  ipv4_unnumbered                                = each.value.ipv4_unnumbered
  ipv4_forwarding_enable                         = each.value.ipv4_forwarding_enable
  ipv4_ttl_propagate_disable                     = each.value.ipv4_ttl_propagate_disable
  ipv4_access_group_ingress_acl1                 = each.value.ipv4_access_group_ingress_acl1
  ipv4_access_group_ingress_hardware_count       = each.value.ipv4_access_group_ingress_hardware_count
  ipv4_access_group_ingress_interface_statistics = each.value.ipv4_access_group_ingress_interface_statistics
  ipv4_access_group_egress_acl                   = each.value.ipv4_access_group_egress_acl
  ipv4_access_group_egress_hardware_count        = each.value.ipv4_access_group_egress_hardware_count
  ipv4_access_group_egress_interface_statistics  = each.value.ipv4_access_group_egress_interface_statistics
  ipv6_access_group_ingress_acl1                 = each.value.ipv6_access_group_ingress_acl1
  ipv6_access_group_ingress_interface_statistics = each.value.ipv6_access_group_ingress_interface_statistics
  ipv6_access_group_egress_acl                   = each.value.ipv6_access_group_egress_acl
  ipv6_access_group_egress_interface_statistics  = each.value.ipv6_access_group_egress_interface_statistics
  ipv6_link_local_address                        = each.value.ipv6_link_local_address
  ipv6_link_local_zone                           = each.value.ipv6_link_local_zone
  ipv6_autoconfig                                = each.value.ipv6_autoconfig
  ipv6_enable                                    = each.value.ipv6_enable
  ipv6_ttl_propagate_disable                     = each.value.ipv6_ttl_propagate_disable
  ipv6_addresses                                 = each.value.ipv6_addresses
  tunnel_source_interface                        = each.value.tunnel_source_interface
  tunnel_source_ipv4                             = each.value.tunnel_source_ipv4
  tunnel_source_ipv6                             = each.value.tunnel_source_ipv6
  tunnel_destination_ipv4                        = each.value.tunnel_destination_ipv4
  tunnel_destination_ipv6                        = each.value.tunnel_destination_ipv6
  tunnel_destination_prefix_list                 = each.value.tunnel_destination_prefix_list
  tunnel_bfd_destination_ipv4                    = each.value.tunnel_bfd_destination_ipv4
  tunnel_bfd_destination_ipv6                    = each.value.tunnel_bfd_destination_ipv6
  tunnel_bfd_period                              = each.value.tunnel_bfd_period
  tunnel_bfd_retry                               = each.value.tunnel_bfd_retry
  tunnel_bfd_minimum_interval                    = each.value.tunnel_bfd_minimum_interval
  tunnel_bfd_multiplier                          = each.value.tunnel_bfd_multiplier
  tunnel_mode_gre_ipv4                           = each.value.tunnel_mode_gre_ipv4
  tunnel_mode_gre_ipv6                           = each.value.tunnel_mode_gre_ipv6
  tunnel_mode_ipv4                               = each.value.tunnel_mode_ipv4
  tunnel_mode_ipv6                               = each.value.tunnel_mode_ipv6
  tunnel_tos                                     = each.value.tunnel_tos
  tunnel_ttl_value                               = each.value.tunnel_ttl_value
  tunnel_ttl_disable                             = each.value.tunnel_ttl_disable
  tunnel_df_disable                              = each.value.tunnel_df_disable
  tunnel_key                                     = each.value.tunnel_key
  tunnel_vrf                                     = each.value.tunnel_vrf
  keepalive_period                               = each.value.keepalive_period

  lifecycle {
    precondition {
      condition     = (each.value.ipv4_address == null && each.value.ipv4_netmask == null) || (each.value.ipv4_address != null && each.value.ipv4_netmask != null)
      error_message = "Interface ${each.key}: ipv4_address and ipv4_netmask must both be specified or both be omitted."
    }
  }

  depends_on = [
    # Future dependencies - uncomment when resource is created:
    #iosxr_vrf.vrf,
  ]
}

##### TUNNELS - TUNNEL-TE #####

locals {
  interfaces_tunnel_te = flatten([
    for device in local.devices : [
      for tunnel in try(local.device_config[device.name].interfaces.tunnels, []) : {
        key                                                = format("%s/tunnel-te%s", device.name, trimprefix(tunnel.id, "$string "))
        device                                             = device.name
        id                                                 = trimprefix(tunnel.id, "$string ")
        shutdown                                           = try(tunnel.shutdown, local.defaults.iosxr.devices.configuration.interfaces.tunnels.shutdown, null)
        logging_events_link_status                         = try(tunnel.logging_events_link_status, local.defaults.iosxr.devices.configuration.interfaces.tunnels.logging_events_link_status, null)
        bandwidth                                          = try(tunnel.bandwidth, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bandwidth, null)
        description                                        = try(tunnel.description, local.defaults.iosxr.devices.configuration.interfaces.tunnels.description, null)
        load_interval                                      = try(tunnel.load_interval, local.defaults.iosxr.devices.configuration.interfaces.tunnels.load_interval, null)
        ipv4_address                                       = try(tunnel.ipv4.address, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.address, null)
        ipv4_netmask                                       = try(tunnel.ipv4.netmask, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.netmask, null)
        ipv4_unnumbered                                    = try(tunnel.ipv4.unnumbered, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.unnumbered, null)
        ipv4_forwarding_enable                             = try(tunnel.ipv4.forwarding_enable, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.forwarding_enable, null)
        ipv4_ttl_propagate_disable                         = try(tunnel.ipv4.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv4.ttl_propagate_disable, null)
        ipv6_enable                                        = try(tunnel.ipv6.enable, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv6.enable, null)
        ipv6_ttl_propagate_disable                         = try(tunnel.ipv6.ttl_propagate_disable, local.defaults.iosxr.devices.configuration.interfaces.tunnels.ipv6.ttl_propagate_disable, null)
        mpls_mtu                                           = try(tunnel.mpls_mtu, local.defaults.iosxr.devices.configuration.interfaces.tunnels.mpls_mtu, null)
        affinity_value                                     = try(tunnel.affinity_value, local.defaults.iosxr.devices.configuration.interfaces.tunnels.affinity_value, null)
        affinity_mask                                      = try(tunnel.affinity_mask, local.defaults.iosxr.devices.configuration.interfaces.tunnels.affinity_mask, null)
        autoroute_announce                                 = try(tunnel.autoroute_announce, local.defaults.iosxr.devices.configuration.interfaces.tunnels.autoroute_announce, null)
        autoroute_announce_metric_absolute                 = try(tunnel.autoroute_announce_metric_absolute, local.defaults.iosxr.devices.configuration.interfaces.tunnels.autoroute_announce_metric_absolute, null)
        autoroute_announce_metric_relative                 = try(tunnel.autoroute_announce_metric_relative, local.defaults.iosxr.devices.configuration.interfaces.tunnels.autoroute_announce_metric_relative, null)
        autoroute_announce_metric                          = try(tunnel.autoroute_announce_metric, local.defaults.iosxr.devices.configuration.interfaces.tunnels.autoroute_announce_metric, null)
        autoroute_announce_include_ipv6                    = try(tunnel.autoroute_announce_include_ipv6, local.defaults.iosxr.devices.configuration.interfaces.tunnels.autoroute_announce_include_ipv6, null)
        autoroute_announce_exclude_traffic_segment_routing = try(tunnel.autoroute_announce_exclude_traffic_segment_routing, local.defaults.iosxr.devices.configuration.interfaces.tunnels.autoroute_announce_exclude_traffic_segment_routing, null)
        autoroute_destinations = try(length(tunnel.autoroute_destinations) == 0, true) ? null : [for dest in try(tunnel.autoroute_destinations, local.defaults.iosxr.devices.configuration.interfaces.tunnels.autoroute_destinations, []) : {
          address = try(dest.address, local.defaults.iosxr.devices.configuration.interfaces.tunnels.autoroute_destinations.address, null)
        }]
        backup_bw_pool_type                    = try(tunnel.backup_bw_pool_type, local.defaults.iosxr.devices.configuration.interfaces.tunnels.backup_bw_pool_type, null)
        backup_bw_class_type                   = try(tunnel.backup_bw_class_type, local.defaults.iosxr.devices.configuration.interfaces.tunnels.backup_bw_class_type, null)
        backup_bw_value                        = try(tunnel.backup_bw_value, local.defaults.iosxr.devices.configuration.interfaces.tunnels.backup_bw_value, null)
        backup_bw_unlimited                    = try(tunnel.backup_bw_unlimited, local.defaults.iosxr.devices.configuration.interfaces.tunnels.backup_bw_unlimited, null)
        signalled_bandwidth                    = try(tunnel.signalled_bandwidth, local.defaults.iosxr.devices.configuration.interfaces.tunnels.signalled_bandwidth, null)
        signalled_bandwidth_class_type         = try(tunnel.signalled_bandwidth_class_type, local.defaults.iosxr.devices.configuration.interfaces.tunnels.signalled_bandwidth_class_type, null)
        signalled_bandwidth_sub_pool           = try(tunnel.signalled_bandwidth_sub_pool, local.defaults.iosxr.devices.configuration.interfaces.tunnels.signalled_bandwidth_sub_pool, null)
        fast_reroute                           = try(tunnel.fast_reroute, local.defaults.iosxr.devices.configuration.interfaces.tunnels.fast_reroute, null)
        fast_reroute_protect_node              = try(tunnel.fast_reroute_protect_node, local.defaults.iosxr.devices.configuration.interfaces.tunnels.fast_reroute_protect_node, null)
        fast_reroute_protect_bandwidth         = try(tunnel.fast_reroute_protect_bandwidth, local.defaults.iosxr.devices.configuration.interfaces.tunnels.fast_reroute_protect_bandwidth, null)
        forward_class                          = try(tunnel.forward_class, local.defaults.iosxr.devices.configuration.interfaces.tunnels.forward_class, null)
        forwarding_adjacency                   = try(tunnel.forwarding_adjacency, local.defaults.iosxr.devices.configuration.interfaces.tunnels.forwarding_adjacency, null)
        forwarding_adjacency_holdtime          = try(tunnel.forwarding_adjacency_holdtime, local.defaults.iosxr.devices.configuration.interfaces.tunnels.forwarding_adjacency_holdtime, null)
        forwarding_adjacency_include_ipv6      = try(tunnel.forwarding_adjacency_include_ipv6, local.defaults.iosxr.devices.configuration.interfaces.tunnels.forwarding_adjacency_include_ipv6, null)
        load_share                             = try(tunnel.load_share, local.defaults.iosxr.devices.configuration.interfaces.tunnels.load_share, null)
        logging_events_lsp_state               = try(tunnel.logging_events_lsp_state, local.defaults.iosxr.devices.configuration.interfaces.tunnels.logging_events_lsp_state, null)
        logging_events_lsp_reoptimize          = try(tunnel.logging_events_lsp_reoptimize, local.defaults.iosxr.devices.configuration.interfaces.tunnels.logging_events_lsp_reoptimize, null)
        logging_events_lsp_reoptimize_attempts = try(tunnel.logging_events_lsp_reoptimize_attempts, local.defaults.iosxr.devices.configuration.interfaces.tunnels.logging_events_lsp_reoptimize_attempts, null)
        logging_events_lsp_bw_change           = try(tunnel.logging_events_lsp_bw_change, local.defaults.iosxr.devices.configuration.interfaces.tunnels.logging_events_lsp_bw_change, null)
        logging_events_lsp_reroute             = try(tunnel.logging_events_lsp_reroute, local.defaults.iosxr.devices.configuration.interfaces.tunnels.logging_events_lsp_reroute, null)
        logging_events_lsp_record_route        = try(tunnel.logging_events_lsp_record_route, local.defaults.iosxr.devices.configuration.interfaces.tunnels.logging_events_lsp_record_route, null)
        logging_events_lsp_switchover          = try(tunnel.logging_events_lsp_switchover, local.defaults.iosxr.devices.configuration.interfaces.tunnels.logging_events_lsp_switchover, null)
        logging_events_lsp_insufficient_bw     = try(tunnel.logging_events_lsp_insufficient_bw, local.defaults.iosxr.devices.configuration.interfaces.tunnels.logging_events_lsp_insufficient_bw, null)
        logging_events_pcalc_failure           = try(tunnel.logging_events_pcalc_failure, local.defaults.iosxr.devices.configuration.interfaces.tunnels.logging_events_pcalc_failure, null)
        logging_events_bfd_status              = try(tunnel.logging_events_bfd_status, local.defaults.iosxr.devices.configuration.interfaces.tunnels.logging_events_bfd_status, null)
        logging_events_all                     = try(tunnel.logging_events_all, local.defaults.iosxr.devices.configuration.interfaces.tunnels.logging_events_all, null)
        signalled_name                         = try(tunnel.signalled_name, local.defaults.iosxr.devices.configuration.interfaces.tunnels.signalled_name, null)
        path_options = try(length(tunnel.path_options) == 0, true) ? null : [for path_option in try(tunnel.path_options, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options, []) : {
          preference                   = try(path_option.preference, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options.preference, null)
          dynamic                      = try(path_option.dynamic, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options.dynamic, null)
          explicit_path_id             = try(path_option.explicit_path_id, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options.explicit_path_id, null)
          explicit_path_name           = try(path_option.explicit_path_name, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options.explicit_path_name, null)
          explicit_path_verbatim       = try(path_option.explicit_path_verbatim, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options.explicit_path_verbatim, null)
          ospf_instance                = try(path_option.ospf_instance, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options.ospf_instance, null)
          ospf_area_id                 = try(path_option.ospf_area_id, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options.ospf_area_id, null)
          ospf_area_ip_format          = try(path_option.ospf_area_ip_format, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options.ospf_area_ip_format, null)
          isis_instance                = try(path_option.isis_instance, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options.isis_instance, null)
          isis_level                   = try(path_option.isis_level, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options.isis_level, null)
          attribute_set                = try(path_option.attribute_set, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options.attribute_set, null)
          protected_by_index           = try(path_option.protected_by_index, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options.protected_by_index, null)
          protected_by_index_secondary = try(path_option.protected_by_index_secondary, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options.protected_by_index_secondary, null)
          lockdown                     = try(path_option.lockdown, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options.lockdown, null)
          lockdown_sticky              = try(path_option.lockdown_sticky, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_options.lockdown_sticky, null)
        }]
        priority_setup                                                          = try(tunnel.priority_setup, local.defaults.iosxr.devices.configuration.interfaces.tunnels.priority_setup, null)
        priority_hold                                                           = try(tunnel.priority_hold, local.defaults.iosxr.devices.configuration.interfaces.tunnels.priority_hold, null)
        record_route                                                            = try(tunnel.record_route, local.defaults.iosxr.devices.configuration.interfaces.tunnels.record_route, null)
        binding_sid_mpls_label                                                  = try(tunnel.binding_sid_mpls_label, local.defaults.iosxr.devices.configuration.interfaces.tunnels.binding_sid_mpls_label, null)
        policy_classes                                                          = try(tunnel.policy_classes, local.defaults.iosxr.devices.configuration.interfaces.tunnels.policy_classes, null)
        auto_bw_limit_min                                                       = try(tunnel.auto_bw_limit_min, local.defaults.iosxr.devices.configuration.interfaces.tunnels.auto_bw_limit_min, null)
        auto_bw_limit_max                                                       = try(tunnel.auto_bw_limit_max, local.defaults.iosxr.devices.configuration.interfaces.tunnels.auto_bw_limit_max, null)
        auto_bw_collect_only                                                    = try(tunnel.auto_bw_collect_only, local.defaults.iosxr.devices.configuration.interfaces.tunnels.auto_bw_collect_only, null)
        auto_bw_adjustment_threshold_percent                                    = try(tunnel.auto_bw_adjustment_threshold_percent, local.defaults.iosxr.devices.configuration.interfaces.tunnels.auto_bw_adjustment_threshold_percent, null)
        auto_bw_adjustment_threshold_min                                        = try(tunnel.auto_bw_adjustment_threshold_min, local.defaults.iosxr.devices.configuration.interfaces.tunnels.auto_bw_adjustment_threshold_min, null)
        auto_bw_overflow_threshold                                              = try(tunnel.auto_bw_overflow_threshold, local.defaults.iosxr.devices.configuration.interfaces.tunnels.auto_bw_overflow_threshold, null)
        auto_bw_overflow_min                                                    = try(tunnel.auto_bw_overflow_min, local.defaults.iosxr.devices.configuration.interfaces.tunnels.auto_bw_overflow_min, null)
        auto_bw_overflow_limit                                                  = try(tunnel.auto_bw_overflow_limit, local.defaults.iosxr.devices.configuration.interfaces.tunnels.auto_bw_overflow_limit, null)
        auto_bw_underflow_threshold                                             = try(tunnel.auto_bw_underflow_threshold, local.defaults.iosxr.devices.configuration.interfaces.tunnels.auto_bw_underflow_threshold, null)
        auto_bw_underflow_min                                                   = try(tunnel.auto_bw_underflow_min, local.defaults.iosxr.devices.configuration.interfaces.tunnels.auto_bw_underflow_min, null)
        auto_bw_underflow_limit                                                 = try(tunnel.auto_bw_underflow_limit, local.defaults.iosxr.devices.configuration.interfaces.tunnels.auto_bw_underflow_limit, null)
        auto_bw_resignal_last_bandwidth_timeout                                 = try(tunnel.auto_bw_resignal_last_bandwidth_timeout, local.defaults.iosxr.devices.configuration.interfaces.tunnels.auto_bw_resignal_last_bandwidth_timeout, null)
        path_protection                                                         = try(tunnel.path_protection, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_protection, null)
        path_protection_srlg_diverse                                            = try(tunnel.path_protection_srlg_diverse, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_protection_srlg_diverse, null)
        path_protection_non_revertive                                           = try(tunnel.path_protection_non_revertive, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_protection_non_revertive, null)
        soft_preemption                                                         = try(tunnel.soft_preemption, local.defaults.iosxr.devices.configuration.interfaces.tunnels.soft_preemption, null)
        path_selection_metric_igp                                               = try(tunnel.path_selection_metric_igp, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_selection_metric_igp, null)
        path_selection_metric_te                                                = try(tunnel.path_selection_metric_te, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_selection_metric_te, null)
        path_selection_metric_delay                                             = try(tunnel.path_selection_metric_delay, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_selection_metric_delay, null)
        path_selection_tiebreaker_min_fill                                      = try(tunnel.path_selection_tiebreaker_min_fill, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_selection_tiebreaker_min_fill, null)
        path_selection_tiebreaker_max_fill                                      = try(tunnel.path_selection_tiebreaker_max_fill, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_selection_tiebreaker_max_fill, null)
        path_selection_tiebreaker_random                                        = try(tunnel.path_selection_tiebreaker_random, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_selection_tiebreaker_random, null)
        path_selection_hop_limit                                                = try(tunnel.path_selection_hop_limit, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_selection_hop_limit, null)
        path_selection_cost_limit                                               = try(tunnel.path_selection_cost_limit, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_selection_cost_limit, null)
        path_selection_delay_limit                                              = try(tunnel.path_selection_delay_limit, local.defaults.iosxr.devices.configuration.interfaces.tunnels.path_selection_delay_limit, null)
        bidirectional_association_id                                            = try(tunnel.bidirectional_association_id, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bidirectional_association_id, null)
        bidirectional_association_source_address                                = try(tunnel.bidirectional_association_source_address, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bidirectional_association_source_address, null)
        bidirectional_association_global_id                                     = try(tunnel.bidirectional_association_global_id, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bidirectional_association_global_id, null)
        bidirectional_association_corouted                                      = try(tunnel.bidirectional_association_corouted, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bidirectional_association_corouted, null)
        bidirectional_association_co_routed_fault_oam                           = try(tunnel.bidirectional_association_co_routed_fault_oam, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bidirectional_association_co_routed_fault_oam, null)
        bidirectional_association_co_routed_wrap_protection                     = try(tunnel.bidirectional_association_co_routed_wrap_protection, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bidirectional_association_co_routed_wrap_protection, null)
        bidirectional_association_co_routed_signaling_protection_object_disable = try(tunnel.bidirectional_association_co_routed_signaling_protection_object_disable, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bidirectional_association_co_routed_signaling_protection_object_disable, null)
        bfd_fast_detect                                                         = try(tunnel.bfd_fast_detect, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bfd_fast_detect, null)
        bfd_sbfd                                                                = try(tunnel.bfd_sbfd, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bfd_sbfd, null)
        bfd_minimum_interval                                                    = try(tunnel.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bfd_minimum_interval, null)
        bfd_multiplier                                                          = try(tunnel.bfd_multiplier, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bfd_multiplier, null)
        bfd_bringup_timeout                                                     = try(tunnel.bfd_bringup_timeout, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bfd_bringup_timeout, null)
        bfd_lsp_ping_interval                                                   = try(tunnel.bfd_lsp_ping_interval, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bfd_lsp_ping_interval, null)
        bfd_lsp_ping_disable                                                    = try(tunnel.bfd_lsp_ping_disable, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bfd_lsp_ping_disable, null)
        bfd_dampening_initial_wait                                              = try(tunnel.bfd_dampening_initial_wait, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bfd_dampening_initial_wait, null)
        bfd_dampening_maximum_wait                                              = try(tunnel.bfd_dampening_maximum_wait, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bfd_dampening_maximum_wait, null)
        bfd_dampening_secondary_wait                                            = try(tunnel.bfd_dampening_secondary_wait, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bfd_dampening_secondary_wait, null)
        bfd_encap_gal                                                           = try(tunnel.bfd_encap_gal, local.defaults.iosxr.devices.configuration.interfaces.tunnels.bfd_encap_gal, null)
        destination                                                             = try(tunnel.destination, local.defaults.iosxr.devices.configuration.interfaces.tunnels.destination, null)
      } if try(tunnel.type, null) == "tunnel-te"
    ]
  ])
}

resource "iosxr_interface_tunnel_te" "tunnel_te" {
  for_each = { for tunnel in local.interfaces_tunnel_te : tunnel.key => tunnel }
  device   = each.value.device

  name                                                                    = each.value.id
  shutdown                                                                = each.value.shutdown
  logging_events_link_status                                              = each.value.logging_events_link_status
  bandwidth                                                               = each.value.bandwidth
  description                                                             = each.value.description
  load_interval                                                           = each.value.load_interval
  ipv4_address                                                            = each.value.ipv4_address
  ipv4_netmask                                                            = each.value.ipv4_netmask
  ipv4_unnumbered                                                         = each.value.ipv4_unnumbered
  ipv4_forwarding_enable                                                  = each.value.ipv4_forwarding_enable
  ipv4_ttl_propagate_disable                                              = each.value.ipv4_ttl_propagate_disable
  ipv6_enable                                                             = each.value.ipv6_enable
  ipv6_ttl_propagate_disable                                              = each.value.ipv6_ttl_propagate_disable
  mpls_mtu                                                                = each.value.mpls_mtu
  autoroute_announce                                                      = each.value.autoroute_announce
  autoroute_announce_metric_absolute                                      = each.value.autoroute_announce_metric_absolute
  autoroute_announce_metric_relative                                      = each.value.autoroute_announce_metric_relative
  autoroute_announce_metric                                               = each.value.autoroute_announce_metric
  autoroute_announce_include_ipv6                                         = each.value.autoroute_announce_include_ipv6
  autoroute_announce_exclude_traffic_segment_routing                      = each.value.autoroute_announce_exclude_traffic_segment_routing
  autoroute_destinations                                                  = each.value.autoroute_destinations
  backup_bw_pool_type                                                     = each.value.backup_bw_pool_type
  backup_bw_class_type                                                    = each.value.backup_bw_class_type
  backup_bw_value                                                         = each.value.backup_bw_value
  backup_bw_unlimited                                                     = each.value.backup_bw_unlimited
  signalled_bandwidth                                                     = each.value.signalled_bandwidth
  signalled_bandwidth_class_type                                          = each.value.signalled_bandwidth_class_type
  signalled_bandwidth_sub_pool                                            = each.value.signalled_bandwidth_sub_pool
  fast_reroute                                                            = each.value.fast_reroute
  fast_reroute_protect_node                                               = each.value.fast_reroute_protect_node
  fast_reroute_protect_bandwidth                                          = each.value.fast_reroute_protect_bandwidth
  forward_class                                                           = each.value.forward_class
  forwarding_adjacency                                                    = each.value.forwarding_adjacency
  forwarding_adjacency_holdtime                                           = each.value.forwarding_adjacency_holdtime
  forwarding_adjacency_include_ipv6                                       = each.value.forwarding_adjacency_include_ipv6
  load_share                                                              = each.value.load_share
  logging_events_lsp_state                                                = each.value.logging_events_lsp_state
  logging_events_lsp_reoptimize                                           = each.value.logging_events_lsp_reoptimize
  logging_events_lsp_reoptimize_attempts                                  = each.value.logging_events_lsp_reoptimize_attempts
  logging_events_lsp_bw_change                                            = each.value.logging_events_lsp_bw_change
  logging_events_lsp_reroute                                              = each.value.logging_events_lsp_reroute
  logging_events_lsp_record_route                                         = each.value.logging_events_lsp_record_route
  logging_events_lsp_switchover                                           = each.value.logging_events_lsp_switchover
  logging_events_lsp_insufficient_bw                                      = each.value.logging_events_lsp_insufficient_bw
  logging_events_pcalc_failure                                            = each.value.logging_events_pcalc_failure
  logging_events_bfd_status                                               = each.value.logging_events_bfd_status
  logging_events_all                                                      = each.value.logging_events_all
  signalled_name                                                          = each.value.signalled_name
  path_options                                                            = each.value.path_options
  priority_setup                                                          = each.value.priority_setup
  priority_hold                                                           = each.value.priority_hold
  record_route                                                            = each.value.record_route
  binding_sid_mpls_label                                                  = each.value.binding_sid_mpls_label
  policy_classes                                                          = each.value.policy_classes
  auto_bw_limit_min                                                       = each.value.auto_bw_limit_min
  auto_bw_limit_max                                                       = each.value.auto_bw_limit_max
  auto_bw_collect_only                                                    = each.value.auto_bw_collect_only
  auto_bw_adjustment_threshold_percent                                    = each.value.auto_bw_adjustment_threshold_percent
  auto_bw_adjustment_threshold_min                                        = each.value.auto_bw_adjustment_threshold_min
  auto_bw_overflow_threshold                                              = each.value.auto_bw_overflow_threshold
  auto_bw_overflow_min                                                    = each.value.auto_bw_overflow_min
  auto_bw_overflow_limit                                                  = each.value.auto_bw_overflow_limit
  auto_bw_underflow_threshold                                             = each.value.auto_bw_underflow_threshold
  auto_bw_underflow_min                                                   = each.value.auto_bw_underflow_min
  auto_bw_underflow_limit                                                 = each.value.auto_bw_underflow_limit
  auto_bw_resignal_last_bandwidth_timeout                                 = each.value.auto_bw_resignal_last_bandwidth_timeout
  path_protection                                                         = each.value.path_protection
  path_protection_srlg_diverse                                            = each.value.path_protection_srlg_diverse
  path_protection_non_revertive                                           = each.value.path_protection_non_revertive
  soft_preemption                                                         = each.value.soft_preemption
  path_selection_metric_igp                                               = each.value.path_selection_metric_igp
  path_selection_metric_te                                                = each.value.path_selection_metric_te
  path_selection_metric_delay                                             = each.value.path_selection_metric_delay
  path_selection_tiebreaker_min_fill                                      = each.value.path_selection_tiebreaker_min_fill
  path_selection_tiebreaker_max_fill                                      = each.value.path_selection_tiebreaker_max_fill
  path_selection_tiebreaker_random                                        = each.value.path_selection_tiebreaker_random
  path_selection_hop_limit                                                = each.value.path_selection_hop_limit
  path_selection_cost_limit                                               = each.value.path_selection_cost_limit
  path_selection_delay_limit                                              = each.value.path_selection_delay_limit
  bidirectional_association_id                                            = each.value.bidirectional_association_id
  bidirectional_association_source_address                                = each.value.bidirectional_association_source_address
  bidirectional_association_global_id                                     = each.value.bidirectional_association_global_id
  bidirectional_association_corouted                                      = each.value.bidirectional_association_corouted
  bidirectional_association_co_routed_fault_oam                           = each.value.bidirectional_association_co_routed_fault_oam
  bidirectional_association_co_routed_wrap_protection                     = each.value.bidirectional_association_co_routed_wrap_protection
  bidirectional_association_co_routed_signaling_protection_object_disable = each.value.bidirectional_association_co_routed_signaling_protection_object_disable
  bfd_fast_detect                                                         = each.value.bfd_fast_detect
  bfd_sbfd                                                                = each.value.bfd_sbfd
  bfd_minimum_interval                                                    = each.value.bfd_minimum_interval
  bfd_multiplier                                                          = each.value.bfd_multiplier
  bfd_bringup_timeout                                                     = each.value.bfd_bringup_timeout
  bfd_lsp_ping_interval                                                   = each.value.bfd_lsp_ping_interval
  bfd_lsp_ping_disable                                                    = each.value.bfd_lsp_ping_disable
  bfd_dampening_initial_wait                                              = each.value.bfd_dampening_initial_wait
  bfd_dampening_maximum_wait                                              = each.value.bfd_dampening_maximum_wait
  bfd_dampening_secondary_wait                                            = each.value.bfd_dampening_secondary_wait
  bfd_encap_gal                                                           = each.value.bfd_encap_gal
  destination                                                             = each.value.destination

  lifecycle {
    precondition {
      condition     = (each.value.ipv4_address == null && each.value.ipv4_netmask == null) || (each.value.ipv4_address != null && each.value.ipv4_netmask != null)
      error_message = "Interface ${each.key}: ipv4_address and ipv4_netmask must both be specified or both be omitted."
    }
  }

  depends_on = [
    # Future dependencies - uncomment when resource is created:
    #iosxr_vrf.vrf,
  ]
}

##### MPLS LDP #####

resource "iosxr_mpls_ldp" "mpls_ldp" {
  for_each                                                 = { for device in local.devices : device.name => device if try(local.device_config[device.name].mpls_ldp, null) != null || try(local.defaults.iosxr.devices.configuration.mpls_ldp, null) != null }
  device                                                   = each.value.name
  router_id                                                = try(local.device_config[each.value.name].mpls_ldp.router_id, local.defaults.iosxr.devices.configuration.mpls_ldp.router_id, null)
  graceful_restart                                         = try(local.device_config[each.value.name].mpls_ldp.graceful_restart, local.defaults.iosxr.devices.configuration.mpls_ldp.graceful_restart, null)
  graceful_restart_reconnect_timeout                       = try(local.device_config[each.value.name].mpls_ldp.graceful_restart_reconnect_timeout, local.defaults.iosxr.devices.configuration.mpls_ldp.graceful_restart_reconnect_timeout, null)
  graceful_restart_forwarding_state_holdtime               = try(local.device_config[each.value.name].mpls_ldp.graceful_restart_forwarding_state_holdtime, local.defaults.iosxr.devices.configuration.mpls_ldp.graceful_restart_forwarding_state_holdtime, null)
  graceful_restart_helper_peer_maintain_on_local_reset_for = try(local.device_config[each.value.name].mpls_ldp.graceful_restart_helper_peer_maintain_on_local_reset_for, local.defaults.iosxr.devices.configuration.mpls_ldp.graceful_restart_helper_peer_maintain_on_local_reset_for, null)
  ltrace_buffer_multiplier                                 = try(local.device_config[each.value.name].mpls_ldp.ltrace_buffer_multiplier, local.defaults.iosxr.devices.configuration.mpls_ldp.ltrace_buffer_multiplier, null)
  default_vrf_implicit_ipv4_disable                        = try(local.device_config[each.value.name].mpls_ldp.default_vrf_implicit_ipv4_disable, local.defaults.iosxr.devices.configuration.mpls_ldp.default_vrf_implicit_ipv4_disable, null)
  session_backoff_time_initial                             = try(local.device_config[each.value.name].mpls_ldp.session_backoff_time_initial, local.defaults.iosxr.devices.configuration.mpls_ldp.session_backoff_time_initial, null)
  session_backoff_time_maximum                             = try(local.device_config[each.value.name].mpls_ldp.session_backoff_time_maximum, local.defaults.iosxr.devices.configuration.mpls_ldp.session_backoff_time_maximum, null)
  session_holdtime                                         = try(local.device_config[each.value.name].mpls_ldp.session_holdtime, local.defaults.iosxr.devices.configuration.mpls_ldp.session_holdtime, null)
  session_downstream_on_demand_with                        = try(local.device_config[each.value.name].mpls_ldp.session_downstream_on_demand_with, local.defaults.iosxr.devices.configuration.mpls_ldp.session_downstream_on_demand_with, null)
  session_protection                                       = try(local.device_config[each.value.name].mpls_ldp.session_protection, local.defaults.iosxr.devices.configuration.mpls_ldp.session_protection, null)
  session_protection_duration                              = try(local.device_config[each.value.name].mpls_ldp.session_protection_duration, local.defaults.iosxr.devices.configuration.mpls_ldp.session_protection_duration, null)
  session_protection_duration_infinite                     = try(local.device_config[each.value.name].mpls_ldp.session_protection_duration_infinite, local.defaults.iosxr.devices.configuration.mpls_ldp.session_protection_duration_infinite, null)
  session_protection_for_acl                               = try(local.device_config[each.value.name].mpls_ldp.session_protection_for_acl, local.defaults.iosxr.devices.configuration.mpls_ldp.session_protection_for_acl, null)
  session_protection_for_acl_duration                      = try(local.device_config[each.value.name].mpls_ldp.session_protection_for_acl_duration, local.defaults.iosxr.devices.configuration.mpls_ldp.session_protection_for_acl_duration, null)
  session_protection_for_acl_duration_infinite             = try(local.device_config[each.value.name].mpls_ldp.session_protection_for_acl_duration_infinite, local.defaults.iosxr.devices.configuration.mpls_ldp.session_protection_for_acl_duration_infinite, null)
  nsr                                                      = try(local.device_config[each.value.name].mpls_ldp.nsr, local.defaults.iosxr.devices.configuration.mpls_ldp.nsr, null)
  entropy_label                                            = try(local.device_config[each.value.name].mpls_ldp.entropy_label, local.defaults.iosxr.devices.configuration.mpls_ldp.entropy_label, null)
  entropy_label_add_el                                     = try(local.device_config[each.value.name].mpls_ldp.entropy_label_add_el, local.defaults.iosxr.devices.configuration.mpls_ldp.entropy_label_add_el, null)
  signalling_dscp                                          = try(local.device_config[each.value.name].mpls_ldp.signalling_dscp, local.defaults.iosxr.devices.configuration.mpls_ldp.signalling_dscp, null)
  igp_sync_delay_on_session_up                             = try(local.device_config[each.value.name].mpls_ldp.igp_sync_delay_on_session_up, local.defaults.iosxr.devices.configuration.mpls_ldp.igp_sync_delay_on_session_up, null)
  igp_sync_delay_on_proc_restart                           = try(local.device_config[each.value.name].mpls_ldp.igp_sync_delay_on_proc_restart, local.defaults.iosxr.devices.configuration.mpls_ldp.igp_sync_delay_on_proc_restart, null)
  capabilities_sac                                         = try(local.device_config[each.value.name].mpls_ldp.capabilities_sac, local.defaults.iosxr.devices.configuration.mpls_ldp.capabilities_sac, null)
  capabilities_sac_fec128_disable                          = try(local.device_config[each.value.name].mpls_ldp.capabilities_sac_fec128_disable, local.defaults.iosxr.devices.configuration.mpls_ldp.capabilities_sac_fec128_disable, null)
  capabilities_sac_fec129_disable                          = try(local.device_config[each.value.name].mpls_ldp.capabilities_sac_fec129_disable, local.defaults.iosxr.devices.configuration.mpls_ldp.capabilities_sac_fec129_disable, null)
  capabilities_sac_ipv4_disable                            = try(local.device_config[each.value.name].mpls_ldp.capabilities_sac_ipv4_disable, local.defaults.iosxr.devices.configuration.mpls_ldp.capabilities_sac_ipv4_disable, null)
  capabilities_sac_ipv6_disable                            = try(local.device_config[each.value.name].mpls_ldp.capabilities_sac_ipv6_disable, local.defaults.iosxr.devices.configuration.mpls_ldp.capabilities_sac_ipv6_disable, null)
  log_hello_adjacency                                      = try(local.device_config[each.value.name].mpls_ldp.log.hello_adjacency, local.defaults.iosxr.devices.configuration.mpls_ldp.log.hello_adjacency, null)
  log_neighbor                                             = try(local.device_config[each.value.name].mpls_ldp.log.neighbor, local.defaults.iosxr.devices.configuration.mpls_ldp.log.neighbor, null)
  log_nsr                                                  = try(local.device_config[each.value.name].mpls_ldp.log.nsr, local.defaults.iosxr.devices.configuration.mpls_ldp.log.nsr, null)
  log_graceful_restart                                     = try(local.device_config[each.value.name].mpls_ldp.log.graceful_restart, local.defaults.iosxr.devices.configuration.mpls_ldp.log.graceful_restart, null)
  log_session_protection                                   = try(local.device_config[each.value.name].mpls_ldp.log.session_protection, local.defaults.iosxr.devices.configuration.mpls_ldp.log.session_protection, null)
  discovery_hello_holdtime                                 = try(local.device_config[each.value.name].mpls_ldp.discovery.hello_holdtime, local.defaults.iosxr.devices.configuration.mpls_ldp.discovery.hello_holdtime, null)
  discovery_hello_interval                                 = try(local.device_config[each.value.name].mpls_ldp.discovery.hello_interval, local.defaults.iosxr.devices.configuration.mpls_ldp.discovery.hello_interval, null)
  discovery_targeted_hello_holdtime                        = try(local.device_config[each.value.name].mpls_ldp.discovery.targeted_hello_holdtime, local.defaults.iosxr.devices.configuration.mpls_ldp.discovery.targeted_hello_holdtime, null)
  discovery_targeted_hello_interval                        = try(local.device_config[each.value.name].mpls_ldp.discovery.targeted_hello_interval, local.defaults.iosxr.devices.configuration.mpls_ldp.discovery.targeted_hello_interval, null)
  discovery_instance_tlv_disable                           = try(local.device_config[each.value.name].mpls_ldp.discovery.instance_tlv_disable, local.defaults.iosxr.devices.configuration.mpls_ldp.discovery.instance_tlv_disable, null)
  discovery_ds_tlv_disable                                 = try(local.device_config[each.value.name].mpls_ldp.discovery.ds_tlv_disable, local.defaults.iosxr.devices.configuration.mpls_ldp.discovery.ds_tlv_disable, null)
  discovery_rtr_id_arb_tlv_disable                         = try(local.device_config[each.value.name].mpls_ldp.discovery.rtr_id_arb_tlv_disable, local.defaults.iosxr.devices.configuration.mpls_ldp.discovery.rtr_id_arb_tlv_disable, null)
  discovery_quick_start_disable                            = try(local.device_config[each.value.name].mpls_ldp.discovery.quick_start_disable, local.defaults.iosxr.devices.configuration.mpls_ldp.discovery.quick_start_disable, null)
  neighbor_dual_stack_transport_connection_prefer_ipv4     = try(local.device_config[each.value.name].mpls_ldp.neighbor_dual_stack_transport_connection_prefer_ipv4, local.defaults.iosxr.devices.configuration.mpls_ldp.neighbor_dual_stack_transport_connection_prefer_ipv4, null)
  neighbor_dual_stack_transport_connection_max_wait        = try(local.device_config[each.value.name].mpls_ldp.neighbor_dual_stack_transport_connection_max_wait, local.defaults.iosxr.devices.configuration.mpls_ldp.neighbor_dual_stack_transport_connection_max_wait, null)
  neighbor_dual_stack_tlv_compliance                       = try(local.device_config[each.value.name].mpls_ldp.neighbor_dual_stack_tlv_compliance, local.defaults.iosxr.devices.configuration.mpls_ldp.neighbor_dual_stack_tlv_compliance, null)
  neighbors = try(length(local.device_config[each.value.name].mpls_ldp.neighbors) == 0, true) ? null : [for neighbor in local.device_config[each.value.name].mpls_ldp.neighbors : {
    neighbor_address   = try(neighbor.address, local.defaults.iosxr.devices.configuration.mpls_ldp.neighbors.address, null)
    label_space_id     = try(neighbor.label_space_id, local.defaults.iosxr.devices.configuration.mpls_ldp.neighbors.label_space_id, null)
    password_disable   = try(neighbor.password_disable, local.defaults.iosxr.devices.configuration.mpls_ldp.neighbors.password_disable, null)
    password_encrypted = try(neighbor.password, local.defaults.iosxr.devices.configuration.mpls_ldp.neighbors.password, null)
  }]
}

##### MPLS LDP INTERFACE #####

locals {
  mpls_ldp_interfaces = flatten([
    for device in local.devices : [
      for ldp_interface in try(local.device_config[device.name].mpls_ldp.interfaces, []) : {
        key                                  = format("%s/%s", device.name, ldp_interface.name)
        device_name                          = device.name
        interface_name                       = try(ldp_interface.name, local.defaults.iosxr.devices.configuration.mpls_ldp.interfaces.name, null)
        discovery_hello_holdtime             = try(ldp_interface.discovery_hello_holdtime, local.defaults.iosxr.devices.configuration.mpls_ldp.interfaces.discovery_hello_holdtime, null)
        discovery_hello_interval             = try(ldp_interface.discovery_hello_interval, local.defaults.iosxr.devices.configuration.mpls_ldp.interfaces.discovery_hello_interval, null)
        discovery_hello_dual_stack_tlv       = try(ldp_interface.discovery_hello_dual_stack_tlv, local.defaults.iosxr.devices.configuration.mpls_ldp.interfaces.discovery_hello_dual_stack_tlv, null)
        discovery_quick_start_disable        = try(ldp_interface.discovery_quick_start_disable, local.defaults.iosxr.devices.configuration.mpls_ldp.interfaces.discovery_quick_start_disable, null)
        igp_sync_delay_on_session_up         = try(ldp_interface.igp_sync_delay_on_session_up, local.defaults.iosxr.devices.configuration.mpls_ldp.interfaces.igp_sync_delay_on_session_up, null)
        igp_sync_delay_on_session_up_disable = try(ldp_interface.igp_sync_delay_on_session_up_disable, local.defaults.iosxr.devices.configuration.mpls_ldp.interfaces.igp_sync_delay_on_session_up_disable, null)
        address_family = try(length(ldp_interface.address_family) == 0, true) ? null : [
          for af in ldp_interface.address_family : {
            af_name                               = try(af.name, local.defaults.iosxr.devices.configuration.mpls_ldp.interfaces.address_family.name, null)
            discovery_transport_address_interface = try(af.discovery_transport_address_interface, local.defaults.iosxr.devices.configuration.mpls_ldp.interfaces.address_family.discovery_transport_address_interface, null)
            discovery_transport_address_ip        = try(af.discovery_transport_address_ip, local.defaults.iosxr.devices.configuration.mpls_ldp.interfaces.address_family.discovery_transport_address_ip, null)
            igp_auto_config_disable               = try(af.igp_auto_config_disable, local.defaults.iosxr.devices.configuration.mpls_ldp.interfaces.address_family.igp_auto_config_disable, null)
            mldp_disable                          = try(af.mldp_disable, local.defaults.iosxr.devices.configuration.mpls_ldp.interfaces.address_family.mldp_disable, null)
          }
        ]
      }
    ]
    if try(local.device_config[device.name].mpls_ldp.interfaces, null) != null
  ])
}

resource "iosxr_mpls_ldp_interface" "mpls_ldp_interface" {
  for_each                             = { for ldp_interface in local.mpls_ldp_interfaces : ldp_interface.key => ldp_interface }
  device                               = each.value.device_name
  interface_name                       = each.value.interface_name
  discovery_hello_holdtime             = each.value.discovery_hello_holdtime
  discovery_hello_interval             = each.value.discovery_hello_interval
  discovery_hello_dual_stack_tlv       = each.value.discovery_hello_dual_stack_tlv
  discovery_quick_start_disable        = each.value.discovery_quick_start_disable
  igp_sync_delay_on_session_up         = each.value.igp_sync_delay_on_session_up
  igp_sync_delay_on_session_up_disable = each.value.igp_sync_delay_on_session_up_disable
  address_family                       = each.value.address_family

  depends_on = [
    iosxr_mpls_ldp.mpls_ldp,
    iosxr_mpls_ldp_address_family.mpls_ldp_address_family,
  ]
}

##### MPLS LDP ADDRESS FAMILY #####

locals {
  mpls_ldp_address_family = flatten([
    for device in local.devices : [
      for ldp_af in try(local.device_config[device.name].mpls_ldp.address_family, []) : {
        key                                                = format("%s/%s", device.name, ldp_af.name)
        device_name                                        = device.name
        af_name                                            = try(ldp_af.name, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.name, null)
        discovery_transport_address_ipv4                   = try(ldp_af.discovery_transport_address_ipv4, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.discovery_transport_address_ipv4, null)
        discovery_transport_address_ipv6                   = try(ldp_af.discovery_transport_address_ipv6, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.discovery_transport_address_ipv6, null)
        discovery_targeted_hello_accept                    = try(ldp_af.discovery_targeted_hello_accept, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.discovery_targeted_hello_accept, null)
        discovery_targeted_hello_accept_from               = try(ldp_af.discovery_targeted_hello_accept_from, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.discovery_targeted_hello_accept_from, null)
        redistribute_bgp_as                                = try(ldp_af.redistribute_bgp_as, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.redistribute_bgp_as, null)
        redistribute_bgp_advertise_to                      = try(ldp_af.redistribute_bgp_advertise_to, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.redistribute_bgp_advertise_to, null)
        traffic_eng_auto_tunnel_mesh_groups_all            = try(contains(ldp_af.traffic_eng.auto_tunnel_mesh_groups, "all"), false) ? true : null
        label_local_allocate_for_access_list               = try(ldp_af.label.local.allocate_for_access_list, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.local.allocate_for_access_list, null)
        label_local_allocate_for_host_routes               = try(ldp_af.label.local.allocate_for_host_routes, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.local.allocate_for_host_routes, null)
        label_local_default_route                          = try(ldp_af.label.local.default_route, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.local.default_route, null)
        label_local_implicit_null_override_for             = try(ldp_af.label.local.implicit_null_override_for, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.local.implicit_null_override_for, null)
        label_local_advertise_disable                      = try(ldp_af.label.local.advertise.disable, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.local.advertise.disable, null)
        label_local_advertise_explicit_null                = try(ldp_af.label.local.advertise.explicit_null, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.local.advertise.explicit_null, null)
        label_local_advertise_explicit_null_for_acl        = try(ldp_af.label.local.advertise.explicit_null_for_acl, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.local.advertise.explicit_null_for_acl, null)
        label_local_advertise_explicit_null_for_acl_to_acl = try(ldp_af.label.local.advertise.explicit_null_for_acl_to_acl, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.local.advertise.explicit_null_for_acl_to_acl, null)
        label_local_advertise_explicit_null_to_acl         = try(ldp_af.label.local.advertise.explicit_null_to_acl, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.local.advertise.explicit_null_to_acl, null)
        neighbor_ipv4_targeted = try(length([for neighbor in ldp_af.neighbor.targeted : neighbor if can(regex(":", try(neighbor.address, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.neighbor.targeted.address, ""))) == false]) == 0, true) ? null : [
          for neighbor in ldp_af.neighbor.targeted : {
            neighbor_address = try(neighbor.address, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.neighbor.targeted.address, null)
          } if can(regex(":", try(neighbor.address, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.neighbor.targeted.address, ""))) == false
        ]
        neighbor_ipv6_targeted = try(length([for neighbor in ldp_af.neighbor.targeted : neighbor if can(regex(":", try(neighbor.address, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.neighbor.targeted.address, ""))) == true]) == 0, true) ? null : [
          for neighbor in ldp_af.neighbor.targeted : {
            neighbor_address = try(neighbor.address, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.neighbor.targeted.address, null)
          } if can(regex(":", try(neighbor.address, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.neighbor.targeted.address, ""))) == true
        ]
        neighbor_sr_policies = try(length(ldp_af.neighbor.sr_policies) == 0, true) ? null : [
          for policy in ldp_af.neighbor.sr_policies : {
            policy_name = try(policy.name, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.neighbor.sr_policies.name, null)
            targeted    = try(policy.targeted, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.neighbor.sr_policies.targeted, null)
          }
        ]
        traffic_eng_auto_tunnel_mesh_groups = try(length([for group in ldp_af.traffic_eng.auto_tunnel_mesh_groups : group if group != "all"]) == 0, true) ? null : [
          for group in ldp_af.traffic_eng.auto_tunnel_mesh_groups : {
            group_id = try(group, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.traffic_eng.auto_tunnel_mesh_groups, null)
          } if group != "all"
        ]
        label_local_advertise_to_neighbors = try(length(ldp_af.label.local.advertise.neighbors) == 0, true) ? null : [
          for neighbor in ldp_af.label.local.advertise.neighbors : {
            neighbor_address = try(neighbor.address, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.local.advertise.neighbors.address, null)
            label_space_id   = try(neighbor.label_space_id, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.local.advertise.neighbors.label_space_id, null)
            for              = try(neighbor["for"], local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.local.advertise.neighbors["for"], null)
          }
        ]
        label_local_advertise_interfaces = try(length(ldp_af.label.local.advertise.interfaces) == 0, true) ? null : [
          for interface in ldp_af.label.local.advertise.interfaces : {
            interface_name = try(interface.name, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.local.advertise.interfaces.name, null)
          }
        ]
        label_local_advertise_for_access_lists = try(length(ldp_af.label.local.advertise.access_lists) == 0, true) ? null : [
          for acl in ldp_af.label.local.advertise.access_lists : {
            access_list_name = try(acl["for"], local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.local.advertise.access_lists["for"], null)
            to               = try(acl.to, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.local.advertise.access_lists.to, null)
          }
        ]
        label_remote_accept_from_neighbors = try(length(ldp_af.label.remote.accept.neighbors) == 0, true) ? null : [
          for neighbor in ldp_af.label.remote.accept.neighbors : {
            neighbor_address = try(neighbor.address, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.remote.accept.neighbors.address, null)
            label_space_id   = try(neighbor.label_space_id, local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.remote.accept.neighbors.label_space_id, null)
            for              = try(neighbor["for"], local.defaults.iosxr.devices.configuration.mpls_ldp.address_family.label.remote.accept.neighbors["for"], null)
          }
        ]
      }
    ]
    if try(local.device_config[device.name].mpls_ldp.address_family, null) != null
  ])
}

resource "iosxr_mpls_ldp_address_family" "mpls_ldp_address_family" {
  for_each                                           = { for ldp_af in local.mpls_ldp_address_family : ldp_af.key => ldp_af }
  device                                             = each.value.device_name
  af_name                                            = each.value.af_name
  discovery_transport_address_ipv4                   = each.value.discovery_transport_address_ipv4
  discovery_transport_address_ipv6                   = each.value.discovery_transport_address_ipv6
  discovery_targeted_hello_accept                    = each.value.discovery_targeted_hello_accept
  discovery_targeted_hello_accept_from               = each.value.discovery_targeted_hello_accept_from
  redistribute_bgp_as                                = each.value.redistribute_bgp_as
  redistribute_bgp_advertise_to                      = each.value.redistribute_bgp_advertise_to
  traffic_eng_auto_tunnel_mesh_groups_all            = each.value.traffic_eng_auto_tunnel_mesh_groups_all
  label_local_allocate_for_access_list               = each.value.label_local_allocate_for_access_list
  label_local_allocate_for_host_routes               = each.value.label_local_allocate_for_host_routes
  label_local_default_route                          = each.value.label_local_default_route
  label_local_implicit_null_override_for             = each.value.label_local_implicit_null_override_for
  label_local_advertise_disable                      = each.value.label_local_advertise_disable
  label_local_advertise_explicit_null                = each.value.label_local_advertise_explicit_null
  label_local_advertise_explicit_null_for_acl        = each.value.label_local_advertise_explicit_null_for_acl
  label_local_advertise_explicit_null_for_acl_to_acl = each.value.label_local_advertise_explicit_null_for_acl_to_acl
  label_local_advertise_explicit_null_to_acl         = each.value.label_local_advertise_explicit_null_to_acl
  neighbor_ipv4_targeted                             = each.value.neighbor_ipv4_targeted
  neighbor_ipv6_targeted                             = each.value.neighbor_ipv6_targeted
  neighbor_sr_policies                               = each.value.neighbor_sr_policies
  traffic_eng_auto_tunnel_mesh_groups                = each.value.traffic_eng_auto_tunnel_mesh_groups
  label_local_advertise_to_neighbors                 = each.value.label_local_advertise_to_neighbors
  label_local_advertise_interfaces                   = each.value.label_local_advertise_interfaces
  label_local_advertise_for_access_lists             = each.value.label_local_advertise_for_access_lists
  label_remote_accept_from_neighbors                 = each.value.label_remote_accept_from_neighbors

  depends_on = [
    iosxr_ipv4_access_list.ipv4_access_list,
    iosxr_ipv6_access_list.ipv6_access_list,
    iosxr_mpls_ldp.mpls_ldp,
  ]
}

##### MPLS LDP MLDP #####

locals {
  mpls_ldp_mldp = flatten([
    for device in local.devices : [
      {
        key                   = device.name
        device_name           = device.name
        logging_internal      = try(local.device_config[device.name].mpls_ldp.mldp.logging_internal, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.logging_internal, null)
        logging_notifications = try(local.device_config[device.name].mpls_ldp.mldp.logging_notifications, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.logging_notifications, null)
        address_family = try(length(local.device_config[device.name].mpls_ldp.mldp.address_family) == 0, true) ? null : [
          for af in local.device_config[device.name].mpls_ldp.mldp.address_family : {
            name                              = try(af.name, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.name, null)
            carrier_supporting_carrier        = try(af.carrier_supporting_carrier, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.carrier_supporting_carrier, null)
            forwarding_recursive              = try(af.forwarding_recursive, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.forwarding_recursive, null)
            forwarding_recursive_route_policy = try(af.forwarding_recursive_route_policy, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.forwarding_recursive_route_policy, null)
            make_before_break_delay           = try(af.make_before_break_delay, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.make_before_break_delay, null)
            make_before_break_delete_delay    = try(af.make_before_break_delete_delay, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.make_before_break_delete_delay, null)
            make_before_break_route_policy    = try(af.make_before_break_route_policy, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.make_before_break_route_policy, null)
            mofrr_enable                      = try(af.mofrr_enable, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.mofrr_enable, null)
            mofrr_route_policy                = try(af.mofrr_route_policy, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.mofrr_route_policy, null)
            neighbors_route_policy_in         = try(af.neighbor_route_policy_in, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.neighbor_route_policy_in, null)
            neighbors_route_policy_out        = try(af.neighbor_route_policy_out, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.neighbor_route_policy_out, null)
            recursive_fec_enable              = try(af.recursive_fec_enable, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.recursive_fec_enable, null)
            recursive_fec_route_policy        = try(af.recursive_fec_route_policy, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.recursive_fec_route_policy, null)
            rib_unicast_always                = try(af.rib_unicast_always, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.rib_unicast_always, null)
            neighbors = try(length(af.neighbors) == 0, true) ? null : [
              for neighbor in af.neighbors : {
                neighbor_address          = try(neighbor.address, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.neighbors.address, null)
                neighbor_route_policy_in  = try(neighbor.route_policy_in, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.neighbors.route_policy_in, null)
                neighbor_route_policy_out = try(neighbor.route_policy_out, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.neighbors.route_policy_out, null)
              }
            ]
            statics = try(length(af.statics) == 0, true) ? null : [
              for static in af.statics : {
                lsp_address = try(static.root_address, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.statics.root_address, null)
                mp2mp       = try(static.mp2mp, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.statics.mp2mp, null)
                p2mp        = try(static.p2mp, local.defaults.iosxr.devices.configuration.mpls_ldp.mldp.address_family.statics.p2mp, null)
              }
            ]
          }
        ]
      }
    ] if try(local.device_config[device.name].mpls_ldp.mldp, null) != null || try(local.defaults.iosxr.devices.configuration.mpls_ldp.mldp, null) != null
  ])
}

resource "iosxr_mpls_ldp_mldp" "mpls_ldp_mldp" {
  for_each              = { for v in local.mpls_ldp_mldp : v.key => v }
  device                = each.value.device_name
  logging_internal      = each.value.logging_internal
  logging_notifications = each.value.logging_notifications
  address_family        = each.value.address_family

  depends_on = [
    iosxr_mpls_ldp_address_family.mpls_ldp_address_family,
    iosxr_route_policy.route_policy
  ]
}

locals {
  router_isis = flatten([
    for device in local.devices : [
      for isis_process in try(local.device_config[device.name].routing.isis_processes, []) : {
        key                                           = format("%s/%s", device.name, isis_process.id)
        device_name                                   = device.name
        process_id                                    = try(isis_process.id, local.defaults.iosxr.devices.configuration.routing.isis_processes.id, null)
        is_type                                       = try(isis_process.is_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.is_type, null)
        log_adjacency_changes                         = try(isis_process.log_adjacency_changes, local.defaults.iosxr.devices.configuration.routing.isis_processes.log_adjacency_changes, null)
        lsp_gen_interval_initial_wait                 = try(isis_process.lsp_gen_interval_initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_gen_interval_initial_wait, null)
        lsp_gen_interval_maximum_wait                 = try(isis_process.lsp_gen_interval_maximum_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_gen_interval_maximum_wait, null)
        lsp_gen_interval_secondary_wait               = try(isis_process.lsp_gen_interval_secondary_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_gen_interval_secondary_wait, null)
        lsp_password_accept_encrypted                 = try(isis_process.lsp_password_accept_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_accept_encrypted, null)
        lsp_password_hmac_md5_enable_poi              = try(isis_process.lsp_password_hmac_md5_enable_poi, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_hmac_md5_enable_poi, null)
        lsp_password_hmac_md5_encrypted               = try(isis_process.lsp_password_hmac_md5_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_hmac_md5_encrypted, null)
        lsp_password_hmac_md5_send_only               = try(isis_process.lsp_password_hmac_md5_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_hmac_md5_send_only, null)
        lsp_password_hmac_md5_snp_send_only           = try(isis_process.lsp_password_hmac_md5_snp_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_hmac_md5_snp_send_only, null)
        lsp_password_keychain                         = try(isis_process.lsp_password_keychain, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_keychain, null)
        lsp_password_keychain_enable_poi              = try(isis_process.lsp_password_keychain_enable_poi, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_keychain_enable_poi, null)
        lsp_password_keychain_send_only               = try(isis_process.lsp_password_keychain_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_keychain_send_only, null)
        lsp_password_keychain_snp_send_only           = try(isis_process.lsp_password_keychain_snp_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_keychain_snp_send_only, null)
        lsp_password_text_enable_poi                  = try(isis_process.lsp_password_text_enable_poi, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_text_enable_poi, null)
        lsp_password_text_encrypted                   = try(isis_process.lsp_password_text_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_text_encrypted, null)
        lsp_password_text_send_only                   = try(isis_process.lsp_password_text_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_text_send_only, null)
        lsp_password_text_snp_send_only               = try(isis_process.lsp_password_text_snp_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_text_snp_send_only, null)
        lsp_refresh_interval                          = try(isis_process.lsp_refresh_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_refresh_interval, null)
        max_lsp_lifetime                              = try(isis_process.max_lsp_lifetime, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_lsp_lifetime, null)
        nsf_cisco                                     = try(isis_process.nsf_cisco, local.defaults.iosxr.devices.configuration.routing.isis_processes.nsf_cisco, null)
        nsf_ietf                                      = try(isis_process.nsf_ietf, local.defaults.iosxr.devices.configuration.routing.isis_processes.nsf_ietf, null)
        nsf_interface_expires                         = try(isis_process.nsf_interface_expires, local.defaults.iosxr.devices.configuration.routing.isis_processes.nsf_interface_expires, null)
        nsf_interface_timer                           = try(isis_process.nsf_interface_timer, local.defaults.iosxr.devices.configuration.routing.isis_processes.nsf_interface_timer, null)
        nsf_lifetime                                  = try(isis_process.nsf_lifetime, local.defaults.iosxr.devices.configuration.routing.isis_processes.nsf_lifetime, null)
        nsr                                           = try(isis_process.nsr, local.defaults.iosxr.devices.configuration.routing.isis_processes.nsr, null)
        set_overload_bit                              = try(isis_process.set_overload_bit, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit, null)
        set_overload_bit_advertise_external           = try(isis_process.set_overload_bit_advertise_external, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit_advertise_external, null)
        set_overload_bit_advertise_interlevel         = try(isis_process.set_overload_bit_advertise_interlevel, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit_advertise_interlevel, null)
        set_overload_bit_on_startup_time_to_advertise = try(isis_process.set_overload_bit_on_startup_time_to_advertise, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit_on_startup_time_to_advertise, null)
        set_overload_bit_on_startup_wait_for_bgp      = try(isis_process.set_overload_bit_on_startup_wait_for_bgp, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit_on_startup_wait_for_bgp, null)
        distribute_link_state                         = try(isis_process.distribute_link_state, local.defaults.iosxr.devices.configuration.routing.isis_processes.distribute_link_state, null)
        distribute_link_state_instance_id             = try(isis_process.distribute_link_state_instance_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.distribute_link_state_instance_id, null)
        distribute_link_state_level                   = try(isis_process.distribute_link_state_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.distribute_link_state_level, null)
        distribute_link_state_throttle                = try(isis_process.distribute_link_state_throttle, local.defaults.iosxr.devices.configuration.routing.isis_processes.distribute_link_state_throttle, null)
        affinity_maps = try(length(isis_process.affinity_maps) == 0, true) ? null : [for affinity_map in isis_process.affinity_maps : {
          name         = try(affinity_map.name, local.defaults.iosxr.devices.configuration.routing.isis_processes.affinity_maps.name, null)
          bit_position = try(affinity_map.bit_position, local.defaults.iosxr.devices.configuration.routing.isis_processes.affinity_maps.bit_position, null)
          }
        ]
        flex_algos = try(length(isis_process.flex_algos) == 0, true) ? null : [for flex_algo in isis_process.flex_algos : {
          number               = try(flex_algo.algo_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.algo_number, null)
          advertise_definition = try(flex_algo.advertise_definition, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.advertise_definition, null)
          metric_type          = try(flex_algo.metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.metric_type, null)
          }
        ]
        interfaces = try(length(isis_process.interfaces) == 0, true) ? null : [for interface in isis_process.interfaces : {
          interface_name = try(interface.interface_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.interface_id, null)
          circuit_type   = try(interface.circuit_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.circuit_type, null)
          hello_padding  = try(interface.hello_padding, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_padding, null)
          point_to_point = try(interface.point_to_point, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.point_to_point, null)
          state          = try(interface.state, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.state, null)
          priority_levels = try(length(interface.priority_levels) == 0, true) ? null : [for priority_level in interface.priority_levels : {
            level_number = try(priority_level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.priority_levels.level_number, null)
            priority     = try(priority_level.priority, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.priority_levels.priority, null)
            }
          ]
          }
        ]
        lsp_password_accept_levels = try(length(isis_process.lsp_password_accept_levels) == 0, true) ? null : [for lsp_password_accept_level in isis_process.lsp_password_accept_levels : {
          level_number = try(lsp_password_accept_level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_accept_levels.level_number, null)
          encrypted    = try(lsp_password_accept_level.encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_accept_levels.encrypted, null)
          }
        ]
        lsp_password_levels = try(length(isis_process.lsp_password_levels) == 0, true) ? null : [for lsp_password_level in isis_process.lsp_password_levels : {
          level_number           = try(lsp_password_level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.level_number, null)
          text_encrypted         = try(lsp_password_level.text_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.text_encrypted, null)
          text_send_only         = try(lsp_password_level.text_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.text_send_only, null)
          text_snp_send_only     = try(lsp_password_level.text_snp_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.text_snp_send_only, null)
          text_enable_poi        = try(lsp_password_level.text_enable_poi, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.text_enable_poi, null)
          hmac_md5_encrypted     = try(lsp_password_level.hmac_md5_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.hmac_md5_encrypted, null)
          hmac_md5_send_only     = try(lsp_password_level.hmac_md5_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.hmac_md5_send_only, null)
          hmac_md5_snp_send_only = try(lsp_password_level.hmac_md5_snp_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.hmac_md5_snp_send_only, null)
          hmac_md5_enable_poi    = try(lsp_password_level.hmac_md5_enable_poi, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.hmac_md5_enable_poi, null)
          keychain_name          = try(lsp_password_level.keychain_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.keychain_name, null)
          keychain_send_only     = try(lsp_password_level.keychain_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.keychain_send_only, null)
          keychain_snp_send_only = try(lsp_password_level.keychain_snp_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.keychain_snp_send_only, null)
          keychain_enable_poi    = try(lsp_password_level.keychain_enable_poi, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.keychain_enable_poi, null)
          }
        ]
        nets = try(length(isis_process.nets) == 0, true) ? null : [for net in isis_process.nets : {
          net_id = try(net.net_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.nets.net_id, null)
          }
        ]
        set_overload_bit_levels = try(length(isis_process.set_overload_bit_levels) == 0, true) ? null : [for set_overload_bit_level in isis_process.set_overload_bit_levels : {
          level_number                 = try(set_overload_bit_level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit_levels.level_number, null)
          advertise_external           = try(set_overload_bit_level.advertise_external, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit_levels.advertise_external, null)
          advertise_interlevel         = try(set_overload_bit_level.advertise_interlevel, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit_levels.advertise_interlevel, null)
          on_startup_time_to_advertise = try(set_overload_bit_level.on_startup_time_to_advertise, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit_levels.on_startup_time_to_advertise, null)
          on_startup_wait_for_bgp      = try(set_overload_bit_level.on_startup_wait_for_bgp, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit_levels.on_startup_wait_for_bgp, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_router_isis" "router_isis" {
  for_each                                      = { for isis in local.router_isis : isis.key => isis }
  device                                        = each.value.device_name
  process_id                                    = each.value.process_id
  is_type                                       = each.value.is_type
  log_adjacency_changes                         = each.value.log_adjacency_changes
  lsp_gen_interval_initial_wait                 = each.value.lsp_gen_interval_initial_wait
  lsp_gen_interval_maximum_wait                 = each.value.lsp_gen_interval_maximum_wait
  lsp_gen_interval_secondary_wait               = each.value.lsp_gen_interval_secondary_wait
  lsp_password_accept_encrypted                 = each.value.lsp_password_accept_encrypted
  lsp_password_hmac_md5_enable_poi              = each.value.lsp_password_hmac_md5_enable_poi
  lsp_password_hmac_md5_encrypted               = each.value.lsp_password_hmac_md5_encrypted
  lsp_password_hmac_md5_send_only               = each.value.lsp_password_hmac_md5_send_only
  lsp_password_hmac_md5_snp_send_only           = each.value.lsp_password_hmac_md5_snp_send_only
  lsp_password_keychain                         = each.value.lsp_password_keychain
  lsp_password_keychain_enable_poi              = each.value.lsp_password_keychain_enable_poi
  lsp_password_keychain_send_only               = each.value.lsp_password_keychain_send_only
  lsp_password_keychain_snp_send_only           = each.value.lsp_password_keychain_snp_send_only
  lsp_password_text_enable_poi                  = each.value.lsp_password_text_enable_poi
  lsp_password_text_encrypted                   = each.value.lsp_password_text_encrypted
  lsp_password_text_send_only                   = each.value.lsp_password_text_send_only
  lsp_password_text_snp_send_only               = each.value.lsp_password_text_snp_send_only
  lsp_refresh_interval                          = each.value.lsp_refresh_interval
  max_lsp_lifetime                              = each.value.max_lsp_lifetime
  nsf_cisco                                     = each.value.nsf_cisco
  nsf_ietf                                      = each.value.nsf_ietf
  nsf_interface_expires                         = each.value.nsf_interface_expires
  nsf_interface_timer                           = each.value.nsf_interface_timer
  nsf_lifetime                                  = each.value.nsf_lifetime
  nsr                                           = each.value.nsr
  set_overload_bit                              = each.value.set_overload_bit
  set_overload_bit_advertise_external           = each.value.set_overload_bit_advertise_external
  set_overload_bit_advertise_interlevel         = each.value.set_overload_bit_advertise_interlevel
  set_overload_bit_on_startup_time_to_advertise = each.value.set_overload_bit_on_startup_time_to_advertise
  set_overload_bit_on_startup_wait_for_bgp      = each.value.set_overload_bit_on_startup_wait_for_bgp
  distribute_link_state                         = each.value.distribute_link_state
  distribute_link_state_instance_id             = each.value.distribute_link_state_instance_id
  distribute_link_state_level                   = each.value.distribute_link_state_level
  distribute_link_state_throttle                = each.value.distribute_link_state_throttle
  affinity_maps                                 = each.value.affinity_maps
  flex_algos                                    = each.value.flex_algos
  interfaces                                    = each.value.interfaces
  lsp_password_accept_levels                    = each.value.lsp_password_accept_levels
  lsp_password_levels                           = each.value.lsp_password_levels
  nets                                          = each.value.nets
  set_overload_bit_levels                       = each.value.set_overload_bit_levels

  depends_on = [
    # Future dependencies - uncomment when resource is created:
    #iosxr_vrf.vrf,
    iosxr_interface.main_interface,
    iosxr_interface.sub_interface,
    iosxr_route_policy.route_policy,
    iosxr_key_chain.key_chain
  ]
}

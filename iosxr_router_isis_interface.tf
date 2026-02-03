locals {
  router_isis_interface = flatten([
    for device in local.devices : [
      for isis_process in try(local.device_config[device.name].routing.isis_processes, []) : [
        for interface in try(isis_process.interfaces, []) : {
          key                               = format("%s/%s/%s", device.name, isis_process.id, interface.interface_name)
          device_name                       = device.name
          process_id                        = try(isis_process.id, local.defaults.iosxr.devices.configuration.routing.isis_processes.id, null)
          interface_name                    = try(interface.interface_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.interface_name, null)
          mesh_group                        = try(interface.mesh_group, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.mesh_group, null)
          mesh_group_blocked                = try(interface.mesh_group_blocked, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.mesh_group_blocked, null)
          state                             = try(interface.passive, false) ? "passive" : try(interface.shutdown, false) ? "shutdown" : try(interface.suppressed, false) ? "suppressed" : null
          circuit_type                      = try(interface.circuit_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.circuit_type, null)
          csnp_interval                     = try(interface.csnp_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.csnp_interval, null)
          hello_padding                     = try(interface.hello_padding, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_padding, null)
          hello_interval                    = try(interface.hello_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_interval, null)
          hello_multiplier                  = try(interface.hello_multiplier, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_multiplier, null)
          lsp_interval                      = try(interface.lsp_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.lsp_interval, null)
          hello_password_accept_encrypted   = try(interface.hello_password_accept_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_accept_encrypted, null)
          hello_password_text_encrypted     = try(interface.hello_password_text_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_text_encrypted, null)
          hello_password_text_send_only     = try(interface.hello_password_text_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_text_send_only, null)
          hello_password_hmac_md5_encrypted = try(interface.hello_password_hmac_md5_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_hmac_md5_encrypted, null)
          hello_password_hmac_md5_send_only = try(interface.hello_password_hmac_md5_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_hmac_md5_send_only, null)
          hello_password_keychain_name      = try(interface.hello_password_keychain_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_keychain_name, null)
          hello_password_keychain_send_only = try(interface.hello_password_keychain_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_keychain_send_only, null)
          remote_psnp_delay                 = try(interface.remote_psnp_delay, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.remote_psnp_delay, null)
          priority                          = try(interface.priority, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.priority, null)
          point_to_point                    = try(interface.point_to_point, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.point_to_point, null)
          retransmit_interval               = try(interface.retransmit_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.retransmit_interval, null)
          retransmit_throttle_interval      = try(interface.retransmit_throttle_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.retransmit_throttle_interval, null)
          link_down_fast_detect             = try(interface.link_down_fast_detect, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.link_down_fast_detect, null)
          affinity_flex_algos               = try(interface.affinity_flex_algos, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.affinity_flex_algos, null)
          affinity_flex_algos_anomalies     = try(interface.affinity_flex_algos_anomalies, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.affinity_flex_algos_anomalies, null)
          override_metrics                  = try(interface.override_metrics, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.override_metrics, null)
          delay_normalize_interval          = try(interface.delay_normalize_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.delay_normalize_interval, null)
          delay_normalize_offset            = try(interface.delay_normalize_offset, interface.delay_normalize_interval != null ? 0 : null, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.delay_normalize_offset, null)
          mpls_ldp_sync                     = try(interface.mpls_ldp_sync, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.mpls_ldp_sync, null)
          mpls_ldp_sync_level               = try(interface.mpls_ldp_sync_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.mpls_ldp_sync_level, null)
          bfd_fast_detect_ipv4              = try(interface.bfd_fast_detect_ipv4, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.bfd_fast_detect_ipv4, null)
          bfd_fast_detect_ipv6              = try(interface.bfd_fast_detect_ipv6, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.bfd_fast_detect_ipv6, null)
          bfd_minimum_interval              = try(interface.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.bfd_minimum_interval, null)
          bfd_multiplier                    = try(interface.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.bfd_multiplier, null)
          csnp_interval_levels = try(length(interface.csnp_interval_levels) == 0, true) ? null : [for level in interface.csnp_interval_levels : {
            level_number  = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.csnp_interval_levels.level_number, null)
            csnp_interval = try(level.csnp_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.csnp_interval_levels.csnp_interval, null)
            }
          ]
          hello_padding_levels = try(length(interface.hello_padding_levels) == 0, true) ? null : [for level in interface.hello_padding_levels : {
            level_number  = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_padding_levels.level_number, null)
            hello_padding = try(level.hello_padding, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_padding_levels.hello_padding, null)
            }
          ]
          hello_interval_levels = try(length(interface.hello_interval_levels) == 0, true) ? null : [for level in interface.hello_interval_levels : {
            level_number   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_interval_levels.level_number, null)
            hello_interval = try(level.hello_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_interval_levels.hello_interval, null)
            }
          ]
          hello_multiplier_levels = try(length(interface.hello_multiplier_levels) == 0, true) ? null : [for level in interface.hello_multiplier_levels : {
            level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_multiplier_levels.level_number, null)
            hello_multiplier = try(level.hello_multiplier, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_multiplier_levels.hello_multiplier, null)
            }
          ]
          lsp_interval_levels = try(length(interface.lsp_interval_levels) == 0, true) ? null : [for level in interface.lsp_interval_levels : {
            level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.lsp_interval_levels.level_number, null)
            lsp_interval = try(level.lsp_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.lsp_interval_levels.lsp_interval, null)
            }
          ]
          hello_password_accepts_levels = try(length(interface.hello_password_accepts_levels) == 0, true) ? null : [for level in interface.hello_password_accepts_levels : {
            level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_accepts_levels.level_number, null)
            encrypted    = try(level.encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_accepts_levels.encrypted, null)
            }
          ]
          hello_password_levels = try(length(interface.hello_password_levels) == 0, true) ? null : [for level in interface.hello_password_levels : {
            level_number       = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_levels.level_number, null)
            text_encrypted     = try(level.text_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_levels.text_encrypted, null)
            text_send_only     = try(level.text_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_levels.text_send_only, null)
            hmac_md5_encrypted = try(level.hmac_md5_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_levels.hmac_md5_encrypted, null)
            hmac_md5_send_only = try(level.hmac_md5_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_levels.hmac_md5_send_only, null)
            keychain_name      = try(level.keychain_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_levels.keychain_name, null)
            keychain_send_only = try(level.keychain_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_levels.keychain_send_only, null)
            }
          ]
          priority_levels = try(length(interface.priority_levels) == 0, true) ? null : [for level in interface.priority_levels : {
            level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.priority_levels.level_number, null)
            priority     = try(level.priority, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.priority_levels.priority, null)
            }
          ]
          retransmit_interval_levels = try(length(interface.retransmit_interval_levels) == 0, true) ? null : [for level in interface.retransmit_interval_levels : {
            level_number        = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.retransmit_interval_levels.level_number, null)
            retransmit_interval = try(level.retransmit_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.retransmit_interval_levels.retransmit_interval, null)
            }
          ]
          retransmit_throttle_interval_levels = try(length(interface.retransmit_throttle_interval_levels) == 0, true) ? null : [for level in interface.retransmit_throttle_interval_levels : {
            level_number                 = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.retransmit_throttle_interval_levels.level_number, null)
            retransmit_throttle_interval = try(level.retransmit_throttle_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.retransmit_throttle_interval_levels.retransmit_throttle_interval, null)
            }
          ]
        }
      ]
    ]
  ])
}

resource "iosxr_router_isis_interface" "router_isis_interface" {
  for_each                            = { for interface in local.router_isis_interface : interface.key => interface }
  device                              = each.value.device_name
  process_id                          = each.value.process_id
  interface_name                      = each.value.interface_name
  mesh_group                          = each.value.mesh_group
  mesh_group_blocked                  = each.value.mesh_group_blocked
  state                               = each.value.state
  circuit_type                        = each.value.circuit_type
  csnp_interval                       = each.value.csnp_interval
  hello_padding                       = each.value.hello_padding
  hello_interval                      = each.value.hello_interval
  hello_multiplier                    = each.value.hello_multiplier
  lsp_interval                        = each.value.lsp_interval
  hello_password_accept_encrypted     = each.value.hello_password_accept_encrypted
  hello_password_text_encrypted       = each.value.hello_password_text_encrypted
  hello_password_text_send_only       = each.value.hello_password_text_send_only
  hello_password_hmac_md5_encrypted   = each.value.hello_password_hmac_md5_encrypted
  hello_password_hmac_md5_send_only   = each.value.hello_password_hmac_md5_send_only
  hello_password_keychain_name        = each.value.hello_password_keychain_name
  hello_password_keychain_send_only   = each.value.hello_password_keychain_send_only
  remote_psnp_delay                   = each.value.remote_psnp_delay
  priority                            = each.value.priority
  point_to_point                      = each.value.point_to_point
  retransmit_interval                 = each.value.retransmit_interval
  retransmit_throttle_interval        = each.value.retransmit_throttle_interval
  link_down_fast_detect               = each.value.link_down_fast_detect
  affinity_flex_algos                 = each.value.affinity_flex_algos
  affinity_flex_algos_anomalies       = each.value.affinity_flex_algos_anomalies
  override_metrics                    = each.value.override_metrics
  delay_normalize_interval            = each.value.delay_normalize_interval
  delay_normalize_offset              = each.value.delay_normalize_offset
  mpls_ldp_sync                       = each.value.mpls_ldp_sync
  mpls_ldp_sync_level                 = each.value.mpls_ldp_sync_level
  bfd_fast_detect_ipv4                = each.value.bfd_fast_detect_ipv4
  bfd_fast_detect_ipv6                = each.value.bfd_fast_detect_ipv6
  bfd_minimum_interval                = each.value.bfd_minimum_interval
  bfd_multiplier                      = each.value.bfd_multiplier
  csnp_interval_levels                = each.value.csnp_interval_levels
  hello_padding_levels                = each.value.hello_padding_levels
  hello_interval_levels               = each.value.hello_interval_levels
  hello_multiplier_levels             = each.value.hello_multiplier_levels
  lsp_interval_levels                 = each.value.lsp_interval_levels
  hello_password_accepts_levels       = each.value.hello_password_accepts_levels
  hello_password_levels               = each.value.hello_password_levels
  priority_levels                     = each.value.priority_levels
  retransmit_interval_levels          = each.value.retransmit_interval_levels
  retransmit_throttle_interval_levels = each.value.retransmit_throttle_interval_levels

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_isis_address_family.ipv4_unicast,
    iosxr_router_isis_address_family.ipv4_multicast,
    iosxr_router_isis_address_family.ipv6_unicast,
    iosxr_router_isis_address_family.ipv6_multicast
  ]
}

locals {
  router_isis = flatten([
    for device in local.devices : [
      for isis_process in try(local.device_config[device.name].routing.isis_processes, []) : {
        key                                          = format("%s/%s", device.name, isis_process.id)
        device_name                                  = device.name
        process_id                                   = try(isis_process.id, local.defaults.iosxr.devices.configuration.routing.isis_processes.id, null)
        segment_routing_global_block_lower_bound     = try(isis_process.segment_routing_global_block_lower_bound, local.defaults.iosxr.devices.configuration.routing.isis_processes.segment_routing_global_block_lower_bound, null)
        segment_routing_global_block_upper_bound     = try(isis_process.segment_routing_global_block_upper_bound, local.defaults.iosxr.devices.configuration.routing.isis_processes.segment_routing_global_block_upper_bound, null)
        receive_application_flex_algo_delay_app_only = try(isis_process.receive_application_flex_algo_delay_app_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.receive_application_flex_algo_delay_app_only, null)
        lsp_refresh_interval                         = try(isis_process.lsp_refresh_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_refresh_interval, null)
        oor_set_overload_bit_disable                 = try(isis_process.oor_set_overload_bit_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.oor_set_overload_bit_disable, null)
        set_overload_bit                             = try(isis_process.set_overload_bit.enable, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit.enable, null)
        set_overload_bit_on_startup_time             = try(isis_process.set_overload_bit.on_startup_time, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit.on_startup_time, null)
        set_overload_bit_on_startup_wait_for_bgp     = try(isis_process.set_overload_bit.on_startup_wait_for_bgp, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit.on_startup_wait_for_bgp, null)
        set_overload_bit_advertise_external          = try(isis_process.set_overload_bit.advertise_external, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit.advertise_external, null)
        set_overload_bit_advertise_interlevel        = try(isis_process.set_overload_bit.advertise_interlevel, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit.advertise_interlevel, null)
        lsp_mtu                                      = try(isis_process.lsp_mtu, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_mtu, null)
        extended_admin_group                         = try(isis_process.extended_admin_group, local.defaults.iosxr.devices.configuration.routing.isis_processes.extended_admin_group, null)
        nsr                                          = try(isis_process.nsr, local.defaults.iosxr.devices.configuration.routing.isis_processes.nsr, null)
        nsr_restart_time                             = try(isis_process.nsr_restart_time, local.defaults.iosxr.devices.configuration.routing.isis_processes.nsr_restart_time, null)
        nsf_cisco                                    = try(isis_process.nsf_cisco, local.defaults.iosxr.devices.configuration.routing.isis_processes.nsf_cisco, null)
        nsf_ietf                                     = try(isis_process.nsf_ietf, local.defaults.iosxr.devices.configuration.routing.isis_processes.nsf_ietf, null)
        nsf_lifetime                                 = try(isis_process.nsf_lifetime, local.defaults.iosxr.devices.configuration.routing.isis_processes.nsf_lifetime, null)
        nsf_interface_timer                          = try(isis_process.nsf_interface_timer, local.defaults.iosxr.devices.configuration.routing.isis_processes.nsf_interface_timer, null)
        nsf_interface_expires                        = try(isis_process.nsf_interface_expires, local.defaults.iosxr.devices.configuration.routing.isis_processes.nsf_interface_expires, null)
        lsp_check_interval                           = try(isis_process.lsp_check_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_check_interval, null)
        lsp_gen_interval_maximum_wait                = try(isis_process.lsp_gen_interval_maximum_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_gen_interval_maximum_wait, null)
        lsp_gen_interval_initial_wait                = try(isis_process.lsp_gen_interval_initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_gen_interval_initial_wait, null)
        lsp_gen_interval_secondary_wait              = try(isis_process.lsp_gen_interval_secondary_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_gen_interval_secondary_wait, null)
        adjacency_stagger                            = try(isis_process.adjacency_stagger, local.defaults.iosxr.devices.configuration.routing.isis_processes.adjacency_stagger, null)
        adjacency_stagger_initial_neighbors          = try(isis_process.adjacency_stagger_initial_neighbors, local.defaults.iosxr.devices.configuration.routing.isis_processes.adjacency_stagger_initial_neighbors, null)
        adjacency_stagger_max_neighbors              = try(isis_process.adjacency_stagger_max_neighbors, local.defaults.iosxr.devices.configuration.routing.isis_processes.adjacency_stagger_max_neighbors, null)
        hostname_dynamic_disable                     = try(isis_process.hostname_dynamic_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.hostname_dynamic_disable, null)
        is_type                                      = try(isis_process.is_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.is_type, null)
        multi_part_tlv_disable                       = try(isis_process.multi_part_tlv_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.multi_part_tlv_disable, null)
        multi_part_tlv_disable_neighbor              = try(isis_process.multi_part_tlv_disable_neighbor, local.defaults.iosxr.devices.configuration.routing.isis_processes.multi_part_tlv_disable_neighbor, null)
        multi_part_tlv_disable_prefix_tlvs           = try(isis_process.multi_part_tlv_disable_prefix_tlvs, local.defaults.iosxr.devices.configuration.routing.isis_processes.multi_part_tlv_disable_prefix_tlvs, null)
        multi_part_tlv_disable_router_capability     = try(isis_process.multi_part_tlv_disable_router_capability, local.defaults.iosxr.devices.configuration.routing.isis_processes.multi_part_tlv_disable_router_capability, null)
        log_adjacency_changes                        = try(isis_process.log_adjacency_changes, local.defaults.iosxr.devices.configuration.routing.isis_processes.log_adjacency_changes, null)
        log_pdu_drops                                = try(isis_process.log_pdu_drops, local.defaults.iosxr.devices.configuration.routing.isis_processes.log_pdu_drops, null)
        log_format_brief                             = try(isis_process.log_format_brief, local.defaults.iosxr.devices.configuration.routing.isis_processes.log_format_brief, null)
        lsp_password_accept_encrypted                = try(isis_process.lsp_password_accept_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_accept_encrypted, null)
        lsp_password_text_encrypted                  = try(isis_process.lsp_password_text_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_text_encrypted, null)
        lsp_password_text_send_only                  = try(isis_process.lsp_password_text_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_text_send_only, null)
        lsp_password_text_snp_send_only              = try(isis_process.lsp_password_text_snp_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_text_snp_send_only, null)
        lsp_password_text_enable_poi                 = try(isis_process.lsp_password_text_enable_poi, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_text_enable_poi, null)
        lsp_password_hmac_md5_encrypted              = try(isis_process.lsp_password_hmac_md5_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_hmac_md5_encrypted, null)
        lsp_password_hmac_md5_send_only              = try(isis_process.lsp_password_hmac_md5_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_hmac_md5_send_only, null)
        lsp_password_hmac_md5_snp_send_only          = try(isis_process.lsp_password_hmac_md5_snp_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_hmac_md5_snp_send_only, null)
        lsp_password_hmac_md5_enable_poi             = try(isis_process.lsp_password_hmac_md5_enable_poi, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_hmac_md5_enable_poi, null)
        lsp_password_keychain                        = try(isis_process.lsp_password_keychain, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_keychain, null)
        lsp_password_keychain_send_only              = try(isis_process.lsp_password_keychain_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_keychain_send_only, null)
        lsp_password_keychain_snp_send_only          = try(isis_process.lsp_password_keychain_snp_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_keychain_snp_send_only, null)
        lsp_password_keychain_enable_poi             = try(isis_process.lsp_password_keychain_enable_poi, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_keychain_enable_poi, null)
        authentication_check_disable                 = try(isis_process.authentication_check_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.authentication_check_disable, null)
        iid_disable                                  = try(isis_process.iid_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.iid_disable, null)
        mpls_ldp_sync                                = try(isis_process.mpls_ldp_sync, local.defaults.iosxr.devices.configuration.routing.isis_processes.mpls_ldp_sync, null)
        mpls_ldp_sync_level                          = try(isis_process.mpls_ldp_sync_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.mpls_ldp_sync_level, null)
        protocol_shutdown                            = try(isis_process.protocol_shutdown, local.defaults.iosxr.devices.configuration.routing.isis_processes.protocol_shutdown, null)
        min_lsp_arrival_initial_wait                 = try(isis_process.min_lsp_arrival_initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.min_lsp_arrival_initial_wait, null)
        min_lsp_arrival_secondary_wait               = try(isis_process.min_lsp_arrival_secondary_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.min_lsp_arrival_secondary_wait, null)
        min_lsp_arrival_maximum_wait                 = try(isis_process.min_lsp_arrival_maximum_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.min_lsp_arrival_maximum_wait, null)
        max_metric                                   = try(isis_process.max_metric.enable, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric.enable, null)
        max_metric_on_startup_advertise              = try(isis_process.max_metric.on_startup_advertise, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric.on_startup_advertise, null)
        max_metric_on_startup_wait_for_bgp           = try(isis_process.max_metric.on_startup_wait_for_bgp, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric.on_startup_wait_for_bgp, null)
        max_metric_external                          = try(isis_process.max_metric.external, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric.external, null)
        max_metric_interlevel                        = try(isis_process.max_metric.interlevel, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric.interlevel, null)
        max_metric_default_route                     = try(isis_process.max_metric.default_route, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric.default_route, null)
        max_metric_srv6_locator                      = try(isis_process.max_metric.srv6_locator, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric.srv6_locator, null)
        max_metric_te                                = try(isis_process.max_metric.te, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric.te, null)
        max_metric_delay                             = try(isis_process.max_metric.delay, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric.delay, null)
        distribute_link_state                        = try(isis_process.distribute_link_state, local.defaults.iosxr.devices.configuration.routing.isis_processes.distribute_link_state, null)
        distribute_link_state_level                  = try(isis_process.distribute_link_state_level, local.defaults.iosxr.devices.configuration.routing.isis_processes.distribute_link_state_level, null)
        distribute_link_state_instance_id            = try(isis_process.distribute_link_state_instance_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.distribute_link_state_instance_id, null)
        distribute_link_state_throttle               = try(isis_process.distribute_link_state_throttle, local.defaults.iosxr.devices.configuration.routing.isis_processes.distribute_link_state_throttle, null)
        distribute_link_state_exclude_interarea      = try(isis_process.distribute_link_state_exclude_interarea, local.defaults.iosxr.devices.configuration.routing.isis_processes.distribute_link_state_exclude_interarea, null)
        distribute_link_state_exclude_external       = try(isis_process.distribute_link_state_exclude_external, local.defaults.iosxr.devices.configuration.routing.isis_processes.distribute_link_state_exclude_external, null)
        distribute_link_state_route_policy           = try(isis_process.distribute_link_state_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.distribute_link_state_route_policy, null)
        max_lsp_lifetime                             = try(isis_process.max_lsp_lifetime, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_lsp_lifetime, null)
        instance_id                                  = try(isis_process.instance_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.instance_id, null)
        hello_padding                                = try(isis_process.hello_padding, local.defaults.iosxr.devices.configuration.routing.isis_processes.hello_padding, null)
        lsp_fast_flooding                            = try(isis_process.lsp_fast_flooding, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_fast_flooding, null)
        lsp_fast_flooding_max_lsp_tx                 = try(isis_process.lsp_fast_flooding_max_lsp_tx, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_fast_flooding_max_lsp_tx, null)
        lsp_fast_flooding_remote_psnp_delay          = try(isis_process.lsp_fast_flooding_remote_psnp_delay, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_fast_flooding_remote_psnp_delay, null)
        psnp_interval                                = try(isis_process.psnp_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.psnp_interval, null)
        ignore_lsp_errors_disable                    = try(isis_process.ignore_lsp_errors_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.ignore_lsp_errors_disable, null)
        purge_transmit_strict                        = try(isis_process.purge_transmit_strict, local.defaults.iosxr.devices.configuration.routing.isis_processes.purge_transmit_strict, null)
        purge_transmit_strict_value                  = try(isis_process.purge_transmit_strict_value, local.defaults.iosxr.devices.configuration.routing.isis_processes.purge_transmit_strict_value, null)
        srlg_admin_weight                            = try(isis_process.srlg_admin_weight, local.defaults.iosxr.devices.configuration.routing.isis_processes.srlg_admin_weight, null)
        lsp_refresh_interval_levels = try(length(isis_process.lsp_refresh_interval_levels) == 0, true) ? null : [for level in isis_process.lsp_refresh_interval_levels : {
          level_number         = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_refresh_interval_levels.level_number, null)
          lsp_refresh_interval = try(level.lsp_refresh_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_refresh_interval_levels.lsp_refresh_interval, null)
          }
        ]
        set_overload_bit_levels = try(length(isis_process.set_overload_bit_levels) == 0, true) ? null : [for level in isis_process.set_overload_bit_levels : {
          level_number                 = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit_levels.level_number, null)
          on_startup_time_to_advertise = try(level.on_startup_time_to_advertise, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit_levels.on_startup_time_to_advertise, null)
          on_startup_wait_for_bgp      = try(level.on_startup_wait_for_bgp, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit_levels.on_startup_wait_for_bgp, null)
          advertise_external           = try(level.advertise_external, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit_levels.advertise_external, null)
          advertise_interlevel         = try(level.advertise_interlevel, local.defaults.iosxr.devices.configuration.routing.isis_processes.set_overload_bit_levels.advertise_interlevel, null)
          }
        ]
        lsp_mtu_levels = try(length(isis_process.lsp_mtu_levels) == 0, true) ? null : [for level in isis_process.lsp_mtu_levels : {
          level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_mtu_levels.level_number, null)
          lsp_mtu      = try(level.lsp_mtu, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_mtu_levels.lsp_mtu, null)
          }
        ]
        multi_part_tlv_disable_levels = try(length(isis_process.multi_part_tlv_disable_levels) == 0, true) ? null : [for level in isis_process.multi_part_tlv_disable_levels : {
          level_number      = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.multi_part_tlv_disable_levels.level_number, null)
          neighbor          = try(level.neighbor, local.defaults.iosxr.devices.configuration.routing.isis_processes.multi_part_tlv_disable_levels.neighbor, null)
          prefix_tlvs       = try(level.prefix_tlvs, local.defaults.iosxr.devices.configuration.routing.isis_processes.multi_part_tlv_disable_levels.prefix_tlvs, null)
          router_capability = try(level.router_capability, local.defaults.iosxr.devices.configuration.routing.isis_processes.multi_part_tlv_disable_levels.router_capability, null)
          }
        ]
        log_sizes = try(length(isis_process.log_sizes) == 0, true) ? null : [for log_size in isis_process.log_sizes : {
          log_type    = try(log_size.log_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.log_sizes.log_type, null)
          size_number = try(log_size.size_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.log_sizes.size_number, null)
          }
        ]
        lsp_password_accept_levels = try(length(isis_process.lsp_password_accept_levels) == 0, true) ? null : [for level in isis_process.lsp_password_accept_levels : {
          level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_accept_levels.level_number, null)
          encrypted    = try(level.encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_accept_levels.encrypted, null)
          }
        ]
        lsp_password_levels = try(length(isis_process.lsp_password_levels) == 0, true) ? null : [for level in isis_process.lsp_password_levels : {
          level_number           = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.level_number, null)
          text_encrypted         = try(level.text_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.text_encrypted, null)
          text_send_only         = try(level.text_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.text_send_only, null)
          text_snp_send_only     = try(level.text_snp_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.text_snp_send_only, null)
          text_enable_poi        = try(level.text_enable_poi, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.text_enable_poi, null)
          hmac_md5_encrypted     = try(level.hmac_md5_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.hmac_md5_encrypted, null)
          hmac_md5_send_only     = try(level.hmac_md5_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.hmac_md5_send_only, null)
          hmac_md5_snp_send_only = try(level.hmac_md5_snp_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.hmac_md5_snp_send_only, null)
          hmac_md5_enable_poi    = try(level.hmac_md5_enable_poi, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.hmac_md5_enable_poi, null)
          keychain_name          = try(level.keychain_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.keychain_name, null)
          keychain_send_only     = try(level.keychain_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.keychain_send_only, null)
          keychain_snp_send_only = try(level.keychain_snp_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.keychain_snp_send_only, null)
          keychain_enable_poi    = try(level.keychain_enable_poi, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_password_levels.keychain_enable_poi, null)
          }
        ]
        lsp_check_interval_levels = try(length(isis_process.lsp_check_interval_levels) == 0, true) ? null : [for level in isis_process.lsp_check_interval_levels : {
          level_number       = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_check_interval_levels.level_number, null)
          lsp_check_interval = try(level.lsp_check_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_check_interval_levels.lsp_check_interval, null)
          }
        ]
        lsp_gen_interval_levels = try(length(isis_process.lsp_gen_interval_levels) == 0, true) ? null : [for level in isis_process.lsp_gen_interval_levels : {
          level_number   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_gen_interval_levels.level_number, null)
          initial_wait   = try(level.initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_gen_interval_levels.initial_wait, null)
          secondary_wait = try(level.secondary_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_gen_interval_levels.secondary_wait, null)
          maximum_wait   = try(level.maximum_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.lsp_gen_interval_levels.maximum_wait, null)
          }
        ]
        min_lsp_arrival_levels = try(length(isis_process.min_lsp_arrival_levels) == 0, true) ? null : [for level in isis_process.min_lsp_arrival_levels : {
          level_number   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.min_lsp_arrival_levels.level_number, null)
          initial_wait   = try(level.initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.min_lsp_arrival_levels.initial_wait, null)
          secondary_wait = try(level.secondary_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.min_lsp_arrival_levels.secondary_wait, null)
          maximum_wait   = try(level.maximum_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.min_lsp_arrival_levels.maximum_wait, null)
          }
        ]
        max_metric_levels = try(length(isis_process.max_metric_levels) == 0, true) ? null : [for level in isis_process.max_metric_levels : {
          level_number            = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric_levels.level_number, null)
          on_startup_advertise    = try(level.on_startup_advertise, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric_levels.on_startup_advertise, null)
          on_startup_wait_for_bgp = try(level.on_startup_wait_for_bgp, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric_levels.on_startup_wait_for_bgp, null)
          external                = try(level.external, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric_levels.external, null)
          interlevel              = try(level.interlevel, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric_levels.interlevel, null)
          default_route           = try(level.default_route, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric_levels.default_route, null)
          srv6_locator            = try(level.srv6_locator, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric_levels.srv6_locator, null)
          te                      = try(level.te, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric_levels.te, null)
          delay                   = try(level.delay, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_metric_levels.delay, null)
          }
        ]
        max_lsp_lifetime_levels = try(length(isis_process.max_lsp_lifetime_levels) == 0, true) ? null : [for level in isis_process.max_lsp_lifetime_levels : {
          level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_lsp_lifetime_levels.level_number, null)
          max_lsp_lifetime = try(level.max_lsp_lifetime, local.defaults.iosxr.devices.configuration.routing.isis_processes.max_lsp_lifetime_levels.max_lsp_lifetime, null)
          }
        ]
        nets = try(length(isis_process.nets) == 0, true) ? null : [for net in isis_process.nets : {
          net_id = try(net.net_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.nets.net_id, null)
          }
        ]
        affinity_maps = try(length(isis_process.affinity_maps) == 0, true) ? null : [for affinity_map in isis_process.affinity_maps : {
          affinity_name = try(affinity_map.affinity_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.affinity_maps.affinity_name, null)
          bit_position  = try(affinity_map.bit_position, local.defaults.iosxr.devices.configuration.routing.isis_processes.affinity_maps.bit_position, null)
          }
        ]
        srlg_names = try(length(isis_process.srlg_names) == 0, true) ? null : [for srlg_name in isis_process.srlg_names : {
          srlg_name    = try(srlg_name.srlg_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.srlg_names.srlg_name, null)
          admin_weight = try(srlg_name.admin_weight, local.defaults.iosxr.devices.configuration.routing.isis_processes.srlg_names.admin_weight, null)
          static_ipv4_addresses = try(length(srlg_name.static_ipv4_addresses) == 0, true) ? null : [for addr in srlg_name.static_ipv4_addresses : {
            local_end_point  = try(addr.local_end_point, local.defaults.iosxr.devices.configuration.routing.isis_processes.srlg_names.static_ipv4_addresses.local_end_point, null)
            remote_end_point = try(addr.remote_end_point, local.defaults.iosxr.devices.configuration.routing.isis_processes.srlg_names.static_ipv4_addresses.remote_end_point, null)
            }
          ]
          }
        ]
        flex_algos = try(length(isis_process.flex_algos) == 0, true) ? null : [for flex_algo in isis_process.flex_algos : {
          number                                    = try(flex_algo.number, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.number, null)
          minimum_bandwidth                         = try(flex_algo.minimum_bandwidth, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.minimum_bandwidth, null)
          maximum_delay                             = try(flex_algo.maximum_delay, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.maximum_delay, null)
          priority                                  = try(flex_algo.priority, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.priority, null)
          metric_type                               = try(flex_algo.metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.metric_type, null)
          advertise_definition                      = try(flex_algo.advertise_definition, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.advertise_definition, null)
          prefix_metric                             = try(flex_algo.prefix_metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.prefix_metric, null)
          auto_cost_reference_bandwidth             = try(flex_algo.auto_cost_reference_bandwidth, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.auto_cost_reference_bandwidth, null)
          auto_cost_reference_bandwidth_granularity = try(flex_algo.auto_cost_reference_bandwidth_granularity, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.auto_cost_reference_bandwidth_granularity, null)
          auto_cost_reference_group_mode            = try(flex_algo.auto_cost_reference_group_mode, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.auto_cost_reference_group_mode, null)
          affinity_exclude_any                      = try(flex_algo.affinity_exclude_any, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.affinity_exclude_any, null)
          affinity_include_any                      = try(flex_algo.affinity_include_any, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.affinity_include_any, null)
          affinity_include_all                      = try(flex_algo.affinity_include_all, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.affinity_include_all, null)
          affinity_reverse_exclude_any              = try(flex_algo.affinity_reverse_exclude_any, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.affinity_reverse_exclude_any, null)
          affinity_reverse_include_any              = try(flex_algo.affinity_reverse_include_any, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.affinity_reverse_include_any, null)
          affinity_reverse_include_all              = try(flex_algo.affinity_reverse_include_all, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.affinity_reverse_include_all, null)
          srlg_exclude_any                          = try(flex_algo.srlg_exclude_any, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.srlg_exclude_any, null)
          fast_reroute_disable                      = try(flex_algo.fast_reroute_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.fast_reroute_disable, null)
          microloop_avoidance_disable               = try(flex_algo.microloop_avoidance_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.microloop_avoidance_disable, null)
          data_plane_segment_routing                = try(flex_algo.data_plane_segment_routing, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.data_plane_segment_routing, null)
          data_plane_ip                             = try(flex_algo.data_plane_ip, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.data_plane_ip, null)
          ucmp_disable                              = try(flex_algo.ucmp_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.ucmp_disable, null)
          address_family = try(length(flex_algo.address_family) == 0, true) ? null : [for af in flex_algo.address_family : {
            af_name                    = try(af.af_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.address_family.af_name, null)
            saf_name                   = try(af.saf_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.address_family.saf_name, null)
            maximum_paths              = try(af.maximum_paths, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.address_family.maximum_paths, null)
            maximum_paths_route_policy = try(af.maximum_paths_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.flex_algos.address_family.maximum_paths_route_policy, null)
            }
          ]
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
  segment_routing_global_block_lower_bound      = each.value.segment_routing_global_block_lower_bound
  segment_routing_global_block_upper_bound      = each.value.segment_routing_global_block_upper_bound
  receive_application_flex_algo_delay_app_only  = each.value.receive_application_flex_algo_delay_app_only
  lsp_refresh_interval                          = each.value.lsp_refresh_interval
  oor_set_overload_bit_disable                  = each.value.oor_set_overload_bit_disable
  set_overload_bit                              = each.value.set_overload_bit
  set_overload_bit_on_startup_time_to_advertise = each.value.set_overload_bit_on_startup_time
  set_overload_bit_on_startup_wait_for_bgp      = each.value.set_overload_bit_on_startup_wait_for_bgp
  set_overload_bit_advertise_external           = each.value.set_overload_bit_advertise_external
  set_overload_bit_advertise_interlevel         = each.value.set_overload_bit_advertise_interlevel
  lsp_mtu                                       = each.value.lsp_mtu
  extended_admin_group                          = each.value.extended_admin_group
  nsr                                           = each.value.nsr
  nsr_restart_time                              = each.value.nsr_restart_time
  nsf_cisco                                     = each.value.nsf_cisco
  nsf_ietf                                      = each.value.nsf_ietf
  nsf_lifetime                                  = each.value.nsf_lifetime
  nsf_interface_timer                           = each.value.nsf_interface_timer
  nsf_interface_expires                         = each.value.nsf_interface_expires
  lsp_check_interval                            = each.value.lsp_check_interval
  lsp_gen_interval_maximum_wait                 = each.value.lsp_gen_interval_maximum_wait
  lsp_gen_interval_initial_wait                 = each.value.lsp_gen_interval_initial_wait
  lsp_gen_interval_secondary_wait               = each.value.lsp_gen_interval_secondary_wait
  adjacency_stagger                             = each.value.adjacency_stagger
  adjacency_stagger_initial_neighbors           = each.value.adjacency_stagger_initial_neighbors
  adjacency_stagger_max_neighbors               = each.value.adjacency_stagger_max_neighbors
  hostname_dynamic_disable                      = each.value.hostname_dynamic_disable
  is_type                                       = each.value.is_type
  multi_part_tlv_disable                        = each.value.multi_part_tlv_disable
  multi_part_tlv_disable_neighbor               = each.value.multi_part_tlv_disable_neighbor
  multi_part_tlv_disable_prefix_tlvs            = each.value.multi_part_tlv_disable_prefix_tlvs
  multi_part_tlv_disable_router_capability      = each.value.multi_part_tlv_disable_router_capability
  log_adjacency_changes                         = each.value.log_adjacency_changes
  log_pdu_drops                                 = each.value.log_pdu_drops
  log_format_brief                              = each.value.log_format_brief
  lsp_password_accept_encrypted                 = each.value.lsp_password_accept_encrypted
  lsp_password_text_encrypted                   = each.value.lsp_password_text_encrypted
  lsp_password_text_send_only                   = each.value.lsp_password_text_send_only
  lsp_password_text_snp_send_only               = each.value.lsp_password_text_snp_send_only
  lsp_password_text_enable_poi                  = each.value.lsp_password_text_enable_poi
  lsp_password_hmac_md5_encrypted               = each.value.lsp_password_hmac_md5_encrypted
  lsp_password_hmac_md5_send_only               = each.value.lsp_password_hmac_md5_send_only
  lsp_password_hmac_md5_snp_send_only           = each.value.lsp_password_hmac_md5_snp_send_only
  lsp_password_hmac_md5_enable_poi              = each.value.lsp_password_hmac_md5_enable_poi
  lsp_password_keychain                         = each.value.lsp_password_keychain
  lsp_password_keychain_send_only               = each.value.lsp_password_keychain_send_only
  lsp_password_keychain_snp_send_only           = each.value.lsp_password_keychain_snp_send_only
  lsp_password_keychain_enable_poi              = each.value.lsp_password_keychain_enable_poi
  authentication_check_disable                  = each.value.authentication_check_disable
  iid_disable                                   = each.value.iid_disable
  mpls_ldp_sync                                 = each.value.mpls_ldp_sync
  mpls_ldp_sync_level                           = each.value.mpls_ldp_sync_level
  protocol_shutdown                             = each.value.protocol_shutdown
  min_lsp_arrival_initial_wait                  = each.value.min_lsp_arrival_initial_wait
  min_lsp_arrival_secondary_wait                = each.value.min_lsp_arrival_secondary_wait
  min_lsp_arrival_maximum_wait                  = each.value.min_lsp_arrival_maximum_wait
  max_metric                                    = each.value.max_metric
  max_metric_on_startup_advertise               = each.value.max_metric_on_startup_advertise
  max_metric_on_startup_wait_for_bgp            = each.value.max_metric_on_startup_wait_for_bgp
  max_metric_external                           = each.value.max_metric_external
  max_metric_interlevel                         = each.value.max_metric_interlevel
  max_metric_default_route                      = each.value.max_metric_default_route
  max_metric_srv6_locator                       = each.value.max_metric_srv6_locator
  max_metric_te                                 = each.value.max_metric_te
  max_metric_delay                              = each.value.max_metric_delay
  distribute_link_state                         = each.value.distribute_link_state
  distribute_link_state_level                   = each.value.distribute_link_state_level
  distribute_link_state_instance_id             = each.value.distribute_link_state_instance_id
  distribute_link_state_throttle                = each.value.distribute_link_state_throttle
  distribute_link_state_exclude_interarea       = each.value.distribute_link_state_exclude_interarea
  distribute_link_state_exclude_external        = each.value.distribute_link_state_exclude_external
  distribute_link_state_route_policy            = each.value.distribute_link_state_route_policy
  max_lsp_lifetime                              = each.value.max_lsp_lifetime
  instance_id                                   = each.value.instance_id
  hello_padding                                 = each.value.hello_padding
  lsp_fast_flooding                             = each.value.lsp_fast_flooding
  lsp_fast_flooding_max_lsp_tx                  = each.value.lsp_fast_flooding_max_lsp_tx
  lsp_fast_flooding_remote_psnp_delay           = each.value.lsp_fast_flooding_remote_psnp_delay
  psnp_interval                                 = each.value.psnp_interval
  ignore_lsp_errors_disable                     = each.value.ignore_lsp_errors_disable
  purge_transmit_strict                         = each.value.purge_transmit_strict
  purge_transmit_strict_value                   = each.value.purge_transmit_strict_value
  srlg_admin_weight                             = each.value.srlg_admin_weight
  lsp_refresh_interval_levels                   = each.value.lsp_refresh_interval_levels
  set_overload_bit_levels                       = each.value.set_overload_bit_levels
  lsp_mtu_levels                                = each.value.lsp_mtu_levels
  multi_part_tlv_disable_levels                 = each.value.multi_part_tlv_disable_levels
  log_sizes                                     = each.value.log_sizes
  lsp_password_accept_levels                    = each.value.lsp_password_accept_levels
  lsp_password_levels                           = each.value.lsp_password_levels
  lsp_check_interval_levels                     = each.value.lsp_check_interval_levels
  lsp_gen_interval_levels                       = each.value.lsp_gen_interval_levels
  min_lsp_arrival_levels                        = each.value.min_lsp_arrival_levels
  max_metric_levels                             = each.value.max_metric_levels
  max_lsp_lifetime_levels                       = each.value.max_lsp_lifetime_levels
  nets                                          = each.value.nets
  affinity_maps                                 = each.value.affinity_maps
  srlg_names                                    = each.value.srlg_names
  flex_algos                                    = each.value.flex_algos

  depends_on = [
    iosxr_route_policy.route_policy,
    iosxr_key_chain.key_chain,
    iosxr_segment_routing.segment_routing,
    iosxr_segment_routing_v6.segment_routing_v6
    #iosxr_segment_routing_mapping_server.segment_routing_mapping_server
  ]
}

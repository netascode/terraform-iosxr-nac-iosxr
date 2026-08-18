##### AAA #####

resource "iosxr_aaa" "aaa" {
  for_each = {
    for device in local.devices : device.name => device
    if try(local.device_config[device.name].aaa, null) != null ||
    try(local.defaults.iosxr.devices.configuration.aaa, null) != null
  }
  device                                         = each.value.name
  banner_login                                   = try(chomp(try(local.device_config[each.value.name].aaa.banner_login, local.defaults.iosxr.devices.configuration.aaa.banner_login, null)), null)
  default_taskgroup                              = try(local.device_config[each.value.name].aaa.default_taskgroup, local.defaults.iosxr.devices.configuration.aaa.default_taskgroup, null)
  server_radius_dynamic_author_port              = try(local.device_config[each.value.name].aaa.server.radius_dynamic_author.port, local.defaults.iosxr.devices.configuration.aaa.server.radius_dynamic_author.port, null)
  server_radius_dynamic_author_ignore_server_key = try(local.device_config[each.value.name].aaa.server.radius_dynamic_author.ignore_server_key, local.defaults.iosxr.devices.configuration.aaa.server.radius_dynamic_author.ignore_server_key, null)
  server_radius_dynamic_author_server_key_type_6 = try(local.device_config[each.value.name].aaa.server.radius_dynamic_author.key_type, null) == 6 ? try(local.device_config[each.value.name].aaa.server.radius_dynamic_author.key, null) : null
  server_radius_dynamic_author_server_key_type_7 = try(local.device_config[each.value.name].aaa.server.radius_dynamic_author.key_type, null) == 7 ? try(local.device_config[each.value.name].aaa.server.radius_dynamic_author.key, null) : null
  server_radius_dynamic_author_clients = try(length(try(local.device_config[each.value.name].aaa.server.radius_dynamic_author.clients, [])) == 0, true) ? null : [
    for client in try(local.device_config[each.value.name].aaa.server.radius_dynamic_author.clients, []) : {
      address           = try(client.address, null)
      vrf               = try(client.vrf, local.defaults.iosxr.devices.configuration.aaa.server.radius_dynamic_author.clients.vrf, null)
      server_key_type_6 = try(client.key_type, null) == 6 ? try(client.key, null) : null
      server_key_type_7 = try(client.key_type, null) == 7 ? try(client.key, null) : null
    }
  ]
  radius_server_groups = try(length(try(local.device_config[each.value.name].aaa.group_servers.radius, [])) == 0, true) ? null : [
    for group in try(local.device_config[each.value.name].aaa.group_servers.radius, []) : {
      group_name                                                    = try(group.name, null)
      deadtime                                                      = try(group.deadtime, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.deadtime, null)
      vrf                                                           = try(group.vrf, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.vrf, null)
      source_interface                                              = try(group.source_interface, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.source_interface, null)
      load_balance_method_least_outstanding                         = try(group.load_balance_method_least_outstanding, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.load_balance_method_least_outstanding, null)
      load_balance_method_least_outstanding_batch_size              = try(group.load_balance_method_least_outstanding_batch_size, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.load_balance_method_least_outstanding_batch_size, null)
      load_balance_method_least_outstanding_ignore_preferred_server = try(group.load_balance_method_least_outstanding_ignore_preferred_server, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.load_balance_method_least_outstanding_ignore_preferred_server, null)
      throttle_access                                               = try(group.throttle.access, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.throttle.access, null)
      throttle_access_timeout                                       = try(group.throttle.access_timeout, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.throttle.access_timeout, null)
      throttle_accounting                                           = try(group.throttle.accounting, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.throttle.accounting, null)
      authorization_request_accept                                  = try(group.authorization_request_accept_list, null) != null ? true : null
      authorization_request_reject                                  = try(group.authorization_request_reject_list, null) != null ? true : null
      authorization_request_radius_attribute_list                   = try(group.authorization_request_accept_list, group.authorization_request_reject_list, null)
      authorization_reply_accept                                    = try(group.authorization_reply_accept_list, null) != null ? true : null
      authorization_reply_reject                                    = try(group.authorization_reply_reject_list, null) != null ? true : null
      authorization_reply_radius_attribute_list                     = try(group.authorization_reply_accept_list, group.authorization_reply_reject_list, null)
      accounting_request_accept                                     = try(group.accounting_request_accept_list, null) != null ? true : null
      accounting_request_reject                                     = try(group.accounting_request_reject_list, null) != null ? true : null
      accounting_request_radius_attribute_list                      = try(group.accounting_request_accept_list, group.accounting_request_reject_list, null)
      accounting_reply_accept                                       = try(group.accounting_reply_accept_list, null) != null ? true : null
      accounting_reply_reject                                       = try(group.accounting_reply_reject_list, null) != null ? true : null
      accounting_reply_radius_attribute_list                        = try(group.accounting_reply_accept_list, group.accounting_reply_reject_list, null)
      server_privates = try(length(try(group.server_privates, [])) == 0, true) ? null : [
        for idx, sp in try(group.server_privates, []) : {
          order            = idx
          address          = try(sp.address, null)
          auth_port        = try(sp.auth_port, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.server_privates.auth_port, 1812)
          acct_port        = try(sp.acct_port, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.server_privates.acct_port, 1813)
          timeout          = try(sp.timeout, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.server_privates.timeout, null)
          retransmit       = try(sp.retransmit, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.server_privates.retransmit, null)
          idle_time        = try(sp.idle_time, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.server_privates.idle_time, null)
          ignore_auth_port = try(sp.ignore_auth_port, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.server_privates.ignore_auth_port, null)
          ignore_acct_port = try(sp.ignore_acct_port, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.server_privates.ignore_acct_port, null)
          test_username    = try(sp.test_username, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.server_privates.test_username, null)
          key_type_6       = try(sp.key_type, null) == 6 ? try(sp.key, null) : null
          key_type_7       = try(sp.key_type, null) == 7 ? try(sp.key, null) : null
        }
      ]
      servers = try(length(try(group.servers, [])) == 0, true) ? null : [
        for idx, sv in try(group.servers, []) : {
          order     = idx
          address   = try(sv.address, null)
          auth_port = try(sv.auth_port, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.servers.auth_port, 1812)
          acct_port = try(sv.acct_port, local.defaults.iosxr.devices.configuration.aaa.group_servers.radius.servers.acct_port, 1813)
        }
      ]
    }
  ]
  tacacs_server_groups = try(length(try(local.device_config[each.value.name].aaa.group_servers.tacacs, [])) == 0, true) ? null : [
    for group in try(local.device_config[each.value.name].aaa.group_servers.tacacs, []) : {
      group_name    = try(group.name, null)
      holddown_time = try(group.holddown_time, local.defaults.iosxr.devices.configuration.aaa.group_servers.tacacs.holddown_time, null)
      vrf           = try(group.vrf, local.defaults.iosxr.devices.configuration.aaa.group_servers.tacacs.vrf, null)
      server_privates = try(length(try(group.server_privates, [])) == 0, true) ? null : [
        for idx, sp in try(group.server_privates, []) : {
          order                          = idx
          address                        = try(sp.address, null)
          port                           = try(sp.port, local.defaults.iosxr.devices.configuration.aaa.group_servers.tacacs.server_privates.port, 49)
          timeout                        = try(sp.timeout, local.defaults.iosxr.devices.configuration.aaa.group_servers.tacacs.server_privates.timeout, null)
          holddown_time                  = try(sp.holddown_time, local.defaults.iosxr.devices.configuration.aaa.group_servers.tacacs.server_privates.holddown_time, null)
          single_connection              = try(sp.single_connection, local.defaults.iosxr.devices.configuration.aaa.group_servers.tacacs.server_privates.single_connection, null)
          single_connection_idle_timeout = try(sp.single_connection_idle_timeout, local.defaults.iosxr.devices.configuration.aaa.group_servers.tacacs.server_privates.single_connection_idle_timeout, null)
          key_type_6                     = try(sp.key_type, null) == 6 ? try(sp.key, null) : null
          key_type_7                     = try(sp.key_type, null) == 7 ? try(sp.key, null) : null
        }
      ]
      servers = try(length(try(group.servers, [])) == 0, true) ? null : [
        for idx, sv in try(group.servers, []) : {
          order   = idx
          address = try(sv.address, null)
        }
      ]
    }
  ]
  taskgroups = try(length(try(local.device_config[each.value.name].taskgroups, [])) == 0, true) ? null : [
    for tg in try(local.device_config[each.value.name].taskgroups, []) : {
      group_name                      = try(tg.name, local.defaults.iosxr.devices.configuration.taskgroups.name, null)
      description                     = try(tg.description, local.defaults.iosxr.devices.configuration.taskgroups.description, null)
      inherit_taskgroup_cisco_support = try(contains(try(tg.inherit_taskgroups, []), "cisco-support"), false) ? true : null
      inherit_taskgroup_netadmin      = try(contains(try(tg.inherit_taskgroups, []), "netadmin"), false) ? true : null
      inherit_taskgroup_operator      = try(contains(try(tg.inherit_taskgroups, []), "operator"), false) ? true : null
      inherit_taskgroup_root_lr       = try(contains(try(tg.inherit_taskgroups, []), "root-lr"), false) ? true : null
      inherit_taskgroup_serviceadmin  = try(contains(try(tg.inherit_taskgroups, []), "serviceadmin"), false) ? true : null
      inherit_taskgroup_sysadmin      = try(contains(try(tg.inherit_taskgroups, []), "sysadmin"), false) ? true : null
      inherit_taskgroups = try(length([for itg in try(tg.inherit_taskgroups, []) : itg if !contains(["cisco-support", "netadmin", "operator", "root-lr", "serviceadmin", "sysadmin"], itg)]) == 0, true) ? null : [
        for itg in try(tg.inherit_taskgroups, []) : { group_name = itg }
        if !contains(["cisco-support", "netadmin", "operator", "root-lr", "serviceadmin", "sysadmin"], itg)
      ]
      # read tasks
      task_read_aaa               = try(contains(try(tg.tasks.read, []), "aaa"), false) ? true : null
      task_read_acl               = try(contains(try(tg.tasks.read, []), "acl"), false) ? true : null
      task_read_admin             = try(contains(try(tg.tasks.read, []), "admin"), false) ? true : null
      task_read_ancp              = try(contains(try(tg.tasks.read, []), "ancp"), false) ? true : null
      task_read_atm               = try(contains(try(tg.tasks.read, []), "atm"), false) ? true : null
      task_read_basic_services    = try(contains(try(tg.tasks.read, []), "basic_services"), false) ? true : null
      task_read_bcdl              = try(contains(try(tg.tasks.read, []), "bcdl"), false) ? true : null
      task_read_bfd               = try(contains(try(tg.tasks.read, []), "bfd"), false) ? true : null
      task_read_bgp               = try(contains(try(tg.tasks.read, []), "bgp"), false) ? true : null
      task_read_boot              = try(contains(try(tg.tasks.read, []), "boot"), false) ? true : null
      task_read_bundle            = try(contains(try(tg.tasks.read, []), "bundle"), false) ? true : null
      task_read_call_home         = try(contains(try(tg.tasks.read, []), "call_home"), false) ? true : null
      task_read_cdp               = try(contains(try(tg.tasks.read, []), "cdp"), false) ? true : null
      task_read_cef               = try(contains(try(tg.tasks.read, []), "cef"), false) ? true : null
      task_read_cgn               = try(contains(try(tg.tasks.read, []), "cgn"), false) ? true : null
      task_read_config_mgmt       = try(contains(try(tg.tasks.read, []), "config_mgmt"), false) ? true : null
      task_read_config_services   = try(contains(try(tg.tasks.read, []), "config_services"), false) ? true : null
      task_read_cpri              = try(contains(try(tg.tasks.read, []), "cpri"), false) ? true : null
      task_read_crypto            = try(contains(try(tg.tasks.read, []), "crypto"), false) ? true : null
      task_read_diag              = try(contains(try(tg.tasks.read, []), "diag"), false) ? true : null
      task_read_dossier           = try(contains(try(tg.tasks.read, []), "dossier"), false) ? true : null
      task_read_drivers           = try(contains(try(tg.tasks.read, []), "drivers"), false) ? true : null
      task_read_dwdm              = try(contains(try(tg.tasks.read, []), "dwdm"), false) ? true : null
      task_read_eem               = try(contains(try(tg.tasks.read, []), "eem"), false) ? true : null
      task_read_eigrp             = try(contains(try(tg.tasks.read, []), "eigrp"), false) ? true : null
      task_read_ethernet_services = try(contains(try(tg.tasks.read, []), "ethernet_services"), false) ? true : null
      task_read_ext_access        = try(contains(try(tg.tasks.read, []), "ext_access"), false) ? true : null
      task_read_fabric            = try(contains(try(tg.tasks.read, []), "fabric"), false) ? true : null
      task_read_fault_mgr         = try(contains(try(tg.tasks.read, []), "fault_mgr"), false) ? true : null
      task_read_fc                = try(contains(try(tg.tasks.read, []), "fc"), false) ? true : null
      task_read_filesystem        = try(contains(try(tg.tasks.read, []), "filesystem"), false) ? true : null
      task_read_firewall          = try(contains(try(tg.tasks.read, []), "firewall"), false) ? true : null
      task_read_fr                = try(contains(try(tg.tasks.read, []), "fr"), false) ? true : null
      task_read_fti               = try(contains(try(tg.tasks.read, []), "fti"), false) ? true : null
      task_read_hdlc              = try(contains(try(tg.tasks.read, []), "hdlc"), false) ? true : null
      task_read_host_services     = try(contains(try(tg.tasks.read, []), "host_services"), false) ? true : null
      task_read_hsrp              = try(contains(try(tg.tasks.read, []), "hsrp"), false) ? true : null
      task_read_interface         = try(contains(try(tg.tasks.read, []), "interface"), false) ? true : null
      task_read_inventory         = try(contains(try(tg.tasks.read, []), "inventory"), false) ? true : null
      task_read_ip_services       = try(contains(try(tg.tasks.read, []), "ip_services"), false) ? true : null
      task_read_ipv4              = try(contains(try(tg.tasks.read, []), "ipv4"), false) ? true : null
      task_read_ipv6              = try(contains(try(tg.tasks.read, []), "ipv6"), false) ? true : null
      task_read_isis              = try(contains(try(tg.tasks.read, []), "isis"), false) ? true : null
      task_read_l2rib             = try(contains(try(tg.tasks.read, []), "l2rib"), false) ? true : null
      task_read_l2vpn             = try(contains(try(tg.tasks.read, []), "l2vpn"), false) ? true : null
      task_read_li                = try(contains(try(tg.tasks.read, []), "li"), false) ? true : null
      task_read_lisp              = try(contains(try(tg.tasks.read, []), "lisp"), false) ? true : null
      task_read_lldp              = try(contains(try(tg.tasks.read, []), "lldp"), false) ? true : null
      task_read_logging           = try(contains(try(tg.tasks.read, []), "logging"), false) ? true : null
      task_read_lpts              = try(contains(try(tg.tasks.read, []), "lpts"), false) ? true : null
      task_read_monitor           = try(contains(try(tg.tasks.read, []), "monitor"), false) ? true : null
      task_read_mpls_ldp          = try(contains(try(tg.tasks.read, []), "mpls_ldp"), false) ? true : null
      task_read_mpls_static       = try(contains(try(tg.tasks.read, []), "mpls_static"), false) ? true : null
      task_read_mpls_te           = try(contains(try(tg.tasks.read, []), "mpls_te"), false) ? true : null
      task_read_multicast         = try(contains(try(tg.tasks.read, []), "multicast"), false) ? true : null
      task_read_nacm              = try(contains(try(tg.tasks.read, []), "nacm"), false) ? true : null
      task_read_netflow           = try(contains(try(tg.tasks.read, []), "netflow"), false) ? true : null
      task_read_network           = try(contains(try(tg.tasks.read, []), "network"), false) ? true : null
      task_read_nps               = try(contains(try(tg.tasks.read, []), "nps"), false) ? true : null
      task_read_ospf              = try(contains(try(tg.tasks.read, []), "ospf"), false) ? true : null
      task_read_otn               = try(contains(try(tg.tasks.read, []), "otn"), false) ? true : null
      task_read_ouni              = try(contains(try(tg.tasks.read, []), "ouni"), false) ? true : null
      task_read_pbr               = try(contains(try(tg.tasks.read, []), "pbr"), false) ? true : null
      task_read_pkg_mgmt          = try(contains(try(tg.tasks.read, []), "pkg_mgmt"), false) ? true : null
      task_read_plat_mgr          = try(contains(try(tg.tasks.read, []), "plat_mgr"), false) ? true : null
      task_read_pos_dpt           = try(contains(try(tg.tasks.read, []), "pos_dpt"), false) ? true : null
      task_read_ppp               = try(contains(try(tg.tasks.read, []), "ppp"), false) ? true : null
      task_read_qos               = try(contains(try(tg.tasks.read, []), "qos"), false) ? true : null
      task_read_rcmd              = try(contains(try(tg.tasks.read, []), "rcmd"), false) ? true : null
      task_read_rib               = try(contains(try(tg.tasks.read, []), "rib"), false) ? true : null
      task_read_rip               = try(contains(try(tg.tasks.read, []), "rip"), false) ? true : null
      task_read_route_map         = try(contains(try(tg.tasks.read, []), "route_map"), false) ? true : null
      task_read_route_policy      = try(contains(try(tg.tasks.read, []), "route_policy"), false) ? true : null
      task_read_sbc               = try(contains(try(tg.tasks.read, []), "sbc"), false) ? true : null
      task_read_snmp              = try(contains(try(tg.tasks.read, []), "snmp"), false) ? true : null
      task_read_sonet_sdh         = try(contains(try(tg.tasks.read, []), "sonet_sdh"), false) ? true : null
      task_read_static            = try(contains(try(tg.tasks.read, []), "static"), false) ? true : null
      task_read_sysmgr            = try(contains(try(tg.tasks.read, []), "sysmgr"), false) ? true : null
      task_read_system            = try(contains(try(tg.tasks.read, []), "system"), false) ? true : null
      task_read_transport         = try(contains(try(tg.tasks.read, []), "transport"), false) ? true : null
      task_read_tty_access        = try(contains(try(tg.tasks.read, []), "tty_access"), false) ? true : null
      task_read_tunnel            = try(contains(try(tg.tasks.read, []), "tunnel"), false) ? true : null
      task_read_vlan              = try(contains(try(tg.tasks.read, []), "vlan"), false) ? true : null
      task_read_vpdn              = try(contains(try(tg.tasks.read, []), "vpdn"), false) ? true : null
      task_read_vrrp              = try(contains(try(tg.tasks.read, []), "vrrp"), false) ? true : null
      # write tasks
      task_write_aaa               = try(contains(try(tg.tasks.write, []), "aaa"), false) ? true : null
      task_write_acl               = try(contains(try(tg.tasks.write, []), "acl"), false) ? true : null
      task_write_admin             = try(contains(try(tg.tasks.write, []), "admin"), false) ? true : null
      task_write_ancp              = try(contains(try(tg.tasks.write, []), "ancp"), false) ? true : null
      task_write_atm               = try(contains(try(tg.tasks.write, []), "atm"), false) ? true : null
      task_write_basic_services    = try(contains(try(tg.tasks.write, []), "basic_services"), false) ? true : null
      task_write_bcdl              = try(contains(try(tg.tasks.write, []), "bcdl"), false) ? true : null
      task_write_bfd               = try(contains(try(tg.tasks.write, []), "bfd"), false) ? true : null
      task_write_bgp               = try(contains(try(tg.tasks.write, []), "bgp"), false) ? true : null
      task_write_boot              = try(contains(try(tg.tasks.write, []), "boot"), false) ? true : null
      task_write_bundle            = try(contains(try(tg.tasks.write, []), "bundle"), false) ? true : null
      task_write_call_home         = try(contains(try(tg.tasks.write, []), "call_home"), false) ? true : null
      task_write_cdp               = try(contains(try(tg.tasks.write, []), "cdp"), false) ? true : null
      task_write_cef               = try(contains(try(tg.tasks.write, []), "cef"), false) ? true : null
      task_write_cgn               = try(contains(try(tg.tasks.write, []), "cgn"), false) ? true : null
      task_write_config_mgmt       = try(contains(try(tg.tasks.write, []), "config_mgmt"), false) ? true : null
      task_write_config_services   = try(contains(try(tg.tasks.write, []), "config_services"), false) ? true : null
      task_write_cpri              = try(contains(try(tg.tasks.write, []), "cpri"), false) ? true : null
      task_write_crypto            = try(contains(try(tg.tasks.write, []), "crypto"), false) ? true : null
      task_write_diag              = try(contains(try(tg.tasks.write, []), "diag"), false) ? true : null
      task_write_dossier           = try(contains(try(tg.tasks.write, []), "dossier"), false) ? true : null
      task_write_drivers           = try(contains(try(tg.tasks.write, []), "drivers"), false) ? true : null
      task_write_dwdm              = try(contains(try(tg.tasks.write, []), "dwdm"), false) ? true : null
      task_write_eem               = try(contains(try(tg.tasks.write, []), "eem"), false) ? true : null
      task_write_eigrp             = try(contains(try(tg.tasks.write, []), "eigrp"), false) ? true : null
      task_write_ethernet_services = try(contains(try(tg.tasks.write, []), "ethernet_services"), false) ? true : null
      task_write_ext_access        = try(contains(try(tg.tasks.write, []), "ext_access"), false) ? true : null
      task_write_fabric            = try(contains(try(tg.tasks.write, []), "fabric"), false) ? true : null
      task_write_fault_mgr         = try(contains(try(tg.tasks.write, []), "fault_mgr"), false) ? true : null
      task_write_fc                = try(contains(try(tg.tasks.write, []), "fc"), false) ? true : null
      task_write_filesystem        = try(contains(try(tg.tasks.write, []), "filesystem"), false) ? true : null
      task_write_firewall          = try(contains(try(tg.tasks.write, []), "firewall"), false) ? true : null
      task_write_fr                = try(contains(try(tg.tasks.write, []), "fr"), false) ? true : null
      task_write_fti               = try(contains(try(tg.tasks.write, []), "fti"), false) ? true : null
      task_write_hdlc              = try(contains(try(tg.tasks.write, []), "hdlc"), false) ? true : null
      task_write_host_services     = try(contains(try(tg.tasks.write, []), "host_services"), false) ? true : null
      task_write_hsrp              = try(contains(try(tg.tasks.write, []), "hsrp"), false) ? true : null
      task_write_interface         = try(contains(try(tg.tasks.write, []), "interface"), false) ? true : null
      task_write_inventory         = try(contains(try(tg.tasks.write, []), "inventory"), false) ? true : null
      task_write_ip_services       = try(contains(try(tg.tasks.write, []), "ip_services"), false) ? true : null
      task_write_ipv4              = try(contains(try(tg.tasks.write, []), "ipv4"), false) ? true : null
      task_write_ipv6              = try(contains(try(tg.tasks.write, []), "ipv6"), false) ? true : null
      task_write_isis              = try(contains(try(tg.tasks.write, []), "isis"), false) ? true : null
      task_write_l2rib             = try(contains(try(tg.tasks.write, []), "l2rib"), false) ? true : null
      task_write_l2vpn             = try(contains(try(tg.tasks.write, []), "l2vpn"), false) ? true : null
      task_write_li                = try(contains(try(tg.tasks.write, []), "li"), false) ? true : null
      task_write_lisp              = try(contains(try(tg.tasks.write, []), "lisp"), false) ? true : null
      task_write_lldp              = try(contains(try(tg.tasks.write, []), "lldp"), false) ? true : null
      task_write_logging           = try(contains(try(tg.tasks.write, []), "logging"), false) ? true : null
      task_write_lpts              = try(contains(try(tg.tasks.write, []), "lpts"), false) ? true : null
      task_write_monitor           = try(contains(try(tg.tasks.write, []), "monitor"), false) ? true : null
      task_write_mpls_ldp          = try(contains(try(tg.tasks.write, []), "mpls_ldp"), false) ? true : null
      task_write_mpls_static       = try(contains(try(tg.tasks.write, []), "mpls_static"), false) ? true : null
      task_write_mpls_te           = try(contains(try(tg.tasks.write, []), "mpls_te"), false) ? true : null
      task_write_multicast         = try(contains(try(tg.tasks.write, []), "multicast"), false) ? true : null
      task_write_nacm              = try(contains(try(tg.tasks.write, []), "nacm"), false) ? true : null
      task_write_netflow           = try(contains(try(tg.tasks.write, []), "netflow"), false) ? true : null
      task_write_network           = try(contains(try(tg.tasks.write, []), "network"), false) ? true : null
      task_write_nps               = try(contains(try(tg.tasks.write, []), "nps"), false) ? true : null
      task_write_ospf              = try(contains(try(tg.tasks.write, []), "ospf"), false) ? true : null
      task_write_otn               = try(contains(try(tg.tasks.write, []), "otn"), false) ? true : null
      task_write_ouni              = try(contains(try(tg.tasks.write, []), "ouni"), false) ? true : null
      task_write_pbr               = try(contains(try(tg.tasks.write, []), "pbr"), false) ? true : null
      task_write_pkg_mgmt          = try(contains(try(tg.tasks.write, []), "pkg_mgmt"), false) ? true : null
      task_write_plat_mgr          = try(contains(try(tg.tasks.write, []), "plat_mgr"), false) ? true : null
      task_write_pos_dpt           = try(contains(try(tg.tasks.write, []), "pos_dpt"), false) ? true : null
      task_write_ppp               = try(contains(try(tg.tasks.write, []), "ppp"), false) ? true : null
      task_write_qos               = try(contains(try(tg.tasks.write, []), "qos"), false) ? true : null
      task_write_rcmd              = try(contains(try(tg.tasks.write, []), "rcmd"), false) ? true : null
      task_write_rib               = try(contains(try(tg.tasks.write, []), "rib"), false) ? true : null
      task_write_rip               = try(contains(try(tg.tasks.write, []), "rip"), false) ? true : null
      task_write_route_map         = try(contains(try(tg.tasks.write, []), "route_map"), false) ? true : null
      task_write_route_policy      = try(contains(try(tg.tasks.write, []), "route_policy"), false) ? true : null
      task_write_sbc               = try(contains(try(tg.tasks.write, []), "sbc"), false) ? true : null
      task_write_snmp              = try(contains(try(tg.tasks.write, []), "snmp"), false) ? true : null
      task_write_sonet_sdh         = try(contains(try(tg.tasks.write, []), "sonet_sdh"), false) ? true : null
      task_write_static            = try(contains(try(tg.tasks.write, []), "static"), false) ? true : null
      task_write_sysmgr            = try(contains(try(tg.tasks.write, []), "sysmgr"), false) ? true : null
      task_write_system            = try(contains(try(tg.tasks.write, []), "system"), false) ? true : null
      task_write_transport         = try(contains(try(tg.tasks.write, []), "transport"), false) ? true : null
      task_write_tty_access        = try(contains(try(tg.tasks.write, []), "tty_access"), false) ? true : null
      task_write_tunnel            = try(contains(try(tg.tasks.write, []), "tunnel"), false) ? true : null
      task_write_vlan              = try(contains(try(tg.tasks.write, []), "vlan"), false) ? true : null
      task_write_vpdn              = try(contains(try(tg.tasks.write, []), "vpdn"), false) ? true : null
      task_write_vrrp              = try(contains(try(tg.tasks.write, []), "vrrp"), false) ? true : null
      # execute tasks
      task_execute_aaa               = try(contains(try(tg.tasks.execute, []), "aaa"), false) ? true : null
      task_execute_acl               = try(contains(try(tg.tasks.execute, []), "acl"), false) ? true : null
      task_execute_admin             = try(contains(try(tg.tasks.execute, []), "admin"), false) ? true : null
      task_execute_ancp              = try(contains(try(tg.tasks.execute, []), "ancp"), false) ? true : null
      task_execute_atm               = try(contains(try(tg.tasks.execute, []), "atm"), false) ? true : null
      task_execute_basic_services    = try(contains(try(tg.tasks.execute, []), "basic_services"), false) ? true : null
      task_execute_bcdl              = try(contains(try(tg.tasks.execute, []), "bcdl"), false) ? true : null
      task_execute_bfd               = try(contains(try(tg.tasks.execute, []), "bfd"), false) ? true : null
      task_execute_bgp               = try(contains(try(tg.tasks.execute, []), "bgp"), false) ? true : null
      task_execute_boot              = try(contains(try(tg.tasks.execute, []), "boot"), false) ? true : null
      task_execute_bundle            = try(contains(try(tg.tasks.execute, []), "bundle"), false) ? true : null
      task_execute_call_home         = try(contains(try(tg.tasks.execute, []), "call_home"), false) ? true : null
      task_execute_cdp               = try(contains(try(tg.tasks.execute, []), "cdp"), false) ? true : null
      task_execute_cef               = try(contains(try(tg.tasks.execute, []), "cef"), false) ? true : null
      task_execute_cgn               = try(contains(try(tg.tasks.execute, []), "cgn"), false) ? true : null
      task_execute_config_mgmt       = try(contains(try(tg.tasks.execute, []), "config_mgmt"), false) ? true : null
      task_execute_config_services   = try(contains(try(tg.tasks.execute, []), "config_services"), false) ? true : null
      task_execute_cpri              = try(contains(try(tg.tasks.execute, []), "cpri"), false) ? true : null
      task_execute_crypto            = try(contains(try(tg.tasks.execute, []), "crypto"), false) ? true : null
      task_execute_diag              = try(contains(try(tg.tasks.execute, []), "diag"), false) ? true : null
      task_execute_dossier           = try(contains(try(tg.tasks.execute, []), "dossier"), false) ? true : null
      task_execute_drivers           = try(contains(try(tg.tasks.execute, []), "drivers"), false) ? true : null
      task_execute_dwdm              = try(contains(try(tg.tasks.execute, []), "dwdm"), false) ? true : null
      task_execute_eem               = try(contains(try(tg.tasks.execute, []), "eem"), false) ? true : null
      task_execute_eigrp             = try(contains(try(tg.tasks.execute, []), "eigrp"), false) ? true : null
      task_execute_ethernet_services = try(contains(try(tg.tasks.execute, []), "ethernet_services"), false) ? true : null
      task_execute_ext_access        = try(contains(try(tg.tasks.execute, []), "ext_access"), false) ? true : null
      task_execute_fabric            = try(contains(try(tg.tasks.execute, []), "fabric"), false) ? true : null
      task_execute_fault_mgr         = try(contains(try(tg.tasks.execute, []), "fault_mgr"), false) ? true : null
      task_execute_fc                = try(contains(try(tg.tasks.execute, []), "fc"), false) ? true : null
      task_execute_filesystem        = try(contains(try(tg.tasks.execute, []), "filesystem"), false) ? true : null
      task_execute_firewall          = try(contains(try(tg.tasks.execute, []), "firewall"), false) ? true : null
      task_execute_fr                = try(contains(try(tg.tasks.execute, []), "fr"), false) ? true : null
      task_execute_fti               = try(contains(try(tg.tasks.execute, []), "fti"), false) ? true : null
      task_execute_hdlc              = try(contains(try(tg.tasks.execute, []), "hdlc"), false) ? true : null
      task_execute_host_services     = try(contains(try(tg.tasks.execute, []), "host_services"), false) ? true : null
      task_execute_hsrp              = try(contains(try(tg.tasks.execute, []), "hsrp"), false) ? true : null
      task_execute_interface         = try(contains(try(tg.tasks.execute, []), "interface"), false) ? true : null
      task_execute_inventory         = try(contains(try(tg.tasks.execute, []), "inventory"), false) ? true : null
      task_execute_ip_services       = try(contains(try(tg.tasks.execute, []), "ip_services"), false) ? true : null
      task_execute_ipv4              = try(contains(try(tg.tasks.execute, []), "ipv4"), false) ? true : null
      task_execute_ipv6              = try(contains(try(tg.tasks.execute, []), "ipv6"), false) ? true : null
      task_execute_isis              = try(contains(try(tg.tasks.execute, []), "isis"), false) ? true : null
      task_execute_l2rib             = try(contains(try(tg.tasks.execute, []), "l2rib"), false) ? true : null
      task_execute_l2vpn             = try(contains(try(tg.tasks.execute, []), "l2vpn"), false) ? true : null
      task_execute_li                = try(contains(try(tg.tasks.execute, []), "li"), false) ? true : null
      task_execute_lisp              = try(contains(try(tg.tasks.execute, []), "lisp"), false) ? true : null
      task_execute_lldp              = try(contains(try(tg.tasks.execute, []), "lldp"), false) ? true : null
      task_execute_logging           = try(contains(try(tg.tasks.execute, []), "logging"), false) ? true : null
      task_execute_lpts              = try(contains(try(tg.tasks.execute, []), "lpts"), false) ? true : null
      task_execute_monitor           = try(contains(try(tg.tasks.execute, []), "monitor"), false) ? true : null
      task_execute_mpls_ldp          = try(contains(try(tg.tasks.execute, []), "mpls_ldp"), false) ? true : null
      task_execute_mpls_static       = try(contains(try(tg.tasks.execute, []), "mpls_static"), false) ? true : null
      task_execute_mpls_te           = try(contains(try(tg.tasks.execute, []), "mpls_te"), false) ? true : null
      task_execute_multicast         = try(contains(try(tg.tasks.execute, []), "multicast"), false) ? true : null
      task_execute_nacm              = try(contains(try(tg.tasks.execute, []), "nacm"), false) ? true : null
      task_execute_netflow           = try(contains(try(tg.tasks.execute, []), "netflow"), false) ? true : null
      task_execute_network           = try(contains(try(tg.tasks.execute, []), "network"), false) ? true : null
      task_execute_nps               = try(contains(try(tg.tasks.execute, []), "nps"), false) ? true : null
      task_execute_ospf              = try(contains(try(tg.tasks.execute, []), "ospf"), false) ? true : null
      task_execute_otn               = try(contains(try(tg.tasks.execute, []), "otn"), false) ? true : null
      task_execute_ouni              = try(contains(try(tg.tasks.execute, []), "ouni"), false) ? true : null
      task_execute_pbr               = try(contains(try(tg.tasks.execute, []), "pbr"), false) ? true : null
      task_execute_pkg_mgmt          = try(contains(try(tg.tasks.execute, []), "pkg_mgmt"), false) ? true : null
      task_execute_plat_mgr          = try(contains(try(tg.tasks.execute, []), "plat_mgr"), false) ? true : null
      task_execute_pos_dpt           = try(contains(try(tg.tasks.execute, []), "pos_dpt"), false) ? true : null
      task_execute_ppp               = try(contains(try(tg.tasks.execute, []), "ppp"), false) ? true : null
      task_execute_qos               = try(contains(try(tg.tasks.execute, []), "qos"), false) ? true : null
      task_execute_rcmd              = try(contains(try(tg.tasks.execute, []), "rcmd"), false) ? true : null
      task_execute_rib               = try(contains(try(tg.tasks.execute, []), "rib"), false) ? true : null
      task_execute_rip               = try(contains(try(tg.tasks.execute, []), "rip"), false) ? true : null
      task_execute_route_map         = try(contains(try(tg.tasks.execute, []), "route_map"), false) ? true : null
      task_execute_route_policy      = try(contains(try(tg.tasks.execute, []), "route_policy"), false) ? true : null
      task_execute_sbc               = try(contains(try(tg.tasks.execute, []), "sbc"), false) ? true : null
      task_execute_snmp              = try(contains(try(tg.tasks.execute, []), "snmp"), false) ? true : null
      task_execute_sonet_sdh         = try(contains(try(tg.tasks.execute, []), "sonet_sdh"), false) ? true : null
      task_execute_static            = try(contains(try(tg.tasks.execute, []), "static"), false) ? true : null
      task_execute_sysmgr            = try(contains(try(tg.tasks.execute, []), "sysmgr"), false) ? true : null
      task_execute_system            = try(contains(try(tg.tasks.execute, []), "system"), false) ? true : null
      task_execute_transport         = try(contains(try(tg.tasks.execute, []), "transport"), false) ? true : null
      task_execute_tty_access        = try(contains(try(tg.tasks.execute, []), "tty_access"), false) ? true : null
      task_execute_tunnel            = try(contains(try(tg.tasks.execute, []), "tunnel"), false) ? true : null
      task_execute_vlan              = try(contains(try(tg.tasks.execute, []), "vlan"), false) ? true : null
      task_execute_vpdn              = try(contains(try(tg.tasks.execute, []), "vpdn"), false) ? true : null
      task_execute_vrrp              = try(contains(try(tg.tasks.execute, []), "vrrp"), false) ? true : null
      # debug tasks
      task_debug_aaa               = try(contains(try(tg.tasks.debug, []), "aaa"), false) ? true : null
      task_debug_acl               = try(contains(try(tg.tasks.debug, []), "acl"), false) ? true : null
      task_debug_admin             = try(contains(try(tg.tasks.debug, []), "admin"), false) ? true : null
      task_debug_ancp              = try(contains(try(tg.tasks.debug, []), "ancp"), false) ? true : null
      task_debug_atm               = try(contains(try(tg.tasks.debug, []), "atm"), false) ? true : null
      task_debug_basic_services    = try(contains(try(tg.tasks.debug, []), "basic_services"), false) ? true : null
      task_debug_bcdl              = try(contains(try(tg.tasks.debug, []), "bcdl"), false) ? true : null
      task_debug_bfd               = try(contains(try(tg.tasks.debug, []), "bfd"), false) ? true : null
      task_debug_bgp               = try(contains(try(tg.tasks.debug, []), "bgp"), false) ? true : null
      task_debug_boot              = try(contains(try(tg.tasks.debug, []), "boot"), false) ? true : null
      task_debug_bundle            = try(contains(try(tg.tasks.debug, []), "bundle"), false) ? true : null
      task_debug_call_home         = try(contains(try(tg.tasks.debug, []), "call_home"), false) ? true : null
      task_debug_cdp               = try(contains(try(tg.tasks.debug, []), "cdp"), false) ? true : null
      task_debug_cef               = try(contains(try(tg.tasks.debug, []), "cef"), false) ? true : null
      task_debug_cgn               = try(contains(try(tg.tasks.debug, []), "cgn"), false) ? true : null
      task_debug_config_mgmt       = try(contains(try(tg.tasks.debug, []), "config_mgmt"), false) ? true : null
      task_debug_config_services   = try(contains(try(tg.tasks.debug, []), "config_services"), false) ? true : null
      task_debug_cpri              = try(contains(try(tg.tasks.debug, []), "cpri"), false) ? true : null
      task_debug_crypto            = try(contains(try(tg.tasks.debug, []), "crypto"), false) ? true : null
      task_debug_diag              = try(contains(try(tg.tasks.debug, []), "diag"), false) ? true : null
      task_debug_dossier           = try(contains(try(tg.tasks.debug, []), "dossier"), false) ? true : null
      task_debug_drivers           = try(contains(try(tg.tasks.debug, []), "drivers"), false) ? true : null
      task_debug_dwdm              = try(contains(try(tg.tasks.debug, []), "dwdm"), false) ? true : null
      task_debug_eem               = try(contains(try(tg.tasks.debug, []), "eem"), false) ? true : null
      task_debug_eigrp             = try(contains(try(tg.tasks.debug, []), "eigrp"), false) ? true : null
      task_debug_ethernet_services = try(contains(try(tg.tasks.debug, []), "ethernet_services"), false) ? true : null
      task_debug_ext_access        = try(contains(try(tg.tasks.debug, []), "ext_access"), false) ? true : null
      task_debug_fabric            = try(contains(try(tg.tasks.debug, []), "fabric"), false) ? true : null
      task_debug_fault_mgr         = try(contains(try(tg.tasks.debug, []), "fault_mgr"), false) ? true : null
      task_debug_fc                = try(contains(try(tg.tasks.debug, []), "fc"), false) ? true : null
      task_debug_filesystem        = try(contains(try(tg.tasks.debug, []), "filesystem"), false) ? true : null
      task_debug_firewall          = try(contains(try(tg.tasks.debug, []), "firewall"), false) ? true : null
      task_debug_fr                = try(contains(try(tg.tasks.debug, []), "fr"), false) ? true : null
      task_debug_fti               = try(contains(try(tg.tasks.debug, []), "fti"), false) ? true : null
      task_debug_hdlc              = try(contains(try(tg.tasks.debug, []), "hdlc"), false) ? true : null
      task_debug_host_services     = try(contains(try(tg.tasks.debug, []), "host_services"), false) ? true : null
      task_debug_hsrp              = try(contains(try(tg.tasks.debug, []), "hsrp"), false) ? true : null
      task_debug_interface         = try(contains(try(tg.tasks.debug, []), "interface"), false) ? true : null
      task_debug_inventory         = try(contains(try(tg.tasks.debug, []), "inventory"), false) ? true : null
      task_debug_ip_services       = try(contains(try(tg.tasks.debug, []), "ip_services"), false) ? true : null
      task_debug_ipv4              = try(contains(try(tg.tasks.debug, []), "ipv4"), false) ? true : null
      task_debug_ipv6              = try(contains(try(tg.tasks.debug, []), "ipv6"), false) ? true : null
      task_debug_isis              = try(contains(try(tg.tasks.debug, []), "isis"), false) ? true : null
      task_debug_l2rib             = try(contains(try(tg.tasks.debug, []), "l2rib"), false) ? true : null
      task_debug_l2vpn             = try(contains(try(tg.tasks.debug, []), "l2vpn"), false) ? true : null
      task_debug_li                = try(contains(try(tg.tasks.debug, []), "li"), false) ? true : null
      task_debug_lisp              = try(contains(try(tg.tasks.debug, []), "lisp"), false) ? true : null
      task_debug_lldp              = try(contains(try(tg.tasks.debug, []), "lldp"), false) ? true : null
      task_debug_logging           = try(contains(try(tg.tasks.debug, []), "logging"), false) ? true : null
      task_debug_lpts              = try(contains(try(tg.tasks.debug, []), "lpts"), false) ? true : null
      task_debug_monitor           = try(contains(try(tg.tasks.debug, []), "monitor"), false) ? true : null
      task_debug_mpls_ldp          = try(contains(try(tg.tasks.debug, []), "mpls_ldp"), false) ? true : null
      task_debug_mpls_static       = try(contains(try(tg.tasks.debug, []), "mpls_static"), false) ? true : null
      task_debug_mpls_te           = try(contains(try(tg.tasks.debug, []), "mpls_te"), false) ? true : null
      task_debug_multicast         = try(contains(try(tg.tasks.debug, []), "multicast"), false) ? true : null
      task_debug_nacm              = try(contains(try(tg.tasks.debug, []), "nacm"), false) ? true : null
      task_debug_netflow           = try(contains(try(tg.tasks.debug, []), "netflow"), false) ? true : null
      task_debug_network           = try(contains(try(tg.tasks.debug, []), "network"), false) ? true : null
      task_debug_nps               = try(contains(try(tg.tasks.debug, []), "nps"), false) ? true : null
      task_debug_ospf              = try(contains(try(tg.tasks.debug, []), "ospf"), false) ? true : null
      task_debug_otn               = try(contains(try(tg.tasks.debug, []), "otn"), false) ? true : null
      task_debug_ouni              = try(contains(try(tg.tasks.debug, []), "ouni"), false) ? true : null
      task_debug_pbr               = try(contains(try(tg.tasks.debug, []), "pbr"), false) ? true : null
      task_debug_pkg_mgmt          = try(contains(try(tg.tasks.debug, []), "pkg_mgmt"), false) ? true : null
      task_debug_plat_mgr          = try(contains(try(tg.tasks.debug, []), "plat_mgr"), false) ? true : null
      task_debug_pos_dpt           = try(contains(try(tg.tasks.debug, []), "pos_dpt"), false) ? true : null
      task_debug_ppp               = try(contains(try(tg.tasks.debug, []), "ppp"), false) ? true : null
      task_debug_qos               = try(contains(try(tg.tasks.debug, []), "qos"), false) ? true : null
      task_debug_rcmd              = try(contains(try(tg.tasks.debug, []), "rcmd"), false) ? true : null
      task_debug_rib               = try(contains(try(tg.tasks.debug, []), "rib"), false) ? true : null
      task_debug_rip               = try(contains(try(tg.tasks.debug, []), "rip"), false) ? true : null
      task_debug_route_map         = try(contains(try(tg.tasks.debug, []), "route_map"), false) ? true : null
      task_debug_route_policy      = try(contains(try(tg.tasks.debug, []), "route_policy"), false) ? true : null
      task_debug_sbc               = try(contains(try(tg.tasks.debug, []), "sbc"), false) ? true : null
      task_debug_snmp              = try(contains(try(tg.tasks.debug, []), "snmp"), false) ? true : null
      task_debug_sonet_sdh         = try(contains(try(tg.tasks.debug, []), "sonet_sdh"), false) ? true : null
      task_debug_static            = try(contains(try(tg.tasks.debug, []), "static"), false) ? true : null
      task_debug_sysmgr            = try(contains(try(tg.tasks.debug, []), "sysmgr"), false) ? true : null
      task_debug_system            = try(contains(try(tg.tasks.debug, []), "system"), false) ? true : null
      task_debug_transport         = try(contains(try(tg.tasks.debug, []), "transport"), false) ? true : null
      task_debug_tty_access        = try(contains(try(tg.tasks.debug, []), "tty_access"), false) ? true : null
      task_debug_tunnel            = try(contains(try(tg.tasks.debug, []), "tunnel"), false) ? true : null
      task_debug_vlan              = try(contains(try(tg.tasks.debug, []), "vlan"), false) ? true : null
      task_debug_vpdn              = try(contains(try(tg.tasks.debug, []), "vpdn"), false) ? true : null
      task_debug_vrrp              = try(contains(try(tg.tasks.debug, []), "vrrp"), false) ? true : null
    }
  ]
  usergroups = try(length(try(local.device_config[each.value.name].usergroups, [])) == 0, true) ? null : [
    for ug in try(local.device_config[each.value.name].usergroups, []) : {
      group_name              = try(ug.name, local.defaults.iosxr.devices.configuration.usergroups.name, null)
      description             = try(ug.description, local.defaults.iosxr.devices.configuration.usergroups.description, null)
      taskgroup_cisco_support = try(contains(try(ug.taskgroups, []), "cisco-support"), false) ? true : null
      taskgroup_maintenance   = try(contains(try(ug.taskgroups, []), "maintenance"), false) ? true : null
      taskgroup_netadmin      = try(contains(try(ug.taskgroups, []), "netadmin"), false) ? true : null
      taskgroup_operator      = try(contains(try(ug.taskgroups, []), "operator"), false) ? true : null
      taskgroup_provisioning  = try(contains(try(ug.taskgroups, []), "provisioning"), false) ? true : null
      taskgroup_read_only     = try(contains(try(ug.taskgroups, []), "read-only"), false) ? true : null
      taskgroup_retrieve      = try(contains(try(ug.taskgroups, []), "retrieve"), false) ? true : null
      taskgroup_root_lr       = try(contains(try(ug.taskgroups, []), "root-lr"), false) ? true : null
      taskgroup_serviceadmin  = try(contains(try(ug.taskgroups, []), "serviceadmin"), false) ? true : null
      taskgroup_sysadmin      = try(contains(try(ug.taskgroups, []), "sysadmin"), false) ? true : null
      taskgroups = try(length([for tg in try(ug.taskgroups, []) : tg if !contains(["cisco-support", "maintenance", "netadmin", "operator", "provisioning", "read-only", "retrieve", "root-lr", "serviceadmin", "sysadmin"], tg)]) == 0, true) ? null : [
        for tg in try(ug.taskgroups, []) : { group_name = tg }
        if !contains(["cisco-support", "maintenance", "netadmin", "operator", "provisioning", "read-only", "retrieve", "root-lr", "serviceadmin", "sysadmin"], tg)
      ]
      inherit_usergroups = try(length(try(ug.inherit_usergroups, [])) == 0, true) ? null : [
        for iug in try(ug.inherit_usergroups, []) : { group_name = iug }
      ]
    }
  ]
  usernames = try(length(try(local.device_config[each.value.name].usernames, [])) == 0, true) ? null : [
    for idx, user in try(local.device_config[each.value.name].usernames, []) : {
      order                 = try(user.order, idx)
      name                  = try(user.name, null)
      policy                = try(user.policy, local.defaults.iosxr.devices.configuration.usernames.policy, null)
      shell_type            = try(user.shell_type, local.defaults.iosxr.devices.configuration.usernames.shell_type, null)
      directory             = try(user.directory, local.defaults.iosxr.devices.configuration.usernames.directory, null)
      login_history_enable  = try(user.login_history, local.defaults.iosxr.devices.configuration.usernames.login_history, null) == "enable" ? true : null
      login_history_disable = try(user.login_history, local.defaults.iosxr.devices.configuration.usernames.login_history, null) == "disable" ? true : null
      secret_type_8         = try(user.secret_type, local.defaults.iosxr.devices.configuration.usernames.secret_type, null) == "8" ? try(user.secret, null) : null
      secret_type_9         = try(user.secret_type, local.defaults.iosxr.devices.configuration.usernames.secret_type, null) == "9" ? try(user.secret, null) : null
      secret_type_10        = try(user.secret_type, local.defaults.iosxr.devices.configuration.usernames.secret_type, null) == "10" ? try(user.secret, null) : null
      group_root_lr         = try(contains(try(user.groups, []), "root-lr"), false) ? true : null
      group_netadmin        = try(contains(try(user.groups, []), "netadmin"), false) ? true : null
      group_sysadmin        = try(contains(try(user.groups, []), "sysadmin"), false) ? true : null
      group_serviceadmin    = try(contains(try(user.groups, []), "serviceadmin"), false) ? true : null
      group_operator        = try(contains(try(user.groups, []), "operator"), false) ? true : null
      group_cisco_support   = try(contains(try(user.groups, []), "cisco-support"), false) ? true : null
      group_maintenance     = try(contains(try(user.groups, []), "maintenance"), false) ? true : null
      group_provisioning    = try(contains(try(user.groups, []), "provisioning"), false) ? true : null
      group_retrieve        = try(contains(try(user.groups, []), "retrieve"), false) ? true : null
      group_read_only_tg    = try(contains(try(user.groups, []), "read-only"), false) ? true : null
      user_groups = try(length([
        for g in try(user.groups, []) : g
        if !contains(["root-lr", "netadmin", "sysadmin", "serviceadmin", "operator", "cisco-support", "maintenance", "provisioning", "retrieve", "read-only"], g)
        ]) == 0, true) ? null : [
        for g in try(user.groups, []) : { group_name = g }
        if !contains(["root-lr", "netadmin", "sysadmin", "serviceadmin", "operator", "cisco-support", "maintenance", "provisioning", "retrieve", "read-only"], g)
      ]
    }
  ]

  depends_on = [iosxr_tacacs_server.tacacs_server, iosxr_radius_server.radius_server]
}

##### AAA Authentication #####

resource "iosxr_aaa_authentication" "aaa_authentication" {
  for_each = {
    for device in local.devices : device.name => device
    if try(local.device_config[device.name].aaa.authentication, null) != null ||
    try(local.defaults.iosxr.devices.configuration.aaa.authentication, null) != null
  }
  device = each.value.name
  login = try(length(local.device_config[each.value.name].aaa.authentication.login) == 0, true) ? null : [
    for login in try(local.device_config[each.value.name].aaa.authentication.login, []) : {
      list      = try(login.name, local.defaults.iosxr.devices.configuration.aaa.authentication.login_defaults.name, null)
      a1_local  = try(login.groups[0], null) == "local" ? true : null
      a1_line   = try(login.groups[0], null) == "line" ? true : null
      a1_tacacs = try(login.groups[0], null) == "tacacs" ? true : null
      a1_radius = try(login.groups[0], null) == "radius" ? true : null
      a1_group  = try(!contains(["local", "line", "tacacs", "radius"], login.groups[0]) ? login.groups[0] : null, null)
      a2_local  = try(login.groups[1], null) == "local" ? true : null
      a2_line   = try(login.groups[1], null) == "line" ? true : null
      a2_tacacs = try(login.groups[1], null) == "tacacs" ? true : null
      a2_radius = try(login.groups[1], null) == "radius" ? true : null
      a2_group  = try(!contains(["local", "line", "tacacs", "radius"], login.groups[1]) ? login.groups[1] : null, null)
      a3_local  = try(login.groups[2], null) == "local" ? true : null
      a3_line   = try(login.groups[2], null) == "line" ? true : null
      a3_tacacs = try(login.groups[2], null) == "tacacs" ? true : null
      a3_radius = try(login.groups[2], null) == "radius" ? true : null
      a3_group  = try(!contains(["local", "line", "tacacs", "radius"], login.groups[2]) ? login.groups[2] : null, null)
      a4_local  = try(login.groups[3], null) == "local" ? true : null
      a4_line   = try(login.groups[3], null) == "line" ? true : null
      a4_tacacs = try(login.groups[3], null) == "tacacs" ? true : null
      a4_radius = try(login.groups[3], null) == "radius" ? true : null
      a4_group  = try(!contains(["local", "line", "tacacs", "radius"], login.groups[3]) ? login.groups[3] : null, null)
    }
  ]

  depends_on = [iosxr_aaa.aaa]
}
##### AAA Accounting #####

resource "iosxr_aaa_accounting" "aaa_accounting" {
  for_each = {
    for device in local.devices : device.name => device
    if try(local.device_config[device.name].aaa.accounting, null) != null ||
    try(local.defaults.iosxr.devices.configuration.aaa.accounting, null) != null
  }
  device          = each.value.name
  update_newinfo  = try(local.device_config[each.value.name].aaa.accounting.update_newinfo, local.defaults.iosxr.devices.configuration.aaa.accounting.update_newinfo, null)
  update_periodic = try(local.device_config[each.value.name].aaa.accounting.update_periodic, local.defaults.iosxr.devices.configuration.aaa.accounting.update_periodic, null)
  exec = try(length(try(local.device_config[each.value.name].aaa.accounting.exec, [])) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa.accounting.exec, []) : {
      list       = try(item.name, null)
      start_stop = try(item.records, local.defaults.iosxr.devices.configuration.aaa.accounting.exec.records, null) == "start-stop" ? true : null
      stop_only  = try(item.records, local.defaults.iosxr.devices.configuration.aaa.accounting.exec.records, null) == "stop-only" ? true : null
      a1_none    = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[0], null) == "none" ? true : null
      a1_tacacs  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[0], null) == "tacacs" ? true : null
      a1_radius  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[0], null) == "radius" ? true : null
      a1_group   = !contains(["none", "tacacs", "radius"], try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[0], "")) && try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[0], null) != null ? try(item.groups[0], null) : null
      a2_none    = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[1], null) == "none" ? true : null
      a2_tacacs  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[1], null) == "tacacs" ? true : null
      a2_radius  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[1], null) == "radius" ? true : null
      a2_group   = !contains(["none", "tacacs", "radius"], try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[1], "")) && try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[1], null) != null ? try(item.groups[1], null) : null
      a3_none    = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[2], null) == "none" ? true : null
      a3_tacacs  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[2], null) == "tacacs" ? true : null
      a3_radius  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[2], null) == "radius" ? true : null
      a3_group   = !contains(["none", "tacacs", "radius"], try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[2], "")) && try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[2], null) != null ? try(item.groups[2], null) : null
      a4_none    = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[3], null) == "none" ? true : null
      a4_tacacs  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[3], null) == "tacacs" ? true : null
      a4_radius  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[3], null) == "radius" ? true : null
      a4_group   = !contains(["none", "tacacs", "radius"], try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[3], "")) && try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[3], null) != null ? try(item.groups[3], null) : null
    }
  ]
  commands = try(length(try(local.device_config[each.value.name].aaa.accounting.commands, [])) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa.accounting.commands, []) : {
      list       = try(item.name, null)
      start_stop = try(item.records, local.defaults.iosxr.devices.configuration.aaa.accounting.commands.records, null) == "start-stop" ? true : null
      stop_only  = try(item.records, local.defaults.iosxr.devices.configuration.aaa.accounting.commands.records, null) == "stop-only" ? true : null
      a1_none    = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[0], null) == "none" ? true : null
      a1_local   = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[0], null) == "local" ? true : null
      a1_tacacs  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[0], null) == "tacacs" ? true : null
      a1_radius  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[0], null) == "radius" ? true : null
      a1_group   = !contains(["none", "local", "tacacs", "radius"], try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[0], "")) && try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[0], null) != null ? try(item.groups[0], null) : null
      a2_none    = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[1], null) == "none" ? true : null
      a2_local   = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[1], null) == "local" ? true : null
      a2_tacacs  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[1], null) == "tacacs" ? true : null
      a2_radius  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[1], null) == "radius" ? true : null
      a2_group   = !contains(["none", "local", "tacacs", "radius"], try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[1], "")) && try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[1], null) != null ? try(item.groups[1], null) : null
      a3_none    = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[2], null) == "none" ? true : null
      a3_local   = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[2], null) == "local" ? true : null
      a3_tacacs  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[2], null) == "tacacs" ? true : null
      a3_radius  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[2], null) == "radius" ? true : null
      a3_group   = !contains(["none", "local", "tacacs", "radius"], try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[2], "")) && try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[2], null) != null ? try(item.groups[2], null) : null
      a4_none    = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[3], null) == "none" ? true : null
      a4_local   = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[3], null) == "local" ? true : null
      a4_tacacs  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[3], null) == "tacacs" ? true : null
      a4_radius  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[3], null) == "radius" ? true : null
      a4_group   = !contains(["none", "local", "tacacs", "radius"], try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[3], "")) && try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[3], null) != null ? try(item.groups[3], null) : null
    }
  ]
  system = try(length(try(local.device_config[each.value.name].aaa.accounting.system, [])) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa.accounting.system, []) : {
      list       = try(item.name, null)
      start_stop = try(item.records, local.defaults.iosxr.devices.configuration.aaa.accounting.system.records, null) == "start-stop" ? true : null
      broadcast  = try(item.broadcast, local.defaults.iosxr.devices.configuration.aaa.accounting.system.broadcast, null)
      a1_none    = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[0], null) == "none" ? true : null
      a1_tacacs  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[0], null) == "tacacs" ? true : null
      a1_radius  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[0], null) == "radius" ? true : null
      a1_group   = !contains(["none", "tacacs", "radius"], try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[0], "")) && try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[0], null) != null ? try(item.groups[0], null) : null
      a2_none    = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[1], null) == "none" ? true : null
      a2_tacacs  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[1], null) == "tacacs" ? true : null
      a2_radius  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[1], null) == "radius" ? true : null
      a2_group   = !contains(["none", "tacacs", "radius"], try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[1], "")) && try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[1], null) != null ? try(item.groups[1], null) : null
      a3_none    = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[2], null) == "none" ? true : null
      a3_tacacs  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[2], null) == "tacacs" ? true : null
      a3_radius  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[2], null) == "radius" ? true : null
      a3_group   = !contains(["none", "tacacs", "radius"], try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[2], "")) && try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[2], null) != null ? try(item.groups[2], null) : null
      a4_none    = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[3], null) == "none" ? true : null
      a4_tacacs  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[3], null) == "tacacs" ? true : null
      a4_radius  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[3], null) == "radius" ? true : null
      a4_group   = !contains(["none", "tacacs", "radius"], try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[3], "")) && try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[3], null) != null ? try(item.groups[3], null) : null
    }
  ]
  network = try(length(try(local.device_config[each.value.name].aaa.accounting.network, [])) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa.accounting.network, []) : {
      list       = try(item.name, null)
      start_stop = try(item.records, local.defaults.iosxr.devices.configuration.aaa.accounting.network.records, null) == "start-stop" ? true : null
      stop_only  = try(item.records, local.defaults.iosxr.devices.configuration.aaa.accounting.network.records, null) == "stop-only" ? true : null
      a1_none    = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[0], null) == "none" ? true : null
      a1_tacacs  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[0], null) == "tacacs" ? true : null
      a1_radius  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[0], null) == "radius" ? true : null
      a1_group   = !contains(["none", "tacacs", "radius"], try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[0], "")) && try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[0], null) != null ? try(item.groups[0], null) : null
      a2_none    = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[1], null) == "none" ? true : null
      a2_tacacs  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[1], null) == "tacacs" ? true : null
      a2_radius  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[1], null) == "radius" ? true : null
      a2_group   = !contains(["none", "tacacs", "radius"], try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[1], "")) && try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[1], null) != null ? try(item.groups[1], null) : null
      a3_none    = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[2], null) == "none" ? true : null
      a3_tacacs  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[2], null) == "tacacs" ? true : null
      a3_radius  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[2], null) == "radius" ? true : null
      a3_group   = !contains(["none", "tacacs", "radius"], try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[2], "")) && try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[2], null) != null ? try(item.groups[2], null) : null
      a4_none    = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[3], null) == "none" ? true : null
      a4_tacacs  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[3], null) == "tacacs" ? true : null
      a4_radius  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[3], null) == "radius" ? true : null
      a4_group   = !contains(["none", "tacacs", "radius"], try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[3], "")) && try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[3], null) != null ? try(item.groups[3], null) : null
    }
  ]
  depends_on = [iosxr_aaa.aaa]
}
##### AAA Authorization #####

resource "iosxr_aaa_authorization" "aaa_authorization" {
  for_each = {
    for device in local.devices : device.name => device
    if try(local.device_config[device.name].aaa.authorization, null) != null ||
    try(local.defaults.iosxr.devices.configuration.aaa.authorization, null) != null
  }
  device = each.value.name
  exec = try(length(try(local.device_config[each.value.name].aaa.authorization.exec, [])) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa.authorization.exec, []) : {
      list      = try(item.name, null)
      a1_local  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[0], null) == "local" ? true : null
      a1_none   = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[0], null) == "none" ? true : null
      a1_tacacs = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[0], null) == "tacacs" ? true : null
      a1_radius = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[0], null) == "radius" ? true : null
      a1_group  = !contains(["local", "none", "tacacs", "radius"], try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[0], "")) && try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[0], null) != null ? try(item.groups[0], null) : null
      a2_local  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[1], null) == "local" ? true : null
      a2_none   = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[1], null) == "none" ? true : null
      a2_tacacs = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[1], null) == "tacacs" ? true : null
      a2_radius = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[1], null) == "radius" ? true : null
      a2_group  = !contains(["local", "none", "tacacs", "radius"], try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[1], "")) && try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[1], null) != null ? try(item.groups[1], null) : null
      a3_local  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[2], null) == "local" ? true : null
      a3_none   = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[2], null) == "none" ? true : null
      a3_tacacs = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[2], null) == "tacacs" ? true : null
      a3_radius = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[2], null) == "radius" ? true : null
      a3_group  = !contains(["local", "none", "tacacs", "radius"], try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[2], "")) && try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[2], null) != null ? try(item.groups[2], null) : null
      a4_local  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[3], null) == "local" ? true : null
      a4_none   = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[3], null) == "none" ? true : null
      a4_tacacs = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[3], null) == "tacacs" ? true : null
      a4_radius = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[3], null) == "radius" ? true : null
      a4_group  = !contains(["local", "none", "tacacs", "radius"], try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[3], "")) && try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.exec.groups[3], null) != null ? try(item.groups[3], null) : null
    }
  ]
  eventmanager = try(length(try(local.device_config[each.value.name].aaa.authorization.eventmanager, [])) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa.authorization.eventmanager, []) : {
      list      = try(item.name, null)
      a1_local  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.eventmanager.groups[0], null) == "local" ? true : null
      a1_tacacs = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.eventmanager.groups[0], null) == "tacacs" ? true : null
      a1_group  = !contains(["local", "tacacs"], try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.eventmanager.groups[0], "")) && try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.eventmanager.groups[0], null) != null ? try(item.groups[0], null) : null
      a2_local  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.eventmanager.groups[1], null) == "local" ? true : null
      a2_tacacs = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.eventmanager.groups[1], null) == "tacacs" ? true : null
      a2_group  = !contains(["local", "tacacs"], try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.eventmanager.groups[1], "")) && try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.eventmanager.groups[1], null) != null ? try(item.groups[1], null) : null
    }
  ]
  commands = try(length(try(local.device_config[each.value.name].aaa.authorization.commands, [])) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa.authorization.commands, []) : {
      list      = try(item.name, null)
      a1_local  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[0], null) == "local" ? true : null
      a1_none   = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[0], null) == "none" ? true : null
      a1_tacacs = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[0], null) == "tacacs" ? true : null
      a1_group  = !contains(["local", "none", "tacacs"], try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[0], "")) && try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[0], null) != null ? try(item.groups[0], null) : null
      a2_local  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[1], null) == "local" ? true : null
      a2_none   = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[1], null) == "none" ? true : null
      a2_tacacs = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[1], null) == "tacacs" ? true : null
      a2_group  = !contains(["local", "none", "tacacs"], try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[1], "")) && try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[1], null) != null ? try(item.groups[1], null) : null
      a3_local  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[2], null) == "local" ? true : null
      a3_none   = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[2], null) == "none" ? true : null
      a3_tacacs = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[2], null) == "tacacs" ? true : null
      a3_group  = !contains(["local", "none", "tacacs"], try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[2], "")) && try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[2], null) != null ? try(item.groups[2], null) : null
      a4_local  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[3], null) == "local" ? true : null
      a4_none   = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[3], null) == "none" ? true : null
      a4_tacacs = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[3], null) == "tacacs" ? true : null
      a4_group  = !contains(["local", "none", "tacacs"], try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[3], "")) && try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.commands.groups[3], null) != null ? try(item.groups[3], null) : null
    }
  ]
  network = try(length(try(local.device_config[each.value.name].aaa.authorization.network, [])) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa.authorization.network, []) : {
      list      = try(item.name, null)
      a1_local  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[0], null) == "local" ? true : null
      a1_none   = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[0], null) == "none" ? true : null
      a1_tacacs = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[0], null) == "tacacs" ? true : null
      a1_radius = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[0], null) == "radius" ? true : null
      a1_group  = !contains(["local", "none", "tacacs", "radius"], try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[0], "")) && try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[0], null) != null ? try(item.groups[0], null) : null
      a2_local  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[1], null) == "local" ? true : null
      a2_none   = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[1], null) == "none" ? true : null
      a2_tacacs = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[1], null) == "tacacs" ? true : null
      a2_radius = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[1], null) == "radius" ? true : null
      a2_group  = !contains(["local", "none", "tacacs", "radius"], try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[1], "")) && try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[1], null) != null ? try(item.groups[1], null) : null
      a3_local  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[2], null) == "local" ? true : null
      a3_none   = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[2], null) == "none" ? true : null
      a3_tacacs = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[2], null) == "tacacs" ? true : null
      a3_radius = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[2], null) == "radius" ? true : null
      a3_group  = !contains(["local", "none", "tacacs", "radius"], try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[2], "")) && try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[2], null) != null ? try(item.groups[2], null) : null
      a4_local  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[3], null) == "local" ? true : null
      a4_none   = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[3], null) == "none" ? true : null
      a4_tacacs = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[3], null) == "tacacs" ? true : null
      a4_radius = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[3], null) == "radius" ? true : null
      a4_group  = !contains(["local", "none", "tacacs", "radius"], try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[3], "")) && try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.authorization.network.groups[3], null) != null ? try(item.groups[3], null) : null
    }
  ]
  depends_on = [iosxr_aaa.aaa]
}

locals {
  radius_servers = flatten([
    for device in local.devices : [
      {
        key                                                           = device.name
        device_name                                                   = device.name
        key_type_6                                                    = try(local.device_config[device.name].radius_server.key_type, local.defaults.iosxr.devices.configuration.radius_server.key_type, null) == 6 ? try(local.device_config[device.name].radius_server.key, local.defaults.iosxr.devices.configuration.radius_server.key, null) : null
        key_type_7                                                    = try(local.device_config[device.name].radius_server.key_type, local.defaults.iosxr.devices.configuration.radius_server.key_type, null) == 7 ? try(local.device_config[device.name].radius_server.key, local.defaults.iosxr.devices.configuration.radius_server.key, null) : null
        timeout                                                       = try(local.device_config[device.name].radius_server.timeout, local.defaults.iosxr.devices.configuration.radius_server.timeout, null)
        retransmit_disable                                            = try(local.device_config[device.name].radius_server.retransmit_disable, local.defaults.iosxr.devices.configuration.radius_server.retransmit_disable, null)
        retransmit_retries                                            = try(local.device_config[device.name].radius_server.retransmit_retries, local.defaults.iosxr.devices.configuration.radius_server.retransmit_retries, null)
        load_balance_method_least_outstanding_batch_size              = try(local.device_config[device.name].radius_server.load_balance_method_least_outstanding_batch_size, local.defaults.iosxr.devices.configuration.radius_server.load_balance_method_least_outstanding_batch_size, null)
        load_balance_method_least_outstanding_ignore_preferred_server = try(local.device_config[device.name].radius_server.load_balance_method_least_outstanding_ignore_preferred_server, local.defaults.iosxr.devices.configuration.radius_server.load_balance_method_least_outstanding_ignore_preferred_server, null)
        throttle_access                                               = try(local.device_config[device.name].radius_server.throttle.access, local.defaults.iosxr.devices.configuration.radius_server.throttle.access, null)
        throttle_access_timeout                                       = try(local.device_config[device.name].radius_server.throttle.access_timeout, local.defaults.iosxr.devices.configuration.radius_server.throttle.access_timeout, null)
        throttle_accounting                                           = try(local.device_config[device.name].radius_server.throttle.accounting, local.defaults.iosxr.devices.configuration.radius_server.throttle.accounting, null)
        deadtime                                                      = try(local.device_config[device.name].radius_server.deadtime, local.defaults.iosxr.devices.configuration.radius_server.deadtime, null)
        dead_criteria_time                                            = try(local.device_config[device.name].radius_server.dead_criteria.time, local.defaults.iosxr.devices.configuration.radius_server.dead_criteria.time, null)
        dead_criteria_tries                                           = try(local.device_config[device.name].radius_server.dead_criteria.tries, local.defaults.iosxr.devices.configuration.radius_server.dead_criteria.tries, null)
        source_port_extended                                          = try(local.device_config[device.name].radius_server.source_port_extended, local.defaults.iosxr.devices.configuration.radius_server.source_port_extended, null)
        ipv4_dscp = try(lookup(local.dscp_map,
          tostring(try(local.device_config[device.name].radius_server.ipv4_dscp, local.defaults.iosxr.devices.configuration.radius_server.ipv4_dscp)),
          tostring(try(local.device_config[device.name].radius_server.ipv4_dscp, local.defaults.iosxr.devices.configuration.radius_server.ipv4_dscp))
          ), null
        )
        ipv6_dscp = try(lookup(local.dscp_map,
          tostring(try(local.device_config[device.name].radius_server.ipv6_dscp, local.defaults.iosxr.devices.configuration.radius_server.ipv6_dscp)),
          tostring(try(local.device_config[device.name].radius_server.ipv6_dscp, local.defaults.iosxr.devices.configuration.radius_server.ipv6_dscp))
          ), null
        )
        vsa_attribute_ignore_unknown                              = try(local.device_config[device.name].radius_server.vsa_attribute_ignore_unknown, local.defaults.iosxr.devices.configuration.radius_server.vsa_attribute_ignore_unknown, null)
        disallow_null_username                                    = try(local.device_config[device.name].radius_server.disallow_null_username, local.defaults.iosxr.devices.configuration.radius_server.disallow_null_username, null)
        attribute_acct_session_id_prepend_nas_port_id             = try(local.device_config[device.name].radius_server.attribute.acct_session_id_prepend_nas_port_id, local.defaults.iosxr.devices.configuration.radius_server.attribute.acct_session_id_prepend_nas_port_id, null)
        attribute_acct_multi_session_id_include_parent_session_id = try(local.device_config[device.name].radius_server.attribute.acct_multi_session_id_include_parent_session_id, local.defaults.iosxr.devices.configuration.radius_server.attribute.acct_multi_session_id_include_parent_session_id, null)
        attribute_filter_id_11_default_direction                  = try(local.device_config[device.name].radius_server.attribute.filter_id_11_default_direction, local.defaults.iosxr.devices.configuration.radius_server.attribute.filter_id_11_default_direction, null)
        hosts = try(length(local.device_config[device.name].radius_server.hosts) == 0, true) ? null : [
          for idx, host in local.device_config[device.name].radius_server.hosts : {
            order                    = idx
            address                  = try(host.address, local.defaults.iosxr.devices.configuration.radius_server.hosts.address, null)
            auth_port                = try(host.auth_port, local.defaults.iosxr.devices.configuration.radius_server.hosts.auth_port, null)
            acct_port                = try(host.acct_port, local.defaults.iosxr.devices.configuration.radius_server.hosts.acct_port, null)
            dtls_server_trustpoint   = try(host.dtls_server_trustpoint, local.defaults.iosxr.devices.configuration.radius_server.hosts.dtls_server_trustpoint, null)
            idle_time                = try(host.idle_time, local.defaults.iosxr.devices.configuration.radius_server.hosts.idle_time, null)
            ignore_acct_port         = try(host.ignore_acct_port, local.defaults.iosxr.devices.configuration.radius_server.hosts.ignore_acct_port, null)
            ignore_auth_port         = try(host.ignore_auth_port, local.defaults.iosxr.devices.configuration.radius_server.hosts.ignore_auth_port, null)
            key_type_6               = try(host.key_type, local.defaults.iosxr.devices.configuration.radius_server.hosts.key_type, null) == 6 ? try(host.key, local.defaults.iosxr.devices.configuration.radius_server.hosts.key, null) : null
            key_type_7               = try(host.key_type, local.defaults.iosxr.devices.configuration.radius_server.hosts.key_type, null) == 7 ? try(host.key, local.defaults.iosxr.devices.configuration.radius_server.hosts.key, null) : null
            radsec_server_trustpoint = try(host.radsec_server_trustpoint, local.defaults.iosxr.devices.configuration.radius_server.hosts.radsec_server_trustpoint, null)
            retransmit               = try(host.retransmit, local.defaults.iosxr.devices.configuration.radius_server.hosts.retransmit, null)
            test_username            = try(host.test_username, local.defaults.iosxr.devices.configuration.radius_server.hosts.test_username, null)
            timeout                  = try(host.timeout, local.defaults.iosxr.devices.configuration.radius_server.hosts.timeout, null)
          }
        ]
        attribute_lists = try(length(local.device_config[device.name].radius_server.attribute.lists) == 0, true) ? null : [
          for attr_list in local.device_config[device.name].radius_server.attribute.lists : {
            name              = try(attr_list.name, local.defaults.iosxr.devices.configuration.radius_server.attribute.lists.name, null)
            radius_attributes = try(attr_list.attributes, local.defaults.iosxr.devices.configuration.radius_server.attribute.lists.attributes, null)
            attribute_vendor_ids = try(length(attr_list.attribute_vendor_ids) == 0, true) ? null : [
              for vendor in attr_list.attribute_vendor_ids : {
                id = try(vendor.id, local.defaults.iosxr.devices.configuration.radius_server.attribute.lists.attribute_vendor_ids.id, null)
                vendor_types = try(length(vendor.vendor_types) == 0, true) ? null : [
                  for vtype in vendor.vendor_types : {
                    vendor_type_id = try(vtype.id, local.defaults.iosxr.devices.configuration.radius_server.attribute.lists.attribute_vendor_ids.vendor_types.id, null)
                  }
                ]
              }
            ]
          }
        ]
      }
    ] if try(local.device_config[device.name].radius_server, null) != null || try(local.defaults.iosxr.devices.configuration.radius_server, null) != null
  ])
}

resource "iosxr_radius_server" "radius_server" {
  for_each                                                      = { for radius_server in local.radius_servers : radius_server.key => radius_server }
  device                                                        = each.value.device_name
  key_type_6                                                    = each.value.key_type_6
  key_type_7                                                    = each.value.key_type_7
  timeout                                                       = each.value.timeout
  retransmit_disable                                            = each.value.retransmit_disable
  retransmit_retries                                            = each.value.retransmit_retries
  load_balance_method_least_outstanding_batch_size              = each.value.load_balance_method_least_outstanding_batch_size
  load_balance_method_least_outstanding_ignore_preferred_server = each.value.load_balance_method_least_outstanding_ignore_preferred_server
  throttle_access                                               = each.value.throttle_access
  throttle_access_timeout                                       = each.value.throttle_access_timeout
  throttle_accounting                                           = each.value.throttle_accounting
  deadtime                                                      = each.value.deadtime
  dead_criteria_time                                            = each.value.dead_criteria_time
  dead_criteria_tries                                           = each.value.dead_criteria_tries
  source_port_extended                                          = each.value.source_port_extended
  ipv4_dscp                                                     = each.value.ipv4_dscp
  ipv6_dscp                                                     = each.value.ipv6_dscp
  vsa_attribute_ignore_unknown                                  = each.value.vsa_attribute_ignore_unknown
  disallow_null_username                                        = each.value.disallow_null_username
  attribute_acct_session_id_prepend_nas_port_id                 = each.value.attribute_acct_session_id_prepend_nas_port_id
  attribute_acct_multi_session_id_include_parent_session_id     = each.value.attribute_acct_multi_session_id_include_parent_session_id
  attribute_filter_id_11_default_direction                      = each.value.attribute_filter_id_11_default_direction
  hosts                                                         = each.value.hosts
  attribute_lists                                               = each.value.attribute_lists
}

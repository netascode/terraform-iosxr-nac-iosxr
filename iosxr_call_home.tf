resource "iosxr_call_home" "call_home" {
  for_each = {
    for device in local.devices : device.name => device
    if try(local.device_config[device.name].call_home, null) != null ||
    try(local.defaults.iosxr.devices.configuration.call_home, null) != null
  }
  device = each.value.name

  # Simple attributes with defaults fallback
  service_active             = try(local.device_config[each.value.name].call_home.service_active, local.defaults.iosxr.devices.configuration.call_home.service_active, null)
  sender_from                = try(local.device_config[each.value.name].call_home.sender_from, local.defaults.iosxr.devices.configuration.call_home.sender_from, null)
  sender_reply_to            = try(local.device_config[each.value.name].call_home.sender_reply_to, local.defaults.iosxr.devices.configuration.call_home.sender_reply_to, null)
  contact_email              = try(local.device_config[each.value.name].call_home.contact_email, local.defaults.iosxr.devices.configuration.call_home.contact_email, null)
  contact_smart_licensing    = try(local.device_config[each.value.name].call_home.contact_smart_licensing, local.defaults.iosxr.devices.configuration.call_home.contact_smart_licensing, null)
  phone_number               = try(local.device_config[each.value.name].call_home.phone_number, local.defaults.iosxr.devices.configuration.call_home.phone_number, null)
  street_address             = try(local.device_config[each.value.name].call_home.street_address, local.defaults.iosxr.devices.configuration.call_home.street_address, null)
  customer_id                = try(local.device_config[each.value.name].call_home.customer_id, local.defaults.iosxr.devices.configuration.call_home.customer_id, null)
  contract_id                = try(local.device_config[each.value.name].call_home.contract_id, local.defaults.iosxr.devices.configuration.call_home.contract_id, null)
  site_id                    = try(local.device_config[each.value.name].call_home.site_id, local.defaults.iosxr.devices.configuration.call_home.site_id, null)
  rate_limit                 = try(local.device_config[each.value.name].call_home.rate_limit, local.defaults.iosxr.devices.configuration.call_home.rate_limit, null)
  data_privacy_hostname      = try(local.device_config[each.value.name].call_home.data_privacy_hostname, local.defaults.iosxr.devices.configuration.call_home.data_privacy_hostname, null)
  data_privacy_level_high    = try(local.device_config[each.value.name].call_home.data_privacy_level_high, local.defaults.iosxr.devices.configuration.call_home.data_privacy_level_high, null)
  data_privacy_level_normal  = try(local.device_config[each.value.name].call_home.data_privacy_level_normal, local.defaults.iosxr.devices.configuration.call_home.data_privacy_level_normal, null)
  http_proxy_name            = try(local.device_config[each.value.name].call_home.http_proxy_name, local.defaults.iosxr.devices.configuration.call_home.http_proxy_name, null)
  http_proxy_port            = try(local.device_config[each.value.name].call_home.http_proxy_port, local.defaults.iosxr.devices.configuration.call_home.http_proxy_port, null)
  source_interface           = try(local.device_config[each.value.name].call_home.source_interface, local.defaults.iosxr.devices.configuration.call_home.source_interface, null)
  syslog_throttling          = try(local.device_config[each.value.name].call_home.syslog_throttling, local.defaults.iosxr.devices.configuration.call_home.syslog_throttling, null)
  vrf                        = try(local.device_config[each.value.name].call_home.vrf, local.defaults.iosxr.devices.configuration.call_home.vrf, null)
  aaa_authorization          = try(local.device_config[each.value.name].call_home.aaa_authorization, local.defaults.iosxr.devices.configuration.call_home.aaa_authorization, null)
  aaa_authorization_username = try(local.device_config[each.value.name].call_home.aaa_authorization_username, local.defaults.iosxr.devices.configuration.call_home.aaa_authorization_username, null)

  # Nested lists - no defaults at list level
  mail_servers = try(length(local.device_config[each.value.name].call_home.mail_servers) == 0, true) ? null : [
    for mail_server in local.device_config[each.value.name].call_home.mail_servers : {
      mail_server_name = try(mail_server.mail_server_name, null)
      priority         = try(mail_server.priority, null)
    }
  ]

  profiles = try(length(local.device_config[each.value.name].call_home.profiles) == 0, true) ? null : [
    for profile in local.device_config[each.value.name].call_home.profiles : {
      profile_name                               = try(profile.profile_name, null)
      active                                     = try(profile.active, null)
      anonymous_reporting_only                   = try(profile.anonymous_reporting_only, null)
      destination_message_size_limit             = try(profile.destination_message_size_limit, null)
      destination_msg_format_long                = try(profile.destination_msg_format_long, null)
      destination_msg_format_short               = try(profile.destination_msg_format_short, null)
      destination_transport_method_email         = try(profile.destination_transport_method_email, null)
      destination_transport_method_email_disable = try(profile.destination_transport_method_email_disable, null)
      destination_transport_method_http          = try(profile.destination_transport_method_http, null)
      destination_transport_method_http_disable  = try(profile.destination_transport_method_http_disable, null)
      reporting_smart_call_home_data             = try(profile.reporting_smart_call_home_data, null)
      reporting_smart_call_home_data_disable     = try(profile.reporting_smart_call_home_data_disable, null)
      reporting_smart_licensing_data             = try(profile.reporting_smart_licensing_data, null)
      reporting_smart_licensing_data_disable     = try(profile.reporting_smart_licensing_data_disable, null)

      # Nested list within profiles
      destination_addresses = try(length(profile.destination_addresses) == 0, true) ? null : [
        for address in profile.destination_addresses : {
          address_type        = try(address.address_type, null)
          destination_address = try(address.destination_address, null)
        }
      ]
    }
  ]
}

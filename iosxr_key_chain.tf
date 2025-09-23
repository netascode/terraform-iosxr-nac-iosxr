locals {
  device_key_chains = flatten([
    for device in local.devices : [
      for key_chain in try(local.device_config[device.name].key_chain, local.defaults.iosxr.configuration.key_chain, []) : {
        device_name = device.name
        name        = try(key_chain.name, local.defaults.iosxr.configuration.key_chain_name, null)
        key         = "${device.name}-keychain-${key_chain.name}"
        keys = [
          for key in try(key_chain.keys, local.defaults.iosxr.configuration.key_chain_keys, []) : {
            key_name                                = try(key.key_name, local.defaults.iosxr.configuration.key_chain_key_name, null)
            key_string_password                     = try(key.key_string_password, local.defaults.iosxr.configuration.key_chain_key_string_password, null)
            cryptographic_algorithm                 = try(key.cryptographic_algorithm, local.defaults.iosxr.configuration.key_chain_cryptographic_algorithm, null)
            accept_lifetime_infinite                = try(key.accept_lifetime_infinite, local.defaults.iosxr.configuration.key_chain_accept_lifetime_infinite, null)
            accept_lifetime_start_time_hour         = try(key.accept_lifetime_start_time_hour, local.defaults.iosxr.configuration.key_chain_accept_lifetime_start_time_hour, null)
            accept_lifetime_start_time_minute       = try(key.accept_lifetime_start_time_minute, local.defaults.iosxr.configuration.key_chain_accept_lifetime_start_time_minute, null)
            accept_lifetime_start_time_second       = try(key.accept_lifetime_start_time_second, local.defaults.iosxr.configuration.key_chain_accept_lifetime_start_time_second, null)
            accept_lifetime_start_time_day_of_month = try(key.accept_lifetime_start_time_day_of_month, local.defaults.iosxr.configuration.key_chain_accept_lifetime_start_time_day_of_month, null)
            accept_lifetime_start_time_month        = try(key.accept_lifetime_start_time_month, local.defaults.iosxr.configuration.key_chain_accept_lifetime_start_time_month, null)
            accept_lifetime_start_time_year         = try(key.accept_lifetime_start_time_year, local.defaults.iosxr.configuration.key_chain_accept_lifetime_start_time_year, null)
            send_lifetime_infinite                  = try(key.send_lifetime_infinite, local.defaults.iosxr.configuration.key_chain_send_lifetime_infinite, null)
            send_lifetime_start_time_hour           = try(key.send_lifetime_start_time_hour, local.defaults.iosxr.configuration.key_chain_send_lifetime_start_time_hour, null)
            send_lifetime_start_time_minute         = try(key.send_lifetime_start_time_minute, local.defaults.iosxr.configuration.key_chain_send_lifetime_start_time_minute, null)
            send_lifetime_start_time_second         = try(key.send_lifetime_start_time_second, local.defaults.iosxr.configuration.key_chain_send_lifetime_start_time_second, null)
            send_lifetime_start_time_day_of_month   = try(key.send_lifetime_start_time_day_of_month, local.defaults.iosxr.configuration.key_chain_send_lifetime_start_time_day_of_month, null)
            send_lifetime_start_time_month          = try(key.send_lifetime_start_time_month, local.defaults.iosxr.configuration.key_chain_send_lifetime_start_time_month, null)
            send_lifetime_start_time_year           = try(key.send_lifetime_start_time_year, local.defaults.iosxr.configuration.key_chain_send_lifetime_start_time_year, null)
          }
        ]
      }
    ]
    if try(local.device_config[device.name].key_chain, null) != null || try(local.defaults.iosxr.configuration.key_chain, null) != null
  ])
}

resource "iosxr_key_chain" "key_chain" {
  for_each = { for key_chain in local.device_key_chains : key_chain.key => key_chain }

  device = each.value.device_name
  name   = each.value.name
  keys   = each.value.keys
}

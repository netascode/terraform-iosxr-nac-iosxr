locals {
  key_chains = flatten([
    for device in local.devices : [
      for key_chain in try(local.device_config[device.name].key_chains, []) : {
        key                       = format("%s/%s", device.name, key_chain.name)
        device_name               = device.name
        name                      = try(key_chain.name, local.defaults.iosxr.devices.configuration.key_chains.name, null)
        accept_tolerance_value    = try(key_chain.accept_tolerance_value, local.defaults.iosxr.devices.configuration.key_chains.accept_tolerance_value, null)
        accept_tolerance_infinite = try(key_chain.accept_tolerance_infinite, local.defaults.iosxr.devices.configuration.key_chains.accept_tolerance_infinite, null)
        timezone_gmt              = try(key_chain.timezone_gmt, local.defaults.iosxr.devices.configuration.key_chains.timezone_gmt, null)
        timezone_local            = try(key_chain.timezone_local, local.defaults.iosxr.devices.configuration.key_chains.timezone_local, null)
        keys = try(length(key_chain.keys) == 0, true) ? null : [for key in key_chain.keys : {
          key_name                                = try(key.key_name, local.defaults.iosxr.devices.configuration.key_chains.keys.key_name, null)
          key_string_password                     = try(key.key_string_password, local.defaults.iosxr.devices.configuration.key_chains.keys.key_string_password, null)
          key_string_password6                    = try(key.key_string_password6, local.defaults.iosxr.devices.configuration.key_chains.keys.key_string_password6, null)
          cryptographic_algorithm                 = try(key.cryptographic_algorithm, local.defaults.iosxr.devices.configuration.key_chains.keys.cryptographic_algorithm, null)
          accept_lifetime_infinite                = try(key.accept_lifetime_infinite, local.defaults.iosxr.devices.configuration.key_chains.keys.accept_lifetime_infinite, null)
          accept_lifetime_duration                = try(key.accept_lifetime_duration, local.defaults.iosxr.devices.configuration.key_chains.keys.accept_lifetime_duration, null)
          accept_lifetime_start_time_hour         = try(key.accept_lifetime_start_time_hour, local.defaults.iosxr.devices.configuration.key_chains.keys.accept_lifetime_start_time_hour, null)
          accept_lifetime_start_time_minute       = try(key.accept_lifetime_start_time_minute, local.defaults.iosxr.devices.configuration.key_chains.keys.accept_lifetime_start_time_minute, null)
          accept_lifetime_start_time_second       = try(key.accept_lifetime_start_time_second, local.defaults.iosxr.devices.configuration.key_chains.keys.accept_lifetime_start_time_second, null)
          accept_lifetime_start_time_day_of_month = try(key.accept_lifetime_start_time_day_of_month, local.defaults.iosxr.devices.configuration.key_chains.keys.accept_lifetime_start_time_day_of_month, null)
          accept_lifetime_start_time_month        = try(key.accept_lifetime_start_time_month, local.defaults.iosxr.devices.configuration.key_chains.keys.accept_lifetime_start_time_month, null)
          accept_lifetime_start_time_year         = try(key.accept_lifetime_start_time_year, local.defaults.iosxr.devices.configuration.key_chains.keys.accept_lifetime_start_time_year, null)
          accept_lifetime_end_time_hour           = try(key.accept_lifetime_end_time_hour, local.defaults.iosxr.devices.configuration.key_chains.keys.accept_lifetime_end_time_hour, null)
          accept_lifetime_end_time_minute         = try(key.accept_lifetime_end_time_minute, local.defaults.iosxr.devices.configuration.key_chains.keys.accept_lifetime_end_time_minute, null)
          accept_lifetime_end_time_second         = try(key.accept_lifetime_end_time_second, local.defaults.iosxr.devices.configuration.key_chains.keys.accept_lifetime_end_time_second, null)
          accept_lifetime_end_time_day_of_month   = try(key.accept_lifetime_end_time_day_of_month, local.defaults.iosxr.devices.configuration.key_chains.keys.accept_lifetime_end_time_day_of_month, null)
          accept_lifetime_end_time_month          = try(key.accept_lifetime_end_time_month, local.defaults.iosxr.devices.configuration.key_chains.keys.accept_lifetime_end_time_month, null)
          accept_lifetime_end_time_year           = try(key.accept_lifetime_end_time_year, local.defaults.iosxr.devices.configuration.key_chains.keys.accept_lifetime_end_time_year, null)
          send_lifetime_infinite                  = try(key.send_lifetime_infinite, local.defaults.iosxr.devices.configuration.key_chains.keys.send_lifetime_infinite, null)
          send_lifetime_duration                  = try(key.send_lifetime_duration, local.defaults.iosxr.devices.configuration.key_chains.keys.send_lifetime_duration, null)
          send_lifetime_start_time_hour           = try(key.send_lifetime_start_time_hour, local.defaults.iosxr.devices.configuration.key_chains.keys.send_lifetime_start_time_hour, null)
          send_lifetime_start_time_minute         = try(key.send_lifetime_start_time_minute, local.defaults.iosxr.devices.configuration.key_chains.keys.send_lifetime_start_time_minute, null)
          send_lifetime_start_time_second         = try(key.send_lifetime_start_time_second, local.defaults.iosxr.devices.configuration.key_chains.keys.send_lifetime_start_time_second, null)
          send_lifetime_start_time_day_of_month   = try(key.send_lifetime_start_time_day_of_month, local.defaults.iosxr.devices.configuration.key_chains.keys.send_lifetime_start_time_day_of_month, null)
          send_lifetime_start_time_month          = try(key.send_lifetime_start_time_month, local.defaults.iosxr.devices.configuration.key_chains.keys.send_lifetime_start_time_month, null)
          send_lifetime_start_time_year           = try(key.send_lifetime_start_time_year, local.defaults.iosxr.devices.configuration.key_chains.keys.send_lifetime_start_time_year, null)
          send_lifetime_end_time_hour             = try(key.send_lifetime_end_time_hour, local.defaults.iosxr.devices.configuration.key_chains.keys.send_lifetime_end_time_hour, null)
          send_lifetime_end_time_minute           = try(key.send_lifetime_end_time_minute, local.defaults.iosxr.devices.configuration.key_chains.keys.send_lifetime_end_time_minute, null)
          send_lifetime_end_time_second           = try(key.send_lifetime_end_time_second, local.defaults.iosxr.devices.configuration.key_chains.keys.send_lifetime_end_time_second, null)
          send_lifetime_end_time_day_of_month     = try(key.send_lifetime_end_time_day_of_month, local.defaults.iosxr.devices.configuration.key_chains.keys.send_lifetime_end_time_day_of_month, null)
          send_lifetime_end_time_month            = try(key.send_lifetime_end_time_month, local.defaults.iosxr.devices.configuration.key_chains.keys.send_lifetime_end_time_month, null)
          send_lifetime_end_time_year             = try(key.send_lifetime_end_time_year, local.defaults.iosxr.devices.configuration.key_chains.keys.send_lifetime_end_time_year, null)
        }]
        macsec_keys = try(length(key_chain.macsec_keys) == 0, true) ? null : [for macsec_key in key_chain.macsec_keys : {
          ckn                                = try(macsec_key.ckn, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.ckn, null)
          key_string_password                = try(macsec_key.key_string_password, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.key_string_password, null)
          key_string_password6               = try(macsec_key.key_string_password6, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.key_string_password6, null)
          key_string_cryptographic_algorithm = try(macsec_key.key_string_cryptographic_algorithm, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.key_string_cryptographic_algorithm, null)
          lifetime_infinite                  = try(macsec_key.lifetime_infinite, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime_infinite, null)
          lifetime_duration                  = try(macsec_key.lifetime_duration, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime_duration, null)
          lifetime_start_time_hour           = try(macsec_key.lifetime_start_time_hour, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime_start_time_hour, null)
          lifetime_start_time_minute         = try(macsec_key.lifetime_start_time_minute, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime_start_time_minute, null)
          lifetime_start_time_second         = try(macsec_key.lifetime_start_time_second, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime_start_time_second, null)
          lifetime_start_time_day_of_month   = try(macsec_key.lifetime_start_time_day_of_month, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime_start_time_day_of_month, null)
          lifetime_start_time_month          = try(macsec_key.lifetime_start_time_month, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime_start_time_month, null)
          lifetime_start_time_year           = try(macsec_key.lifetime_start_time_year, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime_start_time_year, null)
          lifetime_end_time_hour             = try(macsec_key.lifetime_end_time_hour, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime_end_time_hour, null)
          lifetime_end_time_minute           = try(macsec_key.lifetime_end_time_minute, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime_end_time_minute, null)
          lifetime_end_time_second           = try(macsec_key.lifetime_end_time_second, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime_end_time_second, null)
          lifetime_end_time_day_of_month     = try(macsec_key.lifetime_end_time_day_of_month, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime_end_time_day_of_month, null)
          lifetime_end_time_month            = try(macsec_key.lifetime_end_time_month, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime_end_time_month, null)
          lifetime_end_time_year             = try(macsec_key.lifetime_end_time_year, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime_end_time_year, null)
        }]
      }
    ]
  ])
}

resource "iosxr_key_chain" "key_chain" {
  for_each                  = { for key_chain in local.key_chains : key_chain.key => key_chain }
  device                    = each.value.device_name
  name                      = each.value.name
  accept_tolerance_value    = each.value.accept_tolerance_value
  accept_tolerance_infinite = each.value.accept_tolerance_infinite
  timezone_gmt              = each.value.timezone_gmt
  timezone_local            = each.value.timezone_local
  keys                      = each.value.keys
  macsec_keys               = each.value.macsec_keys
}

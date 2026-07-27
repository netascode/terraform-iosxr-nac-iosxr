locals {
  key_chains = flatten([
    for device in local.devices : [
      for key_chain in try(local.device_config[device.name].key_chains, []) : {
        key                       = format("%s/%s", device.name, key_chain.name)
        device_name               = device.name
        name                      = try(key_chain.name, local.defaults.iosxr.devices.configuration.key_chains.name, null)
        timezone_local            = try(key_chain.timezone, local.defaults.iosxr.devices.configuration.key_chains.timezone, null) == "local" ? true : null
        timezone_gmt              = try(key_chain.timezone, local.defaults.iosxr.devices.configuration.key_chains.timezone, null) == "gmt" ? true : null
        accept_tolerance_value    = try(tonumber(key_chain.accept_tolerance), tonumber(local.defaults.iosxr.devices.configuration.key_chains.accept_tolerance), null)
        accept_tolerance_infinite = try(key_chain.accept_tolerance, local.defaults.iosxr.devices.configuration.key_chains.accept_tolerance, null) == "infinite" ? true : null
        keys = try(length(key_chain.standard_keys) == 0, true) ? null : [for key in key_chain.standard_keys : {
          key_name                                = try(key.name, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.name, null)
          key_string_password                     = try(key.password_type, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.password_type, null) == 7 ? try(key.password, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.password, null) : null
          key_string_password6                    = try(key.password_type, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.password_type, null) == 6 ? try(key.password, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.password, null) : null
          cryptographic_algorithm                 = try(key.algorithm, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.algorithm, null)
          accept_lifetime_start_time_hour         = try(tonumber(split(":", try(key.accept_lifetime.from_time, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.accept_lifetime.from_time, ""))[0]), null)
          accept_lifetime_start_time_minute       = try(tonumber(split(":", try(key.accept_lifetime.from_time, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.accept_lifetime.from_time, ""))[1]), null)
          accept_lifetime_start_time_second       = try(tonumber(split(":", try(key.accept_lifetime.from_time, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.accept_lifetime.from_time, ""))[2]), null)
          accept_lifetime_start_time_month        = try(local.keychain_month_names[split("-", try(key.accept_lifetime.from_date, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.accept_lifetime.from_date, ""))[0]], null)
          accept_lifetime_start_time_day_of_month = try(tonumber(split("-", try(key.accept_lifetime.from_date, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.accept_lifetime.from_date, ""))[1]), null)
          accept_lifetime_start_time_year         = try(tonumber(split("-", try(key.accept_lifetime.from_date, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.accept_lifetime.from_date, ""))[2]), null)
          accept_lifetime_end_time_hour           = try(tonumber(split(":", try(key.accept_lifetime.to_time, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.accept_lifetime.to_time, ""))[0]), null)
          accept_lifetime_end_time_minute         = try(tonumber(split(":", try(key.accept_lifetime.to_time, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.accept_lifetime.to_time, ""))[1]), null)
          accept_lifetime_end_time_second         = try(tonumber(split(":", try(key.accept_lifetime.to_time, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.accept_lifetime.to_time, ""))[2]), null)
          accept_lifetime_end_time_month          = try(local.keychain_month_names[split("-", try(key.accept_lifetime.to_date, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.accept_lifetime.to_date, ""))[0]], null)
          accept_lifetime_end_time_day_of_month   = try(tonumber(split("-", try(key.accept_lifetime.to_date, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.accept_lifetime.to_date, ""))[1]), null)
          accept_lifetime_end_time_year           = try(tonumber(split("-", try(key.accept_lifetime.to_date, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.accept_lifetime.to_date, ""))[2]), null)
          accept_lifetime_duration                = try(key.accept_lifetime.duration, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.accept_lifetime.duration, null)
          accept_lifetime_infinite                = try(key.accept_lifetime.infinite, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.accept_lifetime.infinite, null)
          send_lifetime_start_time_hour           = try(tonumber(split(":", try(key.send_lifetime.from_time, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.send_lifetime.from_time, ""))[0]), null)
          send_lifetime_start_time_minute         = try(tonumber(split(":", try(key.send_lifetime.from_time, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.send_lifetime.from_time, ""))[1]), null)
          send_lifetime_start_time_second         = try(tonumber(split(":", try(key.send_lifetime.from_time, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.send_lifetime.from_time, ""))[2]), null)
          send_lifetime_start_time_month          = try(local.keychain_month_names[split("-", try(key.send_lifetime.from_date, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.send_lifetime.from_date, ""))[0]], null)
          send_lifetime_start_time_day_of_month   = try(tonumber(split("-", try(key.send_lifetime.from_date, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.send_lifetime.from_date, ""))[1]), null)
          send_lifetime_start_time_year           = try(tonumber(split("-", try(key.send_lifetime.from_date, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.send_lifetime.from_date, ""))[2]), null)
          send_lifetime_end_time_hour             = try(tonumber(split(":", try(key.send_lifetime.to_time, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.send_lifetime.to_time, ""))[0]), null)
          send_lifetime_end_time_minute           = try(tonumber(split(":", try(key.send_lifetime.to_time, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.send_lifetime.to_time, ""))[1]), null)
          send_lifetime_end_time_second           = try(tonumber(split(":", try(key.send_lifetime.to_time, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.send_lifetime.to_time, ""))[2]), null)
          send_lifetime_end_time_month            = try(local.keychain_month_names[split("-", try(key.send_lifetime.to_date, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.send_lifetime.to_date, ""))[0]], null)
          send_lifetime_end_time_day_of_month     = try(tonumber(split("-", try(key.send_lifetime.to_date, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.send_lifetime.to_date, ""))[1]), null)
          send_lifetime_end_time_year             = try(tonumber(split("-", try(key.send_lifetime.to_date, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.send_lifetime.to_date, ""))[2]), null)
          send_lifetime_duration                  = try(key.send_lifetime.duration, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.send_lifetime.duration, null)
          send_lifetime_infinite                  = try(key.send_lifetime.infinite, local.defaults.iosxr.devices.configuration.key_chains.standard_keys.send_lifetime.infinite, null)
        }]
        macsec_keys = try(length(key_chain.macsec_keys) == 0, true) ? null : [for mkey in key_chain.macsec_keys : {
          ckn                                = try(mkey.name, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.name, null)
          key_string_password                = try(mkey.password_type, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.password_type, null) == 7 ? try(mkey.password, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.password, null) : null
          key_string_password6               = try(mkey.password_type, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.password_type, null) == 6 ? try(mkey.password, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.password, null) : null
          key_string_cryptographic_algorithm = try(mkey.algorithm, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.algorithm, null)
          lifetime_start_time_hour           = try(tonumber(split(":", try(mkey.lifetime.from_time, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime.from_time, ""))[0]), null)
          lifetime_start_time_minute         = try(tonumber(split(":", try(mkey.lifetime.from_time, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime.from_time, ""))[1]), null)
          lifetime_start_time_second         = try(tonumber(split(":", try(mkey.lifetime.from_time, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime.from_time, ""))[2]), null)
          lifetime_start_time_month          = try(local.keychain_month_names[split("-", try(mkey.lifetime.from_date, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime.from_date, ""))[0]], null)
          lifetime_start_time_day_of_month   = try(tonumber(split("-", try(mkey.lifetime.from_date, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime.from_date, ""))[1]), null)
          lifetime_start_time_year           = try(tonumber(split("-", try(mkey.lifetime.from_date, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime.from_date, ""))[2]), null)
          lifetime_end_time_hour             = try(tonumber(split(":", try(mkey.lifetime.to_time, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime.to_time, ""))[0]), null)
          lifetime_end_time_minute           = try(tonumber(split(":", try(mkey.lifetime.to_time, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime.to_time, ""))[1]), null)
          lifetime_end_time_second           = try(tonumber(split(":", try(mkey.lifetime.to_time, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime.to_time, ""))[2]), null)
          lifetime_end_time_month            = try(local.keychain_month_names[split("-", try(mkey.lifetime.to_date, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime.to_date, ""))[0]], null)
          lifetime_end_time_day_of_month     = try(tonumber(split("-", try(mkey.lifetime.to_date, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime.to_date, ""))[1]), null)
          lifetime_end_time_year             = try(tonumber(split("-", try(mkey.lifetime.to_date, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime.to_date, ""))[2]), null)
          lifetime_duration                  = try(mkey.lifetime.duration, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime.duration, null)
          lifetime_infinite                  = try(mkey.lifetime.infinite, local.defaults.iosxr.devices.configuration.key_chains.macsec_keys.lifetime.infinite, null)
        }]
      }
    ]
  ])
}

resource "iosxr_key_chain" "key_chain" {
  for_each                  = { for key_chain in local.key_chains : key_chain.key => key_chain }
  device                    = each.value.device_name
  name                      = each.value.name
  timezone_local            = each.value.timezone_local
  timezone_gmt              = each.value.timezone_gmt
  accept_tolerance_value    = each.value.accept_tolerance_value
  accept_tolerance_infinite = each.value.accept_tolerance_infinite
  keys                      = each.value.keys
  macsec_keys               = each.value.macsec_keys
}

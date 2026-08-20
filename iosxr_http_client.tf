locals {
  http_client = flatten([
    for device in local.devices : [
      {
        key                        = device.name
        device_name                = device.name
        vrf                        = try(local.device_config[device.name].http_client.vrf, local.defaults.iosxr.devices.configuration.http_client.vrf, null)
        response_timeout           = try(local.device_config[device.name].http_client.response_timeout, local.defaults.iosxr.devices.configuration.http_client.response_timeout, null)
        connection_timeout         = try(local.device_config[device.name].http_client.connection_timeout, local.defaults.iosxr.devices.configuration.http_client.connection_timeout, null)
        connection_retry           = try(local.device_config[device.name].http_client.connection_retry, local.defaults.iosxr.devices.configuration.http_client.connection_retry, null)
        source_interface_ipv4      = try(local.device_config[device.name].http_client.source_interface_ipv4, local.defaults.iosxr.devices.configuration.http_client.source_interface_ipv4, null)
        source_interface_ipv6      = try(local.device_config[device.name].http_client.source_interface_ipv6, local.defaults.iosxr.devices.configuration.http_client.source_interface_ipv6, null)
        secure_verify_peer_disable = try(local.device_config[device.name].http_client.secure_verify_peer_disable, local.defaults.iosxr.devices.configuration.http_client.secure_verify_peer_disable, null)
        secure_verify_host_disable = try(local.device_config[device.name].http_client.secure_verify_host_disable, local.defaults.iosxr.devices.configuration.http_client.secure_verify_host_disable, null)
        tcp_window_scale           = try(local.device_config[device.name].http_client.tcp_window_scale, local.defaults.iosxr.devices.configuration.http_client.tcp_window_scale, null)
        version_default            = try(local.device_config[device.name].http_client.version, local.defaults.iosxr.devices.configuration.http_client.version, null) == "default" ? true : null
        version_10                 = try(local.device_config[device.name].http_client.version, local.defaults.iosxr.devices.configuration.http_client.version, null) == "1.0" ? true : null
        version_11                 = try(local.device_config[device.name].http_client.version, local.defaults.iosxr.devices.configuration.http_client.version, null) == "1.1" ? true : null
        ssl_version_tls10          = try(local.device_config[device.name].http_client.ssl_version, local.defaults.iosxr.devices.configuration.http_client.ssl_version, null) == "tls-1.0" ? true : null
        ssl_version_tls11          = try(local.device_config[device.name].http_client.ssl_version, local.defaults.iosxr.devices.configuration.http_client.ssl_version, null) == "tls-1.1" ? true : null
        ssl_version_tls12          = try(local.device_config[device.name].http_client.ssl_version, local.defaults.iosxr.devices.configuration.http_client.ssl_version, null) == "tls-1.2" ? true : null
        ssl_version_tls13          = try(local.device_config[device.name].http_client.ssl_version, local.defaults.iosxr.devices.configuration.http_client.ssl_version, null) == "tls-1.3" ? true : null
      }
    ] if try(local.device_config[device.name].http_client, null) != null ||
    try(local.defaults.iosxr.devices.configuration.http_client, null) != null
  ])
}

resource "iosxr_http_client" "http_client" {
  for_each                   = { for v in local.http_client : v.key => v }
  device                     = each.value.device_name
  vrf                        = each.value.vrf
  response_timeout           = each.value.response_timeout
  connection_timeout         = each.value.connection_timeout
  connection_retry           = each.value.connection_retry
  source_interface_ipv4      = each.value.source_interface_ipv4
  source_interface_ipv6      = each.value.source_interface_ipv6
  secure_verify_peer_disable = each.value.secure_verify_peer_disable
  secure_verify_host_disable = each.value.secure_verify_host_disable
  version_default            = each.value.version_default
  version_10                 = each.value.version_10
  version_11                 = each.value.version_11
  ssl_version_tls10          = each.value.ssl_version_tls10
  ssl_version_tls11          = each.value.ssl_version_tls11
  ssl_version_tls12          = each.value.ssl_version_tls12
  ssl_version_tls13          = each.value.ssl_version_tls13
  tcp_window_scale           = each.value.tcp_window_scale
}

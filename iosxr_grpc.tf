locals {
  grpc = flatten([
    for device in local.devices : [
      {
        key                        = device.name
        device_name                = device.name
        port                       = try(local.device_config[device.name].grpc.port, local.defaults.iosxr.devices.configuration.grpc.port, null)
        vrf                        = try(local.device_config[device.name].grpc.vrf, local.defaults.iosxr.devices.configuration.grpc.vrf, null)
        address_family_ipv4        = try(local.device_config[device.name].grpc.address_family, local.defaults.iosxr.devices.configuration.grpc.address_family, null) == "ipv4" ? true : null
        address_family_ipv6        = try(local.device_config[device.name].grpc.address_family, local.defaults.iosxr.devices.configuration.grpc.address_family, null) == "ipv6" ? true : null
        address_family_dual        = try(local.device_config[device.name].grpc.address_family, local.defaults.iosxr.devices.configuration.grpc.address_family, null) == "dual" ? true : null
        no_tls                     = try(local.device_config[device.name].grpc.no_tls, local.defaults.iosxr.devices.configuration.grpc.no_tls, null)
        local_connection           = try(local.device_config[device.name].grpc.local_connection, local.defaults.iosxr.devices.configuration.grpc.local_connection, null)
        certificate_authentication = try(local.device_config[device.name].grpc.certificate_authentication, local.defaults.iosxr.devices.configuration.grpc.certificate_authentication, null)
        max_request_total          = try(local.device_config[device.name].grpc.max_request_total, local.defaults.iosxr.devices.configuration.grpc.max_request_total, null)
        max_request_per_user       = try(local.device_config[device.name].grpc.max_request_per_user, local.defaults.iosxr.devices.configuration.grpc.max_request_per_user, null)
        max_streams                = try(local.device_config[device.name].grpc.max_streams, local.defaults.iosxr.devices.configuration.grpc.max_streams, null)
        max_streams_per_user       = try(local.device_config[device.name].grpc.max_streams_per_user, local.defaults.iosxr.devices.configuration.grpc.max_streams_per_user, null)
      }
    ] if try(local.device_config[device.name].grpc, null) != null || try(local.defaults.iosxr.devices.configuration.grpc, null) != null
  ])
}

resource "iosxr_grpc" "grpc" {
  for_each                   = { for g in local.grpc : g.key => g }
  device                     = each.value.device_name
  port                       = each.value.port
  vrf                        = each.value.vrf
  address_family_ipv4        = each.value.address_family_ipv4
  address_family_ipv6        = each.value.address_family_ipv6
  address_family_dual        = each.value.address_family_dual
  no_tls                     = each.value.no_tls
  local_connection           = each.value.local_connection
  certificate_authentication = each.value.certificate_authentication
  max_request_total          = each.value.max_request_total
  max_request_per_user       = each.value.max_request_per_user
  max_streams                = each.value.max_streams
  max_streams_per_user       = each.value.max_streams_per_user
}

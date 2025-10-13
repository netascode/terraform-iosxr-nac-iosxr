resource "iosxr_ssh" "ssh" {
  for_each = {
    for device in local.devices : device.name => device
    if try(local.device_config[device.name].ssh, null) != null
    || try(local.defaults.iosxr.configuration.ssh, null) != null
  }

  device = each.value.name

  # General SSH server settings
  server_dscp          = try(local.device_config[each.value.name].ssh.server_dscp, local.defaults.iosxr.configuration.ssh.server_dscp, null)
  server_logging       = try(local.device_config[each.value.name].ssh.server_logging, local.defaults.iosxr.configuration.ssh.server_logging, null)
  server_rate_limit    = try(local.device_config[each.value.name].ssh.server_rate_limit, local.defaults.iosxr.configuration.ssh.server_rate_limit, null)
  server_session_limit = try(local.device_config[each.value.name].ssh.server_session_limit, local.defaults.iosxr.configuration.ssh.server_session_limit, null)
  server_v2            = try(local.device_config[each.value.name].ssh.server_v2, local.defaults.iosxr.configuration.ssh.server_v2, null)

  # VRF-specific SSH configs (list of objects)
  server_vrfs = try(
    local.device_config[each.value.name].ssh.server_vrfs,
    local.defaults.iosxr.configuration.ssh.server_vrfs,
    []
  )
}

# Banner Resources - handles list format with banner_type and line
locals {
  # Flatten banner configuration from list format
  device_banners = flatten([
    for device in local.devices : [
      for banner in try(local.device_config[device.name].banner, []) : {
        device_name = device.name
        banner_type = try(banner.banner_type, local.defaults.iosxr.configuration.banner_type, null)
        line        = try(banner.line, local.defaults.iosxr.configuration.banner_line, null)
        key         = try("${device.name}-${banner.banner_type}", null)
      }
    ]
  ])
}

resource "iosxr_banner" "banner" {
  for_each = { for banner in local.device_banners : banner.key => banner }
  
  device      = each.value.device_name
  banner_type = each.value.banner_type
  line        = each.value.line
}

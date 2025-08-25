# Banner Resources - handles single object format with banner_type and line
locals {
  # Process banner configuration from single object format
  device_banners = flatten([
    for device in local.devices : [
      try(local.device_config[device.name].banner, null) != null ? {
        device_name  = device.name
        banner_type  = local.device_config[device.name].banner.banner_type
        line         = local.device_config[device.name].banner.line
        key          = "${device.name}-${local.device_config[device.name].banner.banner_type}"
      } : null
    ]
  ])
}

resource "iosxr_banner" "banner" {
  for_each = {
    for banner in local.device_banners : banner.key => banner
    if banner != null
  }
  
  device      = each.value.device_name
  banner_type = each.value.banner_type
  line        = each.value.line
}
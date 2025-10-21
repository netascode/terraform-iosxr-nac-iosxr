locals {
  device_banners = flatten([
    for device in local.devices : [
      for banner in try(local.device_config[device.name].banner, []) : {
        key         = "${device.name}-${banner.banner_type}"
        device_name = device.name
        banner_type = try(banner.banner_type, local.defaults.iosxr.configuration.banner_type, null)
        line        = try(banner.line, local.defaults.iosxr.configuration.banner_line, null)
      }
      if try(banner.banner_type, null) != null && try(banner.line, null) != null
    ]
  ])
}

resource "iosxr_banner" "banner" {
  for_each    = { for banner in local.device_banners : banner.key => banner }
  device      = each.value.device_name
  banner_type = each.value.banner_type
  line        = each.value.line
}

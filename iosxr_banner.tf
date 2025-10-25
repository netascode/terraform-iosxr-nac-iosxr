locals {
  banners = flatten([
    for device in local.devices : [
      for banner in try(local.device_config[device.name].banners, []) : {
        key         = "${device.name}-${banner.banner_type}"
        device_name = device.name
        banner_type = try(banner.banner_type, local.defaults.iosxr.devices.configuration.banners.banner_type, null)
        line        = try(banner.line, local.defaults.iosxr.devices.configuration.banners.line, null)
      }
    ]
  ])
}

resource "iosxr_banner" "banner" {
  for_each    = { for banner in local.banners : banner.key => banner }
  device      = each.value.device_name
  banner_type = each.value.banner_type
  line        = each.value.line
}

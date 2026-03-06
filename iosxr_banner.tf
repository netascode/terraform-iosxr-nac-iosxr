locals {
  banners = flatten([
    for device in local.devices : [
      for banner in try(local.device_config[device.name].banners, []) : {
        key         = format("%s/%s", device.name, banner.type)
        device_name = device.name
        banner_type = try(banner.type, local.defaults.iosxr.devices.configuration.banners.type, null)
        line        = try(banner.banner, local.defaults.iosxr.devices.configuration.banners.banner, null)
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

module "model" {
  source = "./modules/model"

  yaml_directories          = var.yaml_directories
  yaml_files                = var.yaml_files
  model                     = var.model
  managed_device_groups     = var.managed_device_groups
  managed_devices           = var.managed_devices
  write_model_file          = var.write_model_file
  write_default_values_file = var.write_default_values_file
}

locals {
  model    = module.model.model
  defaults = module.model.default_values
  iosxr    = try(local.model.iosxr, {})
  devices  = try(local.iosxr.devices, [])

  device_config = { for device in try(local.iosxr.devices, []) :
    device.name => try(device.configuration, {})
  }

  provider_devices = module.model.devices
}

provider "iosxr" {
  devices = local.provider_devices
}

# next provider release will have cli yang support
# locals {
#   cli_templates_0 = flatten([
#     for device in local.devices : [
#       for template in try(device.cli_templates, []) : {
#         key     = format("%s/%s", device.name, template.name)
#         device  = device.name
#         content = template.content
#       } if try(template.order, local.defaults.iosxr.templates.order) == 0
#     ]
#   ])
#   cli_templates_1 = flatten([
#     for device in local.devices : [
#       for template in try(device.cli_templates, []) : {
#         key     = format("%s/%s", device.name, template.name)
#         device  = device.name
#         content = template.content
#       } if try(template.order, local.defaults.iosxr.templates.order) == 1
#     ]
#   ])
#   cli_templates_2 = flatten([
#     for device in local.devices : [
#       for template in try(device.cli_templates, []) : {
#         key     = format("%s/%s", device.name, template.name)
#         device  = device.name
#         content = template.content
#       } if try(template.order, local.defaults.iosxr.templates.order) == 2
#     ]
#   ])
#   cli_templates_3 = flatten([
#     for device in local.devices : [
#       for template in try(device.cli_templates, []) : {
#         key     = format("%s/%s", device.name, template.name)
#         device  = device.name
#         content = template.content
#       } if try(template.order, local.defaults.iosxr.templates.order) == 3
#     ]
#   ])
#   cli_templates_4 = flatten([
#     for device in local.devices : [
#       for template in try(device.cli_templates, []) : {
#         key     = format("%s/%s", device.name, template.name)
#         device  = device.name
#         content = template.content
#       } if try(template.order, local.defaults.iosxr.templates.order) == 4
#     ]
#   ])
#   cli_templates_5 = flatten([
#     for device in local.devices : [
#       for template in try(device.cli_templates, []) : {
#         key     = format("%s/%s", device.name, template.name)
#         device  = device.name
#         content = template.content
#       } if try(template.order, local.defaults.iosxr.templates.order) == 5
#     ]
#   ])
#   cli_templates_6 = flatten([
#     for device in local.devices : [
#       for template in try(device.cli_templates, []) : {
#         key     = format("%s/%s", device.name, template.name)
#         device  = device.name
#         content = template.content
#       } if try(template.order, local.defaults.iosxr.templates.order) == 6
#     ]
#   ])
#   cli_templates_7 = flatten([
#     for device in local.devices : [
#       for template in try(device.cli_templates, []) : {
#         key     = format("%s/%s", device.name, template.name)
#         device  = device.name
#         content = template.content
#       } if try(template.order, local.defaults.iosxr.templates.order) == 7
#     ]
#   ])
#   cli_templates_8 = flatten([
#     for device in local.devices : [
#       for template in try(device.cli_templates, []) : {
#         key     = format("%s/%s", device.name, template.name)
#         device  = device.name
#         content = template.content
#       } if try(template.order, local.defaults.iosxr.templates.order) == 8
#     ]
#   ])
#   cli_templates_9 = flatten([
#     for device in local.devices : [
#       for template in try(device.cli_templates, []) : {
#         key     = format("%s/%s", device.name, template.name)
#         device  = device.name
#         content = template.content
#       } if try(template.order, local.defaults.iosxr.templates.order) == 9
#     ]
#   ])
# }

# resource "iosxr_cli" "cli_0" {
#   for_each = { for e in local.cli_templates_0 : e.key => e }
#   device   = each.value.device

#   cli = each.value.content
#   raw = true

#   depends_on = [
#     iosxr_as_path_set.as_path_set,
#     iosxr_banner.banner,
#     iosxr_cdp.cdp,
#     iosxr_class_map_qos.class_map_qos,
#     iosxr_community_set.community_set,
#     iosxr_domain.domain,
#     iosxr_domain_vrf.domain_vrf,
#     iosxr_esi_set.esi_set,
#     iosxr_evpn.evpn,
#     iosxr_evpn_evi.evpn_evi,
#     iosxr_evpn_group.evpn_group,
#     iosxr_extcommunity_cost_set.extcommunity_cost_set,
#     iosxr_extcommunity_opaque_set.extcommunity_opaque_set,
#     iosxr_flow_monitor_map.flow_monitor_map,
#     iosxr_flow_sampler_map.flow_sampler_map,
#     iosxr_fpd.fpd,
#     iosxr_gnmi.gnmi,
#     iosxr_hostname.hostname,
#     iosxr_interface.main_interface,
#     iosxr_interface.sub_interface,
#     iosxr_ipv4_access_list_options.ipv4_access_list_options,
#     iosxr_ipv4_prefix_list.ipv4_prefix_list,
#     iosxr_ipv6_access_list_options.ipv6_access_list_options,
#     iosxr_key_chain.key_chain,
#     iosxr_l2vpn.l2vpn,
#     iosxr_l2vpn_bridge_group.l2vpn_bridge_group,
#     iosxr_l2vpn_bridge_group_bridge_domain.l2vpn_bridge_group_bridge_domain,
#     iosxr_l2vpn_pw_class.l2vpn_pw_class,
#     iosxr_lacp.lacp,
#     iosxr_lldp.lldp,
#     iosxr_logging.logging,
#     iosxr_logging_source_interface.logging_source_interface,
#     iosxr_logging_vrf.logging_vrf,
#     iosxr_mpls_oam.mpls_oam,
#     iosxr_mpls_traffic_eng.mpls_traffic_eng,
#     iosxr_ntp.ntp,
#     iosxr_pce.pce,
#     iosxr_policy_map_qos.policy_map_qos,
#     iosxr_prefix_set.prefix_set,
#     iosxr_rd_set.rd_set,
#     iosxr_route_policy.route_policy,
#     iosxr_router_hsrp_interface.router_hsrp_interface,
#     iosxr_router_ospf.router_ospf,
#     iosxr_router_static_ipv4_unicast.router_static_ipv4_unicast,
#     iosxr_segment_routing.segment_routing,
#     iosxr_segment_routing_te.segment_routing_te,
#     iosxr_segment_routing_v6.segment_routing_v6,
#     iosxr_service_timestamps.service_timestamps,
#     iosxr_snmp_server.snmp_server,
#     iosxr_snmp_server_mib.snmp_server_mib,
#     iosxr_snmp_server_view.snmp_server_view,
#     iosxr_ssh.ssh,
#     iosxr_tag_set.tag_set,
#     iosxr_telnet.telnet
#   ]
# }

# resource "iosxr_cli" "cli_1" {
#   for_each = { for e in local.cli_templates_1 : e.key => e }
#   device   = each.value.device

#   cli = each.value.content
#   raw = true

#   depends_on = [
#     iosxr_cli.cli_0
#   ]
# }

# resource "iosxr_cli" "cli_2" {
#   for_each = { for e in local.cli_templates_2 : e.key => e }
#   device   = each.value.device

#   cli = each.value.content
#   raw = true

#   depends_on = [
#     iosxr_cli.cli_1
#   ]
# }

# resource "iosxr_cli" "cli_3" {
#   for_each = { for e in local.cli_templates_3 : e.key => e }
#   device   = each.value.device

#   cli = each.value.content
#   raw = true

#   depends_on = [
#     iosxr_cli.cli_2
#   ]
# }

# resource "iosxr_cli" "cli_4" {
#   for_each = { for e in local.cli_templates_4 : e.key => e }
#   device   = each.value.device

#   cli = each.value.content
#   raw = true

#   depends_on = [
#     iosxr_cli.cli_3
#   ]
# }

# resource "iosxr_cli" "cli_5" {
#   for_each = { for e in local.cli_templates_5 : e.key => e }
#   device   = each.value.device

#   cli = each.value.content
#   raw = true

#   depends_on = [
#     iosxr_cli.cli_4
#   ]
# }

# resource "iosxr_cli" "cli_6" {
#   for_each = { for e in local.cli_templates_6 : e.key => e }
#   device   = each.value.device

#   cli = each.value.content
#   raw = true

#   depends_on = [
#     iosxr_cli.cli_5
#   ]
# }

# resource "iosxr_cli" "cli_7" {
#   for_each = { for e in local.cli_templates_7 : e.key => e }
#   device   = each.value.device

#   cli = each.value.content
#   raw = true

#   depends_on = [
#     iosxr_cli.cli_6
#   ]
# }

# resource "iosxr_cli" "cli_8" {
#   for_each = { for e in local.cli_templates_8 : e.key => e }
#   device   = each.value.device

#   cli = each.value.content
#   raw = true

#   depends_on = [
#     iosxr_cli.cli_7
#   ]
# }

# resource "iosxr_cli" "cli_9" {
#   for_each = { for e in local.cli_templates_9 : e.key => e }
#   device   = each.value.device

#   cli = each.value.content
#   raw = true

#   depends_on = [
#     iosxr_cli.cli_8
#   ]
# }

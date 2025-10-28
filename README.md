<!-- BEGIN_TF_DOCS -->
# Terraform Network-as-Code Cisco IOS-XR Module

A Terraform module to configure Cisco IOS-XR devices.

## Usage

This module supports an inventory driven approach, where a complete IOS-XR configuration or parts of it are either modeled in one or more YAML files or natively using Terraform variables.

## Examples

Configuring an IOS-XR hostname configuration using YAML:

#### `system.nac.yaml`

```yaml
iosxr:
  devices:
    - name: router-1
      host: 1.2.3.4
      configuration:
        hostname: router-1

```

#### `main.tf`

```hcl
module "iosxr" {
  source  = "netascode/nac-iosxr/iosxr"
  version = ">= 0.1.0"

  yaml_files = ["system.nac.yaml"]
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.0 |
| <a name="requirement_iosxr"></a> [iosxr](#requirement\_iosxr) | >= 0.6.0 |
| <a name="requirement_utils"></a> [utils](#requirement\_utils) | = 1.1.0-beta3 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_managed_device_groups"></a> [managed\_device\_groups](#input\_managed\_device\_groups) | List of device group names to be managed. By default all device groups will be managed. | `list(string)` | `[]` | no |
| <a name="input_managed_devices"></a> [managed\_devices](#input\_managed\_devices) | List of device names to be managed. By default all devices will be managed. | `list(string)` | `[]` | no |
| <a name="input_model"></a> [model](#input\_model) | As an alternative to YAML files, a native Terraform data structure can be provided as well. | `map(any)` | `{}` | no |
| <a name="input_write_default_values_file"></a> [write\_default\_values\_file](#input\_write\_default\_values\_file) | Write all default values to a YAML file. Value is a path pointing to the file to be created. | `string` | `""` | no |
| <a name="input_write_model_file"></a> [write\_model\_file](#input\_write\_model\_file) | Write the full model including all resolved templates to a single YAML file. Value is a path pointing to the file to be created. | `string` | `""` | no |
| <a name="input_yaml_directories"></a> [yaml\_directories](#input\_yaml\_directories) | List of paths to YAML directories. | `list(string)` | `[]` | no |
| <a name="input_yaml_files"></a> [yaml\_files](#input\_yaml\_files) | List of paths to YAML files. | `list(string)` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_values"></a> [default\_values](#output\_default\_values) | All default values. |
| <a name="output_model"></a> [model](#output\_model) | Full model. |
## Resources

| Name | Type |
|------|------|
| [iosxr_as_path_set.as_path_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/as_path_set) | resource |
| [iosxr_banner.banner](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/banner) | resource |
| [iosxr_bgp_as_format.bgp_as_format](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/bgp_as_format) | resource |
| [iosxr_cdp.cdp](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/cdp) | resource |
| [iosxr_class_map_qos.class_map_qos](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/class_map_qos) | resource |
| [iosxr_community_set.community_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/community_set) | resource |
| [iosxr_domain.domain](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/domain) | resource |
| [iosxr_domain_vrf.domain_vrf](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/domain_vrf) | resource |
| [iosxr_esi_set.esi_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/esi_set) | resource |
| [iosxr_evpn.evpn](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/evpn) | resource |
| [iosxr_evpn_evi.evpn_evi](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/evpn_evi) | resource |
| [iosxr_evpn_group.evpn_group](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/evpn_group) | resource |
| [iosxr_extcommunity_cost_set.extcommunity_cost_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/extcommunity_cost_set) | resource |
| [iosxr_extcommunity_opaque_set.extcommunity_opaque_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/extcommunity_opaque_set) | resource |
| [iosxr_flow_monitor_map.flow_monitor_map](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/flow_monitor_map) | resource |
| [iosxr_flow_sampler_map.flow_sampler_map](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/flow_sampler_map) | resource |
| [iosxr_fpd.fpd](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/fpd) | resource |
| [iosxr_gnmi.gnmi](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/gnmi) | resource |
| [iosxr_hostname.hostname](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/hostname) | resource |
| [iosxr_interface.main_interface](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/interface) | resource |
| [iosxr_interface.sub_interface](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/interface) | resource |
| [iosxr_ipv4_access_list_options.ipv4_access_list_options](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/ipv4_access_list_options) | resource |
| [iosxr_ipv4_prefix_list.ipv4_prefix_list](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/ipv4_prefix_list) | resource |
| [iosxr_ipv6_access_list_options.ipv6_access_list_options](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/ipv6_access_list_options) | resource |
| [iosxr_key_chain.key_chain](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/key_chain) | resource |
| [iosxr_l2vpn.l2vpn](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/l2vpn) | resource |
| [iosxr_l2vpn_bridge_group.l2vpn_bridge_group](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/l2vpn_bridge_group) | resource |
| [iosxr_l2vpn_bridge_group_bridge_domain.l2vpn_bridge_group_bridge_domain](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/l2vpn_bridge_group_bridge_domain) | resource |
| [iosxr_l2vpn_pw_class.l2vpn_pw_class](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/l2vpn_pw_class) | resource |
| [iosxr_lacp.lacp](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/lacp) | resource |
| [iosxr_lldp.lldp](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/lldp) | resource |
| [iosxr_logging.logging](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/logging) | resource |
| [iosxr_logging_source_interface.logging_source_interface](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/logging_source_interface) | resource |
| [iosxr_logging_vrf.logging_vrf](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/logging_vrf) | resource |
| [iosxr_mpls_oam.mpls_oam](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/mpls_oam) | resource |
| [iosxr_mpls_traffic_eng.mpls_traffic_eng](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/mpls_traffic_eng) | resource |
| [iosxr_ntp.ntp](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/ntp) | resource |
| [iosxr_pce.pce](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/pce) | resource |
| [iosxr_policy_map_qos.policy_map_qos](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/policy_map_qos) | resource |
| [iosxr_prefix_set.prefix_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/prefix_set) | resource |
| [iosxr_rd_set.rd_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/rd_set) | resource |
| [iosxr_route_policy.route_policy](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/route_policy) | resource |
| [iosxr_router_hsrp_interface.router_hsrp_interface](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/router_hsrp_interface) | resource |
| [iosxr_router_ospf.router_ospf](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/router_ospf) | resource |
| [iosxr_router_static_ipv4_unicast.router_static_ipv4_unicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/router_static_ipv4_unicast) | resource |
| [iosxr_segment_routing.segment_routing](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/segment_routing) | resource |
| [iosxr_segment_routing_te.segment_routing_te](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/segment_routing_te) | resource |
| [iosxr_segment_routing_v6.segment_routing_v6](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/segment_routing_v6) | resource |
| [iosxr_service_timestamps.service_timestamps](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/service_timestamps) | resource |
| [iosxr_snmp_server.snmp_server](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/snmp_server) | resource |
| [iosxr_snmp_server_mib.snmp_server_mib](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/snmp_server_mib) | resource |
| [iosxr_snmp_server_view.snmp_server_view](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/snmp_server_view) | resource |
| [iosxr_ssh.ssh](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/ssh) | resource |
| [iosxr_tag_set.tag_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/tag_set) | resource |
| [iosxr_telnet.telnet](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/telnet) | resource |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_model"></a> [model](#module\_model) | ./modules/model | n/a |
<!-- END_TF_DOCS -->
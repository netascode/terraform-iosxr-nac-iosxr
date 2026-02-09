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
| <a name="requirement_iosxr"></a> [iosxr](#requirement\_iosxr) | 0.7.0 |
| <a name="requirement_utils"></a> [utils](#requirement\_utils) | 1.1.0-beta3 |
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
| [iosxr_as_path_set.as_path_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/as_path_set) | resource |
| [iosxr_banner.banner](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/banner) | resource |
| [iosxr_bgp_as_format.bgp_as_format](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/bgp_as_format) | resource |
| [iosxr_bmp_server.bmp_server](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/bmp_server) | resource |
| [iosxr_cdp.cdp](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/cdp) | resource |
| [iosxr_class_map_qos.class_map_qos](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/class_map_qos) | resource |
| [iosxr_cli.cli_0](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/cli) | resource |
| [iosxr_cli.cli_1](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/cli) | resource |
| [iosxr_cli.cli_2](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/cli) | resource |
| [iosxr_cli.cli_3](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/cli) | resource |
| [iosxr_cli.cli_4](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/cli) | resource |
| [iosxr_cli.cli_5](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/cli) | resource |
| [iosxr_cli.cli_6](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/cli) | resource |
| [iosxr_cli.cli_7](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/cli) | resource |
| [iosxr_cli.cli_8](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/cli) | resource |
| [iosxr_cli.cli_9](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/cli) | resource |
| [iosxr_community_set.community_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/community_set) | resource |
| [iosxr_domain.domain](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/domain) | resource |
| [iosxr_domain_vrf.domain_vrf](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/domain_vrf) | resource |
| [iosxr_error_disable_recovery.error_disable_recovery](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/error_disable_recovery) | resource |
| [iosxr_esi_set.esi_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/esi_set) | resource |
| [iosxr_evpn.evpn](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/evpn) | resource |
| [iosxr_evpn_evi.evpn_evi](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/evpn_evi) | resource |
| [iosxr_extcommunity_cost_set.extcommunity_cost_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/extcommunity_cost_set) | resource |
| [iosxr_extcommunity_opaque_set.extcommunity_opaque_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/extcommunity_opaque_set) | resource |
| [iosxr_flow_monitor_map.flow_monitor_map](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/flow_monitor_map) | resource |
| [iosxr_flow_sampler_map.flow_sampler_map](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/flow_sampler_map) | resource |
| [iosxr_fpd.fpd](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/fpd) | resource |
| [iosxr_gnmi.gnmi](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/gnmi) | resource |
| [iosxr_hostname.hostname](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/hostname) | resource |
| [iosxr_interface_bundle_ether.bundle_ether](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/interface_bundle_ether) | resource |
| [iosxr_interface_bundle_ether_subinterface.bundle_ether_subinterface](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/interface_bundle_ether_subinterface) | resource |
| [iosxr_interface_bvi.bvi](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/interface_bvi) | resource |
| [iosxr_interface_ethernet.ethernet](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/interface_ethernet) | resource |
| [iosxr_interface_ethernet.ethernet_unmanaged](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/interface_ethernet) | resource |
| [iosxr_interface_ethernet_subinterface.ethernet_subinterface](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/interface_ethernet_subinterface) | resource |
| [iosxr_interface_loopback.loopback](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/interface_loopback) | resource |
| [iosxr_interface_tunnel_ip.tunnel_ip](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/interface_tunnel_ip) | resource |
| [iosxr_interface_tunnel_te.tunnel_te](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/interface_tunnel_te) | resource |
| [iosxr_ipv4_access_list_options.ipv4_access_list_options](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/ipv4_access_list_options) | resource |
| [iosxr_ipv4_prefix_list.ipv4_prefix_list](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/ipv4_prefix_list) | resource |
| [iosxr_ipv6_access_list_options.ipv6_access_list_options](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/ipv6_access_list_options) | resource |
| [iosxr_key_chain.key_chain](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/key_chain) | resource |
| [iosxr_l2vpn.l2vpn](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/l2vpn) | resource |
| [iosxr_l2vpn_bridge_group_bridge_domain.l2vpn_bridge_group_bridge_domain](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/l2vpn_bridge_group_bridge_domain) | resource |
| [iosxr_l2vpn_pw_class.l2vpn_pw_class](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/l2vpn_pw_class) | resource |
| [iosxr_lacp.lacp](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/lacp) | resource |
| [iosxr_lldp.lldp](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/lldp) | resource |
| [iosxr_logging.logging](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/logging) | resource |
| [iosxr_logging_vrf.logging_vrf](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/logging_vrf) | resource |
| [iosxr_mpls_oam.mpls_oam](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/mpls_oam) | resource |
| [iosxr_mpls_traffic_eng.mpls_traffic_eng](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/mpls_traffic_eng) | resource |
| [iosxr_ntp.ntp](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/ntp) | resource |
| [iosxr_pce.pce](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/pce) | resource |
| [iosxr_policy_map_qos.policy_map_qos](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/policy_map_qos) | resource |
| [iosxr_prefix_set.prefix_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/prefix_set) | resource |
| [iosxr_rd_set.rd_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/rd_set) | resource |
| [iosxr_route_policy.route_policy](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/route_policy) | resource |
| [iosxr_router_bgp.router_bgp](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp) | resource |
| [iosxr_router_bgp_address_family.ipv4_unicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_address_family) | resource |
| [iosxr_router_bgp_address_family.ipv6_unicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_address_family) | resource |
| [iosxr_router_bgp_address_family.l2vpn_evpn](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_address_family) | resource |
| [iosxr_router_bgp_address_family.vpnv4_multicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_address_family) | resource |
| [iosxr_router_bgp_address_family.vpnv4_unicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_address_family) | resource |
| [iosxr_router_bgp_address_family.vpnv6_multicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_address_family) | resource |
| [iosxr_router_bgp_address_family.vpnv6_unicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_address_family) | resource |
| [iosxr_router_bgp_af_group.router_bgp_af_group](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_af_group) | resource |
| [iosxr_router_bgp_neighbor_address_family.router_bgp_neighbor_address_family](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_neighbor_address_family) | resource |
| [iosxr_router_bgp_neighbor_group.router_bgp_neighbor_group](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_neighbor_group) | resource |
| [iosxr_router_bgp_session_group.router_bgp_session_group](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_session_group) | resource |
| [iosxr_router_bgp_vrf.router_bgp_vrf](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_vrf) | resource |
| [iosxr_router_bgp_vrf_address_family.ipv4_multicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_vrf_address_family) | resource |
| [iosxr_router_bgp_vrf_address_family.ipv4_unicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_vrf_address_family) | resource |
| [iosxr_router_bgp_vrf_address_family.ipv6_multicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_vrf_address_family) | resource |
| [iosxr_router_bgp_vrf_address_family.ipv6_unicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_vrf_address_family) | resource |
| [iosxr_router_bgp_vrf_neighbor_address_family.router_bgp_vrf_neighbor_address_family](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_bgp_vrf_neighbor_address_family) | resource |
| [iosxr_router_hsrp_interface.router_hsrp_interface](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_hsrp_interface) | resource |
| [iosxr_router_hsrp_interface_ipv4_group_v2.router_hsrp_interface_ipv4_group_v2](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_hsrp_interface_ipv4_group_v2) | resource |
| [iosxr_router_isis.router_isis](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_isis) | resource |
| [iosxr_router_isis_address_family.ipv4_multicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_isis_address_family) | resource |
| [iosxr_router_isis_address_family.ipv4_unicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_isis_address_family) | resource |
| [iosxr_router_isis_address_family.ipv6_multicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_isis_address_family) | resource |
| [iosxr_router_isis_address_family.ipv6_unicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_isis_address_family) | resource |
| [iosxr_router_isis_interface.router_isis_interface](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_isis_interface) | resource |
| [iosxr_router_isis_interface_address_family.router_isis_interface_address_family](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_isis_interface_address_family) | resource |
| [iosxr_router_ospf.router_ospf](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_ospf) | resource |
| [iosxr_router_ospf_area.router_ospf_area](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_ospf_area) | resource |
| [iosxr_router_ospf_area_interface.router_ospf_area_interface](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_ospf_area_interface) | resource |
| [iosxr_router_ospf_vrf.router_ospf_vrf](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_ospf_vrf) | resource |
| [iosxr_router_ospf_vrf_area.router_ospf_vrf_area](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_ospf_vrf_area) | resource |
| [iosxr_router_ospf_vrf_area_interface.router_ospf_vrf_area_interface](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_ospf_vrf_area_interface) | resource |
| [iosxr_router_static_ipv4_multicast.router_static_ipv4_multicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_static_ipv4_multicast) | resource |
| [iosxr_router_static_ipv4_unicast.router_static_ipv4_unicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_static_ipv4_unicast) | resource |
| [iosxr_router_static_ipv6_multicast.router_static_ipv6_multicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_static_ipv6_multicast) | resource |
| [iosxr_router_static_ipv6_unicast.router_static_ipv6_unicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_static_ipv6_unicast) | resource |
| [iosxr_router_static_vrf_ipv4_multicast.router_static_vrf_ipv4_multicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_static_vrf_ipv4_multicast) | resource |
| [iosxr_router_static_vrf_ipv4_unicast.router_static_vrf_ipv4_unicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_static_vrf_ipv4_unicast) | resource |
| [iosxr_router_static_vrf_ipv6_multicast.router_static_vrf_ipv6_multicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_static_vrf_ipv6_multicast) | resource |
| [iosxr_router_static_vrf_ipv6_unicast.router_static_vrf_ipv6_unicast](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_static_vrf_ipv6_unicast) | resource |
| [iosxr_router_vrrp_interface.router_vrrp_interface](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_vrrp_interface) | resource |
| [iosxr_router_vrrp_interface_ipv6.router_vrrp_interface_ipv6](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/router_vrrp_interface_ipv6) | resource |
| [iosxr_segment_routing.segment_routing](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/segment_routing) | resource |
| [iosxr_segment_routing_te.segment_routing_te](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/segment_routing_te) | resource |
| [iosxr_segment_routing_v6.segment_routing_v6](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/segment_routing_v6) | resource |
| [iosxr_service_timestamps.service_timestamps](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/service_timestamps) | resource |
| [iosxr_snmp_server.snmp_server](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/snmp_server) | resource |
| [iosxr_snmp_server_mib.snmp_server_mib](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/snmp_server_mib) | resource |
| [iosxr_ssh.ssh](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/ssh) | resource |
| [iosxr_tag_set.tag_set](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/tag_set) | resource |
| [iosxr_telnet.telnet](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/telnet) | resource |
| [iosxr_vrf.vrf](https://registry.terraform.io/providers/CiscoDevNet/iosxr/0.7.0/docs/resources/vrf) | resource |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_model"></a> [model](#module\_model) | ./modules/model | n/a |
<!-- END_TF_DOCS -->
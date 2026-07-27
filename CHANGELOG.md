## 0.1.0

- Initial release

## 0.1.1

- Routing: BGP (global, VRF, address families, neighbor/AF/session groups), IS-IS, OSPF (global/VRF, areas, interfaces), static routes (IPv4/IPv6, global/VRF), BGP AS format
- Interfaces: Ethernet, subinterfaces, Bundle-Ether, BVI, Loopback, Tunnel-IP, Tunnel-TE with L2 transport, addressing, access groups, flow monitoring, SPAN, dampening, BFD, and bundle membership
- MPLS and Traffic Engineering: Consolidated segment routing (global, SRv6, SR-TE), MPLS TE, MPLS OAM, PCE
- L2VPN and EVPN: L2VPN (global, bridge domain, pseudowire class), EVPN (global, EVI, interfaces, SRv6 bindings)
- First-Hop Redundancy: HSRP (v1/v2 IPv4), VRRP (v3 IPv4/IPv6)
- QoS and Traffic Management: Class maps, policy maps, IPv4/IPv6 access list options, prefix lists, BFD with multipath destinations
- Network Services: NTP, PTP with profiles, DNS/domain (global/VRF), logging (buffered/console/monitor/trap/VRF), consolidated SNMP (communities, traps, views, encrypted traps/informs, SNMPv3, VRF, MIB), consolidated flow monitoring (exporter/monitor/sampler), monitor sessions
- Device Management: SSH, Telnet, banners, CDP, LLDP, line console/default/template, VTY pools, LACP, service timestamps, error-disable recovery, FPD, control plane, linux networking, TPA, FTP/TFTP, XML agent, NETCONF (TTY/YANG), telemetry model-driven
- Routing Policy: Route policies, prefix sets, consolidated routing sets (AS path, community, ESI, tag, RD, extended community)
- VRF: VRF definitions with address families, RD/RT, import/export route policies
- Security: Key chain, RADIUS source interface, TACACS+ server
- Consolidation and standardization across resources
  - Consolidate segment routing, SRv6, and SR-TE into a single resource
  - Consolidate SNMP server, VRF host, and MIB into a unified SNMP resource
  - Consolidate flow exporter, monitor, and sampler maps into a single flow resource
  - Standardize naming and structure across all BGP resources
  - Standardize OSPF, IS-IS, and static route resources with consistent naming and enum values
  - Normalize MAC address formats automatically across interfaces, LACP, and HSRP
  - Normalize route distinguisher and route target parsing across BGP and VRF resources

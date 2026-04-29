locals {
  # Standard QoS mappings
  dscp_map = {
    "0"  = "default", "8" = "cs1", "10" = "af11",
    "12" = "af12", "14" = "af13", "16" = "cs2",
    "18" = "af21", "20" = "af22", "22" = "af23",
    "24" = "cs3", "26" = "af31", "28" = "af32",
    "30" = "af33", "32" = "cs4", "34" = "af41",
    "36" = "af42", "38" = "af43", "40" = "cs5",
    "46" = "ef", "48" = "cs6", "56" = "cs7"
  }
  precedence_map = {
    "0" = "routine", "1" = "priority",
    "2" = "immediate", "3" = "flash",
    "4" = "flash-override", "5" = "critical",
    "6" = "internet", "7" = "network"
  }
  # Used by iosxr_key_chain to convert MM-DD-YYYY date format to YANG month enum
  keychain_month_names = {
    "01" = "january", "02" = "february", "03" = "march",
    "04" = "april", "05" = "may", "06" = "june",
    "07" = "july", "08" = "august", "09" = "september",
    "10" = "october", "11" = "november", "12" = "december"
  }
  # Separate map for ACL DSCP values to avoid conflicts with QoS DSCP values
  acl_dscp_map = {
    "0"  = "default", "8" = "cs1", "10" = "af11",
    "12" = "af12", "14" = "af13", "16" = "cs2",
    "18" = "af21", "20" = "af22", "22" = "af23",
    "24" = "cs3", "26" = "af31", "28" = "af32",
    "30" = "af33", "32" = "cs4", "34" = "af41",
    "36" = "af42", "38" = "af43", "40" = "cs5",
    "46" = "ef", "48" = "cs6", "56" = "cs7"
  }
  # Separate map for ACL precedence values to avoid conflicts with QoS precedence values
  acl_precedence_map = {
    "0"              = "Routine", "1" = "Priority", "2" = "Immediate",
    "3"              = "Flash", "4" = "FlashOverride", "5" = "Critical",
    "6"              = "Internet", "7" = "Network",
    "routine"        = "Routine", "priority" = "Priority",
    "immediate"      = "Immediate", "flash" = "Flash",
    "flash-override" = "FlashOverride", "critical" = "Critical",
    "internet"       = "Internet", "network" = "Network"
  }
  # IPv4/IPv6 ACL mappings
  acl_l4port_map = {
    # TCP ports: numeric -> YANG
    "7"    = "Echo", "9" = "Discard", "13" = "Daytime",
    "19"   = "CharGen", "20" = "FTPData", "21" = "FTP",
    "22"   = "SSH", "23" = "Telnet", "25" = "SMTP",
    "37"   = "Time", "43" = "WhoIs", "49" = "TACACS",
    "53"   = "DNS", "70" = "Gopher", "79" = "Finger",
    "80"   = "WWW", "101" = "Hostname", "109" = "POP2",
    "110"  = "POP3", "111" = "SunRPC", "113" = "Ident",
    "119"  = "NNTP", "161" = "SNMP", "179" = "BGP",
    "194"  = "IRC", "443" = "HTTPS", "496" = "PIMAutoRP",
    "512"  = "ExecOrBiff", "513" = "LoginOrWho", "514" = "CmdOrSyslog",
    "515"  = "LPD", "517" = "Talk", "540" = "UUCP",
    "543"  = "KLogin", "544" = "KShell", "646" = "LDP",
    "1812" = "RADIUS", "1813" = "RADIUS_ACCT",
    # UDP-only ports: numeric -> YANG
    "3784" = "BFD", "68" = "BootPC", "67" = "BootPS",
    "195"  = "DNSIX", "500" = "ISAKMP", "434" = "MobileIP",
    "42"   = "NameServer", "138" = "NetBIOS_DGS", "137" = "NetBIOS_NS",
    "139"  = "NetBIOS_SS", "123" = "NTP", "520" = "RIP",
    "162"  = "SNMPTrap", "69" = "TFTP", "177" = "XDMCP",
    # TCP ports: schema -> YANG
    "echo"    = "Echo", "discard" = "Discard", "daytime" = "Daytime",
    "chargen" = "CharGen", "ftp-data" = "FTPData", "ftp" = "FTP",
    "ssh"     = "SSH", "telnet" = "Telnet", "smtp" = "SMTP",
    "time"    = "Time", "whois" = "WhoIs", "tacacs" = "TACACS",
    "domain"  = "DNS", "gopher" = "Gopher", "finger" = "Finger",
    "www"     = "WWW", "hostname" = "Hostname", "pop2" = "POP2",
    "pop3"    = "POP3", "sunrpc" = "SunRPC", "ident" = "Ident",
    "nntp"    = "NNTP", "snmp" = "SNMP", "bgp" = "BGP",
    "irc"     = "IRC", "https" = "HTTPS", "pim-auto-rp" = "PIMAutoRP",
    "exec"    = "ExecOrBiff", "login" = "LoginOrWho", "cmd" = "CmdOrSyslog",
    "lpd"     = "LPD", "talk" = "Talk", "uucp" = "UUCP",
    "klogin"  = "KLogin", "kshell" = "KShell", "ldp" = "LDP",
    "radius"  = "RADIUS", "radius-acct" = "RADIUS_ACCT",
    # UDP-only ports: schema -> YANG
    "bfd"        = "BFD", "bootpc" = "BootPC", "bootps" = "BootPS",
    "dnsix"      = "DNSIX", "isakmp" = "ISAKMP", "mobile-ip" = "MobileIP",
    "nameserver" = "NameServer", "netbios-dgm" = "NetBIOS_DGS",
    "netbios-ns" = "NetBIOS_NS", "netbios-ss" = "NetBIOS_SS",
    "ntp"        = "NTP", "rip" = "RIP", "snmptrap" = "SNMPTrap",
    "tftp"       = "TFTP", "xdmcp" = "XDMCP"
  }
  acl_protocol_map = {
    "1"   = "icmp", "2" = "igmp", "4" = "ipinip", "6" = "tcp",
    "9"   = "igrp", "17" = "udp", "46" = "rsvp", "47" = "gre",
    "50"  = "esp", "51" = "ahp", "58" = "icmpv6", "88" = "eigrp",
    "89"  = "ospf", "94" = "nos", "103" = "pim", "108" = "pcp",
    "112" = "vrrp", "132" = "sctp"
  }
  acl_igmp_type_map = {
    "17" = "host-query", "18" = "host-report", "19" = "dvmrp",
    "20" = "pim", "21" = "trace", "22" = "v2-report",
    "23" = "v2-leave", "30" = "mtrace-response", "31" = "mtrace",
    "34" = "v3-report"
  }
  acl_fragment_type_map = {
    "dont-fragment-is-fragment"    = "dont-fragment is-fragment"
    "dont-fragment-first-fragment" = "dont-fragment first-fragment"
    "dont-fragment-last-fragment"  = "dont-fragment last-fragment"
  }
  # Bit-position order for TCP flags and IPv6 headers
  acl_tcp_flags_order    = ["fin", "syn", "rst", "psh", "ack", "urg"]
  acl_ipv6_headers_order = ["routing", "destopts", "hop-by-hop", "fragments", "authen"]
}

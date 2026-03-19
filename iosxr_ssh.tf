locals {
  ssh = flatten([
    for device in local.devices : [
      {
        key                                       = device.name
        device_name                               = device.name
        timeout                                   = try(local.device_config[device.name].ssh.timeout, local.defaults.iosxr.devices.configuration.ssh.timeout, null)
        server_v1                                 = try(local.device_config[device.name].ssh.server.v1, local.defaults.iosxr.devices.configuration.ssh.server.v1, null)
        server_v2                                 = try(local.device_config[device.name].ssh.server.v2, local.defaults.iosxr.devices.configuration.ssh.server.v2, null)
        server_rate_limit                         = try(local.device_config[device.name].ssh.server.rate_limit, local.defaults.iosxr.devices.configuration.ssh.server.rate_limit, null)
        server_session_limit                      = try(local.device_config[device.name].ssh.server.session_limit, local.defaults.iosxr.devices.configuration.ssh.server.session_limit, null)
        server_logging                            = try(local.device_config[device.name].ssh.server.logging, local.defaults.iosxr.devices.configuration.ssh.server.logging, null)
        server_dscp                               = try(local.device_config[device.name].ssh.server.dscp, local.defaults.iosxr.devices.configuration.ssh.server.dscp, null)
        server_port                               = try(local.device_config[device.name].ssh.server.port, local.defaults.iosxr.devices.configuration.ssh.server.port, null)
        server_max_auth_limit                     = try(local.device_config[device.name].ssh.server.max_auth_limit, local.defaults.iosxr.devices.configuration.ssh.server.max_auth_limit, null)
        server_tcp_window_scale                   = try(local.device_config[device.name].ssh.server.tcp_window_scale, local.defaults.iosxr.devices.configuration.ssh.server.tcp_window_scale, null)
        server_port_forwarding_local              = try(local.device_config[device.name].ssh.server.port_forwarding_local, local.defaults.iosxr.devices.configuration.ssh.server.port_forwarding_local, null)
        server_rekey_time                         = try(local.device_config[device.name].ssh.server.rekey_time, local.defaults.iosxr.devices.configuration.ssh.server.rekey_time, null)
        server_rekey_volume                       = try(local.device_config[device.name].ssh.server.rekey_volume, local.defaults.iosxr.devices.configuration.ssh.server.rekey_volume, null)
        server_netconf_port                       = try(local.device_config[device.name].ssh.server.netconf_port, local.defaults.iosxr.devices.configuration.ssh.server.netconf_port, null)
        server_netconf_xml                        = try(local.device_config[device.name].ssh.server.netconf_xml, local.defaults.iosxr.devices.configuration.ssh.server.netconf_xml, null)
        server_disable_hmac_sha1                  = try(contains(local.device_config[device.name].ssh.server.disable_hmacs, "sha1"), contains(local.defaults.iosxr.devices.configuration.ssh.server.disable_hmacs, "sha1"), false) ? true : null
        server_disable_hmac_sha2_256              = try(contains(local.device_config[device.name].ssh.server.disable_hmacs, "sha2_256"), contains(local.defaults.iosxr.devices.configuration.ssh.server.disable_hmacs, "sha2_256"), false) ? true : null
        server_disable_hmac_sha2_512              = try(contains(local.device_config[device.name].ssh.server.disable_hmacs, "sha2_512"), contains(local.defaults.iosxr.devices.configuration.ssh.server.disable_hmacs, "sha2_512"), false) ? true : null
        server_enable_cipher_aes_cbc              = try(contains(local.device_config[device.name].ssh.server.enable_ciphers, "aes_cbc"), contains(local.defaults.iosxr.devices.configuration.ssh.server.enable_ciphers, "aes_cbc"), false) ? true : null
        server_enable_cipher_3des_cbc             = try(contains(local.device_config[device.name].ssh.server.enable_ciphers, "3des_cbc"), contains(local.defaults.iosxr.devices.configuration.ssh.server.enable_ciphers, "3des_cbc"), false) ? true : null
        server_algorithms_key_exchanges           = try(local.device_config[device.name].ssh.server.algorithms.key_exchanges, local.defaults.iosxr.devices.configuration.ssh.server.algorithms.key_exchanges, null)
        server_algorithms_host_key_ecdsa_nistp256 = try(contains(local.device_config[device.name].ssh.server.algorithms.host_keys, "ecdsa_nistp256"), contains(local.defaults.iosxr.devices.configuration.ssh.server.algorithms.host_keys, "ecdsa_nistp256"), false) ? true : null
        server_algorithms_host_key_ecdsa_nistp384 = try(contains(local.device_config[device.name].ssh.server.algorithms.host_keys, "ecdsa_nistp384"), contains(local.defaults.iosxr.devices.configuration.ssh.server.algorithms.host_keys, "ecdsa_nistp384"), false) ? true : null
        server_algorithms_host_key_ecdsa_nistp521 = try(contains(local.device_config[device.name].ssh.server.algorithms.host_keys, "ecdsa_nistp521"), contains(local.defaults.iosxr.devices.configuration.ssh.server.algorithms.host_keys, "ecdsa_nistp521"), false) ? true : null
        server_algorithms_host_key_rsa            = try(contains(local.device_config[device.name].ssh.server.algorithms.host_keys, "rsa"), contains(local.defaults.iosxr.devices.configuration.ssh.server.algorithms.host_keys, "rsa"), false) ? true : null
        server_algorithms_host_key_dsa            = try(contains(local.device_config[device.name].ssh.server.algorithms.host_keys, "dsa"), contains(local.defaults.iosxr.devices.configuration.ssh.server.algorithms.host_keys, "dsa"), false) ? true : null
        server_algorithms_host_key_x509v3_ssh_rsa = try(contains(local.device_config[device.name].ssh.server.algorithms.host_keys, "x509v3_ssh_rsa"), contains(local.defaults.iosxr.devices.configuration.ssh.server.algorithms.host_keys, "x509v3_ssh_rsa"), false) ? true : null
        server_algorithms_host_key_ed25519        = try(contains(local.device_config[device.name].ssh.server.algorithms.host_keys, "ed25519"), contains(local.defaults.iosxr.devices.configuration.ssh.server.algorithms.host_keys, "ed25519"), false) ? true : null
        server_algorithms_host_key_rsa_sha512     = try(contains(local.device_config[device.name].ssh.server.algorithms.host_keys, "rsa_sha512"), contains(local.defaults.iosxr.devices.configuration.ssh.server.algorithms.host_keys, "rsa_sha512"), false) ? true : null
        server_algorithms_host_key_rsa_sha256     = try(contains(local.device_config[device.name].ssh.server.algorithms.host_keys, "rsa_sha256"), contains(local.defaults.iosxr.devices.configuration.ssh.server.algorithms.host_keys, "rsa_sha256"), false) ? true : null
        server_algorithms_host_key_ssh_rsa        = try(contains(local.device_config[device.name].ssh.server.algorithms.host_keys, "ssh_rsa"), contains(local.defaults.iosxr.devices.configuration.ssh.server.algorithms.host_keys, "ssh_rsa"), false) ? true : null
        server_algorithms_ciphers                 = try(local.device_config[device.name].ssh.server.algorithms.ciphers, local.defaults.iosxr.devices.configuration.ssh.server.algorithms.ciphers, null)
        server_vrfs = try(length(local.device_config[device.name].ssh.server.vrfs) == 0, true) ? null : [for vrf in local.device_config[device.name].ssh.server.vrfs : {
          vrf_name         = try(vrf.name, local.defaults.iosxr.devices.configuration.ssh.server.vrfs.name, null)
          ipv4_access_list = try(vrf.ipv4_access_list, local.defaults.iosxr.devices.configuration.ssh.server.vrfs.ipv4_access_list, null)
          ipv6_access_list = try(vrf.ipv6_access_list, local.defaults.iosxr.devices.configuration.ssh.server.vrfs.ipv6_access_list, null)
          }
        ]
        server_netconf_vrfs = try(length(local.device_config[device.name].ssh.server.netconf_vrfs) == 0, true) ? null : [for vrf in local.device_config[device.name].ssh.server.netconf_vrfs : {
          vrf_name         = try(vrf.name, local.defaults.iosxr.devices.configuration.ssh.server.netconf_vrfs.name, null)
          ipv4_access_list = try(vrf.ipv4_access_list, local.defaults.iosxr.devices.configuration.ssh.server.netconf_vrfs.ipv4_access_list, null)
          ipv6_access_list = try(vrf.ipv6_access_list, local.defaults.iosxr.devices.configuration.ssh.server.netconf_vrfs.ipv6_access_list, null)
          }
        ]
        server_usernames = try(length(local.device_config[device.name].ssh.server.usernames) == 0, true) ? null : [for user in local.device_config[device.name].ssh.server.usernames : {
          username  = try(user.name, local.defaults.iosxr.devices.configuration.ssh.server.usernames.name, null)
          keystring = try(user.keystring, local.defaults.iosxr.devices.configuration.ssh.server.usernames.keystring, null)
          }
        ]
        client_source_interface         = try(local.device_config[device.name].ssh.client.source_interface, local.defaults.iosxr.devices.configuration.ssh.client.source_interface, null)
        client_vrf                      = try(local.device_config[device.name].ssh.client.vrf, local.defaults.iosxr.devices.configuration.ssh.client.vrf, null)
        client_dscp                     = try(local.device_config[device.name].ssh.client.dscp, local.defaults.iosxr.devices.configuration.ssh.client.dscp, null)
        client_v1                       = try(local.device_config[device.name].ssh.client.v1, local.defaults.iosxr.devices.configuration.ssh.client.v1, null)
        client_v2                       = try(local.device_config[device.name].ssh.client.v2, local.defaults.iosxr.devices.configuration.ssh.client.v2, null)
        client_tcp_window_scale         = try(local.device_config[device.name].ssh.client.tcp_window_scale, local.defaults.iosxr.devices.configuration.ssh.client.tcp_window_scale, null)
        client_rekey_time               = try(local.device_config[device.name].ssh.client.rekey_time, local.defaults.iosxr.devices.configuration.ssh.client.rekey_time, null)
        client_rekey_volume             = try(local.device_config[device.name].ssh.client.rekey_volume, local.defaults.iosxr.devices.configuration.ssh.client.rekey_volume, null)
        client_disable_hmac_sha1        = try(contains(local.device_config[device.name].ssh.client.disable_hmacs, "sha1"), contains(local.defaults.iosxr.devices.configuration.ssh.client.disable_hmacs, "sha1"), false) ? true : null
        client_disable_hmac_sha2_256    = try(contains(local.device_config[device.name].ssh.client.disable_hmacs, "sha2_256"), contains(local.defaults.iosxr.devices.configuration.ssh.client.disable_hmacs, "sha2_256"), false) ? true : null
        client_disable_hmac_sha2_512    = try(contains(local.device_config[device.name].ssh.client.disable_hmacs, "sha2_512"), contains(local.defaults.iosxr.devices.configuration.ssh.client.disable_hmacs, "sha2_512"), false) ? true : null
        client_enable_cipher_aes_cbc    = try(contains(local.device_config[device.name].ssh.client.enable_ciphers, "aes_cbc"), contains(local.defaults.iosxr.devices.configuration.ssh.client.enable_ciphers, "aes_cbc"), false) ? true : null
        client_enable_cipher_3des_cbc   = try(contains(local.device_config[device.name].ssh.client.enable_ciphers, "3des_cbc"), contains(local.defaults.iosxr.devices.configuration.ssh.client.enable_ciphers, "3des_cbc"), false) ? true : null
        client_algorithms_key_exchanges = try(local.device_config[device.name].ssh.client.algorithms.key_exchanges, local.defaults.iosxr.devices.configuration.ssh.client.algorithms.key_exchanges, null)
        client_algorithms_ciphers       = try(local.device_config[device.name].ssh.client.algorithms.ciphers, local.defaults.iosxr.devices.configuration.ssh.client.algorithms.ciphers, null)
      }
    ] if try(local.device_config[device.name].ssh, null) != null || try(local.defaults.iosxr.devices.configuration.ssh, null) != null
  ])
}

resource "iosxr_ssh" "ssh" {
  for_each                                  = { for ssh in local.ssh : ssh.key => ssh }
  device                                    = each.value.device_name
  timeout                                   = each.value.timeout
  server_v1                                 = each.value.server_v1
  server_v2                                 = each.value.server_v2
  server_rate_limit                         = each.value.server_rate_limit
  server_session_limit                      = each.value.server_session_limit
  server_logging                            = each.value.server_logging
  server_dscp                               = each.value.server_dscp
  server_port                               = each.value.server_port
  server_max_auth_limit                     = each.value.server_max_auth_limit
  server_tcp_window_scale                   = each.value.server_tcp_window_scale
  server_port_forwarding_local              = each.value.server_port_forwarding_local
  server_rekey_time                         = each.value.server_rekey_time
  server_rekey_volume                       = each.value.server_rekey_volume
  server_netconf_port                       = each.value.server_netconf_port
  server_netconf_xml                        = each.value.server_netconf_xml
  server_disable_hmac_sha1                  = each.value.server_disable_hmac_sha1
  server_disable_hmac_sha2_256              = each.value.server_disable_hmac_sha2_256
  server_disable_hmac_sha2_512              = each.value.server_disable_hmac_sha2_512
  server_enable_cipher_aes_cbc              = each.value.server_enable_cipher_aes_cbc
  server_enable_cipher_3des_cbc             = each.value.server_enable_cipher_3des_cbc
  server_algorithms_key_exchanges           = each.value.server_algorithms_key_exchanges
  server_algorithms_host_key_ecdsa_nistp256 = each.value.server_algorithms_host_key_ecdsa_nistp256
  server_algorithms_host_key_ecdsa_nistp384 = each.value.server_algorithms_host_key_ecdsa_nistp384
  server_algorithms_host_key_ecdsa_nistp521 = each.value.server_algorithms_host_key_ecdsa_nistp521
  server_algorithms_host_key_rsa            = each.value.server_algorithms_host_key_rsa
  server_algorithms_host_key_dsa            = each.value.server_algorithms_host_key_dsa
  server_algorithms_host_key_x509v3_ssh_rsa = each.value.server_algorithms_host_key_x509v3_ssh_rsa
  server_algorithms_host_key_ed25519        = each.value.server_algorithms_host_key_ed25519
  server_algorithms_host_key_rsa_sha512     = each.value.server_algorithms_host_key_rsa_sha512
  server_algorithms_host_key_rsa_sha256     = each.value.server_algorithms_host_key_rsa_sha256
  server_algorithms_host_key_ssh_rsa        = each.value.server_algorithms_host_key_ssh_rsa
  server_algorithms_ciphers                 = each.value.server_algorithms_ciphers
  server_vrfs                               = each.value.server_vrfs
  server_netconf_vrfs                       = each.value.server_netconf_vrfs
  server_usernames                          = each.value.server_usernames
  client_source_interface                   = each.value.client_source_interface
  client_vrf                                = each.value.client_vrf
  client_dscp                               = each.value.client_dscp
  client_v1                                 = each.value.client_v1
  client_v2                                 = each.value.client_v2
  client_tcp_window_scale                   = each.value.client_tcp_window_scale
  client_rekey_time                         = each.value.client_rekey_time
  client_rekey_volume                       = each.value.client_rekey_volume
  client_disable_hmac_sha1                  = each.value.client_disable_hmac_sha1
  client_disable_hmac_sha2_256              = each.value.client_disable_hmac_sha2_256
  client_disable_hmac_sha2_512              = each.value.client_disable_hmac_sha2_512
  client_enable_cipher_aes_cbc              = each.value.client_enable_cipher_aes_cbc
  client_enable_cipher_3des_cbc             = each.value.client_enable_cipher_3des_cbc
  client_algorithms_key_exchanges           = each.value.client_algorithms_key_exchanges
  client_algorithms_ciphers                 = each.value.client_algorithms_ciphers
}

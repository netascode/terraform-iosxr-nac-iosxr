<!-- BEGIN_TF_DOCS -->
# IOS-XR Hostname Configuration Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

#### `system.nac.yaml`

```yaml
iosxr:
  devices:
    - name: router-1
      host: 10.122.20.77:2623
      configuration:
        #hostname: router-1
        pce:
          address_ipv4: 77.77.77.1
          api_authentication_digest: true
          api_sibling_ipv4: 100.100.100.2
          peer_filter_ipv4_access_list: Accesslist1
          delete_mode: all
          api_users:
            - user_name: rest-user
              password_encrypted: 00141215174C04140B
          state_sync_ipv4s:
            - address: 100.100.100.11
              password_encrypted: 00141215174C04140B

```

#### `main.tf`

```hcl
module "iosxr" {
  #source  = "netascode/nac-iosxr/iosxr"
  #version = ">= 0.1.0"
  source     = "../.."
  yaml_files = ["system.nac.yaml"]
}
```
<!-- END_TF_DOCS -->
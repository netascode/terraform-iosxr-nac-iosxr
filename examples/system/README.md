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
<!-- END_TF_DOCS -->
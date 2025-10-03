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
    - name: xr-1
      host: 10.1.1.1
      configuration:
        hostname: xr-1
```

#### `main.tf`

```hcl
module "iosxr" {
  source     = "../../"
  yaml_files = ["system.nac.yaml"]
}
```
<!-- END_TF_DOCS -->
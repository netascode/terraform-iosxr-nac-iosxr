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
        hostname: rasim
        tag_set:
          set_name: "TEST"
          rpl_tag_set: |
            tag-set TEST
              4297, 5000, 6000
            end-set
```

#### `main.tf`

```hcl
module "iosxr" {
  #source     = "netascode/nac-iosxr/iosxr"
  #version    = ">= 0.1.0"
  source     = "../.."
  yaml_files = ["system.nac.yaml"]
}
```
<!-- END_TF_DOCS -->
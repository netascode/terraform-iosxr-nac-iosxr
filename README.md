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
| <a name="requirement_iosxr"></a> [iosxr](#requirement\_iosxr) | >= 0.5.3 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.3.0 |
| <a name="requirement_utils"></a> [utils](#requirement\_utils) | >= 0.2.6 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_model"></a> [model](#input\_model) | As an alternative to YAML files, a native Terraform data structure can be provided as well. | `map(any)` | `{}` | no |
| <a name="input_write_default_values_file"></a> [write\_default\_values\_file](#input\_write\_default\_values\_file) | Write all default values to a YAML file. Value is a path pointing to the file to be created. | `string` | `""` | no |
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
| [iosxr_hostname.hostname](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/hostname) | resource |
| [iosxr_service_timestamps.service_timestamps](https://registry.terraform.io/providers/CiscoDevNet/iosxr/latest/docs/resources/service_timestamps) | resource |
| [local_sensitive_file.defaults](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [terraform_data.validation](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
## Modules

No modules.
<!-- END_TF_DOCS -->
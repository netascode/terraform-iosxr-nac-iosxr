module "iosxr" {
  source  = "../.."
  # version = ">= 0.1.0"

  yaml_files = ["system.nac.yaml"]
}
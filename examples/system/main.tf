module "iosxr" {
  source = "../.."

  yaml_files = ["system.nac.yaml"]
}
module "iosxr" {
  #source  = "netascode/nac-iosxr/iosxr"
  #version = ">= 0.1.0"
  source = "../.."
  yaml_files = ["system.nac.yaml"]
}
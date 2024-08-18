# modules/proxmox/virtual_machine/local.tf

locals {
  virtual_machine = try(yamldecode(file("/mnt/workspace/virtual_machine.yaml")), {})
  provider = try(yamldecode(file("/mnt/workspace/provider.yaml")), {})
}
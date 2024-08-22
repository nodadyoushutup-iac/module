locals {
  provider = yamldecode(file("/mnt/workspace/provider.yaml"))
  config = try(yamldecode(file("/mnt/workspace/config.yaml")), yamldecode(file("/mnt/workspace/config.yml")))
  valid_terraform_version = var.ansible == null || try(var.ansible.playbook == null, null) ? var.terraform_version : null
  valid_ansible = var.terraform_version == null ? var.ansible : null
  invalid_config = var.terraform_version != null && (var.ansible != null && try(var.ansible.playbook != null, null) != null)
}

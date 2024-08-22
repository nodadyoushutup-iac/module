resource "spacelift_stack" "stack" {
  ## REQUIRED ##
  name                = var.name
  repository          = var.repository
  branch = var.branch != null && var.branch != "" ? var.branch : (try(local.config.global.stack.branch, null) != null && try(local.config.global.stack.branch != "", null) ? local.config.global.stack.branch : "main")

  ## UNIQUE ##
  description         = var.description
  labels              = var.labels
  project_root        = var.project_root
  
  ## OPTIONAL ##
  space_id = try(var.space_id, try(local.config.global.stack.space_id, null))
  administrative = try(var.administrative, try(local.config.global.stack.administrative, null))
  autodeploy = try(var.autodeploy, try(local.config.global.stack.autodeploy, null))
  terraform_version = try(var.terraform_version, try(local.config.global.stack.terraform_version, null))
  
  dynamic "github_enterprise" {
    for_each = var.github_enterprise != null && var.github_enterprise != {} ? [var.github_enterprise] : []
    content {
      namespace = github_enterprise.value.namespace
    }
  }

  dynamic "ansible" {
    for_each = (
      var.ansible != null && var.ansible != {} && (var.terraform_version == null || var.terraform_version == "")
    ) ? [var.ansible] : []
    content {
      playbook = ansible.value.playbook
    }
  }
}

resource "spacelift_context_attachment" "config" {
  context_id = "config"
  stack_id   = var.name
  priority   = var.context_priority
  depends_on = [spacelift_stack.stack]
}

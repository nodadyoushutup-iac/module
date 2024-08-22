resource "spacelift_stack" "stack" {
  ## REQUIRED ##
  name                = var.name
  repository          = var.repository

  ## UNIQUE ##
  description         = var.description
  labels              = var.labels
  project_root        = var.project_root
  
  ## OPTIONAL ##
  branch              = var.branch
  space_id            = var.space_id
  administrative      = var.administrative
  autodeploy          = var.autodeploy
  terraform_version   = var.ansible == null || var.ansible == {} ? var.terraform_version : null
  
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

# resource "spacelift_context_attachment" "config" {
#   context_id = "config"
#   stack_id   = var.name
#   priority   = var.context_priority
#   depends_on = [spacelift_stack.stack]
# }

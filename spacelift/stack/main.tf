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
  terraform_version   = var.terraform_version
  
  github_enterprise { 
    namespace   = var.github_enterprise.namespace
  }
}

resource "spacelift_context_attachment" "config" {
  count = try(spacelift_stack.stack) ? 1 : 0
  context_id = "config"
  stack_id   = var.name
  priority   = var.context_priority
  depends_on = [spacelift_stack.stack]
}
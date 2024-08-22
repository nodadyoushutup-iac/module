resource "spacelift_stack" "stack" {
    #REQUIRED
    name                = var.name
    repository          = var.repository
    
    #OPTIONAL
    branch              = var.branch
    space_id            = var.space_id
    administrative      = var.administrative
    autodeploy          = var.autodeploy
    description         = var.description
    project_root        = var.project_root
    terraform_version   = var.terraform_version
    labels              = var.labels
    github_enterprise { 
        namespace   = var.github_enterprise.namespace
    }
}

resource "spacelift_context_attachment" "config" {
  context_id = "config"
  stack_id   = var.name
  priority   = var.context_priority
}
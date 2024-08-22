# # INFRA
# resource "spacelift_stack" "stack_infra" {
#   ## REQUIRED ##
#   name                = concat(var.name, "_infra")
#   repository          = var.repository

#   ## UNIQUE ##
#   description         = var.description
#   labels              = concat(var.labels, ["infra"])
#   project_root        = "infra"
  
#   ## OPTIONAL ##
#   branch              = var.branch
#   space_id            = var.space_id
#   administrative      = var.administrative
#   autodeploy          = var.autodeploy
#   terraform_version   = var.terraform_version
  
#   github_enterprise { 
#     namespace   = var.github_enterprise.namespace
#   }
# }

# resource "spacelift_context_attachment" "config" {
#   context_id = "config"
#   stack_id   = concat(var.name, "_init")
#   priority   = var.context_priority
#   depends_on = [spacelift_stack.stack_init]
# }

# # INIT
# resource "spacelift_stack" "stack_init" {
#   ## REQUIRED ##
#   name                = concat(var.name, "_init")
#   repository          = var.repository

#   ## UNIQUE ##
#   description         = var.description
#   labels              = concat(var.labels, ["init"])
#   project_root        = "init"
#   ansible {
#     playbook = "main.yaml"
#   }
  
#   ## OPTIONAL ##
#   branch              = var.branch
#   space_id            = var.space_id
#   administrative      = var.administrative
#   autodeploy          = var.autodeploy
#   terraform_version   = var.terraform_version
  
#   github_enterprise { 
#     namespace   = var.github_enterprise.namespace
#   }
# }

# resource "spacelift_context_attachment" "config" {
#   context_id = "config"
#   stack_id   = concat(var.name, "_init")
#   priority   = var.context_priority
#   depends_on = [spacelift_stack.stack_init]
# }
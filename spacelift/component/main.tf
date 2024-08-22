# INFRA

locals {
  stack = lookup(local.config.stack, var.component, null)
}

# module "infra" {
#     source  = "spacelift.io/nodadyoushutup/stack/spacelift"
#     count = try(contains(local.config.component, var.component)) ? 1 : 0

#     # REQUIRED
#     name = "${var.component}_infra"
#     repository = try(local.config.stack.database.repository, var.component)

#     # UNIQUE
#     description = try(
#         try(
#             local.config.stack.database.description, 
#             local.config.global.stack.description
#         ), 
#         "Database infrastructure"
#     )
#     project_root = try(
#         try(
#         local.config.stack.database.project_root, 
#         local.config.global.stack.project_root
#         ), 
#         "infra"
#     )
#     labels = try(
#         try(
#         concat(local.config.stack.database.labels, ["infra", var.component]), 
#         concat(local.config.global.stack.labels, ["infra", var.component])
#         ),
#         ["infra", var.component]
#     )

#     # # OPTIONAL
#     # space_id = try(
#     #     try(
#     #     local.config.stack.database.space_id, 
#     #     local.config.global.stack.space_id
#     #     ), 
#     #     null
#     # )
#     # administrative = try(
#     #     try(
#     #     local.config.stack.database.administrative, 
#     #     local.config.global.stack.administrative
#     #     ), 
#     #     null
#     # )
#     # autodeploy = try(
#     #     try(
#     #     local.config.stack.database.autodeploy, 
#     #     local.config.global.stack.autodeploy
#     #     ), 
#     #     null
#     # )
#     # branch = try(
#     #     try(
#     #     local.config.stack.database.branch, 
#     #     local.config.global.stack.branch
#     #     ), 
#     #     null
#     # )
#     # terraform_version = try(
#     #     try(
#     #     local.config.stack.database.terraform_version, 
#     #     local.config.global.stack.terraform_version
#     #     ), 
#     #     null
#     # )
#     # context_priority = try(
#     #     try(
#     #     local.config.stack.database.context_priority, 
#     #     local.config.global.stack.context_priority
#     #     ), 
#     #     null
#     # )
#     github_enterprise = { 
#         namespace = try(
#         try(
#             local.config.stack.database.github_enterprise.namespace, 
#             local.config.global.stack.github_enterprise.namespace
#         ),
#         null
#         )
#     }
# }

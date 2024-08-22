# INFRA

locals {
  stack = lookup(local.config.stack, var.component, null)
}

module "infra" {
    source  = "spacelift.io/nodadyoushutup/stack/spacelift"
    count = try(contains(local.config.component, var.component)) ? 1 : 0

    # REQUIRED
    name = "${var.component}_infra"
    repository = try(local.stack.infra.repository, var.component)

    # UNIQUE
    description = try(
        try(
            local.stack.infra.description, 
            local.config.global.stack.description
        ), 
        "${var.component} infrastructure"
    )
    project_root = try(
        try(
        local.stack.infra.project_root, 
        local.config.global.stack.project_root
        ), 
        "infra"
    )
    labels = try(
        try(
        concat(local.stack.infra.labels, ["infra", var.component]), 
        concat(local.config.global.stack.labels, ["infra", var.component])
        ),
        ["infra", var.component]
    )

    # OPTIONAL
    space_id = try(
        try(
        local.stack.infra.space_id, 
        local.config.global.stack.space_id
        ), 
        null
    )
    administrative = try(
        try(
        local.stack.infra.administrative, 
        local.config.global.stack.administrative
        ), 
        null
    )
    autodeploy = try(
        try(
        local.stack.infra.autodeploy, 
        local.config.global.stack.autodeploy
        ), 
        null
    )
    branch = try(
        try(
        local.stack.infra.branch, 
        local.config.global.stack.branch
        ), 
        null
    )
    terraform_version = try(
        try(
        local.stack.infra.terraform_version, 
        local.config.global.stack.terraform_version
        ), 
        null
    )
    context_priority = try(
        try(
        local.stack.infra.context_priority, 
        local.config.global.stack.context_priority
        ), 
        null
    )
    github_enterprise = { 
        namespace = try(
        try(
            local.stack.infra.github_enterprise.namespace, 
            local.config.global.stack.github_enterprise.namespace
        ),
        null
        )
    }
}

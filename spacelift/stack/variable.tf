# REQUIRED
variable "name" {
  description = "Name of the Spacelift stack."
  type        = string
}

variable "repository" {
  description = "Repository URL for the Spacelift stack."
  type        = string
}

#OPTIONAL
variable "space_id" {
  description = "ID of the space where the stack is created."
  type= string
  default = "root"
}

variable "administrative" {
  description = "Flag to indicate if the stack has administrative permissions."
  type= bool
  default= false
}

variable "autodeploy" {
  description = "Flag to enable automatic deployment for the stack."
  type= bool
  default= true
}

variable "branch" {
  description = "Git branch to use for the stack."
  type= string
  default= "main"
}

variable "description" {
  description = "Description of the Spacelift stack."
  type        = string
  default     = null
}

variable "project_root" {
  description = "Project root directory for the Spacelift stack."
  type        = string
  default     = "/"
}

variable "terraform_version" {
  description = "Terraform version to use for the stack."
  type        = string
  default     = "1.5.7"
}

variable "labels" {
  description = "List of labels to assign to the stack."
  type        = list(string)
  default     = []
}

variable "context_priority" {
  description = "Priority of the context when attached to the stack."
  type        = number
  default     = 100
}


variable "github_enterprise" {
  description = "Configuration for GitHub Enterprise integration."
  type = object({
    namespace = optional(string, "nodadyoushutup-terraform")
  })
  default = null
}

variable "ansible" {
  description = "Configuration for GitHub Enterprise integration."
  type = object({
    playbook = optional(string, null)
  })
  default = null
}


variable "project" {
  description = "the project node to apply the roles to"
  default = null
}

variable "folder" {
    description = "the folder node to apply the roles to"
  default = null
}

variable "organization" {
  description = "the organization node to apply the roles to"
  default = null
}

variable "member" {
  description = "the member superuser roles should be applied to"
  type = string
}

variable "binding_level" {
  description = "The type of resource the member should bind to. One of PROJECT, FOLDER, or ORGANIZATION"
  default     = "PROJECT"
}

variable "admin_type" {
  description = "Whether to create an admin or super-admin. One of ADMIN or SUPERADMIN"
  default     = "ADMIN"
}

variable "resource_manager_id" {
  description = "The resource id to bind to."
}

variable "member" {
  description = "The member the superuser roles should be applied to."
  type        = string
}

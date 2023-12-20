variable "binding_level" {
  description = "The type of resource the member should bind to. One of PROJECT, FOLDER, or ORGANIZATION"
  default     = "PROJECT"
}

variable "resource_manager_id" {
  description = "The resource id to bind to."
}

variable "member" {
  description = "The member the superuser roles should be applied to."
  type        = string
}

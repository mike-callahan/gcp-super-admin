// Import roles from json file
locals {
  role_import = jsondecode(file("${path.module}/roles.json"))
  roles       = var.admin_type == "SUPERADMIN" ? local.role_import.super_admin : local.role_import.admin
}


// If a project ID is passed in bind the roles at the project level
resource "google_project_iam_member" "project" {
  for_each = var.binding_level == "PROJECT" ? toset(concat(local.roles.general, local.roles.project_only)) : []
  project  = var.resource_manager_id
  role     = each.key
  member   = var.member
}

// If a folder ID is passed in bind the roles at the folder level
resource "google_folder_iam_member" "folder" {
  for_each = var.binding_level == "FOLDER" ? toset(concat(local.roles.general, local.roles.folder_only)) : []
  folder   = var.resource_manager_id
  role     = each.key
  member   = var.member
}

// If an organization ID is passed in bind the roels at the organization level
resource "google_organization_iam_member" "organization" {
  for_each = var.binding_level == "ORGANIZATION" ? toset(concat(local.roles.general, local.roles.folder_only, local.roles.organization_only)) : []
  org_id   = var.resource_manager_id
  role     = each.key
  member   = var.member
}

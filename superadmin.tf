// Import roles from json file
locals {
  roles = jsondecode(file("./superadmin_roles.json"))
}

// If a project ID is passed in bind the roles at the project level
resource "google_project_iam_member" "project" {
  for_each = var.project ? local.roles : null
  project = var.project
  role    = each.key
  member  = var.member
}

// If a folder ID is passed in bind the roles at the folder level
resource "google_folder_iam_member" "folder" {
      for_each = var.folder ? local.roles : null
  folder  = var.folder
  role    = each.key
  member  = var.member
}

// If an organization ID is passed in bind the roels at the organization level
resource "google_organization_iam_member" "organization" {
    for_each = var.organization ? local.roles : null
  org_id  = var.organization
  role    = each.key
  member  = var.member
}

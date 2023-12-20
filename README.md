# GCP Terraform Superuser role module
**!!! WARNING !!!!**
This module should be used with extreme caution.
* Use at your own risk.
* Never use in a production environment
* Never use in a way that could lead to data leaks, abuse, harm, etc.
* This is in NO way endorsed, warranted, recommended, or recognized by Google.

# What is this module?
Balancing security and convenience is always delicate. I try for principle of least privledge whenever possible. I created this module because there are occasionally valid reasons for not adhering to that principle. When I can't adhere to least privledge I try to mitigate the impact of that decision.

This module enables the controlled and scoped provisionment of GCP administrator roles en masse. It takes a binding scope and a member and grants a series of admin roles to the member.

# Usage
| Input    | Description |
| -------- | ------- |
| admin_type | One of ADMIN or SUPERADMIN. Admin is a paired down list that covers most practical use-cases while reducing the number of roles that need to be applied.    |
| binding_level    | One of PROJECT, FOLDER, or ORGANIZATION   |
| resource_manager_id | ID of the binding level. A project name for projects or a number for folders and organizations     |
| member    | One of user:<user_email>, group:<group_email>, or serviceAccount:<service_account_email>   |

# Usage Examples

~~~
module "super-admin" {
  source              = "github.com/mike-callahan/gcp-super-admin.git"
  admin_type          = "SUPERADMIN"
  binding_level       = "PROJECT"
  resource_manager_id = "my-project"
  member              = "user:myuser@myemail.com"
}

module "super-admin" {
  source              = "github.com/mike-callahan/gcp-super-admin.git"
  admin_type          = "ADMIN"
  binding_level       = "FOLDER"
  resource_manager_id = "123456789"
  member              = "group:mygroup@myemail.com"
}

module "super-admin" {
  source              = "github.com/mike-callahan/gcp-super-admin.git"
  admin_type          = "SUPERADMIN"
  binding_level       = "ORGANIZATION"
  resource_manager_id = "123456789"
  member              = "serviceAccount:myaccount@<project>.iam.gserviceaccount.com"
}
~~~

# Notes
* Roles were chosen based on regex keyword of 'admin' or 'Admin'. A few others were manually added such as `resourcemanager.projectDeleter`.
* This is slow, it takes around 10-15 minutes to apply all the roles of SUPERADMIN.
* I would keep this in a seperate terraform state file for pipeline speed and blast radius reasons.
* Roles up-to-date as of 12/15/2023. Includes GA and Beta roles.
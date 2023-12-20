# GCP Terraform Superuser role module
**!!! WARNING !!!!**
This module should be used with extreme caution. It gives a principle **insanely** over-privledged access. There is a place for it though and it's better to do it in IAC than in the console so it can be controlled.

# Typical uses
* Root service account: Some organizations prefer to have a single root service account that controls backend infrastructure automation. This can fill that use case. 

    NOTICE: Having a single root service account is a dumb idea. My recommendation would be to spread access across multiple service accounts and/or start with the iam.organizationAdmin role and use automation to let the service account grant itself roles. But do what you want! Always use two-factor!
* POC/Ephemeral projects: A quick POC may require lots of different roles. It can be annoying and time-consuming to continually grant yourself a role. Under this use-case you can create your POC easily and then destroy the project when you're done.

# Usage
Clone down the repo or reference the git link directly in the terraform source argument. Supply *project* OR *folder* OR *organization* depending on what level the IAM binding should be. Ex:

~~~
module "superadmin_project" {
    source   = github
    project  = "my-project"
    member   = "user:myuser@myorg.com"
}

module "superadmin_folder" {
    source   = github
    folder   = "folders/123"
    member   = "serviceAccount:myaccount.iam.gserviceaccount.com"
}

module "superadmin_project" {
    source        = github
    organization  = "organizations/123"
    member        = "group:admins@myorg.com"
}
~~~

# Notes
* Includes any role with the keyword 'admin' or 'Admin'. It's possible I missed a role if the role name doesn't include that text. Feel free to submit a PR if you find a new role that should be added.
* This is in NO way endorsed, warranted, recommended, or recognized by Google.
* Roles up-to-date as of 12/15/2023. Includes GA and Beta roles.
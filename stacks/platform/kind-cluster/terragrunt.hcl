# Terragrunt configuration for KIND cluster stack

include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Local variables
locals {
  root_dir = get_repo_root()
}

# Stack-specific inputs
inputs = {
  cluster_name       = "opentofu-platform-demo"
  kubernetes_version = "v1.30.0"
}

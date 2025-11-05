# Terragrunt configuration for Team B stack

include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Dependency on vcluster
dependency "kind_cluster" {
  config_path = "../../platform/kind-cluster"

  mock_outputs = {
    cluster_endpoint = ""
    cluster_ca_certificate = ""
    client_certificate = ""
    client_key = ""
  }

  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
}

# Stack-specific inputs
inputs = {
  host_cluster_endpoint = dependency.kind_cluster.outputs.cluster_endpoint
  host_cluster_ca_cert = dependency.kind_cluster.outputs.cluster_ca_certificate
  host_client_cert = dependency.kind_cluster.outputs.client_certificate
  host_client_key = dependency.kind_cluster.outputs.client_key
  team_name                = "team-b"
}

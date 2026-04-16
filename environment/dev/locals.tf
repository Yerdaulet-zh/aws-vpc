locals {
  region           = "eu-central-1"
  environment      = "Development"
  project_name     = "EKS_academy"
  eks_cluster_name = "${local.environment}_${local.project_name}"
}

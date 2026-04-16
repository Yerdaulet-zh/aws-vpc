locals {
  region           = "eu-central-1"
  environment      = "Production"
  project_name     = "EKS-Academy"
  eks_cluster_name = "${local.environment}_${local.project_name}"
}

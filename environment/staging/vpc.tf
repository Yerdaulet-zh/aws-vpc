module "staging" {
  source           = "../../modules/vpc"
  region           = local.region
  environment      = local.environment
  project_name     = local.project_name
  eks_cluster_name = local.eks_cluster_name
  nat_gateway_config = {
    "a"    = { enabled = false }
    "b"    = { enabled = false }
    "c"    = { enabled = false }
    "a_ds" = { enabled = false }
    "b_ds" = { enabled = false }
    "c_ds" = { enabled = false }
  }
  private_subnet_config = {
    "ipv4_pvt_a" = { zone = "a" }
    "ipv4_pvt_b" = { zone = "b" }
    "ipv4_pvt_c" = { zone = "c" }
    "ipv6_pvt_a" = { zone = "a" }
    "ipv6_pvt_b" = { zone = "b" }
    "ipv6_pvt_c" = { zone = "c" }
    "dual_pvt_a" = { zone = "a" }
    "dual_pvt_b" = { zone = "b" }
    "dual_pvt_c" = { zone = "c" }
  }
}

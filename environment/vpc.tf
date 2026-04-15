resource "aws_vpc" "this" {
  ipv4_ipam_pool_id   = data.aws_vpc_ipam_pool.dev_ipv4.id
  ipv4_netmask_length = 20

  ipv6_ipam_pool_id   = data.aws_vpc_ipam_pool.dev_ipv6.id
  ipv6_netmask_length = 56

  instance_tenancy                     = "default"
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  enable_dns_hostnames                 = true
  #   assign_generated_ipv6_cidr_block     = false

  tags = {
    Name        = "Development VPC for EKS"
    Environment = "Development"
    Owner       = "Network-EKS"
    ManagedBy   = "terraform"
  }
}

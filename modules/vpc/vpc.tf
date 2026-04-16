resource "aws_vpc" "this" {
  ipv4_ipam_pool_id   = data.aws_vpc_ipam_pool.dev_ipv4.id
  ipv4_netmask_length = 20

  # ipv6_ipam_pool_id   = aws_vpc_ipv6_cidr_block_association.example
  # ipv6_netmask_length = 56

  # assign Amazon provided IPv6 pool of IP addresses which GUA
  assign_generated_ipv6_cidr_block = true

  instance_tenancy                     = "default"
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  enable_dns_hostnames                 = true

  tags = {
    Name        = "${local.environment}_${local.project_name}"
    Environment = "${local.environment}"
    Owner       = "Network-EKS"
    ManagedBy   = "terraform"
  }
}

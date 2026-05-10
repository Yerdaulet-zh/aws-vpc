resource "aws_vpc" "this" {

  ipv4_ipam_pool_id   = local.vpc_config.ipam_ipv4_id
  ipv4_netmask_length = local.vpc_config.ipv4_netmask_length
  cidr_block          = local.vpc_config.cidr_block

  # ipv6_ipam_pool_id   = aws_vpc_ipv6_cidr_block_association.example
  # ipv6_netmask_length = 56

  # assign Amazon provided IPv6 pool of IP addresses which GUA
  assign_generated_ipv6_cidr_block = var.vpc_config.assign_generated_ipv6_cidr_block

  instance_tenancy                     = var.vpc_config.instance_tenancy
  enable_dns_support                   = var.vpc_config.enable_dns_support
  enable_network_address_usage_metrics = var.vpc_config.enable_network_address_usage_metrics
  enable_dns_hostnames                 = var.vpc_config.enable_dns_hostnames

  tags = {
    Name        = "${var.global.project_name}-${var.global.environment}"
    Environment = "${var.global.environment}"
    Owner       = "EKS-RDS"
    ManagedBy   = "terraform"
  }
}

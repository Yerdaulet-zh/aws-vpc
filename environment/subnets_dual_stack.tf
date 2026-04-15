resource "aws_subnet" "dual_stack_public_a" {
  vpc_id            = aws_vpc.this.id
  availability_zone = "${local.region}a"

  # IPv4 Logic: /20 -> /24 (Index 6 to stay clear of other subnet files)
  cidr_block = cidrsubnet(aws_vpc.this.cidr_block, 4, 6)
  # IPv6 Logic: /56 -> /64 (Index 6)
  ipv6_cidr_block = cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, 6)

  map_public_ip_on_launch                        = true
  assign_ipv6_address_on_creation                = true
  enable_resource_name_dns_aaaa_record_on_launch = true

  tags = {
    Name                                            = "Dual Stack Public Subnet 1"
    Project                                         = local.project_name
    "kubernetes.io/role/elb"                        = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}

resource "aws_subnet" "dual_stack_public_b" {
  vpc_id            = aws_vpc.this.id
  availability_zone = "${local.region}b"

  cidr_block      = cidrsubnet(aws_vpc.this.cidr_block, 4, 7)
  ipv6_cidr_block = cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, 7)

  map_public_ip_on_launch                        = true
  assign_ipv6_address_on_creation                = true
  enable_resource_name_dns_aaaa_record_on_launch = true

  tags = {
    Name                                            = "Dual Stack Public Subnet 2"
    Project                                         = local.project_name
    "kubernetes.io/role/elb"                        = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}

resource "aws_subnet" "dual_stack_public_c" {
  vpc_id            = aws_vpc.this.id
  availability_zone = "${local.region}c"

  cidr_block      = cidrsubnet(aws_vpc.this.cidr_block, 4, 8)
  ipv6_cidr_block = cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, 8)

  map_public_ip_on_launch                        = true
  assign_ipv6_address_on_creation                = true
  enable_resource_name_dns_aaaa_record_on_launch = true

  tags = {
    Name                                            = "Dual Stack Public Subnet 3"
    Project                                         = local.project_name
    "kubernetes.io/role/elb"                        = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}

resource "aws_subnet" "dual_stack_private_a" {
  vpc_id            = aws_vpc.this.id
  availability_zone = "${local.region}a"

  cidr_block      = cidrsubnet(aws_vpc.this.cidr_block, 4, 9)
  ipv6_cidr_block = cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, 9)

  map_public_ip_on_launch                        = false
  assign_ipv6_address_on_creation                = true
  enable_resource_name_dns_aaaa_record_on_launch = true

  tags = {
    Name                                            = "Dual Stack Private Subnet 1"
    Project                                         = local.project_name
    "kubernetes.io/role/internal-elb"               = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}

resource "aws_subnet" "dual_stack_private_b" {
  vpc_id            = aws_vpc.this.id
  availability_zone = "${local.region}b"

  cidr_block      = cidrsubnet(aws_vpc.this.cidr_block, 4, 10)
  ipv6_cidr_block = cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, 10)

  map_public_ip_on_launch                        = false
  assign_ipv6_address_on_creation                = true
  enable_resource_name_dns_aaaa_record_on_launch = true

  tags = {
    Name                                            = "Dual Stack Private Subnet 2"
    Project                                         = local.project_name
    "kubernetes.io/role/internal-elb"               = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}

resource "aws_subnet" "dual_stack_private_c" {
  vpc_id            = aws_vpc.this.id
  availability_zone = "${local.region}c"

  cidr_block      = cidrsubnet(aws_vpc.this.cidr_block, 4, 11)
  ipv6_cidr_block = cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, 11)

  map_public_ip_on_launch                        = false
  assign_ipv6_address_on_creation                = true
  enable_resource_name_dns_aaaa_record_on_launch = true

  tags = {
    Name                                            = "Dual Stack Private Subnet 3"
    Project                                         = local.project_name
    "kubernetes.io/role/internal-elb"               = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}

output "dual_stack_public_subnet_id_a" {
  value = aws_subnet.dual_stack_public_a.id
}

output "dual_stack_public_subnet_id_b" {
  value = aws_subnet.dual_stack_public_b.id
}

output "dual_stack_public_subnet_id_c" {
  value = aws_subnet.dual_stack_public_c.id
}

output "dual_stack_private_subnet_id_a" {
  value = aws_subnet.dual_stack_private_a.id
}

output "dual_stack_private_subnet_id_b" {
  value = aws_subnet.dual_stack_private_b.id
}

output "dual_stack_private_subnet_id_c" {
  value = aws_subnet.dual_stack_private_c.id
}

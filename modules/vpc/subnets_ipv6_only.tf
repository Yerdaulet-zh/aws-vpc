resource "aws_subnet" "ipv6_public_a" {
  vpc_id            = aws_vpc.this.id
  availability_zone = "${local.region}a"

  ipv6_native = true

  # Logic: (56 + 8 = 64). Slicing the VPC's /56 into /64s.
  # index 0, 1, 2 for public; 3, 4, 5 for private to avoid overlap.
  ipv6_cidr_block = cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, 0)

  assign_ipv6_address_on_creation                = true
  enable_resource_name_dns_aaaa_record_on_launch = true
  enable_dns64                                   = true

  tags = {
    Name                                            = "IPv6 Public Subnet 1"
    Project                                         = local.project_name
    "kubernetes.io/role/elb"                        = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}

resource "aws_subnet" "ipv6_public_b" {
  vpc_id            = aws_vpc.this.id
  availability_zone = "${local.region}b"
  ipv6_native       = true
  ipv6_cidr_block   = cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, 1)

  assign_ipv6_address_on_creation                = true
  enable_resource_name_dns_aaaa_record_on_launch = true
  enable_dns64                                   = true

  tags = {
    Name                                            = "IPv6 Public Subnet 2"
    Project                                         = local.project_name
    "kubernetes.io/role/elb"                        = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}

resource "aws_subnet" "ipv6_public_c" {
  vpc_id            = aws_vpc.this.id
  availability_zone = "${local.region}c"
  ipv6_native       = true
  ipv6_cidr_block   = cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, 2)

  assign_ipv6_address_on_creation                = true
  enable_resource_name_dns_aaaa_record_on_launch = true
  enable_dns64                                   = true

  tags = {
    Name                                            = "IPv6 Public Subnet 3"
    Project                                         = local.project_name
    "kubernetes.io/role/elb"                        = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}

resource "aws_subnet" "ipv6_private_a" {
  vpc_id            = aws_vpc.this.id
  availability_zone = "${local.region}a"
  ipv6_native       = true
  ipv6_cidr_block   = cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, 3)

  assign_ipv6_address_on_creation                = true
  enable_resource_name_dns_aaaa_record_on_launch = true
  enable_dns64                                   = true

  tags = {
    Name                                            = "IPv6 Private Subnet 1"
    Project                                         = local.project_name
    "kubernetes.io/role/internal-elb"               = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}

resource "aws_subnet" "ipv6_private_b" {
  vpc_id            = aws_vpc.this.id
  availability_zone = "${local.region}b"
  ipv6_native       = true
  ipv6_cidr_block   = cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, 4)

  assign_ipv6_address_on_creation                = true
  enable_resource_name_dns_aaaa_record_on_launch = true
  enable_dns64                                   = true

  tags = {
    Name                                            = "IPv6 Private Subnet 2"
    Project                                         = local.project_name
    "kubernetes.io/role/internal-elb"               = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}

resource "aws_subnet" "ipv6_private_c" {
  vpc_id            = aws_vpc.this.id
  availability_zone = "${local.region}c"
  ipv6_native       = true
  ipv6_cidr_block   = cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, 5)

  assign_ipv6_address_on_creation                = true
  enable_resource_name_dns_aaaa_record_on_launch = true
  enable_dns64                                   = true

  tags = {
    Name                                            = "IPv6 Private Subnet 3"
    Project                                         = local.project_name
    "kubernetes.io/role/internal-elb"               = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}

output "ipv6_public_subnet_id_a" {
  value = aws_subnet.ipv6_public_a.id
}

output "ipv6_public_subnet_id_b" {
  value = aws_subnet.ipv6_public_b.id
}

output "ipv6_public_subnet_id_c" {
  value = aws_subnet.ipv6_public_c.id
}

output "ipv6_private_subnet_id_a" {
  value = aws_subnet.ipv6_private_a.id
}

output "ipv6_private_subnet_id_b" {
  value = aws_subnet.ipv6_private_b.id
}

output "ipv6_private_subnet_id_c" {
  value = aws_subnet.ipv6_private_c.id
}

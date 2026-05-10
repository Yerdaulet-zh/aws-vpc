# resource "aws_subnet" "ipv4_public_a" {
#   vpc_id            = aws_vpc.this.id
#   availability_zone = "${local.region}a"

#   # VPC is /20. Adding 4 bits (20+4) creates a /24.
#   # Index 0 = 10.x.0.0/24
#   cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 4, 0)
#   map_public_ip_on_launch = true

#   tags = {
#     Name                                            = "IPv4 Public Subnet 1"
#     Project                                         = local.project_name
#     "kubernetes.io/role/elb"                        = "1"
#     "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
#   }
# }

# resource "aws_subnet" "ipv4_public_b" {
#   vpc_id            = aws_vpc.this.id
#   availability_zone = "${local.region}b"

#   cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 4, 1)
#   map_public_ip_on_launch = true

#   tags = {
#     Name                                            = "IPv4 Public Subnet 2"
#     Project                                         = local.project_name
#     "kubernetes.io/role/elb"                        = "1"
#     "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
#   }
# }

# resource "aws_subnet" "ipv4_public_c" {
#   vpc_id            = aws_vpc.this.id
#   availability_zone = "${local.region}c"

#   cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 4, 2)
#   map_public_ip_on_launch = true

#   tags = {
#     Name                                            = "IPv4 Public Subnet 3"
#     Project                                         = local.project_name
#     "kubernetes.io/role/elb"                        = "1"
#     "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
#   }
# }

# resource "aws_subnet" "ipv4_private_a" {
#   vpc_id            = aws_vpc.this.id
#   availability_zone = "${local.region}a"

#   cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 4, 3)
#   map_public_ip_on_launch = false

#   tags = {
#     Name                                            = "IPv4 Private Subnet 1"
#     Project                                         = local.project_name
#     "kubernetes.io/role/internal-elb"               = "1"
#     "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
#   }
# }

# resource "aws_subnet" "ipv4_private_b" {
#   vpc_id            = aws_vpc.this.id
#   availability_zone = "${local.region}b"

#   cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 4, 4)
#   map_public_ip_on_launch = false

#   tags = {
#     Name                                            = "IPv4 Private Subnet 2"
#     Project                                         = local.project_name
#     "kubernetes.io/role/internal-elb"               = "1"
#     "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
#   }
# }

# resource "aws_subnet" "ipv4_private_c" {
#   vpc_id            = aws_vpc.this.id
#   availability_zone = "${local.region}c"

#   cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 4, 5)
#   map_public_ip_on_launch = false

#   tags = {
#     Name                                            = "IPv4 Private Subnet 3"
#     Project                                         = local.project_name
#     "kubernetes.io/role/internal-elb"               = "1"
#     "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
#   }
# }

# output "ipv4_public_subnet_id_a" {
#   value = aws_subnet.ipv4_public_a.id
# }

# output "ipv4_public_subnet_id_b" {
#   value = aws_subnet.ipv4_public_b.id
# }

# output "ipv4_public_subnet_id_c" {
#   value = aws_subnet.ipv4_public_c.id
# }

# output "ipv4_private_subnet_id_a" {
#   value = aws_subnet.ipv4_private_a.id
# }

# output "ipv4_private_subnet_id_b" {
#   value = aws_subnet.ipv4_private_b.id
# }

# output "ipv4_private_subnet_id_c" {
#   value = aws_subnet.ipv4_private_c.id
# }

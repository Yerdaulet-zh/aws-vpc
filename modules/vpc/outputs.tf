output "vpc_id" {
  description = "VPC ID for the EKS cluster"
  value       = aws_vpc.this.id
}

# ------------- IPv6 Only Subnets -------------
output "public_ipv4_subnets" {
  description = "Map of public subnet IDs"
  value = {
    "public_ipv4_a" = aws_subnet.subnets["ipv4_public_a"].id
    "public_ipv4_b" = aws_subnet.subnets["ipv4_public_b"].id
    "public_ipv4_c" = aws_subnet.subnets["ipv4_public_c"].id
  }
}

output "private_ipv4_subnets" {
  description = "Map of private subnet IDs"
  value = {
    "private_ipv4_a" = aws_subnet.subnets["ipv4_private_a"].id
    "private_ipv4_b" = aws_subnet.subnets["ipv4_private_b"].id
    "private_ipv4_c" = aws_subnet.subnets["ipv4_private_c"].id
  }
}

# ------------- IPv6 Only Subnets -------------
output "public_ipv6_subnets" {
  description = "Map of public subnet IDs"
  value = {
    "public_ipv6_a" = aws_subnet.subnets["ipv6_public_a"].id
    "public_ipv6_b" = aws_subnet.subnets["ipv6_public_b"].id
    "public_ipv6_c" = aws_subnet.subnets["ipv6_public_c"].id
  }
}

output "private_ipv6_subnets" {
  description = "Map of private subnet IDs"
  value = {
    "private_ipv6_a" = aws_subnet.subnets["ipv6_private_a"].id
    "private_ipv6_b" = aws_subnet.subnets["ipv6_private_b"].id
    "private_ipv6_c" = aws_subnet.subnets["ipv6_private_c"].id
  }
}

# ------------- Dual-Stack Subnets -------------
output "public_dual_stack_subnets" {
  description = "Map of public subnet IDs"
  value = {
    "public_dual_stack_a" = aws_subnet.subnets["dual_stack_public_a"].id
    "public_dual_stack_b" = aws_subnet.subnets["dual_stack_public_b"].id
    "public_dual_stack_c" = aws_subnet.subnets["dual_stack_public_c"].id
  }
}

output "private_dual_stack_subnets" {
  description = "Map of private subnet IDs"
  value = {
    "private_dual_stack_a" = aws_subnet.subnets["dual_stack_private_a"].id
    "private_dual_stack_b" = aws_subnet.subnets["dual_stack_private_b"].id
    "private_dual_stack_c" = aws_subnet.subnets["dual_stack_private_c"].id
  }
}

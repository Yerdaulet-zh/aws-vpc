output "vpc_id" {
  description = "VPC ID for the EKS cluster"
  value       = module.test.vpc_id
}

# ------------- IPv4 Only Subnets -------------
output "public_ipv4_subnets" {
  description = "Map of public subnet IDs"
  value       = module.test.public_ipv4_subnets
}

output "private_ipv4_subnets" {
  description = "Map of private subnet IDs"
  value       = module.test.private_ipv4_subnets
}

# ------------- IPv6 Only Subnets -------------
output "public_ipv6_subnets" {
  description = "Map of public subnet IDs"
  value       = module.test.public_ipv6_subnets
}

output "private_ipv6_subnets" {
  description = "Map of private subnet IDs"
  value       = module.test.private_ipv6_subnets
}

# ------------- Dual-Stack Subnets -------------
output "public_dual_stack_subnets" {
  description = "Map of public subnet IDs"
  value       = module.test.public_dual_stack_subnets
}

output "private_dual_stack_subnets" {
  description = "Map of private subnet IDs"
  value       = module.test.private_dual_stack_subnets
}

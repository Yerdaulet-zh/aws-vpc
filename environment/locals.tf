locals {
  project_name = "advanced-vpc"
  region       = "eu-central-1"

  # Define where NAT Gateways should actually exist
  # If enabled = false, the NAT GW and EIP for that zone won't be created.
  nat_zones = {
    "a" = { public_subnet_id = aws_subnet.ipv4_public_a.id, enabled = true }
    "b" = { public_subnet_id = aws_subnet.ipv4_public_b.id, enabled = true }
    "c" = { public_subnet_id = aws_subnet.ipv4_public_c.id, enabled = true }
  }

  # Map EVERY private subnet to a NAT Zone
  # This list includes IPv4-only, IPv6-native, and Dual-Stack subnets.
  private_subnet_map = {
    "ipv4_pvt_a" = { id = aws_subnet.ipv4_private_a.id, zone = "a" }
    "ipv4_pvt_b" = { id = aws_subnet.ipv4_private_b.id, zone = "b" }
    "ipv4_pvt_c" = { id = aws_subnet.ipv4_private_c.id, zone = "c" }
    "ipv6_pvt_a" = { id = aws_subnet.ipv6_private_a.id, zone = "a" }
    "ipv6_pvt_b" = { id = aws_subnet.ipv6_private_b.id, zone = "b" }
    "ipv6_pvt_c" = { id = aws_subnet.ipv6_private_c.id, zone = "c" }
    "dual_pvt_a" = { id = aws_subnet.dual_stack_private_a.id, zone = "a" }
    "dual_pvt_b" = { id = aws_subnet.dual_stack_private_b.id, zone = "b" }
    "dual_pvt_c" = { id = aws_subnet.dual_stack_private_c.id, zone = "c" }
  }

  # Helpers to filter active resources
  active_nats = { for k, v in local.nat_zones : k => v if v.enabled }

  # Get a sorted list of keys for zones that HAVE a NAT Gateway
  # e.g., ["a"] if only A is enabled
  available_nat_keys = keys(local.active_nats)

  # Association Logic with Fallback
  # If the subnet's zone is enabled, use it.
  # Otherwise, use the first available NAT zone.
  # If NO NATs are enabled, this map becomes empty to prevent errors.
  active_associations = length(local.available_nat_keys) > 0 ? {
    for k, v in local.private_subnet_map : k => {
      id = v.id
      # Fallback: Is the preferred zone active? If not, use available_nat_keys[0]
      target_zone = local.nat_zones[v.zone].enabled ? v.zone : local.available_nat_keys[0]
    }
  } : {}

  use_nat = length(local.available_nat_keys) > 0
}

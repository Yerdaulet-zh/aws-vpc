locals {
  # This conditional block for vpc cidr block definition
  vpc_config = var.vpc_config.ipam_ipv4_id != null ? {
    ipv4_ipam_pool_id   = var.vpc_config.ipam_ipv4_id
    ipv4_netmask_length = var.vpc_config.ipv4_netmask_length
    } : {
    cidr_block = var.vpc_config.cidr_block
  }

  # Define where NAT Gateways should actually exist
  # If enabled = false, the NAT GW and EIP for that zone won't be created.

  # Map the keys to their corresponding subnet IDs
  subnet_id_lookup = {
    "a"    = aws_subnet.ipv4_public_a.id
    "b"    = aws_subnet.ipv4_public_b.id
    "c"    = aws_subnet.ipv4_public_c.id
    "a_ds" = aws_subnet.dual_stack_public_a.id
    "b_ds" = aws_subnet.dual_stack_public_b.id
    "c_ds" = aws_subnet.dual_stack_public_c.id
  }
  # Merge the variable settings with the actual IDs
  nat_zones = {
    for key, config in var.nat_gateway_config : key => {
      public_subnet_id = local.subnet_id_lookup[key]
      enabled          = config.enabled
    }
  }


  # Map EVERY private subnet to a NAT Zone
  # This list includes IPv4-only, IPv6-native, and Dual-Stack subnets.

  # The actual resource ID references
  private_subnet_ids = {
    "ipv4_pvt_a" = aws_subnet.ipv4_private_a.id
    "ipv4_pvt_b" = aws_subnet.ipv4_private_b.id
    "ipv4_pvt_c" = aws_subnet.ipv4_private_c.id
    "ipv6_pvt_a" = aws_subnet.ipv6_private_a.id
    "ipv6_pvt_b" = aws_subnet.ipv6_private_b.id
    "ipv6_pvt_c" = aws_subnet.ipv6_private_c.id
    "dual_pvt_a" = aws_subnet.dual_stack_private_a.id
    "dual_pvt_b" = aws_subnet.dual_stack_private_b.id
    "dual_pvt_c" = aws_subnet.dual_stack_private_c.id
  }

  # The final map used by your route table resources
  private_subnet_map = {
    for name, config in var.private_subnet_config : name => {
      id   = local.private_subnet_ids[name]
      zone = config.zone
    }
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

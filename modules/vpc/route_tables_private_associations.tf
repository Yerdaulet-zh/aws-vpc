resource "aws_route_table_association" "private_unified" {
  # Use the map that covers EVERY private subnet (IPv4, IPv6, Dual)
  for_each  = local.private_subnet_map
  subnet_id = each.value.id

  route_table_id = local.use_nat ? (
    # If NAT exists, use the fallback logic from locals
    aws_route_table.private_nat[local.active_associations[each.key].target_zone].id
    ) : (
    # If NO NAT exists globally, use the fallback EOIGW table
    aws_route_table.ipv6_fallback[0].id
  )
}

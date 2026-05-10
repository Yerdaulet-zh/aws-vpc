resource "aws_route_table_association" "public" {
  # Filter the subnets map to only include subnets where public IP is enabled
  for_each = {
    for k, v in var.subnets : k => v
    if v.map_public_ip_on_launch == true
  }

  # Reference the dynamically created subnet ID
  subnet_id = aws_subnet.subnets[each.key].id

  route_table_id = aws_route_table.dual_stack_public_route_table.id
}

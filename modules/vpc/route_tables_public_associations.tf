resource "aws_route_table_association" "public" {
  # We filter the subnets map to include only the subnets that should be public.
  # Based on your variable, these are subnets where Name contains 'Public'.
  for_each = {
    for k, v in var.subnets : k => v
    if length(regexall("public", lower(k))) > 0
  }

  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.dual_stack_public_route_table.id
}

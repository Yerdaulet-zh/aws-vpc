resource "aws_network_acl_association" "main" {
  for_each = aws_subnet.subnets

  subnet_id      = each.value.id
  network_acl_id = aws_network_acl.main.id
}

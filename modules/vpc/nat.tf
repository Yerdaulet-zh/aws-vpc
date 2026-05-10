resource "aws_eip" "nat" {
  for_each = local.active_nats
  domain   = "vpc"
  tags     = { Name = "${var.global.project_name}-nat-eip-${each.key}" }
}

resource "aws_nat_gateway" "main" {
  for_each      = local.active_nats
  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = each.value.public_subnet_id

  # NAT64 is essential for IPv6-native subnets to talk to IPv4 internet
  connectivity_type = "public"

  tags = { Name = "${var.global.project_name}-nat-gw-${each.key}" }
}

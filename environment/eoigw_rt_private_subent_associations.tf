resource "aws_route_table" "ipv6_private" {
  vpc_id = aws_vpc.this.id

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.this.id
  }

  tags = {
    Name = "${local.project_name}-eoigw-rt"
  }
}

# Dual Stack
resource "aws_route_table_association" "ipv6_private_association_a" {
  subnet_id      = aws_subnet.dual_stack_private_a.id
  route_table_id = aws_route_table.ipv6_private.id
}

resource "aws_route_table_association" "ipv6_private_association_b" {
  subnet_id      = aws_subnet.dual_stack_private_b.id
  route_table_id = aws_route_table.ipv6_private.id
}

resource "aws_route_table_association" "ipv6_private_association_c" {
  subnet_id      = aws_subnet.dual_stack_private_c.id
  route_table_id = aws_route_table.ipv6_private.id
}

# IPv6
resource "aws_route_table_association" "ipv6_only_private_route_table_association_a" {
  subnet_id      = aws_subnet.ipv6_private_a.id
  route_table_id = aws_route_table.ipv6_private.id
}

resource "aws_route_table_association" "ipv6_only_private_route_table_association_b" {
  subnet_id      = aws_subnet.ipv6_private_b.id
  route_table_id = aws_route_table.ipv6_private.id
}

resource "aws_route_table_association" "ipv6_only_private_route_table_association_c" {
  subnet_id      = aws_subnet.ipv6_private_c.id
  route_table_id = aws_route_table.ipv6_private.id
}

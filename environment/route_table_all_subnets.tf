resource "aws_route_table" "dual_stack_public_route_table" {
  vpc_id = aws_vpc.this.id

  # IPv4 outbound
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  # IPv6 outbound
  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.igw.id
  }

  tags = {
    Name    = "Dual Stack Public Route Table"
    Project = local.project_name
  }
}

# Dual Stack
resource "aws_route_table_association" "dual_stack_public_route_table_association_a" {
  subnet_id      = aws_subnet.dual_stack_public_a.id
  route_table_id = aws_route_table.dual_stack_public_route_table.id
}

resource "aws_route_table_association" "dual_stack_public_route_table_association_b" {
  subnet_id      = aws_subnet.dual_stack_public_b.id
  route_table_id = aws_route_table.dual_stack_public_route_table.id
}

resource "aws_route_table_association" "dual_stack_public_route_table_association_c" {
  subnet_id      = aws_subnet.dual_stack_public_c.id
  route_table_id = aws_route_table.dual_stack_public_route_table.id
}

# IPv4
resource "aws_route_table_association" "ipv4_only_public_route_table_association_a" {
  subnet_id      = aws_subnet.ipv4_public_a.id
  route_table_id = aws_route_table.dual_stack_public_route_table.id
}

resource "aws_route_table_association" "ipv4_only_public_route_table_association_b" {
  subnet_id      = aws_subnet.ipv4_public_b.id
  route_table_id = aws_route_table.dual_stack_public_route_table.id
}

resource "aws_route_table_association" "ipv4_only_public_route_table_association_c" {
  subnet_id      = aws_subnet.ipv4_public_c.id
  route_table_id = aws_route_table.dual_stack_public_route_table.id
}

# IPv6
resource "aws_route_table_association" "ipv6_only_public_route_table_association_a" {
  subnet_id      = aws_subnet.ipv6_public_a.id
  route_table_id = aws_route_table.dual_stack_public_route_table.id
}

resource "aws_route_table_association" "ipv6_only_public_route_table_association_b" {
  subnet_id      = aws_subnet.ipv6_public_b.id
  route_table_id = aws_route_table.dual_stack_public_route_table.id
}

resource "aws_route_table_association" "ipv6_only_public_route_table_association_c" {
  subnet_id      = aws_subnet.ipv6_public_c.id
  route_table_id = aws_route_table.dual_stack_public_route_table.id
}

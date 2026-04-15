# Dual Stack Subnets
# --------- Public ---------
resource "aws_network_acl_association" "dual_stack_public_a_network_acl_association" {
  subnet_id      = aws_subnet.dual_stack_public_a.id
  network_acl_id = aws_network_acl.main.id
}

resource "aws_network_acl_association" "dual_stack_public_b_network_acl_association" {
  subnet_id      = aws_subnet.dual_stack_public_b.id
  network_acl_id = aws_network_acl.main.id
}

resource "aws_network_acl_association" "dual_stack_public_c_network_acl_association" {
  subnet_id      = aws_subnet.dual_stack_public_c.id
  network_acl_id = aws_network_acl.main.id
}

# --------- Private ---------
resource "aws_network_acl_association" "dual_stack_private_a_network_acl_association" {
  subnet_id      = aws_subnet.dual_stack_private_a.id
  network_acl_id = aws_network_acl.main.id
}

resource "aws_network_acl_association" "dual_stack_private_b_network_acl_association" {
  subnet_id      = aws_subnet.dual_stack_private_b.id
  network_acl_id = aws_network_acl.main.id
}

resource "aws_network_acl_association" "dual_stack_private_c_network_acl_association" {
  subnet_id      = aws_subnet.dual_stack_private_c.id
  network_acl_id = aws_network_acl.main.id
}

# IPv4 Only Subnets
# --------- Public ---------
resource "aws_network_acl_association" "ipv4_public_a_network_acl_association" {
  subnet_id      = aws_subnet.ipv4_public_a.id
  network_acl_id = aws_network_acl.main.id
}

resource "aws_network_acl_association" "ipv4_public_b_network_acl_association" {
  subnet_id      = aws_subnet.ipv4_public_b.id
  network_acl_id = aws_network_acl.main.id
}

resource "aws_network_acl_association" "ipv4_public_c_network_acl_association" {
  subnet_id      = aws_subnet.ipv4_public_c.id
  network_acl_id = aws_network_acl.main.id
}

# --------- Private ---------
resource "aws_network_acl_association" "ipv4_private_a_network_acl_association" {
  subnet_id      = aws_subnet.ipv4_private_a.id
  network_acl_id = aws_network_acl.main.id
}

resource "aws_network_acl_association" "ipv4_private_b_network_acl_association" {
  subnet_id      = aws_subnet.ipv4_private_b.id
  network_acl_id = aws_network_acl.main.id
}

resource "aws_network_acl_association" "ipv4_private_c_network_acl_association" {
  subnet_id      = aws_subnet.ipv4_private_c.id
  network_acl_id = aws_network_acl.main.id
}

# IPv6 Only Subnets
# --------- Public ---------
resource "aws_network_acl_association" "ipv6_public_a_network_acl_association" {
  subnet_id      = aws_subnet.ipv6_public_a.id
  network_acl_id = aws_network_acl.main.id
}

resource "aws_network_acl_association" "ipv6_public_b_network_acl_association" {
  subnet_id      = aws_subnet.ipv6_public_b.id
  network_acl_id = aws_network_acl.main.id
}

resource "aws_network_acl_association" "ipv6_public_c_network_acl_association" {
  subnet_id      = aws_subnet.ipv6_public_c.id
  network_acl_id = aws_network_acl.main.id
}

# --------- Private ---------
resource "aws_network_acl_association" "ipv6_private_a_network_acl_association" {
  subnet_id      = aws_subnet.ipv6_private_a.id
  network_acl_id = aws_network_acl.main.id
}

resource "aws_network_acl_association" "ipv6_private_b_network_acl_association" {
  subnet_id      = aws_subnet.ipv6_private_b.id
  network_acl_id = aws_network_acl.main.id
}

resource "aws_network_acl_association" "ipv6_private_c_network_acl_association" {
  subnet_id      = aws_subnet.ipv6_private_c.id
  network_acl_id = aws_network_acl.main.id
}

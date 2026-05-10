resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.this.id
  tags = {
    Project = "${var.global.project_name}"
  }
}

# ACL Rules for IPv4
resource "aws_network_acl_rule" "acl_rule_ingress" {
  for_each = {
    "100" = "tcp"
    "110" = "udp"
  }

  network_acl_id = aws_network_acl.main.id
  rule_number    = each.key
  egress         = false
  protocol       = each.value
  cidr_block     = "0.0.0.0/0"
  rule_action    = "allow"
  from_port      = 0
  to_port        = 65535
}

resource "aws_network_acl_rule" "acl_rule_egress" {
  for_each = {
    "100" = "tcp"
    "110" = "udp"
  }

  network_acl_id = aws_network_acl.main.id
  rule_number    = each.key
  egress         = true
  protocol       = each.value
  cidr_block     = "0.0.0.0/0"
  rule_action    = "allow"
  from_port      = 0
  to_port        = 65535
}

# ACL Rules for IPv6
resource "aws_network_acl_rule" "acl_rule_ingress_v6" {
  for_each = {
    "200" = "tcp"
    "210" = "udp"
  }

  network_acl_id  = aws_network_acl.main.id
  rule_number     = each.key
  egress          = false
  protocol        = each.value
  ipv6_cidr_block = "::/0"
  rule_action     = "allow"
  from_port       = 0
  to_port         = 65535
}

resource "aws_network_acl_rule" "acl_rule_egress_v6" {
  for_each = {
    "200" = "tcp"
    "210" = "udp"
  }

  network_acl_id  = aws_network_acl.main.id
  rule_number     = each.key
  egress          = true
  protocol        = each.value
  ipv6_cidr_block = "::/0"
  rule_action     = "allow"
  from_port       = 0
  to_port         = 65535
}

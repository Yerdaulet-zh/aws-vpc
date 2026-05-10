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
    Project = var.global.project_name
  }
}

# Create consolidated Route Tables for zones with an active NAT GW
resource "aws_route_table" "private_nat" {
  for_each = local.active_nats
  vpc_id   = aws_vpc.this.id

  # IPv4 Egress (via NAT)
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main[each.key].id
  }

  # IPv6-to-IPv4 Egress (NAT64 via NAT)
  route {
    ipv6_cidr_block = "64:ff9b::/96"
    nat_gateway_id  = aws_nat_gateway.main[each.key].id
  }

  # Native IPv6 Egress (via EOIGW)
  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.this.id
  }

  tags = { Name = "${var.global.project_name}-rt-combined-${each.key}" }
}

resource "aws_route_table" "ipv6_fallback" {
  count  = local.use_nat ? 0 : 1
  vpc_id = aws_vpc.this.id

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.this.id
  }

  tags = { Name = "${var.global.project_name}-rt-fallback-ipv6" }
}

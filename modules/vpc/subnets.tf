resource "aws_subnet" "subnets" {
  for_each = var.subnets

  vpc_id            = aws_vpc.this.id
  availability_zone = "${var.global.region}${each.value.availability_zone}"
  ipv6_native       = each.value.ipv6_native
  cidr_block = each.value.cidrsubnet_ipv4.newbits != null ? cidrsubnet(
    aws_vpc.this.cidr_block, each.value.cidrsubnet_ipv4.newbits, each.value.cidrsubnet_ipv4.netnum
  ) : null

  ipv6_cidr_block = each.value.cidrsubnet_ipv6.newbits != null ? cidrsubnet(
    aws_vpc.this.ipv6_cidr_block, each.value.cidrsubnet_ipv6.newbits, each.value.cidrsubnet_ipv6.netnum
  ) : null

  map_public_ip_on_launch                        = each.value.map_public_ip_on_launch
  assign_ipv6_address_on_creation                = each.value.assign_ipv6_address_on_creation
  enable_resource_name_dns_aaaa_record_on_launch = each.value.enable_resource_name_dns_aaaa_record_on_launch
  enable_dns64                                   = each.value.enable_dns64

  tags = {
    Name                                                   = each.value.tags.Name
    Project                                                = var.global.project_name
    "kubernetes.io/role/elb"                               = each.value.tags.k8s_elb
    "kubernetes.io/cluster/${var.global.eks_cluster_name}" = each.value.tags.k8s_subnet
  }
}

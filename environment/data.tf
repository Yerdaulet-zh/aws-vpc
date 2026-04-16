data "aws_region" "current" {}

data "aws_vpc_ipam_pool" "dev_ipv4" {
  filter {
    name   = "description"
    values = ["dev ${data.aws_region.current.region} pool"]
  }
  filter {
    name   = "address-family"
    values = ["ipv4"]
  }
}

# data "aws_vpc_ipam_pool" "dev_ipv6" {
#   filter {
#     name   = "description"
#     values = ["dev ${data.aws_region.current.region} pool"]
#   }
#   filter {
#     name   = "address-family"
#     values = ["ipv6"]
#   }
# }

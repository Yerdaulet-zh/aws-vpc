variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "region" {
  type = string
}

variable "nat_gateway_config" {
  description = "Configuration for NAT Gateways across zones"
  type = map(object({
    enabled = bool
  }))
  default = {
    "a"    = { enabled = false }
    "b"    = { enabled = false }
    "c"    = { enabled = false }
    "a_ds" = { enabled = false }
    "b_ds" = { enabled = false }
    "c_ds" = { enabled = false }
  }
}

variable "private_subnet_config" {
  description = "Mapping of private subnet logical names to their NAT zones"
  type = map(object({
    zone = string
  }))
  default = {
    "ipv4_pvt_a" = { zone = "a" }
    "ipv4_pvt_b" = { zone = "b" }
    "ipv4_pvt_c" = { zone = "c" }
    "ipv6_pvt_a" = { zone = "a" }
    "ipv6_pvt_b" = { zone = "b" }
    "ipv6_pvt_c" = { zone = "c" }
    "dual_pvt_a" = { zone = "a" }
    "dual_pvt_b" = { zone = "b" }
    "dual_pvt_c" = { zone = "c" }
  }
}

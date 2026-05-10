variable "global" {
  type = object({
    environment      = string
    project_name     = string
    region           = string
    eks_cluster_name = string
  })
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

variable "vpc_config" {
  description = ""
  type = object({
    ipam_ipv4_id                         = string
    ipv4_netmask_length                  = number
    cidr_block                           = string
    assign_generated_ipv6_cidr_block     = bool
    instance_tenancy                     = string
    enable_dns_support                   = bool
    enable_network_address_usage_metrics = bool
    enable_dns_hostnames                 = bool
    tags = object({
      Owner     = string
      ManagedBy = string
    })
  })
  default = {
    ipam_ipv4_id                         = null,
    ipv4_netmask_length                  = null,
    cidr_block                           = "10.0.0.0/16",
    assign_generated_ipv6_cidr_block     = true
    instance_tenancy                     = "default"
    enable_dns_support                   = true
    enable_network_address_usage_metrics = false
    enable_dns_hostnames                 = true
    tags = {
      Owner     = "EKS-RDS"
      ManagedBy = "Terraform"
    }
  }
}

variable "subnets" {
  description = "All types of subnet configurations"
  type = map(object({
    availability_zone = string
    ipv6_native       = bool
    cidrsubnet_ipv4 = object({
      newbits = number
      netnum  = number
    })
    cidrsubnet_ipv6 = object({
      newbits = number
      netnum  = number
    })

    map_public_ip_on_launch                        = bool
    assign_ipv6_address_on_creation                = bool
    enable_resource_name_dns_aaaa_record_on_launch = bool
    enable_dns64                                   = bool

    tags = object({
      Name       = string
      k8s_elb    = string
      k8s_subnet = string
    })
  }))
  default = {
    "ipv4-pub-a" = {
      availability_zone = "a"
      cidrsubnet_ipv4 = {
        newbits = 4,
        netnum  = 0
      }
      cidrsubnet_ipv6 = {
        newbits = 4,
        netnum  = 0
      }
      ipv6_native                                    = false
      map_public_ip_on_launch                        = true
      assign_ipv6_address_on_creation                = true
      enable_resource_name_dns_aaaa_record_on_launch = true
      enable_dns64                                   = true
      tags = {
        Name       = "IPv4 Public Subnet A"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
  }
}

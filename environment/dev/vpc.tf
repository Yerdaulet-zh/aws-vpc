module "dev" {
  source = "../../modules/vpc"

  global = {
    region           = local.region
    environment      = local.environment
    project_name     = local.project_name
    eks_cluster_name = local.eks_cluster_name
  }
  vpc_config = {
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
  nat_gateway_config = {
    "a"    = { enabled = false }
    "b"    = { enabled = false }
    "c"    = { enabled = false }
    "a_ds" = { enabled = false }
    "b_ds" = { enabled = false }
    "c_ds" = { enabled = false }
  }
  private_subnet_config = {
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
  subnets = {
    # -------- Public IPv4 Subnets --------
    "ipv4_public_a" = {
      availability_zone = "a"
      cidrsubnet_ipv4 = {
        newbits = 4,
        netnum  = 0
      }
      cidrsubnet_ipv6 = {
        newbits = null
        netnum  = null
      }
      ipv6_native                                    = false
      map_public_ip_on_launch                        = true
      assign_ipv6_address_on_creation                = false
      enable_resource_name_dns_aaaa_record_on_launch = false
      enable_dns64                                   = false
      tags = {
        Name       = "IPv4 Public Subnet A"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    "ipv4_public_b" = {
      availability_zone = "b"
      cidrsubnet_ipv4 = {
        newbits = 4,
        netnum  = 1
      }
      cidrsubnet_ipv6 = {
        newbits = null
        netnum  = null
      }
      ipv6_native                                    = false
      map_public_ip_on_launch                        = true
      assign_ipv6_address_on_creation                = false
      enable_resource_name_dns_aaaa_record_on_launch = false
      enable_dns64                                   = false
      tags = {
        Name       = "IPv4 Public Subnet B"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    "ipv4_public_c" = {
      availability_zone = "c"
      cidrsubnet_ipv4 = {
        newbits = 4,
        netnum  = 2
      }
      cidrsubnet_ipv6 = {
        newbits = null
        netnum  = null
      }
      ipv6_native                                    = false
      map_public_ip_on_launch                        = true
      assign_ipv6_address_on_creation                = false
      enable_resource_name_dns_aaaa_record_on_launch = false
      enable_dns64                                   = false
      tags = {
        Name       = "IPv4 Public Subnet C"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    # -------- Private IPv4 Subnets --------
    "ipv4_private_a" = {
      availability_zone = "a"
      cidrsubnet_ipv4 = {
        newbits = 4,
        netnum  = 3
      }
      cidrsubnet_ipv6 = {
        newbits = null
        netnum  = null
      }
      ipv6_native                                    = false
      map_public_ip_on_launch                        = false
      assign_ipv6_address_on_creation                = false
      enable_resource_name_dns_aaaa_record_on_launch = false
      enable_dns64                                   = false
      tags = {
        Name       = "IPv4 Private Subnet A"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    "ipv4_private_b" = {
      availability_zone = "b"
      cidrsubnet_ipv4 = {
        newbits = 4,
        netnum  = 4
      }
      cidrsubnet_ipv6 = {
        newbits = null
        netnum  = null
      }
      ipv6_native                                    = false
      map_public_ip_on_launch                        = false
      assign_ipv6_address_on_creation                = false
      enable_resource_name_dns_aaaa_record_on_launch = false
      enable_dns64                                   = false
      tags = {
        Name       = "IPv4 Private Subnet B"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    "ipv4_private_c" = {
      availability_zone = "c"
      cidrsubnet_ipv4 = {
        newbits = 4,
        netnum  = 5
      }
      cidrsubnet_ipv6 = {
        newbits = null
        netnum  = null
      }
      ipv6_native                                    = false
      map_public_ip_on_launch                        = false
      assign_ipv6_address_on_creation                = false
      enable_resource_name_dns_aaaa_record_on_launch = false
      enable_dns64                                   = false
      tags = {
        Name       = "IPv4 Private Subnet C"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    # -------- Public IPv6 Subnets --------
    "ipv6_public_a" = {
      availability_zone = "a"
      cidrsubnet_ipv4 = {
        newbits = null
        netnum  = null
      }
      cidrsubnet_ipv6 = {
        newbits = 4,
        netnum  = 0
      }
      ipv6_native                                    = true
      map_public_ip_on_launch                        = false
      assign_ipv6_address_on_creation                = true
      enable_resource_name_dns_aaaa_record_on_launch = true
      enable_dns64                                   = true
      tags = {
        Name       = "IPv6 Public Subnet A"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    "ipv6_public_b" = {
      availability_zone = "b"
      cidrsubnet_ipv4 = {
        newbits = null
        netnum  = null
      }
      cidrsubnet_ipv6 = {
        newbits = 4,
        netnum  = 1
      }
      ipv6_native                                    = true
      map_public_ip_on_launch                        = false
      assign_ipv6_address_on_creation                = true
      enable_resource_name_dns_aaaa_record_on_launch = true
      enable_dns64                                   = true
      tags = {
        Name       = "IPv6 Public Subnet B"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    "ipv6_public_c" = {
      availability_zone = "c"
      cidrsubnet_ipv4 = {
        newbits = null
        netnum  = null
      }
      cidrsubnet_ipv6 = {
        newbits = 4,
        netnum  = 2
      }
      ipv6_native                                    = true
      map_public_ip_on_launch                        = false
      assign_ipv6_address_on_creation                = true
      enable_resource_name_dns_aaaa_record_on_launch = true
      enable_dns64                                   = true
      tags = {
        Name       = "IPv6 Public Subnet C"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    # -------- Private IPv6 Subnets --------
    "ipv6_private_a" = {
      availability_zone = "a"
      cidrsubnet_ipv4 = {
        newbits = null
        netnum  = null
      }
      cidrsubnet_ipv6 = {
        newbits = 4,
        netnum  = 3
      }
      ipv6_native                                    = true
      map_public_ip_on_launch                        = false
      assign_ipv6_address_on_creation                = true
      enable_resource_name_dns_aaaa_record_on_launch = true
      enable_dns64                                   = true
      tags = {
        Name       = "IPv6 Private Subnet A"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    "ipv6_private_b" = {
      availability_zone = "b"
      cidrsubnet_ipv4 = {
        newbits = null
        netnum  = null
      }
      cidrsubnet_ipv6 = {
        newbits = 4,
        netnum  = 4
      }
      ipv6_native                                    = true
      map_public_ip_on_launch                        = false
      assign_ipv6_address_on_creation                = true
      enable_resource_name_dns_aaaa_record_on_launch = true
      enable_dns64                                   = true
      tags = {
        Name       = "IPv6 Private Subnet B"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    "ipv6_private_c" = {
      availability_zone = "c"
      cidrsubnet_ipv4 = {
        newbits = null
        netnum  = null
      }
      cidrsubnet_ipv6 = {
        newbits = 4,
        netnum  = 5
      }
      ipv6_native                                    = true
      map_public_ip_on_launch                        = false
      assign_ipv6_address_on_creation                = true
      enable_resource_name_dns_aaaa_record_on_launch = true
      enable_dns64                                   = true
      tags = {
        Name       = "IPv6 Private Subnet C"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    # -------- Public Dual Stack Subnets --------
    "dual_stack_public_a" = {
      availability_zone = "a"
      cidrsubnet_ipv4 = {
        newbits = 4,
        netnum  = 6
      }
      cidrsubnet_ipv6 = {
        newbits = 4,
        netnum  = 6
      }
      ipv6_native                                    = false
      map_public_ip_on_launch                        = true
      assign_ipv6_address_on_creation                = true
      enable_resource_name_dns_aaaa_record_on_launch = true
      enable_dns64                                   = true
      tags = {
        Name       = "Dual Stack Public Subnet A"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    "dual_stack_public_b" = {
      availability_zone = "b"
      cidrsubnet_ipv4 = {
        newbits = 4,
        netnum  = 7
      }
      cidrsubnet_ipv6 = {
        newbits = 4,
        netnum  = 7
      }
      ipv6_native                                    = false
      map_public_ip_on_launch                        = true
      assign_ipv6_address_on_creation                = true
      enable_resource_name_dns_aaaa_record_on_launch = true
      enable_dns64                                   = true
      tags = {
        Name       = "Dual Stack Public Subnet B"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    "dual_stack_public_c" = {
      availability_zone = "c"
      cidrsubnet_ipv4 = {
        newbits = 4,
        netnum  = 8
      }
      cidrsubnet_ipv6 = {
        newbits = 4,
        netnum  = 8
      }
      ipv6_native                                    = false
      map_public_ip_on_launch                        = true
      assign_ipv6_address_on_creation                = true
      enable_resource_name_dns_aaaa_record_on_launch = true
      enable_dns64                                   = true
      tags = {
        Name       = "Dual Stack Public Subnet C"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    # -------- Private Dual Stack Subnets --------
    "dual_stack_private_a" = {
      availability_zone = "a"
      cidrsubnet_ipv4 = {
        newbits = 4,
        netnum  = 9
      }
      cidrsubnet_ipv6 = {
        newbits = 4,
        netnum  = 9
      }
      ipv6_native                                    = false
      map_public_ip_on_launch                        = false
      assign_ipv6_address_on_creation                = true
      enable_resource_name_dns_aaaa_record_on_launch = true
      enable_dns64                                   = true
      tags = {
        Name       = "Dual Stack Private Subnet A"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    "dual_stack_private_b" = {
      availability_zone = "b"
      cidrsubnet_ipv4 = {
        newbits = 4,
        netnum  = 10
      }
      cidrsubnet_ipv6 = {
        newbits = 4,
        netnum  = 10
      }
      ipv6_native                                    = false
      map_public_ip_on_launch                        = false
      assign_ipv6_address_on_creation                = true
      enable_resource_name_dns_aaaa_record_on_launch = true
      enable_dns64                                   = true
      tags = {
        Name       = "Dual Stack Private Subnet B"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
    "dual_stack_private_c" = {
      availability_zone = "c"
      cidrsubnet_ipv4 = {
        newbits = 4,
        netnum  = 11
      }
      cidrsubnet_ipv6 = {
        newbits = 4,
        netnum  = 11
      }
      ipv6_native                                    = false
      map_public_ip_on_launch                        = false
      assign_ipv6_address_on_creation                = true
      enable_resource_name_dns_aaaa_record_on_launch = true
      enable_dns64                                   = true
      tags = {
        Name       = "Dual Stack Private Subnet C"
        k8s_elb    = "1"
        k8s_subnet = "shared"
      }
    },
  }
}

terraform {
  backend "s3" {
    bucket       = "epam-terrform-state-bucket"
    key          = "vpc/dual-stack/terraform.tfstate"
    region       = "eu-central-1"
    encrypt      = true
    use_lockfile = true
    profile      = "895587011312_NetworkAdministrator"
  }
}

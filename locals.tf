locals {
  common_tags = {
    "aws.cloud/platform" = "Terraform_Platform"
    "aws.cloud/platform_env" = var.env
    "aws.cloud/managed_by" = "terraform"
    "aws.cloud/module" = "vpn_gateway"
  }
}

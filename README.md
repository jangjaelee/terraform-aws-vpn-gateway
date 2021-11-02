# AWS Site-to-Site VPN Gateway module

Terraform module which creates VPN Gateway resources on AWS.

These types of resources are supported:

* [AWS VPN Gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway)


## Usage
### Create Site-toSite VPN Gateway

main.tf
```hcl
module "vpg" {
  source = "git@github.com:jangjaelee/terraform-aws-vpn-gateway.git"

  vpg_name = var.vpg_name
  vpc_id   = var.vpc_id
  asn      = var.asn

  env = var.env
}
```

providers.tf
```hcl
provider "aws" {
  region = var.region
  allowed_account_ids = var.account_id
  profile = "eks_service"
}
```

terraform.tf
```hcl
terraform {
  required_version = ">= 0.15.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 3.43.0"
    }
  }

  backend "s3" {
    bucket = "kubesphere-terraform-state-backend"
    key = "kubesphere/vpn-gateway/terraform.tfstate"
    dynamodb_table = "kubesphere-terraform-state-locks"
    encrypt = true
    region = "ap-northeast-2"
    profile = "eks_service"
  }
}
```

variables.tf
```hcl
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-2"
}

variable "account_id" {
  description = "List of Allowed AWS account IDs"
  type        = list(string)
  default     = ["123456789012"]
}

variable "vpg_name" {
  description = "Name to be used on all the resources as identifier for VPN Gateway"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID to create in"
  type        = string
}

variable "asn" {
  description = "The Autonomous System Number (ASN) for the Amazon side of the gateway"
  type        = number
}

variable "env" {
  description = "Environment"
  type        = string
}
```

terraform.tfvars
```hcl
region     = "ap-northeast-2"
account_id = ["123456789012"]
vpg_name   = "kubesphere-office"
vpc_id     = "vpc-65f9730e"
asn        = "64512"
env        = "dev"
```

output.tf
```hcl
output "vpg_id" {
  value = module.vpg.vpg_id
}

output "vpg_arn" {
  value = module.vpg.vpg_arn
}

output "vpg_tags_all" {
  value = module.vpg.vpg_tags_all
}
```

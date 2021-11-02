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

output "vpg_id" {
  value = aws_vpn_gateway.this.id
}

output "vpg_arn" {
  value = aws_vpn_gateway.this.arn
}

output "vpg_tags_all" {
  value = aws_vpn_gateway.this.tags_all
}

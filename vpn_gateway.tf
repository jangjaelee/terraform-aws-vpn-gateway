resource "aws_vpn_gateway" "this" {
  vpc_id          = var.vpc_id
  amazon_side_asn = var.asn

  tags = merge(
    {
      "Name" = format("%s-vpg", var.vpg_name)
    },
    local.common_tags,
  )
}

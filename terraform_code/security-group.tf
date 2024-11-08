locals {

  webserver_ingress_rules = {
    allow_port_22 = {
      "source"    = "0.0.0.0/0",
      "from_port" = 22,
      "to_port"   = 22,
      "protocol"  = "tcp"
    },
    allow_port_8080 = {
      "source"    = "0.0.0.0/0",
      "from_port" = 8080,
      "to_port"   = 8080,
      "protocol"  = "tcp"
    }
  }

  general_egress_rules = {
    all_traffic_egress_rule = {
      "source"   = "0.0.0.0/0",
      "protocol" = "-1"
    }
  }

}
################
# Webserver SG #
################
resource "aws_security_group" "webserver_sg" {
  name   = local.webserver_sg_name
  vpc_id = module.alpha_vpc.vpc_id

  tags = merge({ Name = "${local.webserver_sg_name}" }, var.tags)
}

resource "aws_vpc_security_group_ingress_rule" "webserver_ingress" {
  for_each = local.webserver_ingress_rules

  security_group_id = aws_security_group.webserver_sg.id
  from_port         = each.value["from_port"]
  to_port           = each.value["to_port"]
  cidr_ipv4         = each.value["source"]
  ip_protocol       = each.value["protocol"]

  tags = merge({ Name = each.key }, var.tags)
}

resource "aws_vpc_security_group_egress_rule" "webserver_egress" {
  security_group_id = aws_security_group.webserver_sg.id
  for_each          = local.general_egress_rules

  cidr_ipv4   = each.value["source"]
  ip_protocol = each.value["protocol"]

  tags = merge({ Name = each.key }, var.tags)
}
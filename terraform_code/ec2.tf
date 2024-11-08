resource "aws_instance" "instance" {
  for_each = local.instances

  ami                         = each.value["ami"]
  vpc_security_group_ids      = each.value["vpc_security_group_ids"]
  instance_type               = each.value["instance_type"]
  subnet_id                   = each.value["subnet_id"]
  key_name                    = each.value["key_name"]
  user_data                   = try(each.value["user_data"], null)
  associate_public_ip_address = each.value["associate_public_ip_address"]
  iam_instance_profile        = try(each.value["iam_instance_profile"], null)

  tags = each.value["tags"]
}
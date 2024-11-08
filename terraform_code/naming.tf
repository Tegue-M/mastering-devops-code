locals {
  resource_prefix = "${var.project}-${var.environment}"

  ### VPC naming values ###
  vpc_name = "${local.resource_prefix}-vpc"

  ecr_admin_group_name  = "${local.resource_prefix}-ecr-admin-group"
  ecr_admin_permissions = "${local.resource_prefix}-ecr-admin-permissions"

  ### EC2 Naming Variables ###

  instances = {
    jenkins_master = {
        ami                         = var.webserver_ami
        vpc_security_group_ids      = [aws_security_group.webserver_sg.id]
        instance_type               = var.webserver_instance_type
        subnet_id                   = module.alpha_vpc.public_subnets[0]
        key_name                    = var.webserver_key_name
        #user_data                   = filebase64("${path.module}/scripts/userdata.sh")
        associate_public_ip_address = true
        #iam_instance_profile        = aws_iam_instance_profile.webserver_instance_profile.id

        tags = merge({ Name = "${local.resource_prefix}-jenkins-master" }, var.tags)
    },
      jenkins_build = {
        ami                         = var.webserver_ami
        vpc_security_group_ids      = [aws_security_group.webserver_sg.id]
        instance_type               = var.webserver_instance_type
        subnet_id                   = module.alpha_vpc.public_subnets[0]
        key_name                    = var.webserver_key_name
        #user_data                   = filebase64("${path.module}/scripts/userdata.sh")
        associate_public_ip_address = true
        #iam_instance_profile        = aws_iam_instance_profile.webserver_instance_profile.id

        tags = merge({ Name = "${local.resource_prefix}-jenkins-build-node" }, var.tags)
    },
      ansible = {
        ami                         = var.webserver_ami
        vpc_security_group_ids      = [aws_security_group.webserver_sg.id]
        instance_type               = var.webserver_instance_type
        subnet_id                   = module.alpha_vpc.public_subnets[0]
        key_name                    = var.webserver_key_name
        user_data                   = filebase64("${path.module}/scripts/ansible-userdata.sh")
        associate_public_ip_address = true
        #iam_instance_profile        = aws_iam_instance_profile.webserver_instance_profile.id

        tags = merge({ Name = "${local.resource_prefix}-ansible" }, var.tags)
    }
  }

  ### SG Naming values ###
  webserver_sg_name = "${local.resource_prefix}-webserver-sg"
  rds_sg_name       = "${local.resource_prefix}-rds-sg"
  alb_sg_name       = "${local.resource_prefix}-alb-sg"

}
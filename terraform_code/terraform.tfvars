##################################
##### General Naming Variables ###
##################################

region     = "eu-west-1"
account_id = "296274010522"

tags = {
  environment = "prod"
  project     = "devops-demo"
  source      = "terraform"
}

project     = "devops-demo"
environment = "prod"

############################
### VPC Naming Variables ###
############################

vpc_cidr           = "10.70.0.0/21"
availability_zones = ["eu-west-1a", "eu-west-1b"]

public_subnet_cidrs  = ["10.70.0.0/23", "10.70.2.0/23"]
private_subnet_cidrs = ["10.70.4.0/23", "10.70.6.0/23"]

############################
### EC2 Naming Variables ###
############################

webserver_ami                 = "ami-0d64bb532e0502c46"
webserver_instance_type       = "t3.micro"
webserver_key_name            = "nginx-server-keypair"
webserver_associate_public_ip = true



############################
### RDS Naming Variables ###
############################

rds_object = {
  allocated_storage           = 20
  engine                      = "mysql"
  engine_version              = "8.0.39"
  instance_class              = "db.t3.micro"
  username                    = "admin"
  manage_master_user_password = true
  parameter_group_name        = "default.mysql8.0"
  storage_encrypted           = true
  multi_az                    = false
  availability_zone           = "eu-west-1a"
  skip_final_snapshot         = true
}

############################
### KMS Naming Variables ###
############################

kms_key_name        = "alias/rds-encryption-key"
kms_key_description = "This KMS key is used to encrypt the RDS DB"
enable_key_rotation = true

############################
### IAM Naming Variables ###
############################

iam_group_membership_name   = "tf-testing-group-membership"
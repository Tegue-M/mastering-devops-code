module "alpha_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"
  name    = local.vpc_name

  cidr            = var.vpc_cidr
  azs             = var.availability_zones
  public_subnets  = var.public_subnet_cidrs
  private_subnets = var.private_subnet_cidrs

  public_subnet_suffix  = "pub"
  private_subnet_suffix = "pvt"

  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_flow_log      = true
  create_igw           = true

  create_flow_log_cloudwatch_iam_role             = true
  create_flow_log_cloudwatch_log_group            = true
  flow_log_cloudwatch_log_group_retention_in_days = 7
}
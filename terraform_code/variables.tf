##################################
##### General Naming Variables ###
##################################

variable "region" {
  type        = string
  description = "The AWS Region we will be deploying in"
}

variable "account_id" {
  type = string
}

variable "tags" {
  type        = map(any)
  description = "The tags that we will be allocating to our resources"
}

variable "project" {
  type        = string
  description = "Name of the project that will be running in the environment"
}

variable "environment" {
  type        = string
  description = "Environment we will be deploying in"
}


############################
### VPC Naming Variables ###
############################

variable "vpc_cidr" {
  type        = string
  description = "CIDR we will be assigning to our VPC"
}

variable "availability_zones" {
  type        = list(string)
  description = "AZs we will be deploying in"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR ranges we will be assigning to our public subnets"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR ranges we will be assigning to our private subnets"
}

############################
### EC2 Naming Variables ###
############################

variable "webserver_ami" {
  type        = string
  description = "AMI to be used for the webserver"
}

variable "webserver_instance_type" {
  type        = string
  description = "Instance type to be used for the webserver"
}

variable "webserver_key_name" {
  type        = string
  description = "SSH key to be used for the webserver"
}

variable "webserver_associate_public_ip" {
  type        = bool
  description = "Whether this instance will have a public IP assigned to it or not"
}

############################
### RDS Naming Variables ###
############################

variable "rds_object" {
  type = object({
    allocated_storage           = number
    engine                      = string
    engine_version              = string
    instance_class              = string
    username                    = string
    manage_master_user_password = bool
    parameter_group_name        = string
    storage_encrypted           = bool
    multi_az                    = bool
    availability_zone           = string
    skip_final_snapshot         = bool
  })
}

############################
### KMS Naming Variables ###
############################

variable "kms_key_name" {
  type        = string
  description = "Name to assign the KMS key alias"
}

variable "kms_key_description" {
  type        = string
  description = "Description to assign the KMS key"
}

variable "enable_key_rotation" {
  type        = bool
  description = "Enables/Disabled KMS key rotation"
}

############################
### IAM Naming Variables ###
############################

variable "iam_group_membership_name" {
  type = string
  description = "Name of the IAM group membership used"
}
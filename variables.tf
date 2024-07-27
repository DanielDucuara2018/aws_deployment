#Define AWS Region
variable "region" {
  description = "Infrastructure region"
  type        = string
  default     = "eu-west-3"
}

# Define IAM User Access Key
variable "access_key" {
  description = "The access_key that belongs to the IAM user"
  type        = string
  sensitive   = true
  default     = ""
}

# Define IAM User Secret Key
variable "secret_key" {
  description = "The secret_key that belongs to the IAM user"
  type        = string
  sensitive   = true
  default     = ""
}

# Define EC2 instance type
variable "instance_type" {
  description = "The instance type of the EC2 instances"
  default     = "t2.micro"
  type        = string
}

# Define SSH key name
variable "keypair_name" {
  description = "name of the keypair"
  default     = "aws-keypair-report-calculation-deploy"
  type        = string
}

# Define AMI id for EC2 instances
variable "ami_id" {
  description = "The id of Amazon Linux 2023 AMI"
  default     = "ami-0320905eab6995d03"
  type        = string
}

# ip range for main vpc
variable "vpc_ip_range" {
  description = "The cidr of the vpc"
  default     = "192.168.0.0/16"
  type        = string
}

variable "subnet_ip_range_public" {
  description = "cidr blocks for the public subnets"
  default     = "192.168.1.0/24"
  type        = string
}


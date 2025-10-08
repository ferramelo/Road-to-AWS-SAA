variable "aws_region" {
  description = "AWS region for deployment"
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet1_cidr" {
  description = "CIDR block for the first private subnet"
  default     = "10.0.2.0/24"
}

variable "private_subnet2_cidr" {
  description = "CIDR block for the second private subnet"
  default     = "10.0.3.0/24"
}

variable "bastion_ami" {
  description = "AMI ID for the Bastion Host"
  default     = "ami-0b104d881e3078545" # Ultima Ubuntu Jammy EU-Central-1
}

variable "bastion_instance_type" {
  description = "Instance type for Bastion Host"
  default     = "t3.micro"
}

variable "db_username" {
  description = "Username for RDS MySQL"
  default     = "admin"
}

variable "db_password" {
  description = "Password for RDS MySQL"
  default     = "ChangeMe123!"
}

variable "my_ip_cidr" {
  description = "Your public IP address (for SSH access to Bastion)"
  default     = "158.47.227.0/24"
}

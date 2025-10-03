variable "aws_region" {
  description = "Regione AWS"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR della VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR subnet pubblica"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR subnet privata"
  type        = string
  default     = "10.0.2.0/24"
}

variable "bastion_ami" {
  description = "AMI per il Bastion Host"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # esempio per Ubuntu 22.04 EU-Central
}

variable "bastion_instance_type" {
  description = "Tipo di istanza per Bastion Host"
  type        = string
  default     = "t3.micro"
}

variable "db_username" {
  description = "Username per RDS MySQL"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Password per RDS MySQL"
  type        = string
  default     = "ChangeMe123!"
}

variable "db_name" {
  description = "Nome del database"
  type        = string
  default     = "labdb"
}

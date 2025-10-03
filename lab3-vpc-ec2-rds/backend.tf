
terraform {
  backend "s3" {
    bucket         = "lab3-terraform-state"
    key            = "lab3-vpc-ec2-rds/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-lock"
  }
}

terraform {
  backend "s3" {
    bucket = "lab3-terraform-state211289420968"
    key    = "terraform.tfstate"
    region = "eu-central-1"
    use_lockfile = true
  }
}


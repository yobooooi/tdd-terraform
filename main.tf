
terraform {
  required_version = "~> 0.12"
}

provider "aws" {
  region  = var.region
  version = "~> 2.59"
  profile = "internal-dev"
}

provider "local" {
  version = "~> 1.4"
}

terraform {
  backend "s3" {
    bucket  = "testing-terraform-state"
    key     = "tdd-infra"
    region  = "eu-west-1"
    profile = "internal-dev"
  }
}
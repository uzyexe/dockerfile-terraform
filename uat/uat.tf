# Terraform verification

provider "aws" {}

resource "aws_vpc" "vpc" {
  cidr_block = "10.100.0.0/20"

  tags {
    Name        = "terraform-container-uat"
    application = "circleci"
    managed_by  = "terraform"
  }
}

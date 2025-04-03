terraform {
  backend "s3" {
    bucket       = "medicate-dev-terraform-state"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
  }
}

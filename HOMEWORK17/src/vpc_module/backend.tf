terraform {
  backend "s3" {
    bucket = "terraform-state-danit-devops-2"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}

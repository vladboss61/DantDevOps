variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "ami_id" {
  type    = string
  default = "ami-078701cc0905d44e4" # Amazon Linux 2 AMI for us-west-2
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "m_region" {
  type    = string
  default = "us-west-2"
}
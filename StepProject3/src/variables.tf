variable "amazon_ami" {
  default     = "ami-078701cc0905d44e4" # Amazon Linux AMI
  description = "Name of Amazone AMI"
}

variable "ssh_key_name" {
  description = "SSH key name"
}

variable "jenkins_master_instance_type" {
  default = "t2.micro"
}

variable "jenkins_worker_instance_type" {
  default = "t3.small"
}

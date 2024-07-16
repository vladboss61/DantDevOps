variable "vpc_id" {
  description = "The VPC ID where the resources will be created (Module)."
  type        = string
}

variable "list_of_open_ports" {
  description = "A list of ports to allow access from anywhere (Module)."
  type        = list(number)
}

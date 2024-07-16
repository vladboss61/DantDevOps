variable "vpc_id" {
  description = "The VPC ID."
  type        = string
}

variable "list_of_open_ports" {
  description = "A list of ports to allow access from anywhere."
  type        = list(number)
}

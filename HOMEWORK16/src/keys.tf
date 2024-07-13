resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh_key_pair" {
  key_name   = "m-aws-key-instances"
  public_key = tls_private_key.example.public_key_openssh
}
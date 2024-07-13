resource "aws_instance" "public" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.public_sg.name]
  key_name        = aws_key_pair.ssh_key_pair.key_name

  tags = {
    Name = "public-instance"
  }
}

resource "aws_instance" "private" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.private.id
  security_groups = [aws_security_group.private_sg.name]
  key_name        = aws_key_pair.ssh_key_pair.key_name

  tags = {
    Name = "private-instance"
  }
}
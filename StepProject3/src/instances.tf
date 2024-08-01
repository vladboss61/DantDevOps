resource "aws_security_group" "jenkins_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins_master" {
  ami           = var.amazon_ami
  subnet_id     = aws_subnet.public_subnet.id
  instance_type = var.jenkins_master_instance_type
  key_name      = var.ssh_key_name
  security_groups = [aws_security_group.jenkins_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              echo 'SSH key added'
              EOF

  tags = {
    Name = "JenkinsMaster"
  }
}

resource "aws_instance" "jenkins_worker" {
  ami           = "ami-0c55b159cbfafe1f0"
  subnet_id     = aws_subnet.private_subnet
  instance_type = var.jenkins_worker_instance_type
  key_name      = var.ssh_key_name
  security_groups = [aws_security_group.jenkins_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              echo 'SSH key added'
              EOF

  tags = {
    Name = "JenkinsWorker"
  }
}
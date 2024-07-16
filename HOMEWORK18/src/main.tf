provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2_instance" {
  count         = 2
  ami           = "ami-078701cc0905d44e4" # Amazon Linux 2 AMI for us-west-2
  instance_type = "t2.micro"

  tags = {
    Name = "Ansible-EC2-${count.index + 1}"
  }

  provisioner "local-exec" {
    command = <<EOT
    echo "[ec2_instance]" > inventory
    for ip in ${aws_instance.ec2_instance.*.public_ip}; do
      echo "$ip" >> inventory
    done
    EOT
  }
}

output "instance_ips" {
  value = aws_instance.ec2_instance.*.public_ip
}

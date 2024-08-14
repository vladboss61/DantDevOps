output "instance_ip" {
  value       = aws_instance.nginx.public_ip
  description = "The public IP of the EC2 instance"
}
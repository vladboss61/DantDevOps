output "public_instance_public_ip" {
  value = aws_instance.public.public_ip
}

output "private_instance_private_ip" {
  value = aws_instance.private.private_ip
}

output "private_key_pem" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}
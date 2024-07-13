# update your token from AWS profile or using aws cli `aws get-session token` and put to ~/.aws/credentials or using EXPORT ENV_VARIABLES

# Invoke terrform

terraform init
terraform apply

# See AWS console.

# Access instances
# path_to_private_key take from output

# terraform output -raw private_key_pem

# terraform output -raw public_instance_public_ip

# terraform output -raw private_instance_private_ip

# ssh -i path_to_private_key ec2-user@public_instance_public_ip
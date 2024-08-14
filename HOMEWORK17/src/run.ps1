# first run init
terraform init

# then we can terraform apply -var 'vpc_id=vpc-123' -var 'list_of_open_ports=[22,80,443]'
# or place as is `terraform apply` and type during execution of `terraform apply`
# or change ./variables file
terraform apply -var 'vpc_id=vpc-123' -var 'list_of_open_ports=[22,80,443]'
# First of all invoke next commands
terraform init
terraform apply --auto-approve

# Then invoke asbile to set up ec2
ansible-playbook -i inventory playbook.yml
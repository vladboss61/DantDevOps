# First invoke:
terraform init

# Then invoke:
terraform apply --auto-approve

# Set-up instance using Ansible
ansible-playbook -i "<Jenkins Master Public IP>," jenkins.ansible.yml -u ec2-user --private-key ...
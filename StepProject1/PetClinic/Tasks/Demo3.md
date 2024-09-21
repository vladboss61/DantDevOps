# DevOps Project Demo 3
## Deploying Spring PetClinic Sample Application on AWS cloud using Terraform

### Use source code from your Gitlab repo
### Use [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) for infrastructure deployment 



- Subtask I  - Create [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) scripts for AWS infrasrtucture:
   * Create AWS VPC.
   * Configure access and network groups.
   * Create 2 EC2 instances(use t3.micro types).
   * Provision 1st EC2 instance install MySQL and install all dependencies. (Or create [AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html) based on that ec2 instance, and use it as image.)
   * Istall all dependencies on 2nd EC2 instance. (Or create AMI based on that ec2 instance, and use it as image.)
   * Deploy jar application and run it on 2nd instance.

- Subtask II  - Gitlab
    * Setup Gitlab account/Gitlab.
    * Create a job that will be triggered on changes in master branch in gitlab repo. It should build your project and create jar package.
    * Create a 2nd Job and use your Terraform scripts for infrastructure deployment.
    * Create a step to check if the application is up and running(health check).

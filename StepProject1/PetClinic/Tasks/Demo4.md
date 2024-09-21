# DevOps Project Demo 4 K8S
## Deploying Spring PetClinic Sample Application on GKE K8S using Terraform

### Use source code from your Gitlab repo
### Visit the [Terraform Provision a GKE Cluster (Google Cloud)](https://learn.hashicorp.com/tutorials/terraform/gke?in=terraform/kubernetes&utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS) Learn tutorial to learn how to provision and interact with a GKE cluster.
### See the Using [GKE with Terraform](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/using_gke_with_terraform) guide for more information about using GKE with Terraform.


- Subtask I - Create [Terraform](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) scripts for GKE(more prefered)/AWS EKS infrasrtucture:

   * Create [GCP account](https://console.cloud.google.com/) / or AWS
   * Install kubectl + terraform + gcloud SDK
   * Deploy and access Kubernetes Dashboard 
   * Deploy mysql + application on GKE/AWS EKS using pods
   * Create service to access your application from external networks

<br>   
 
- Subtask II - Use Jenkins/Gitlab for running terraform for spawn GKE/EKS

    * Setup Gitlab account/Gitlab-CI or Jenkins.
    * Create a job that will be triggered on changes in master branch in gitlab repo. It should build your project and create jar package.
    * Create a 2nd Job and use your Terraform scripts for infrastructure deployment.
    * Create a step to check if the application is up and running(health check).

<br>

- Additional tasks

    * If you want you can use [Cloud SQL](https://cloud.google.com/sql) Instead pod
    * You could use K8S on-premise

<br>

- TIPS & TRICKS

    * [Cheap GKE](https://github.com/Neutrollized/free-tier-gke)

    * [module](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest)
 

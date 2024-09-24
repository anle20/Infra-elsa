# Infra-elsa

## Getting Started

```bash
cd script
./setup.sh # Install all dependencies
./deploy.sh # Deploy Jenkins and ingress

```

Now open the browser and enter http://localhost:8080

Optionally, you can also visit jenkins-elsa.example from your browser.

Add a line to the bottom of the /etc/hosts file on your computer (you will need administrator access):
```bash
127.0.0.1 jenkins-elsa.example
127.0.0.1 hackathon-elsa.example
$ minikube tunnel
```
Now open the browser and enter jenkins-elsa.example

## Using TF to create EKS cluster
- VPC module: terraform-aws-modules/vpc/aws
- EKS module: terraform-aws-modules/eks/aws

We can create a specific environment with tfvars file in tfsettings like dev.tfvars

To apply tf from local, we can use the below command
```bash
terraform init -backend-config="dev.tfvars"
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```

However, we should use CI/CD to update and deploy for best practice.
provider "aws" {
  region = var.region
}

# Create a VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.0"

  name = var.vpc_name
  cidr = var.vpc_cidr_block

  azs             = slice(data.aws_availability_zones.available.names, 0, var.number_of_azs)
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Name = var.vpc_name
  }
}

# Create an EKS Cluster
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "19.0.1"

  cluster_name    = var.eks_cluster_name
  cluster_version = "1.27"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  node_groups = {
    eks_nodes = {
      desired_capacity = var.desired_capacity
      max_capacity     = var.max_capacity
      min_capacity     = var.min_capacity

      instance_type = var.instance_type
      key_name      = var.key_name
    }
  }

  tags = {
    Name = var.eks_cluster_name
  }
}


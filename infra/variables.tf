variable "region" {
  description = "AWS Region"
}

variable "vpc_name" {
  description = "Name of the VPC"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "number_of_azs" {
  description = "Number of Availability Zones"
}

variable "public_subnets" {
  description = "Public subnets"
}

variable "private_subnets" {
  description = "Private subnets"
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
}

variable "max_capacity" {
  description = "Maximum number of worker nodes"
}

variable "min_capacity" {
  description = "Minimum number of worker nodes"
}

variable "instance_type" {
  description = "EC2 instance type for worker nodes"
}

variable "key_name" {
  description = "Name of the SSH key"
}

variable "environment" {
  description = "Environment type (dev, qa, uat, prod)"
}

# S3 Backend Configuration
variable "s3_bucket_name" {
  description = "S3 bucket name for storing Terraform state"
}

variable "s3_region" {
  description = "Region for the S3 bucket"
}

variable "dynamodb_table" {
  description = "DynamoDB table for state locking"
}

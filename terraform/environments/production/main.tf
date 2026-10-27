###----Module ECR

module "ecr" {
  source = "../../modules/ecr"

  repository_name = "k8s-eks-app-deployment"
}


###----Module VPC

module "vpc" {
  source = "../../modules/vpc"

  name = "k8s-eks-app-deployment"

  vpc_cidr = "10.0.0.0/16"

  availability_zones = [
    "ap-south-1a",
    "ap-south-1b"
  ]

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnet_cidrs = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}


###----Module IAM

module "iam" {
  source = "../../modules/iam"

  name                = "k8s-eks-app-deployment"
  eks_oidc_issuer_url = module.eks.oidc_issuer_url
}


###----Module EKS

module "eks" {
  source = "../../modules/eks"

  cluster_name = "k8s-eks-app-deployment"

  cluster_role_arn = module.iam.eks_cluster_role_arn

  node_role_arn = module.iam.eks_node_role_arn

  vpc_id = module.vpc.vpc_id

  private_subnet_ids = module.vpc.private_subnet_ids

  kubernetes_version = "1.33"

  node_instance_types = [
    "t3.micro"
  ]

  node_desired_size = 1

  node_min_size = 1

  node_max_size = 2
}


###----Module SECURITY

module "security" {
  source = "../../modules/security"

  name   = "k8s-eks-app-deployment"
  vpc_id = module.vpc.vpc_id
}


###----Module RDS

module "rds" {
  source = "../../modules/rds"

  identifier = "k8s-eks-app-deployment-db"

  database_name = "cloudops"

  engine = "postgres"

  engine_version = "17"

  instance_class = "db.t3.micro"

  username = "cloudopsadmin"

  password = var.db_password

  private_subnet_ids = module.vpc.private_subnet_ids

  security_group_ids = [
    module.security.rds_security_group_id
  ]
}



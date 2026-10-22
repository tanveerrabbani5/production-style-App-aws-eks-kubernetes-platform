module "ecr" {
  source = "../../modules/ecr"

  repository_name = "k8s-eks-app-deployment"
}

###----EKS OIDC PROVIDER

resource "aws_iam_openid_connect_provider" "eks" {
  url = var.eks_oidc_issuer_url

  client_id_list = [
    "sts.amazonaws.com"
  ]

  tags = {
    Name = "${var.name}-eks-oidc"
  }
}


###----LOAD BALANCER CONTROLLER IAM POLICY

resource "aws_iam_policy" "aws_load_balancer_controller" {
  name        = "${var.name}-aws-load-balancer-controller"
  description = "IAM permissions for AWS Load Balancer Controller"

  policy = file("${path.module}/aws-load-balancer-controller-policy.json")

  tags = {
    Name = "${var.name}-aws-load-balancer-controller"
  }
}


###----LOAD BALANCER CONTROLLER TRUST POLICY

data "aws_iam_policy_document" "aws_load_balancer_controller_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.eks_oidc_issuer_url, "https://", "")}:sub"

      values = [
        "system:serviceaccount:kube-system:aws-load-balancer-controller"
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.eks_oidc_issuer_url, "https://", "")}:aud"

      values = ["sts.amazonaws.com"]
    }
  }
}


###----LOAD BALANCER CONTROLLER IAM ROLE

resource "aws_iam_role" "aws_load_balancer_controller" {
  name               = "${var.name}-aws-load-balancer-controller"
  assume_role_policy = data.aws_iam_policy_document.aws_load_balancer_controller_assume_role.json

  tags = {
    Name = "${var.name}-aws-load-balancer-controller"
  }
}


###----ATTACH IAM POLICY

resource "aws_iam_role_policy_attachment" "aws_load_balancer_controller" {
  role       = aws_iam_role.aws_load_balancer_controller.name
  policy_arn = aws_iam_policy.aws_load_balancer_controller.arn
}

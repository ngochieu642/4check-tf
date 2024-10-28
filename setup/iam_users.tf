resource "aws_iam_user" "terraform_user" {
  name = var.iam_user_name
  force_destroy = true
}

# Attach Policies to the IAM User
resource "aws_iam_user_policy" "terraform_user_policy" {
  name = "${aws_iam_user.terraform_user.name}-policy"
  user = aws_iam_user.terraform_user.name

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          # Full Lambda permissions
          "lambda:*",
          # Full RDS permissions
          "rds:*",
          # Permissions to connect to RDS databases
          "rds-db:connect",
          # Required for Lambda execution roles
          "iam:PassRole",
          # Needed for VPC and network management
          "ec2:Describe*",
          "ec2:CreateVpc",
          "ec2:DeleteVpc",
          "ec2:CreateTags",
          "ec2:ModifyVpcAttribute",
          "ec2:CreateSecurityGroup",
          "ec2:DeleteSecurityGroup",
          "ec2:CreateSubnet",
          "ec2:CreateRouteTable",
          "ec2:AssociateRouteTable",
          "ec2:RevokeSecurityGroupEgress",
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:RevokeSecurityGroupIngress",
          "ec2:CreateNetworkAclEntry",
          "ec2:DeleteNetworkAclEntry",
          # Secrets Manager for RDS credentials
          "secretsmanager:GetSecretValue",
          "secretsmanager:ListSecrets",
          # Permissions for CloudWatch Logs (Lambda logging)
          "logs:*"
        ],
        "Resource": "*"
      }
    ]
  })
}

# Create Access Key and Secret for the IAM User
resource "aws_iam_access_key" "terraform_user_key" {
  user = aws_iam_user.terraform_user.name
}

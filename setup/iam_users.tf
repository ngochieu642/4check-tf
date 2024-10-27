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
          "lambda:*",                # Full Lambda permissions
          "rds:*",                   # Full RDS permissions
          "rds-db:connect",          # Permissions to connect to RDS databases
          "iam:PassRole",            # Required for Lambda execution roles
          "ec2:Describe*",           # Needed for VPC and network management
          "secretsmanager:GetSecretValue",  # If using Secrets Manager for RDS credentials
          "secretsmanager:ListSecrets",
          "logs:*"                   # Permissions for CloudWatch Logs (Lambda logging)
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

output "access_key_id" {
  value       = aws_iam_access_key.terraform_user_key.id
  description = "Access Key ID for the IAM user"
  sensitive   = true
}

output "secret_access_key" {
  value       = aws_iam_access_key.terraform_user_key.secret
  description = "Secret Access Key for the IAM user"
  sensitive   = true
}

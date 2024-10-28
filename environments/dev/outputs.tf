output "ApplicationSecurityGroupId" {
  value       = aws_security_group.application_sg.id
  description = "The ID of the application security group"
}

output "Subnet1Id" {
  value       = module.vpc.private_subnets[0]
  description = "The ID of the first private subnet"
}

output "Subnet2Id" {
  value       = module.vpc.private_subnets[1]
  description = "The ID of the second private subnet"
}

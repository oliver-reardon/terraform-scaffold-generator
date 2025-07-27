# Example outputs - customize based on your resources
output "region" {
  description = "AWS region"
  value       = var.region
}

output "environment" {
  description = "Environment name"
  value       = var.environment
}

output "project_name" {
  description = "Project name"
  value       = var.project_name
}

# Example: Output AWS account info
# output "aws_caller_identity" {
#   description = "AWS caller identity information"
#   value = {
#     account_id = data.aws_caller_identity.current.account_id
#     arn        = data.aws_caller_identity.current.arn
#     user_id    = data.aws_caller_identity.current.user_id
#   }
# }

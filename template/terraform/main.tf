# Main Terraform configuration
# Add your resources here

# Example: Data sources for common AWS resources
# data "aws_caller_identity" "current" {}
# data "aws_region" "current" {}
# data "aws_availability_zones" "available" {
#   state = "available"
# }

# Example: S3 bucket with common naming convention
# resource "aws_s3_bucket" "example" {
#   bucket = "${local.name_prefix}-example-bucket"
#   tags   = local.common_tags
# }

# Example: VPC
# resource "aws_vpc" "main" {
#   cidr_block           = "10.0.0.0/16"
#   enable_dns_hostnames = true
#   enable_dns_support   = true
#   
#   tags = merge(local.common_tags, {
#     Name = "${local.name_prefix}-vpc"
#   })
# }

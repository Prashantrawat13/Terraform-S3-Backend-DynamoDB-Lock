output "s3-bucket-name" {
  description = "The name of the S3 bucket used for Terraform state storage"
  value       = aws_s3_bucket.state_bucket-name.bucket
}


output "dynamodb-table-name" {
  description = "The name of the DynamoDB table used for state locking"
  value       = aws_dynamodb_table.dynamodb_table.name
}
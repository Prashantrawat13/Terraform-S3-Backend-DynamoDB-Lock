variable "region" {
  description = "Region for the resources"
  type        = string
}

variable "bucket-name" {
  description = "Name of the S3-bucket"
  type        = string
}

variable "s3-key" {
  description = "Path to the state file in the S3 bucket"
  type        = string
}

variable "dynamodb-table-name" {
  description = "Name of the DynamoDB table for state locking"
  type        = string
}

variable "dynamodb-region" {
  description = "Region for the DynamoDB table"
  type        = string
}
// We'll be creating the S3 bucket and S3 object for Terraform state storage

resource "aws_s3_bucket" "state_bucket-name" {
  bucket = var.bucket-name
  region = var.region

  tags = {
    Name = var.bucket-name
  }
}



resource "aws_s3_object" "state_file" {
  bucket = aws_s3_bucket.state_bucket-name.bucket # Reference to the S3 bucket created above
  key    = var.s3-key                             # Path to the state file in the S3 bucket

  depends_on = [aws_s3_bucket.state_bucket-name]
}


// We'll be creating the DynamoDB table for state locking

resource "aws_dynamodb_table" "dynamodb_table" {
  name         = var.dynamodb-table-name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  region       = var.dynamodb-region

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = var.dynamodb-table-name
  }

}

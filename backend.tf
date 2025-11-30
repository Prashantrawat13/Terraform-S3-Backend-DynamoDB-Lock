// Here we'll define the backend configuration for Terraform to use S3 and DynamoDB for state management



/*
terraform {
  backend "s3" {
    bucket         = "s3-backend-creation-13"
    key            = "State-File/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamodb-lockID"
    encrypt        = true
  }
}
*/


// Note: The backend configuration block is commented out because it needs to be defined
// before initializing the Terraform project. Uncomment and configure it as needed.
// Make sure to run `terraform init` after setting up the backend configuration.
# Terraform AWS Backend with S3 and DynamoDB (State Storage + Locking)


This project demonstrates how to set up a secure and scalable Terraform remote backend on AWS using:

Amazon S3 – to store the Terraform state file

Amazon DynamoDB – to manage Terraform state locking

An S3 object – stored inside the bucket as part of the project

This setup is ideal for collaborative Terraform environments and production-grade infrastructure deployments.

---


## Project Overview

The project provisions the following resources:

#### 1. S3 Bucket for Terraform State

A dedicated S3 bucket is created to safely store the terraform.tfstate file. This ensures that state is preserved remotely and can be accessed by your team or CI/CD systems.

#### 2. S3 Object

An object is uploaded into the S3 bucket as part of the project demonstration.
This helps verify bucket functionality and ensures proper configuration.


#### 3. DynamoDB Table for State Locking

A DynamoDB table is created and used by Terraform to prevent multiple users or processes from running Terraform at the same time.
This protects infrastructure from corruption caused by concurrent updates.

---




### Project Structure
    
    ├── main.tf             # S3 and DynamoDB creation.
    |
    ├── backend.tf          # backend configuration for S3 and DynamoDB
    |
    ├── provider.tf         # Provider and AWS configuration.
    |
    ├── variables.tf        # Variables for the reusability 
    |
    ├── terraform.tfvars    # Values for the Variables
    |
    ├── outputs.tf          # Output To be shown
    |
    └── README.md           # This File is the you are reading.


---

### Features

-> Secure remote Terraform state storage on S3

-> State locking and consistency with DynamoDB

-> Automatically created AWS resources

-> Easy to integrate with CI/CD pipelines

-> Follows recommended AWS best practices for Terraform backends

---


### Prerequisites

-> Before running this project, ensure you have:

    -> Terraform installed

    -> An active AWS account

    ->  Sufficient IAM permissions to create S3 and DynamoDB resources

---
---


## How to Use This Project

1. Initialize Terraform

You should Comment out your backend code at this point of time, mean before the creation of S3-Bucket and DynamoDB-table you should comment out the backend code in backend.tf file. 

After the creation of both resources you should uncomment it.

```bash
terraform init
```

2. Validate
```bash
terraform validate
```

3. Plan Infrastructure
```bash
terraform plan
```

4. Apply Infrastructure
```bash
terraform apply

# Type yes when asked for confirmation.
```

- When your infrastructure is created, Terraform will output the S3 bucket name and DynamoDB table name.

- Now that your S3 bucket and DynamoDB table are created. 

- You can uncomment the backend configuration in backend.tf file and re-initialize Terraform to start using the remote backend.

5. Re-initialize Terraform with the backend
```bash 
terraform init 
```
- This command will configure Terraform to use the S3 bucket and DynamoDB table for state storage and locking. 

6. Verify State Storage

        You can check the "terraform.tfstate" file, If it's empty then that means the state file is successfully migrated. 
        
        And you can also Do the same for when migrating it back to the Local.

***
***


### Outputs

After the project is applied, Terraform will display key information such as:

-> S3 bucket name

-> DynamoDB table name

-> ARNs or IDs (depending on your outputs)

---


## Cleanup

To destroy all resources created by Terraform we usually use this command :
```
terraform destroy
```
But in this the you can't directly delete these resources:

Reason:

- We have our state file in the S3 so we can't delete that and because of that the command will fail
  
**There are Two ways to delete the S3 Bucket.**

1. You can go to console and delete it manually.

2. Or you can Do this, Let's see how we can delete through Terraform.

Firstly we'll be migrating/transfering the State file to our local from the S3, and removing Dynamodb LockID Using this Command:

```
terraform init --migrate-state
```

Then it'll ask for Confirmation Type ``yes``

- **When the Migration is done simply comment out the ``backend.tf`` file using the Syntax ``/*`` and ``*/`` as it is done before.**

Now That the Backend.tf file is Commented out, and the State file is migrated to the Local we can destroy it:

```
terraform destroy --auto-approve
```

With this Your entire things'll be destroyed.

```
How to Check If the State file is migrated to S3 or Back to Local from S3:

You can just check the "terraform.tfstate" file and If it's empty then it is in you beckend i.e. S3 and 
if it's filled with state then the State file migrated to your Local.

```



***


### Notes

- This setup is ideal for production and collaborative work.

- Storing Terraform state remotely ensures consistency and reliability.

- DynamoDB prevents accidental parallel Terraform operations.

- For enhanced security, consider enabling:

  - S3 bucket versioning

  - Encryption

  - Bucket policies

  - IAM least-privilege access

***
***

## License

This project is open-source. You are free to use, modify, and distribute it.

***

## Contact

For questions or support regarding this project, feel free to reach out:

**Prashant Rawat**  
[LinkedIn Profile](https://www.linkedin.com/in/prashantrawat13/)
***
***

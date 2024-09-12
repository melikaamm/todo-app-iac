# MongoDB Atlas Terraform Setup

This Terraform configuration automates the provisioning of MongoDB Atlas resources.

## Prerequisites
1. Create a MongoDB Atlas account.
2. Set up an organization and project.
3. Generate an API key (organization or project level).

## Usage
1. Edit the `terraform.tfvars` file with your Atlas organization/project information and API key.
2. Run the following commands:
   ```bash
   terraform init
   terraform apply
   ```

This will provision your MongoDB Atlas resources based on the provided configuration.


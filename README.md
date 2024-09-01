# DevOps Project Infrastructure As Code 

This repository contains Terraform and Ansible playbooks for setting up the infrastructure required for the DevOps project. The infrastructure includes provisioning an EC2 instance on AWS, setting up a MongoDB instance on Atlas Cloud, and configuring essential tools like GitHub Runner, Docker, Docker Compose, and Node Exporter on the EC2 instances.

## Repository Structure
```
├── terraform/
│   ├── ec2-terraform
│   ├── atlas-terraform
|
└── ansible/
    ├──docker
    ├──nginx
    ├──githu-runner
```


## 1. Terraform Directory
The terraform/ directory contains the Terraform configurations necessary to provision the following resources:

EC2 Instance with Elastic IP: Creates an AWS EC2 instance with an associated Elastic IP for easy accessibility.
MongoDB Atlas: Provisions a MongoDB cluster on Atlas Cloud.
### Prerequisites
Terraform installed on your local machine.
AWS credentials configured in your environment.
MongoDB Atlas account with necessary API keys.

### Usage
#### 1. provisioning an EC2 instance:
1. Navigate to the terraform directory:
    ```bash
    cd terraform/ec2-terraform
    ```
2. Initialize Terraform:
    ```bash
    terraform init
    ```
3. Apply the Terraform configuration:
    ```bash
    terraform apply
    ```
    ** You need to provide you SSH public key path 

#### 2. provisioning a Mongodb atlas cloud cluster
1. Navigate to the terraform directory:
    ```bash
    cd terraform/ec2-terraform
    ```
2. Initialize Terraform:
    ```bash
    terraform init
    ```
3. Change variables inside the `terraform.tfvars` and also provide private and public access key of you Mongo atlas cloud.

4. Apply the Terraform configuration:
    ```bash
    terraform apply
    ```

## Ansible Directory
Inside this directory you can find ansible playbooks for: 
1. docker 
2. github-runner
3. nginx

To apply each playbook, you need to be in the root of the playbook, and change the address in the inventory file to your your server's.\
And also make changes in the variables in main and ansible.cfg files if needed.\
to apply the playbooks, simply run: 
```bash
ansible-playbook main.yml -b -K
```
Will ask sudo password of your server, if you have sudo without password just leave it empty and press Enter.  
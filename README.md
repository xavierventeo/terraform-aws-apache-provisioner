# Terraform AWS Apache Provisioner

Use Terraform provisioner after launch an EC2 instance to install Apache

Repository created for training purpose. The recomendation is to split responsabilities between infrastructure creation and software set up. 

In this case, use terraform to create infrastructure and some CI/CD pipeline to install software. For instance: Github Actions or Jenkins

## Terraform Infrastructure as Code (IaC) Repository

This repository contains Terraform code to provision and manage infrastructure on Amazon Web Services using Infrastructure as Code (IaC) principles.

### Prerequisites

Before you begin, ensure you have the following tools installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- An [AWS account](https://aws.amazon.com/free/?all-free-tier) and the [associated credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-creds.html) that allow you to create resources. These credentials must be configured for the AWS provider (see [Authentication and Configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration) section in AWS terraform provider documentation.)

### Usage

1. Clone this repository to your local machine:

```bash
git clone git@github.com:xavierventeo/terraform-aws-apache-provisioner.git
```

2. Navigate to the repository directory:

```bash
cd terraform-aws-apache-provisioner
```

3. Initialize Terraform:

```bash
terraform init
```

4. Configure terraform variables with your own values

```bash
cp terraform.tfvars.example terraform.tfvars
vi terraform.tfvars
```

5. Plan the infrastructure changes:

```bash
terraform plan
```

6. Apply the infrastructure changes to your AWS Account:

```bash
terraform apply
```

Confirm the action by typing 'yes' when prompted.

### Cleanup

To destroy the infrastructure provisioned by Terraform, run:

```bash
terraform destroy
```

Confirm the action by typing 'yes' when prompted.

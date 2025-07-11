# 🏗️ Three-Tier Architecture on AWS using Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.0%2B-purple?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazon-aws)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

A **production-ready**, **highly available**, and **scalable** three-tier architecture deployed on Amazon Web Services using Infrastructure as Code (Terraform). This project demonstrates modern cloud architecture best practices with automated provisioning, multi-AZ deployment, and comprehensive security configurations.

## 📋 Table of Contents

- [🏗️ Three-Tier Architecture on AWS using Terraform](#️-three-tier-architecture-on-aws-using-terraform)
  - [📋 Table of Contents](#-table-of-contents)
  - [🎯 Overview](#-overview)
  - [🏛️ Architecture](#️-architecture)
  - [✨ Key Features](#-key-features)
  - [🧱 AWS Components](#-aws-components)
  - [📂 Project Structure](#-project-structure)
  - [🔧 Prerequisites](#-prerequisites)
  - [🚀 Quick Start](#-quick-start)
  - [⚙️ Configuration](#️-configuration)
  - [🔐 Security Features](#-security-features)
  - [📊 Monitoring & Logging](#-monitoring--logging)
  - [💰 Cost Optimization](#-cost-optimization)
  - [🔄 CI/CD Integration](#-cicd-integration)
  - [🐛 Troubleshooting](#-troubleshooting)
  - [🧹 Cleanup](#-cleanup)
  - [📖 Additional Resources](#-additional-resources)
  - [🤝 Contributing](#-contributing)
  - [📄 License](#-license)
  - [👤 Author](#-author)

## 🎯 Overview

This project implements a **three-tier architecture** pattern on AWS, consisting of:

- **🌐 Web Tier**: Load-balanced EC2 instances serving static content
- **⚡ Application Tier**: Auto-scaled application servers in private subnets
- **🗄️ Database Tier**: RDS MySQL instance with Multi-AZ deployment

The architecture is designed for **high availability**, **fault tolerance**, and **horizontal scalability** across multiple Availability Zones.

## 🏛️ Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        Internet Gateway                         │
└─────────────────────────┬───────────────────────────────────────┘
                          │
┌─────────────────────────┴───────────────────────────────────────┐
│                    Application Load Balancer                    │
└─────────────────┬───────────────────────┬───────────────────────┘
                  │                       │
         ┌────────┴────────┐     ┌────────┴────────┐
         │   Public Subnet │     │   Public Subnet │
         │      (AZ-1)     │     │      (AZ-2)     │
         │   Web Tier EC2  │     │   Web Tier EC2  │
         └────────┬────────┘     └────────┬────────┘
                  │                       │
         ┌────────┴────────┐     ┌────────┴────────┐
         │  Private Subnet │     │  Private Subnet │
         │      (AZ-1)     │     │      (AZ-2)     │
         │   App Tier EC2  │     │   App Tier EC2  │
         └────────┬────────┘     └────────┬────────┘
                  │                       │
         ┌────────┴────────┐     ┌────────┴────────┐
         │  Private Subnet │     │  Private Subnet │
         │      (AZ-1)     │     │      (AZ-2)     │
         │   RDS Database  │     │   RDS Database  │
         │    (Primary)    │     │    (Standby)    │
         └─────────────────┘     └─────────────────┘
```

## ✨ Key Features

- ✅ **Infrastructure as Code** with Terraform
- 🌐 **Multi-AZ Deployment** for high availability
- 🔄 **Auto Scaling Groups** for dynamic scaling
- 🛡️ **Security Groups** with least privilege access
- 📊 **Application Load Balancer** with health checks
- 🗄️ **RDS MySQL** with automated backups
- 🚀 **CloudFront CDN** for global content delivery
- 🔑 **API Gateway** for RESTful endpoints
- 📦 **S3 Bucket** for static asset storage
- 🔒 **VPC** with public and private subnets
- 🌉 **NAT Gateways** for secure outbound internet access
- 📝 **User Data Scripts** for automated instance configuration

## 🧱 AWS Components

| Service | Purpose | Configuration |
|---------|---------|---------------|
| **VPC** | Network isolation | CIDR: 10.0.0.0/16 |
| **Subnets** | Network segmentation | 6 subnets across 2 AZs |
| **Internet Gateway** | Internet access | Attached to VPC |
| **NAT Gateway** | Outbound internet for private subnets | 2 NAT Gateways (Multi-AZ) |
| **EC2 Instances** | Compute resources | t3.micro instances |
| **Auto Scaling Groups** | Dynamic scaling | Min: 2, Max: 6 instances |
| **Application Load Balancer** | Traffic distribution | HTTP/HTTPS load balancing |
| **RDS MySQL** | Database service | db.t3.micro with Multi-AZ |
| **S3 Bucket** | Static asset storage | Versioning enabled |
| **CloudFront** | CDN service | Global edge locations |
| **API Gateway** | API management | Regional endpoints |
| **Security Groups** | Network security | Tier-based access control |

## 📂 Project Structure

```
three-tier-architecture/
├── main.tf              # Main Terraform configuration
├── variables.tf         # Input variables and default values
├── outputs.tf           # Output values for resources
├── provider.tf          # AWS provider configuration
├── user_data.sh         # EC2 bootstrap script
├── README.md           # Project documentation
└── .terraform/         # Terraform state and modules (auto-generated)
```

## 🔧 Prerequisites

Before deploying this infrastructure, ensure you have:

- **AWS Account** with appropriate permissions
- **AWS CLI** configured with credentials
- **Terraform** installed (version 1.0+)
- **Git** for version control

### AWS Permissions Required

Your AWS user/role should have permissions for:
- EC2 (instances, security groups, load balancers)
- VPC (subnets, route tables, internet gateways)
- RDS (database instances, subnet groups)
- S3 (bucket creation and management)
- CloudFront (distribution management)
- API Gateway (API creation and deployment)
- IAM (for service-linked roles)

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/three-tier-architecture-aws.git
cd three-tier-architecture-aws
```

### 2. Configure AWS Credentials

```bash
aws configure
# Enter your AWS Access Key ID, Secret Access Key, and Region
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Review and Customize Variables

Edit `variables.tf` to customize your deployment:

```hcl
variable "aws_region" {
  default = "us-east-1"  # Change to your preferred region
}

variable "project_name" {
  default = "my-three-tier-app"  # Customize project name
}

variable "environment" {
  default = "production"  # or "staging", "development"
}
```

### 5. Plan the Deployment

```bash
terraform plan
```

### 6. Deploy the Infrastructure

```bash
terraform apply
```

Type `yes` when prompted to confirm the deployment.

### 7. Access Your Application

After successful deployment, Terraform will output:

```bash
Outputs:

api_gateway_url = "https://xxxxxxxxxx.execute-api.us-east-1.amazonaws.com/production"
cloudfront_distribution_domain = "xxxxxxxxxx.cloudfront.net"
load_balancer_dns = "my-three-tier-app-alb-xxxxxxxxxx.us-east-1.elb.amazonaws.com"
```

## ⚙️ Configuration

### Environment-Specific Configurations

Create `.tfvars` files for different environments:

**production.tfvars**
```hcl
environment = "production"
aws_region = "us-east-1"
project_name = "my-app-prod"
```

**staging.tfvars**
```hcl
environment = "staging"
aws_region = "us-west-2"
project_name = "my-app-staging"
```

Deploy with specific configuration:
```bash
terraform apply -var-file="production.tfvars"
```

### Database Configuration

Modify database settings in `variables.tf`:

```hcl
variable "db_username" {
  description = "Database username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database password"
  type        = string
  default     = "SecurePass123!"
  sensitive   = true
}
```

## 🔐 Security Features

### Network Security
- **VPC Isolation**: Complete network isolation with custom VPC
- **Security Groups**: Tier-based access control with least privilege
- **Private Subnets**: Database and application tiers in private subnets
- **NAT Gateways**: Secure outbound internet access for private resources

### Data Security
- **RDS Encryption**: Database encryption at rest
- **S3 Encryption**: Server-side encryption for static assets
- **CloudFront HTTPS**: SSL/TLS encryption for content delivery

### Access Control
- **IAM Roles**: Service-specific IAM roles and policies
- **Security Groups**: Port-specific access control
- **VPC Endpoints**: Private connectivity to AWS services

## 📊 Monitoring & Logging

### CloudWatch Integration
- **EC2 Monitoring**: CPU, memory, and disk utilization
- **RDS Monitoring**: Database performance metrics
- **Load Balancer Monitoring**: Request count and response times

### Logging
- **VPC Flow Logs**: Network traffic logging
- **CloudTrail**: API call logging
- **Application Logs**: Custom application logging

## 💰 Cost Optimization

### Instance Sizing
- **t3.micro instances**: Cost-effective for development/testing
- **Auto Scaling**: Dynamic scaling based on demand
- **Reserved Instances**: Consider for production workloads

### Storage Optimization
- **S3 Lifecycle Policies**: Automatic data archiving
- **EBS GP2 Storage**: Cost-effective storage for databases
- **CloudFront Caching**: Reduced origin requests

## 🔄 CI/CD Integration

### GitHub Actions Example

```yaml
name: Deploy Infrastructure

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    
    - name: Setup Terraform
      uses: hashicorp/setup-terraform@v1
      with:
        terraform_version: 1.0.0
    
    - name: Terraform Init
      run: terraform init
    
    - name: Terraform Plan
      run: terraform plan
    
    - name: Terraform Apply
      run: terraform apply -auto-approve
```

## 🐛 Troubleshooting

### Common Issues

**1. CloudFront AccessDenied Errors**
```bash
# Solution: Contact AWS Support for account verification
# Alternative: Remove CloudFront resources temporarily
```

**2. RDS Connection Issues**
```bash
# Check security group rules
# Verify subnet group configuration
# Confirm database endpoint accessibility
```

**3. Auto Scaling Group Launch Failures**
```bash
# Review launch template configuration
# Check instance limits in AWS account
# Verify AMI availability in the region
```

### Debug Commands

```bash
# Check Terraform state
terraform show

# Validate configuration
terraform validate

# View specific resource
terraform state show aws_instance.web
```

## 🧹 Cleanup

To avoid ongoing charges, destroy the infrastructure when no longer needed:

```bash
# Preview destruction
terraform plan -destroy

# Destroy infrastructure
terraform destroy

# Confirm with 'yes' when prompted
```

**⚠️ Warning**: This action is irreversible and will delete all resources.

## 📖 Additional Resources

- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)
- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS VPC Best Practices](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-best-practices.html)
- [Auto Scaling Best Practices](https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-benefits.html)

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Ujjwal Nagrikar**

- 📧 Email: [ujjwalnagrikar@gmail.com](mailto:ujjwalnagrikar@gmail.com)
- 📱 Phone: +91 84463 62075
- 🔗 LinkedIn: [ujjwal-nagrikar](https://www.linkedin.com/in/ujjwal-nagrikar-2631aa273/)
- 🐙 GitHub: [@ujjwalnagrikar](https://github.com/ujjwalnagrikar)

---

⭐ **If you found this project helpful, please give it a star!**

*Built with ❤️ using Terraform and AWS*

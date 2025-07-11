Here's a professional `README.md` file for your **Three-Tier Architecture on AWS using Terraform** project:

---

# 🏗️ Three-Tier Architecture on AWS using Terraform

This project demonstrates the deployment of a **highly available** and **scalable** three-tier architecture on **Amazon Web Services (AWS)** using **Terraform**. The architecture includes a **web tier**, **application tier**, and **database tier**, with automated infrastructure provisioning and configuration using Terraform and `user_data.sh` scripts.

---

## 📌 Key Features

* ✅ **Infrastructure as Code (IaC)** using Terraform
* 🌐 **Highly available and scalable** deployment across multiple Availability Zones
* ⚙️ Automated provisioning of:

  * VPC with public and private subnets
  * Internet Gateway and NAT Gateways
  * Application Load Balancer (ALB)
  * Auto Scaling Groups (ASGs)
  * EC2 instances with user data scripts
  * RDS (MySQL) instance in private subnet
  * S3 Bucket + CloudFront CDN for static content
  * API Gateway for application layer
* 🔐 Security Groups to isolate each tier

---

## 🧱 AWS Components Involved

* **VPC** (Virtual Private Cloud)
* **Subnets** (Public & Private)
* **Internet Gateway (IGW)**
* **NAT Gateway**
* **EC2 Instances** (Amazon Linux / Ubuntu)
* **Auto Scaling Groups (ASG)**
* **Elastic Load Balancer (ALB)**
* **Amazon RDS (MySQL)**
* **Amazon S3**
* **CloudFront CDN**
* **API Gateway**
* **Security Groups**

---

## 📂 Project Structure

```
.
├── main.tf              # Main Terraform configuration for all resources
├── variables.tf         # Variables used across the configuration
├── provider.tf          # AWS provider and region configuration
├── output.tf            # Outputs like ALB DNS, API endpoints, etc.
├── user_data.sh         # Bootstrap script for EC2 web instances
└── README.md            # Project documentation
```

---

## 🚀 How to Deploy

> Ensure you have:
>
> * AWS account with IAM permissions
> * Terraform installed and configured

### 1️⃣ Initialize Terraform

```bash
terraform init
```

### 2️⃣ Review Plan

```bash
terraform plan
```

### 3️⃣ Apply Infrastructure

```bash
terraform apply
```

### 4️⃣ Access Outputs

After a successful apply, Terraform will display outputs like:

* ✅ Load Balancer URL
* ✅ API Gateway Endpoint
* ✅ CloudFront Distribution URL

---

## 💡 User Data Script

The `user_data.sh` file is executed on web tier EC2 instances to:

* Install and start the Apache HTTP Server
* Render dynamic instance metadata into the index page (instance ID, AZ)

---

## 📈 Auto Scaling & High Availability

* EC2 instances are launched across **multiple Availability Zones**
* ASGs adjust capacity based on demand
* NAT Gateways ensure private subnets have outbound internet access

---

## 🔐 Security

* Each tier is protected by its own **Security Group**
* Principle of **least privilege** followed between web, app, and DB layers

---

## 🌍 API Gateway

* Provides a RESTful endpoint (`/health`) to verify service status
* Integrated with the application logic for extensibility

---

## ⚠️ Notes

* CloudFront setup may require AWS account verification. If you receive `AccessDenied` errors, [contact AWS Support](https://console.aws.amazon.com/support/home#/).
* Ensure your credentials are set up with `aws configure` or via environment variables.

---

## 🧹 Cleanup

To destroy the infrastructure:

```bash
terraform destroy
```

---

## 👤 Author

**Ujjwal Nagrikar**
📧 [ujjwalnagrikar@mail.com](mailto:ujjwalnagrikar@mail.com)
📱 +91 84463 62075
🔗 [LinkedIn](https://www.linkedin.com/in/ujjwal-nagrikar-2631aa273/)

---


# Highly Available AWS Architecture with ALB, ASG, NAT Gateway & Bastion Host

## Overview
This project demonstrates a secure, highly available AWS architecture where EC2 instances
run in private subnets across two Availability Zones. Traffic is routed through an
Application Load Balancer, instances scale automatically using an Auto Scaling Group,
and administrative access is handled securely using a Bastion Host.

---

## Architecture
![Architecture Diagram]

<img width="254" height="208" alt="image" src="https://github.com/user-attachments/assets/e53ce840-4ea5-4568-98ad-55fe0c75b2e4" />



---

## AWS Services Used
- VPC
- EC2
- Auto Scaling Group
- Application Load Balancer
- NAT Gateway
- Internet Gateway
- Security Groups

---

## Architecture Details
- Custom VPC with CIDR `10.0.0.0/16`
- Two Availability Zones
- Public subnets:
  - Application Load Balancer
  - NAT Gateways
  - Bastion Host
- Private subnets:
  - EC2 instances managed by Auto Scaling Group
- No public IPs assigned to private EC2 instances
- Outbound internet access via NAT Gateway

---

## Traffic Flow
1. Client sends request to ALB in public subnet
2. ALB distributes traffic to EC2 instances in private subnets
3. Health checks ensure only healthy instances receive traffic
4. EC2 instances access the internet via NAT Gateway
5. SSH access to private EC2 is done via Bastion Host

---

## Security
- EC2 instances deployed in private subnets
- Bastion Host acts as a jump server
- SSH access restricted by security groups
- EC2 security group allows traffic only from ALB and Bastion Host

---

## Scaling & Availability
- Auto Scaling Group spans multiple AZs
- ALB performs health checks
- Unhealthy instances are automatically replaced

---

## Bastion Host
Administrative access to private EC2 instances is achieved using a Bastion Host.
Detailed steps are documented here:
[notes/bastion-host-access.md](notes/bastion-host-access.md)

---

## Failure Testing
The application was intentionally installed on only one EC2 instance to observe
Load Balancer behavior when a target is unhealthy. The ALB correctly removed
the unhealthy instance from rotation.

---

## Future Improvements
- Replace Bastion Host with AWS SSM Session Manager
- HTTPS using ACM
- CloudWatch alarms
- Infrastructure as Code using Terraform
- CI/CD pipeline for deployments

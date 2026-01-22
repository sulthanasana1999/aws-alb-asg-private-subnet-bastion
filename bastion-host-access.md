# Bastion Host Access

## Purpose
Private EC2 instances do not have public IP addresses and cannot be accessed directly.
A Bastion Host was used as a secure jump server.

---

## Bastion Host Setup
- Deployed in a public subnet
- Assigned a public IP
- SSH access restricted to my IP address

---

## Access Flow
Local Machine → Bastion Host → Private EC2 Instance

---

## Implementation Note
The Bastion Host and networking configuration were created using the AWS Management Console.

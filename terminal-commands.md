# Terminal Commands Used

Only minimal terminal commands were used for access and validation.

---

## Copy SSH Key to Bastion Host

powershell
=================================================
scp -i awslogin.pem awslogin.pem ubuntu@<BASTION_PUBLIC_IP>:/home/ubuntu/

SSH into Bastion Host
ssh -i awslogin.pem ubuntu@<BASTION_PUBLIC_IP>

SSH into Private EC2 from Bastion Host
ssh -i awslogin.pem ubuntu@<PRIVATE_EC2_IP>

Application Test on Private EC2
vim index.html
python3 -m http.server 8000

Purpose of These Commands
===============================================

Validate Bastion Host access

Confirm private subnet connectivity

Test Load Balancer behavior

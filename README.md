# terraform-on-aws-repo
Sample Terraform files to create S3 bucket in AWS

How to run
1. Create CMK
2. Change CMK ARN in code
3. Create an S3 and lake formation full access role
4. Create EC2 Instance
5. Apply the above role to EC2
6. Connect to instance

#Install git
#Perform a quick update on your instance:
sudo yum update -y;
#Install git in your EC2 instance
sudo yum install git -y;

#Install Terraform
sudo yum install -y yum-utils;
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo;
sudo yum -y install terraform;

git clone https://github.com/konradbaccenture/terraform-on-aws-repo.git;

cd terraform-on-aws-repo/s3/;

terraform init;
terraform plan;
terraform apply;


terraform destroy
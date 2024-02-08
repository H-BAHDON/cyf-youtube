# main.tf
provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "./modules/ec2"

  region              = "us-east-1"
  ami_id              = "ami-0a3c3a20c09d6f377"
  instance_type       = "t2.micro"
  key_name            = "cyfyoutube"
  security_group_ids  = ["sg-0b149967503a26d7d"]
  user_data_script    = <<-EOF
                        #!/bin/bash
                        echo "Hello from user data!" > /tmp/user_data_output.txt
                        EOF
}

module "rds" {
  source = "./modules/rds"

  region                  = "us-east-1"
  db_instance_identifier  = "cyf-youtube-database"
  engine_version          = "15.5"
  instance_class          = "db.t3.micro"
  db_name                 = "inital_db"
  master_username         = "postgres"
  master_password         = "1"
  allocated_storage       = 20
  storage_type            = "gp2"
  backup_retention_period = 0
  vpc_security_group_ids  = ["sg-08fa2514f948a5070"]
  storage_encryption      = true
  kms_key_id              = "aws/rds"
}


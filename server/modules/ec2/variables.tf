# modules/ec2/variables.tf

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for Amazon Linux"
  type        = string
  default     = "ami-0a3c3a20c09d6f377"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair for SSH access"
  type        = string
  default     = "cyfyoutube"
}

variable "security_group_ids" {
  description = "List of security group IDs for the EC2 instance"
  type        = list(string)
  default     = ["sg-0b149967503a26d7d"]
}

variable "user_data_script" {
  description = "User data script for the EC2 instance"
  type        = string
  default     = <<-EOF
                #!/bin/bash
                echo "Hello from user data!" > /tmp/user_data_output.txt
                EOF
}

# modules/ec2/main.tf

provider "aws" {
  region = var.region
}

resource "aws_instance" "ec2-instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "cyfyoutube"
  }

  vpc_security_group_ids = var.security_group_ids

  user_data = var.user_data_script
}
##############################################################

# EC2 load balancer
# We created an ALB
# defined a target group (aws_lb_target_group resource)  for ALB
# We attached the EC2 instance to the target group using the aws_lb_target_group_attachment resource.

##############################################################


resource "aws_lb" "cyfyoutube-load-balancer" {
  name               = "my-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_ids[0]]

  enable_deletion_protection = false

  subnets = ["subnet-061458610e0b30903", "subnet-0cd46245b3bbdb86f"]
}


# setting up an HTTP listener on port 80 for the specified AWS Load Balancer (referenced by load_balancer_arn)

resource "aws_lb_listener" "cyfyoutube-load-balancer" {
  load_balancer_arn = aws_lb.cyfyoutube-load-balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      status_code  = "200"
      message_body = "OK"
    }
  }
}

resource "aws_lb_target_group" "cyfyoutube-load-balancer" {
  name        = "my-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = "vpc-0c9ca3ff7c6276ab0"  

  health_check {
    path     = "/"
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group_attachment" "cyfyoutube-load-balancer" {
  target_group_arn = aws_lb_target_group.cyfyoutube-load-balancer.arn
  target_id        = aws_instance.ec2-instance.id
}

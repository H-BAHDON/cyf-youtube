# modules/ec2/outputs.tf

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2-instance.id
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2-instance.public_ip
}

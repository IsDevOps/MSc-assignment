output "subnet_ids" {
  description = "List of subnet IDs for the VPC"
  value       = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
}

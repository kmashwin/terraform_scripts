output "mum-instance-id" {
  description = "to output instance id of mum-instance"
  value       = aws_instance.mum-instance.id
}

output "mum-public-ip" {
  description = "Set the server based on the requirement"
  value       = aws_instance.mum-instance.public_ip
}

output "ohio-instance-id" {
  description = "to output instance id of ohio-instance"
  value       = aws_instance.ohio-instance.id
}

output "ohio-public-ip" {
  description = "Set the server based on the requirement"
  value       = aws_instance.ohio-instance.public_ip
}

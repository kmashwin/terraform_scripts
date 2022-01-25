output "controller_ip_addr" {
  value       = aws_instance.ansicontroller.public_ip
  description = "The public ip address of kebernetes master"
}

output "controller_instance_id" {
  value = aws_instance.ansicontroller.id
}

output "worker1_ip_addr" {
  value       = aws_instance.ansiworker1.public_ip
  description = "The public ip address of kebernetes master"
}

output "worker1_instance_id" {
  value = aws_instance.ansiworker1.id
}

output "worker2_ip_addr" {
  value       = aws_instance.ansiworker2.public_ip
  description = "The public ip address of kebernetes worker2"
}

output "worker2_instance_id" {
  value = aws_instance.ansiworker2.id
}


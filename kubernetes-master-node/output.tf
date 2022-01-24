output "master_ip_addr" {
  value       = aws_instance.kubemaster.public_ip
  description = "The public ip address of kebernetes master"
}

output "master_instance_id" {
  value = aws_instance.kubemaster.id
}

output "worker1_ip_addr" {
  value       = aws_instance.kubeworker1.public_ip
  description = "The public ip address of kebernetes master"
}

output "worker1_instance_id" {
  value = aws_instance.kubeworker1.id
}

output "worker2_ip_addr" {
  value       = aws_instance.kubeworker2.public_ip
  description = "The public ip address of kebernetes worker2"
}

output "worker2_instance_id" {
  value = aws_instance.kubeworker2.id
}


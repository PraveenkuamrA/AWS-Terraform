output "Instance_ID" {
    value = aws_instance.ec2-instance[*].id
}

output "Instane_Public_IP" {
    value = aws_instance.ec2-instance[*].public_ip
  
}

output "ssh_command" {
  value = [
    for instance in aws_instance.ec2-instance:
        "ssh -i key_name ec2-user@${instance.public_ip}"
  ]
}
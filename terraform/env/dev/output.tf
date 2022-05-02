output "rds_endpoint" {
  description = "rds_endpoint"
  value       = module.db.db_instance_endpoint
}

output "wordpress_image_id" {
  description = "created_ami_id"
  value       = data.aws_ami.wordpress_image.id
}

#output "aws_efs_file_system_id" {
#  value = aws_efs_file_system.node_efs_file_system.id
#}

output "node_alb_dns_name" {
  value = aws_lb.node_alb.dns_name
}

output "bastion_host_ip" {
  value = data.aws_instances.bastion_host_instances.public_ips
}

output "node_ip" {
  value = data.aws_instances.node_instances.private_ips
}

output "public_subnets" {
  value = module.app_vpc.public_subnets
}

output "private_subnets" {
  value = module.app_vpc.private_subnets
}

output "database_subnets" {
  value = module.app_vpc.database_subnets
}


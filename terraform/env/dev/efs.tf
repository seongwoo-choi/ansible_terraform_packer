#resource "aws_efs_file_system" "node_efs_file_system" {
#  creation_token   = "node_file_system"
#  performance_mode = "generalPurpose"
#  encrypted        = "true"
#
#  tags = {
#    Name = "node_file_system"
#  }
#}
#
#resource "aws_efs_mount_target" "node_efs_mount_target" {
#  file_system_id  = aws_efs_file_system.node_efs_file_system.id
#  subnet_id       = module.app_vpc.private_subnets[0]
#  security_groups = [aws_security_group.node_efs_sg.id]
#}
#
#resource "aws_efs_access_point" "node_efs_access_point" {
#  file_system_id = aws_efs_file_system.node_efs_file_system.id
#  root_directory {
#    path = "/var/www/html/wordpress"
#  }
#}
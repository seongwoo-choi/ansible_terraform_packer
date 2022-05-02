resource "aws_security_group" "bastion_sg" {
  name   = "bastion_security_group"
  vpc_id = module.app_vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [file("./my_ip.txt")]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion_security_group"
  }
}

resource "aws_security_group" "node_sg" {
  name   = "node_security_group"
  vpc_id = module.app_vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "node_security_group"
  }
}

resource "aws_security_group" "alb_sg" {
  name   = "alb_security_group"
  vpc_id = module.app_vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb_security_group"
  }
}

#resource "aws_security_group" "node_efs_sg" {
#  name   = "node_efs_security_group"
#  vpc_id = module.app_vpc.vpc_id
#
#  ingress {
#    from_port       = 2049
#    protocol        = "tcp"
#    to_port         = 2049
#    security_groups = [aws_security_group.node_sg.id]
#  }
#
#  egress {
#    from_port       = 0
#    protocol        = "-1"
#    to_port         = 0
#    security_groups = [aws_security_group.node_sg.id]
#  }
#
#  tags = {
#    Name = "node_efs_sg"
#  }
#}

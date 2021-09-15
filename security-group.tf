resource "aws_security_group" "access-ssh-dev" {
  name        = "access-ssh-dev"
  description = "Allow access-ssh traffic"
  
  ingress {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      prefix_list_ids  = null
      cidr_blocks      = var.cidr_access_remote
    }

  tags = {
    Name = "ssh_allow"
  }
}

resource "aws_security_group" "access-ssh-hom" {
  provider = aws.hom
  name        = "access-ssh-hom"
  description = "Allow access-ssh traffic"
  
  ingress {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      prefix_list_ids  = null
      cidr_blocks      = var.cidr_access_remote
    }

  tags = {
    Name = "ssh_allow"
  }
}

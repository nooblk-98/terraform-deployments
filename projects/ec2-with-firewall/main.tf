provider "aws" {
  region = var.aws_region
}

// Use default VPC
data "aws_vpc" "default" {
  default = true
}

// Use a default subnet in the default VPC and specified AZ
data "aws_subnet" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
  filter {
    name   = "default-for-az"
    values = ["true"]
  }
  filter {
    name   = "availability-zone"
    values = [var.aws_az]
  }
}

resource "aws_security_group" "application-firewall" {
  name        = var.firewall_name
  description = "Allow inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = var.firewall_name }
}

resource "aws_key_pair" "root_key" {
  key_name   = "root-key"
  public_key = var.ssh_public_key
}

resource "aws_instance" "ec2" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  subnet_id                   = data.aws_subnet.default.id
  vpc_security_group_ids      = [aws_security_group.application-firewall.id]
  key_name                    = aws_key_pair.root_key.key_name
  associate_public_ip_address = true

  tags = { Name = "ec2-with-vpc-firewall" }
}
resource "aws_eip" "ec2_eip" {
  instance = aws_instance.ec2.id
}



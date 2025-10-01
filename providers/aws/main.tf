provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "sample" {
  bucket = var.bucket_name
}

resource "aws_instance" "free_ec2" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  tags = {
    Name = "FreeTierEC2"
  }
}

# Uncomment resources below as needed:

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
#   tags = { Name = "main-vpc" }
# }

# resource "aws_subnet" "main" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-1a"
#   tags = { Name = "main-subnet" }
# }

# resource "aws_security_group" "allow_ssh" {
#   name        = "allow_ssh"
#   description = "Allow SSH inbound traffic"
#   vpc_id      = aws_vpc.main.id
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = { Name = "allow_ssh" }
# }

# resource "aws_db_instance" "default" {
#   allocated_storage    = 20
#   engine               = "mysql"
#   engine_version       = "8.0"
#   instance_class       = "db.t3.micro"
#   name                 = "mydb"
#   username             = "foo"
#   password             = "barbazqux"
#   parameter_group_name = "default.mysql8.0"
#   skip_final_snapshot  = true
# }

# resource "aws_iam_user" "example" {
#   name = "example-user"
# }

# resource "aws_lambda_function" "example" {
#   function_name = "example_lambda"
#   handler       = "index.handler"
#   runtime       = "nodejs14.x"
#   role          = aws_iam_role.lambda_exec.arn
#   filename      = "lambda.zip"
# }

# resource "aws_elb" "example" {
#   name               = "example-elb"
#   availability_zones = ["us-east-1a"]
#   listener {
#     instance_port     = 80
#     instance_protocol = "http"
#     lb_port           = 80
#     lb_protocol       = "http"
#   }
# }

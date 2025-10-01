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

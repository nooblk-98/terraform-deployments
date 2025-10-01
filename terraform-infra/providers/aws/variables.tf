variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "bucket_name" {
  type = string
}

variable "ami_id" {
  description = "AMI ID for Amazon Linux 2 (free tier eligible)"
  type        = string
  default     = "ami-0c02fb55956c7d316" # Amazon Linux 2, us-east-1
}

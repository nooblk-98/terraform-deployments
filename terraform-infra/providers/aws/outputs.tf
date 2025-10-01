output "bucket_id" {
  value = aws_s3_bucket.sample.id
}

output "ec2_public_ip" {
  value = aws_instance.free_ec2.public_ip
}

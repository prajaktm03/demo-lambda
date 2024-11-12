resource "aws_s3_bucket" "lambda_deployment_bucket" {
  bucket = var.bucket_name
  #region = "us-east-1"
}

# Define the ACL separately
#resource "aws_s3_bucket_acl" "lambda_deployment_bucket_acl" {
#  bucket = aws_s3_bucket.lambda_deployment_bucket.id
#  acl    = "private"
#}

output "bucket_name" {
  value = aws_s3_bucket.lambda_deployment_bucket.bucket
}



provider "aws" {
  region = "us-east-1"
}

# Create an S3 bucket to store the Lambda function code
resource "aws_s3_bucket" "lambda_deployment_bucket" {
  bucket = "demo-lambda-deployment-bucket-nov"
}

resource "aws_ecr_repository" "lambda_deployment_repo" {
  name = "lambda-deployment-repo"
}

# IAM role for Lambda execution with basic permissions
resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

# Attach a basic execution policy to the role
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Lambda function deployment
resource "aws_lambda_function" "demo_lambda" {
  function_name = "demo_lambda_function"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"

  # S3 bucket and key for Lambda function code
  s3_bucket = aws_s3_bucket.lambda_deployment_bucket.bucket
  s3_key    = "demo_lambda_function.zip" # Ensure this file is uploaded to S3 before deployment

  # Environment variables (optional)
  environment {
    variables = {
      ENV = "prod"
    }
  }
}

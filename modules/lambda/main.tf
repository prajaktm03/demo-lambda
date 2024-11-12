resource "aws_lambda_function" "my_lambda_function" {
  function_name = var.function_name
  s3_bucket     = var.s3_bucket
  s3_key        = var.s3_key
  handler       = "demo_lambda_function.lambda_handler"
  runtime       = "python3.8"
  role          = var.iam_role_arn

  environment {
    variables = var.environment_variables
  }
}

output "lambda_function_name" {
  value = aws_lambda_function.my_lambda_function.function_name
}


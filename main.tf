provider "aws" {
  region = "us-east-1"
}

# S3 module
module "s3" {
  source      = "./modules/s3"
  bucket_name = "my-lambda-deployment-bucket-prajakt"
}

# IAM module
module "iam" {
  source    = "./modules/iam"
  role_name = "lambda_execution_role"
}

# Lambda module
module "lambda" {
  source        = "./modules/lambda"
  function_name = "myLambdaFunction"
  s3_bucket     = module.s3.bucket_name
  s3_key        = "demo_lambda_function.zip" # Specify the S3 key for the Lambda code
  iam_role_arn  = module.iam.lambda_role_arn
  environment_variables = {
    VAR1 = "value1"
    VAR2 = "value2"
  }
}


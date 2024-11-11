# Use a Python runtime as a base image
#FROM public.ecr.aws/lambda/python:3.8

# Copy the function code into the container
#COPY App/demo_lambda_function.py ${LAMBDA_TASK_ROOT}

# Set the CMD to your handler (filename.function_name)
#CMD ["demo_lambda_function.lambda_handler"]



# Use the AWS Lambda Python 3.8 runtime as the base image
FROM public.ecr.aws/lambda/python:3.8

# Copy the function code into the container
COPY demo_lambda_function.py ${LAMBDA_TASK_ROOT}

# Set the CMD to your handler (filename.function_name)
CMD ["demo_lambda_function.lambda_handler"]

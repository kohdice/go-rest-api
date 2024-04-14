variable "environment" {
  description = "Environment to deploy to"
  type        = string
}

variable "aws_region" {
  description = "AWS region to use"
  type        = string
}

variable "aws_partition" {
  description = "AWS partition to use (e.g., aws or aws-us-gov)"
  type        = string
}

variable "lambda_archive" {
  description = "Name of the Lambda handler"
  type        = string
}

variable "lambda_binary" {
  description = "Path to the Lambda handler binary"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.44.0"
    }
  }

  required_version = "= 1.7.5"
}

provider "aws" {
  access_key = "foo"
  secret_key = "bar"
  region     = "us-east-1"

  default_tags {
    tags = {
      Environment = "development"
      CreatedBy   = "terraform"
      Repository  = "kohdice/go-rest-api"
    }
  }
}

module "go-rest-api" {
  source = "../modules"

  environment               = "dev"
  aws_region                = "us-east-1"
  aws_partition             = "aws"
  lambda_archive            = "lambda.zip"
  lambda_binary             = "cmd/lambda/bootstrap"
  lambda_function_name      = "go-rest-api"
  api_gateway_resource_path = "lambda"
}

output "api_id" {
  value       = module.go-rest-api.api_id
  description = "The ID of API Gateway"
}

output "invoke_url" {
  description = "The URL to invoke the REST API"
  value       = module.go-rest-api.invoke_url
}

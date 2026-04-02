terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_lambda_function" "developer_lambda" {
  function_name = var.lambda_function_name
  role          = var.lambda_role_arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime

  s3_bucket         = var.lambda_artifact_s3_bucket
  s3_key            = var.lambda_artifact_s3_key
  s3_object_version = var.lambda_artifact_s3_object_version

  publish = true
}

output "lambda_artifact_metadata" {
  description = "Artifact metadata applied to this Lambda deployment."
  value = {
    s3_bucket         = var.lambda_artifact_s3_bucket
    s3_key            = var.lambda_artifact_s3_key
    s3_object_version = var.lambda_artifact_s3_object_version
  }
}

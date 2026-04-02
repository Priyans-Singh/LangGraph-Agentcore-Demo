variable "aws_region" {
  description = "AWS region where Lambda is deployed."
  type        = string
}

variable "lambda_function_name" {
  description = "Lambda function name."
  type        = string
}

variable "lambda_role_arn" {
  description = "IAM role ARN used by the Lambda function."
  type        = string
}

variable "lambda_handler" {
  description = "Lambda handler entrypoint."
  type        = string
  default     = "handler.lambda_handler"
}

variable "lambda_runtime" {
  description = "Lambda runtime for the packaged artifact."
  type        = string
  default     = "python3.12"
}

variable "lambda_artifact_s3_bucket" {
  description = "S3 bucket containing Lambda zip artifact uploaded by CI."
  type        = string
}

variable "lambda_artifact_s3_key" {
  description = "S3 object key for Lambda zip artifact uploaded by CI."
  type        = string
}

variable "lambda_artifact_s3_object_version" {
  description = "S3 object version for immutable Lambda deployment from CI artifact."
  type        = string
}

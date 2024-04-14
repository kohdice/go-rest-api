output "api_id" {
  value       = aws_api_gateway_rest_api.api.id
  description = "The ID of API Gateway"
}

output "invoke_url" {
  description = "The URL to invoke the REST API"
  value       = aws_api_gateway_stage.stage.invoke_url
}

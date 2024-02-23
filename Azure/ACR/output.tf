output "acr_token_passwords" {
  value       = jsondecode(module.acr.acr_token_passwords)
  sensitive   = true
  description = "ACR token passwords"
}

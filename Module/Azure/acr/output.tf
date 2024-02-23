output "acr_token_passwords" {
  value       = jsonencode({
    for token_key, token_password in azurerm_container_registry_token_password.acr_token_password :
    azurerm_container_registry_scope_map.acr_scope_map[token_key].name => {
      password1 = token_password.password1[0].value,
      password2 = token_password.password2[0].value
    }
  })
  sensitive   = true
  description = "ACR token passwords"
}

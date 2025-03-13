output "app_name" {
    value = azurerm_linux_web_app.webapp.name
}

output "app_url" {
    value = "Go to https://webapp-${random_pet.name.id}.azurewebsites.net/ to view the application"
}
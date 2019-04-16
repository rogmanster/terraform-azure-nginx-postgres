#Nginx

output "nginx_app_url" {
  value = "http://${azurerm_public_ip.tf-guide-pip.fqdn}"
}

output "nginx_public_ip" {
  value = "${azurerm_public_ip.tf-guide-pip.ip_address}"
}

output "nginx_private_ip" {
  description = "private IP address of the vault-demo server"
  value       = "${azurerm_network_interface.tf-guide-nic.private_ip_address}"
}



#Postgres

output "postgres_server_name" {
  description = "The name of the PostgreSQL server"
  value       = "${azurerm_postgresql_server.server.name}"
}

output "postgres_fqdn" {
  description = "The fully qualified domain name (FQDN) of the PostgreSQL server"
  value       = "${azurerm_postgresql_server.server.fqdn}"
}

output "postgres_administrator_login" {
  value = "${var.administrator_login}"
}

output "postgres_administrator_password" {
  value     = "${var.administrator_password}"
  sensitive = true
}

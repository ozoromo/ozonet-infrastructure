output "prod_secure_1_ip" {
  description = "Public IPv4 of the prod-secure-1 instance."
  value       = scaleway_instance_ip.prod_secure_1.address
}

output "prod_secure_1_id" {
  description = "Server ID of the PLAY2-PICO instance."
  value       = scaleway_instance_server.prod_secure_1.id
}

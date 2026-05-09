output "play2_pico_ip" {
  description = "Public IPv4 of the PLAY2-PICO instance."
  value       = scaleway_instance_ip.play2_pico.address
}

output "play2_pico_id" {
  description = "Server ID of the PLAY2-PICO instance."
  value       = scaleway_instance_server.play2_pico.id
}

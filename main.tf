resource "scaleway_instance_ip" "prod_secure_1" {
  type = "routed_ipv4"
}

resource "scaleway_instance_server" "prod_secure_1" {
  name   = "prod-secure-1"
  type   = "PLAY2-PICO"
  image  = "debian_bookworm"
  ip_ids = [scaleway_instance_ip.prod_secure_1.id]
}

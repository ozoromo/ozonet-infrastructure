resource "scaleway_instance_ip" "play2_pico" {
  type = "routed_ipv4"
}

resource "scaleway_instance_server" "play2_pico" {
  name   = "play2-pico"
  type   = "PLAY2-PICO"
  image  = "debian_bookworm"
  ip_ids = [scaleway_instance_ip.play2_pico.id]
}

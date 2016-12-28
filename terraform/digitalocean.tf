variable "do_token" {}
variable "ssh_key_id" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "web" {
  image = "docker-16-04"
  name = "docker-1"
  region = "nyc2"
  size = "4gb"
  ssh_keys = ["${var.ssh_key_id}"]
}
variable "do_token" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "web" {
  image = "docker-16-04"
  name = "docker-1"
  region = "nyc2"
  size = "512mb"
}
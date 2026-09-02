terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Mengunduh image Nginx (simulasi sistem operasi server)
resource "docker_image" "nginx_server" {
  name         = "nginx:latest"
  keep_locally = false
}

# ... (blok provider dan docker_image biarkan sama) ...

resource "docker_container" "web_server" {
  image = docker_image.nginx_server.image_id
  name  = "server-terraform-variabel"
  ports {
    internal = 80
    external = 8082
  }
}

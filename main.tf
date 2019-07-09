provider "kubernetes" {}

resource "kubernetes_config_map" "test-config-map" {
  metadata {
    name = "test-config-map"
    namespace = "terraform-controller"
  }

  data = {
    hostname = "cattle.io"
  }
}

output "hostname" {
    value = "${kubernetes_config_map.test-config-map.data.hostname}"
}
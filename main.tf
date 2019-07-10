variable "test_config_map" {}
variable "test_secret" {}
variable host {
  default = "https://localhost:6443"
}
provider "kubernetes" {
  host                   = "${var.host}"
  token                  = "${file("/var/run/secrets/kubernetes.io/serviceaccount/token")}"
  cluster_ca_certificate = "${file("/var/run/secrets/kubernetes.io/serviceaccount/ca.crt")}"
}

resource "kubernetes_config_map" "test-config-map" {
  metadata {
    name      = "test-config-map"
    namespace = "terraform-controller"
  }

  data = {
    test_config_map = "${var.test_config_map}"
    test_secret     = "${var.test_secret}"
  }
}

output "test_config_map" {
  value = "${kubernetes_config_map.test-config-map.data.test_config_map}"
}
output "test_secret" {
  value = "${kubernetes_config_map.test-config-map.data.test_secret}"
}
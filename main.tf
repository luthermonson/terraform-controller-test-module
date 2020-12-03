variable "test_config_map" {}
variable "test_config_map_env" {
  default = "terraform-controller"
}
variable "test_secret" {}
terraform {
  required_providers {
    kubernetes = "1.11.3"
  }
}

provider "kubernetes" {
  load_config_file = "false"
}
resource "kubernetes_config_map" "test-config-map" {
  metadata {
    name      = "test-config-map"
    namespace = var.test_config_map_env
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

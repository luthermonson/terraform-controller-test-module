variable "test_config_map" {}
variable "test_secret" {}

output "test_config_map" {
  value = "${var.test_config_map}"
}
output "test_secret" {
  value = "${var.test_secret}"
}
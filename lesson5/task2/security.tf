resource "yandex_vpc_security_group" "vm" {
  name       = "${var.vpc_name}-vm"
  network_id = module.vpc_dev.subnet.network_id

  ingress {
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = var.access_cidrs
  }

  ingress {
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = var.access_cidrs
  }

  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
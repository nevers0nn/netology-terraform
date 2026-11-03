resource "yandex_vpc_network" "develop" {
  name = var.env_name
}

resource "yandex_vpc_subnet" "develop" {
  name           = "${var.env_name}-${var.zone}"
  zone           = var.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.cidr
  route_table_id = yandex_vpc_route_table.egress.id
}
resource "yandex_vpc_gateway" "egress" {
  name = "${var.env_name}-egress"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "egress" {
  name       = "${var.env_name}-egress"
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.egress.id
  }
}
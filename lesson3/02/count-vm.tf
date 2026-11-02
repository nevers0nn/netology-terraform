resource "yandex_compute_instance" "platform" {
  depends_on = [
    yandex_compute_instance.db
  ]
  count = 2


  name        = "netology-develop-platform-web-${count.index + 1}"
  hostname    = "netology-develop-platform-web-${count.index + 1}"
  platform_id = "standard-v3"
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = local.ubuntu_image_id
      size = 6
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }


  metadata = local.common_metadata
}
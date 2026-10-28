resource "yandex_compute_instance" "platform" {
  depends_on = [
    yandex_compute_instance.db
  ]
  count = var.web_vm_specs.instance_count


  name        = "netology-develop-platform-web-${count.index + 1}"
  hostname    = "netology-develop-platform-web-${count.index + 1}"
  platform_id = var.web_vm_specs.platform_id
  resources {
    cores         = var.web_vm_specs.cpu
    memory        = var.web_vm_specs.ram
    core_fraction = var.web_vm_specs.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = local.ubuntu_image_id
      size     = var.web_vm_specs.disk_volume
      type     = var.web_vm_specs.type_disk
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }


  metadata = local.common_metadata
}
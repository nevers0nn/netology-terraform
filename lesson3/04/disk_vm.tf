resource "yandex_compute_disk" "storage_disk" {
  count = var.storage_disk_specs.disk_count

  name = "storage_disk-${count.index + 1}"
  zone = var.default_zone
  size = var.storage_disk_specs.disk_volume
  type = var.storage_disk_specs.type_disk

  folder_id = var.folder_id
}

resource "yandex_compute_instance" "storage_vm" {
  name                      = var.storage_vm_specs.vm_name
  zone                      = var.default_zone
  platform_id               = var.storage_vm_specs.platform_id
  allow_stopping_for_update = true

  resources {
    cores         = var.storage_vm_specs.cpu
    memory        = var.storage_vm_specs.ram
    core_fraction = var.storage_vm_specs.core_fraction
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = local.ubuntu_image_id
      size     = var.storage_vm_specs.disk_volume
      type     = var.storage_vm_specs.type_disk
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat                = true
  }
  metadata = local.common_metadata

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk
    content {
      disk_id = secondary_disk.value.id
      mode    = "READ_WRITE"
    }
  }
}

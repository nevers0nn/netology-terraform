resource "yandex_compute_instance" "db" {
  for_each = { for vm in var.db_vm_specs : vm.vm_name => vm }
  name = each.key
  zone = var.default_zone
  platform_id = each.value.platform_id

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
    core_fraction = each.value.core_fraction
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = local.ubuntu_image_id
      size     = each.value.disk_volume
      type     = each.value.type_disk
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat                = true
  }

  metadata = local.common_metadata
}
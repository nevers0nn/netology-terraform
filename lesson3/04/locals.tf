locals {
  common_metadata = {
    serial-port-enable = var.vms_metadata.serial_port_enable
    ssh-keys           = "${var.vms_metadata.ssh_user}:${file("~/.ssh/id_rsa.pub")}"
  }
  ubuntu_image_id = data.yandex_compute_image.ubuntu.image_id
}
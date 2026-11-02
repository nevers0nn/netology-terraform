locals {
  ssh_public_key = trimspace(file(pathexpand(var.ssh_public_key_path)))

  common_metadata = {
    serial-port-enable = var.vms_metadata.serial_port_enable
    user-data          = data.template_file.cloudinit.rendered
  }
}

locals {
  vm_web_full_name = "${var.vm_web_name}-${var.default_zone}"
  vm_db_full_name  = "${var.vm_db_name}-${var.default_zone_db}"
  common_metadata = {
    serial-port-enable = tostring(var.vms_metadata["common"].serial_port_enable)
    ssh-keys           = "${var.vms_metadata["common"].ssh_user}:${var.vms_ssh_public_root_key}"
  }
}
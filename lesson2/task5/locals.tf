locals {
  vm_web_full_name = "${var.vm_web_name}-${var.default_zone}"
  vm_db_full_name  = "${var.vm_db_name}-${var.default_zone_db}"
}

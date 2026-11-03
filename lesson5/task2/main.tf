module "vpc_dev" {
  source = "./vpc"
  env_name = var.vpc_name
  zone = var.default_zone
  cidr = var.default_cidr
}

module "marketing_vm" {
  source = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"

  env_name               = var.vpc_name
  instance_name          = var.vm_web_name
  instance_count         = 1
  network_id             = module.vpc_dev.subnet.network_id
  subnet_zones           = [module.vpc_dev.subnet.zone]
  subnet_ids             = [module.vpc_dev.subnet.id]
  image_family           = var.vm_resources.image_family
  instance_cores         = var.vm_resources.cores
  instance_memory        = var.vm_resources.memory
  instance_core_fraction = var.vm_resources.core_fraction
  boot_disk_size         = var.vm_resources.disk_size
  public_ip              = true
  preemptible            = true
  labels                 = { project = "marketing" }
  metadata               = local.common_metadata
}

module "analytics_vm" {
  source = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"

  env_name               = var.vpc_name
  instance_name          = var.vm_db_name
  instance_count         = 1
  network_id             = module.vpc_dev.subnet.network_id
  subnet_zones           = [module.vpc_dev.subnet.zone]
  subnet_ids             = [module.vpc_dev.subnet.id]
  image_family           = var.vm_resources.image_family
  instance_cores         = var.vm_resources.cores
  instance_memory        = var.vm_resources.memory
  instance_core_fraction = var.vm_resources.core_fraction
  boot_disk_size         = var.vm_resources.disk_size
  public_ip              = true
  preemptible            = true
  labels                 = { project = "analytics" }
  metadata               = local.common_metadata
}

data "template_file" "cloudinit" {
  template = file("${path.module}/cloud-init.yml")
  vars = {
    ssh_public_key = jsonencode(local.ssh_public_key)
    ssh_user       = var.vms_metadata.ssh_user
  }
}

locals {
  web_hosts = [
    for i in yandex_compute_instance.platform : {
      name = i.name
      ip   = i.network_interface[0].nat_ip_address
      fqdn = i.fqdn
    }
  ]

  db_hosts = [
    for i in yandex_compute_instance.db : {
      name = i.name
      ip   = i.network_interface[0].nat_ip_address
      fqdn = i.fqdn
    }
  ]

  storage_hosts = [
    for i in [yandex_compute_instance.storage_vm] : {
      name = i.name
      ip   = i.network_interface[0].nat_ip_address
      fqdn = i.fqdn
    }
  ]
}
resource "local_file" "ansible_inventory" {
  filename = "inventory.ini"

  content = templatefile("${path.module}/ansible-inventory.tpl", {
    webservers = local.web_hosts
    databases  = local.db_hosts
    storage    = local.storage_hosts
  })
}
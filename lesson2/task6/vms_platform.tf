variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "name VM"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "platform_id"
}

# variable "vm_web_resources" {
#   type        = map
#   default = {
#     cpu = 2
#     memory = 1
#     core_fraction = 20
#   }
# }

variable "default_zone_db" {
  type        = string
  default     = "ru-central1-e"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "name VM"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "platform_id"
}

# variable "vm_db_resources" {
#   type        = map
#   default = {
#     cpu = 2
#     memory = 2
#     core_fraction = 20
#   }
# }

variable "vms_resources" {
  description = "Map of resource configurations (cores, memory, disk) for all VMs"
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    disk_size     = number
    disk_type     = string
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
      disk_size     = 10
      disk_type     = "network-hdd"
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      disk_size     = 10
      disk_type     = "network-ssd"
    }
  }
}

variable "vms_metadata" {
  description = "Common metadata for all VMs"

  type = map(object({
    serial_port_enable = number
    ssh_user           = string
  }))

  default = {
    common = {
      serial_port_enable = 1
      ssh_user           = "ubuntu"
    }
  }
}

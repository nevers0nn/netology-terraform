###cloud vars
# variable "token" {
#   type        = string
#   description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
# }

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vms_metadata" {
  description = "Common metadata for all VMs"

  type = object({
    serial_port_enable = number
    ssh_user           = string
  })

  default = {
    serial_port_enable = 1
    ssh_user           = "ubuntu"
  }
}

variable "db_vm_specs" {
  description = "Configuration specifications for database VMs (main/replica)."
  type = list(object({
    vm_name       = string
    cpu           = number
    ram           = number
    disk_volume   = number
    core_fraction = number
    platform_id   = string
    type_disk     = string
  }))
  default = [
    {
      vm_name       = "main"
      cpu           = 4
      ram           = 4
      disk_volume   = 5
      core_fraction = 20
      platform_id   = "standard-v3"
      type_disk     = "network-hdd"
    },
    {
      vm_name       = "replica"
      cpu           = 2
      ram           = 2
      disk_volume   = 7
      core_fraction = 20
      platform_id   = "standard-v3"
      type_disk     = "network-hdd"
    }
  ]
}
variable "web_vm_specs" {
  description = "Configuration specifications for web VMs."
  type = object({
    instance_count = number
    cpu            = number
    ram            = number
    disk_volume    = number
    core_fraction  = number
    platform_id    = string
    type_disk      = string
  })
  default = {
    instance_count = 2
    cpu            = 2
    ram            = 2
    disk_volume    = 6
    core_fraction  = 20
    platform_id    = "standard-v3"
    type_disk      = "network-hdd"
  }
}

variable "storage_disk_specs" {
  description = "Configuration specifications for additional storage disks."
  type = object({
    disk_count  = number
    disk_volume = number
    type_disk   = string
  })
  default = {
    disk_count  = 3
    disk_volume = 1
    type_disk   = "network-hdd"
  }
}

variable "storage_vm_specs" {
  description = "Configuration specifications for storage VM."
  type = object({
    vm_name       = string
    cpu           = number
    ram           = number
    disk_volume   = number
    core_fraction = number
    platform_id   = string
    type_disk     = string
  })
  default = {
    vm_name       = "storage"
    cpu           = 2
    ram           = 2
    disk_volume   = 10
    core_fraction = 20
    platform_id   = "standard-v3"
    type_disk     = "network-hdd"
  }
}

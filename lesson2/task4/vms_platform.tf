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

variable "vm_web_resources" {
  type = map(any)
  default = {
    cpu           = 2
    memory        = 1
    core_fraction = 20
  }
}

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

variable "vm_db_resources" {
  type = map(any)
  default = {
    cpu           = 2
    memory        = 2
    core_fraction = 20
  }
}

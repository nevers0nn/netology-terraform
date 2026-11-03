variable "ip_address" {
  type = string
  default = "192.168.0.1"
  description = "ip-адрес"
  validation {
    condition = can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$",
      var.ip_address))
    error_message = "Invalid ip"
  }
}

variable "list_of_ip_addresses" {
  type        = list(string)
  description = "список ip-адресов"
  default = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]
  validation {
    condition     = alltrue([
      for ip in var.list_of_ip_addresses : can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", ip))
    ])
    error_message = "Список содержит некорректные IP-адреса"
  }
}
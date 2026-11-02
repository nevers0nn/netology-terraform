variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "service_account_key_file" {
  type    = string
  default = "~/authorized_key.json"
}

variable "default_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "default_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "vpc_name" {
  type    = string
  default = "develop"
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "vm_web_name" {
  type    = string
  default = "marketing"
}

variable "vm_db_name" {
  type    = string
  default = "analytics"
}

variable "vm_resources" {
  type = object({
    image_family  = string
    cores         = number
    memory        = number
    core_fraction = number
    disk_size     = number
  })
  default = {
    image_family  = "ubuntu-2204-lts"
    cores         = 2
    memory        = 2
    core_fraction = 20
    disk_size     = 10
  }
}

variable "vms_metadata" {
  type = object({
    serial_port_enable = number
    ssh_user           = string
  })
  default = {
    serial_port_enable = 1
    ssh_user           = "ubuntu"
  }
}

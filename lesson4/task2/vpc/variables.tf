variable "env_name" {
  type = string
  description = "network name"
}

variable "zone" {
  type = string
}

variable "cidr" {
  type    = list(string)
}
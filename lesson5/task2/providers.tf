terraform {
  required_version = "> 1.12.0"

  backend "s3" {

    shared_credentials_files = ["~/.aws/credentials"]
    profile                  = "default"
    region                   = "ru-central1"

    bucket  = "terraform-data-adanilin"
    key     = "dev/terraform.tfstate"
    encrypt = false
    use_lockfile = true

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true

    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
  }

  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}



provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.default_zone
  service_account_key_file = pathexpand(var.service_account_key_file)
}

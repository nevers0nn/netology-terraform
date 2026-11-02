output "virtual_machines" {
  value = {
    marketing = {
      external_ip = module.marketing_vm.external_ip_address
      labels      = module.marketing_vm.labels
    }
    analytics = {
      external_ip = module.analytics_vm.external_ip_address
      labels      = module.analytics_vm.labels
    }
  }
}

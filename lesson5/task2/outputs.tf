output "virtual_machines" {
  value = {
    marketing = {
      internal_ip = module.marketing_vm.internal_ip_address
      labels      = module.marketing_vm.labels
    }
    analytics = {
      internal_ip = module.analytics_vm.internal_ip_address
      labels      = module.analytics_vm.labels
    }
  }
}

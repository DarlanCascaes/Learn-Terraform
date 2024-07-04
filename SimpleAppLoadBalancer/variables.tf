variable "rg_name" {
  type = string
  default = "rg_sb_eastus_40287_1_171076047662"
  description = "Resource Group Name"
}

variable "region" {
  type = string
  default = "East US"
  description = "Application Region"
}

variable "vm_properties"{
  description = "Virtual machines properties"
  type = map(any)
  default = {
    vmcasclabtest01 = {
      name = "vmcasclabtest01"
      size = "standard_B2ms"
      admin_username = "dcascaes"
      admin_password = "Dcascaes666"
      os_disk_name = "stcasclab001"
      storage_type = "Standard_LRS"
    },
    vmcasclabtest02 = {
      name = "vmcasclabtest02"
      size = "standard_B2ms"
      admin_username = "dcascaes"
      admin_password = "Dcascaes666"
      os_disk_name = "stcasclab002"
      storage_type = "Standard_LRS"
    }
  }
}
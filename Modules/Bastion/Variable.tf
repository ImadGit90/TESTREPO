variable "Bastion" {
  type = map(object({
    name                = string
  location            = string
  resource_group_name = string
    ipconfig_name                 = string
    subnet_id            = string
    virtual_network_name = string
    public_ip_address_id = string
  
  }))
}
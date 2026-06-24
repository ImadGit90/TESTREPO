module "RG" {
  source         = "../Modules/resource_group"
  resource_group = var.resource_group
}

module "stg11" {
  depends_on      = [module.RG]
  source          = "../Modules/storage_account"
  storage_account = var.storage_account
}

module "vnet1" {
  depends_on      = [module.RG]
  source          = "../Modules/Vnet"
  virtual_network = var.virtual_network
}

module "subnet" {

  depends_on = [module.vnet1]
  source     = "../Modules/Subnet"
  subnet     = var.subnet

}

module "PublicIP" {
  depends_on = [module.RG]
  source     = "../Modules/PublicIp"
  PublicIP   = var.PublicIP
}

module "Bastion" {

  depends_on = [module.subnet, module.PublicIP]

  source  = "../Modules/Bastion"
  Bastion = var.Bastion
}

module "NIC" {

  depends_on = [module.subnet]

  source            = "../Modules/Nic"
  network_interface = var.network_interface

}

module "linuxVM" {
  
  depends_on = [ module.RG,module.NIC, module.vnet1 ]

  source = "../Modules/Virtual_Machine"
  linuxVM = var.linuxVM
}
data "azurerm_network_interface" "nic" {
  for_each = var.linuxVM

  name = each.value.nic_name

resource_group_name = each.value.resource_group_name
}
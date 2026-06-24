resource "azurerm_linux_virtual_machine" "linuxVM" {
    for_each = var.linuxVM
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_D4_v5"
  admin_username      = "adminuser"
  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
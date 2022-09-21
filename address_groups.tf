resource "nutanix_address_group" "maint_address" {
  name        = "Maint-Address-Group"
  description = "Address group for maintenance"

  ip_address_block_list {
    ip            = "10.10.10.0"
    prefix_length = 24
  }
}
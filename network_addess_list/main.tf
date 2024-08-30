resource "oci_waf_network_address_list" "this" {
  compartment_id = var.compartment_id
  type           = var.type
  addresses      = var.addresses
  defined_tags   = var.defined_tags
  display_name   = var.display_name
  freeform_tags  = var.freeform_tags
  system_tags    = var.system_tags
  vcn_addresses {
    addresses = var.vcn_addresses
    vcn_id    = var.vcn_id
  }
}

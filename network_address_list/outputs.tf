output "addresses" {
  description = "A list of IP address prefixes in CIDR notation. To specify all addresses, use \"0.0.0.0/0\" for IPv4 and \"::/0\" for IPv6."
  value       = oci_waf_network_address_list.this.addresses
}

output "compartment_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment."
  value       = oci_waf_network_address_list.this.compartment_id
}

output "defined_tags" {
  description = "Defined tags for this resource. Each key is predefined and scoped to a namespace."
  value       = oci_waf_network_address_list.this.defined_tags
}

output "display_name" {
  description = "NetworkAddressList display name, can be renamed."
  value       = oci_waf_network_address_list.this.display_name
}

output "freeform_tags" {
  description = "Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only."
  value       = oci_waf_network_address_list.this.freeform_tags
}

output "id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the NetworkAddressList."
  value       = oci_waf_network_address_list.this.id
}

output "lifecycle_details" {
  description = "A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in FAILED state."
  value       = oci_waf_network_address_list.this.lifecycle_details
}

output "state" {
  description = "The current state of the NetworkAddressList."
  value       = oci_waf_network_address_list.this.state
}

output "system_tags" {
  description = "Usage of system tag keys. These predefined keys are scoped to namespaces."
  value       = oci_waf_network_address_list.this.system_tags
}

output "time_created" {
  description = "The time the NetworkAddressList was created. An RFC3339 formatted datetime string."
  value       = oci_waf_network_address_list.this.time_created
}

output "time_updated" {
  description = "The time the NetworkAddressList was updated. An RFC3339 formatted datetime string."
  value       = oci_waf_network_address_list.this.time_updated
}

output "type" {
  description = "Type of NetworkAddressList."
  value       = oci_waf_network_address_list.this.type
}

output "vcn_addresses" {
  description = "A list of private address prefixes, each associated with a particular VCN. To specify all addresses in a VCN, use \"0.0.0.0/0\" for IPv4 and \"::/0\" for IPv6."
  value       = oci_waf_network_address_list.this.vcn_addresses
}

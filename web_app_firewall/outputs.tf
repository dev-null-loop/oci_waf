output "backend_type" {
  description = "Type of the WebAppFirewall, as example LOAD_BALANCER."
  value       = oci_waf_web_app_firewall.this.backend_type
}

output "compartment_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment."
  value       = oci_waf_web_app_firewall.this.compartment_id
}

output "defined_tags" {
  description = "Defined tags for this resource. Each key is predefined and scoped to a namespace."
  value       = oci_waf_web_app_firewall.this.defined_tags
}

output "display_name" {
  description = "WebAppFirewall display name, can be renamed."
  value       = oci_waf_web_app_firewall.this.display_name
}

output "freeform_tags" {
  description = "Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only."
  value       = oci_waf_web_app_firewall.this.freeform_tags
}

output "id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the WebAppFirewall."
  value       = oci_waf_web_app_firewall.this.id
}

output "lifecycle_details" {
  description = "A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in FAILED state."
  value       = oci_waf_web_app_firewall.this.lifecycle_details
}

output "load_balancer_id" {
  description = "LoadBalancer [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) to which the WebAppFirewallPolicy is attached to."
  value       = oci_waf_web_app_firewall.this.load_balancer_id
}

output "state" {
  description = "The current state of the WebAppFirewall."
  value       = oci_waf_web_app_firewall.this.state
}

output "system_tags" {
  description = "Usage of system tag keys. These predefined keys are scoped to namespaces."
  value       = oci_waf_web_app_firewall.this.system_tags
}

output "time_created" {
  description = "The time the WebAppFirewall was created. An RFC3339 formatted datetime string."
  value       = oci_waf_web_app_firewall.this.time_created
}

output "time_updated" {
  description = "The time the WebAppFirewall was updated. An RFC3339 formatted datetime string."
  value       = oci_waf_web_app_firewall.this.time_updated
}

output "web_app_firewall_policy_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of WebAppFirewallPolicy, which is attached to the resource."
  value       = oci_waf_web_app_firewall.this.web_app_firewall_policy_id
}

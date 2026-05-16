output "actions" {
  description = "Predefined actions for use in multiple different rules."
  value       = oci_waf_web_app_firewall_policy.this.actions
}

output "compartment_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment."
  value       = oci_waf_web_app_firewall_policy.this.compartment_id
}

output "defined_tags" {
  description = "Defined tags for this resource."
  value       = oci_waf_web_app_firewall_policy.this.defined_tags
}

output "display_name" {
  description = "WebAppFirewallPolicy display name, can be renamed."
  value       = oci_waf_web_app_firewall_policy.this.display_name
}

output "freeform_tags" {
  description = "Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only."
  value       = oci_waf_web_app_firewall_policy.this.freeform_tags
}

output "id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the WebAppFirewallPolicy."
  value       = oci_waf_web_app_firewall_policy.this.id
}

output "lifecycle_details" {
  description = "A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in FAILED state."
  value       = oci_waf_web_app_firewall_policy.this.lifecycle_details
}

output "request_access_control" {
  description = "Module that allows inspection of HTTP request properties and to return a defined HTTP response."
  value       = oci_waf_web_app_firewall_policy.this.request_access_control
}

output "request_protection" {
  description = "Module that allows to enable OCI-managed protection capabilities for incoming HTTP requests."
  value       = oci_waf_web_app_firewall_policy.this.request_protection
}

output "request_rate_limiting" {
  description = "Module that allows inspection of HTTP connection properties and to limit requests frequency for a given key."
  value       = oci_waf_web_app_firewall_policy.this.request_rate_limiting
}

output "response_access_control" {
  description = "Module that allows inspection of HTTP response properties and to return a defined HTTP response."
  value       = oci_waf_web_app_firewall_policy.this.response_access_control
}

output "response_protection" {
  description = "Module that allows to enable OCI-managed protection capabilities for HTTP responses."
  value       = oci_waf_web_app_firewall_policy.this.response_protection
}

output "state" {
  description = "The current state of the WebAppFirewallPolicy."
  value       = oci_waf_web_app_firewall_policy.this.state
}

output "system_tags" {
  description = "Usage of system tag keys. These predefined keys are scoped to namespaces."
  value       = oci_waf_web_app_firewall_policy.this.system_tags
}

output "time_created" {
  description = "The time the WebAppFirewallPolicy was created. An RFC3339 formatted datetime string."
  value       = oci_waf_web_app_firewall_policy.this.time_created
}

output "time_updated" {
  description = "The time the WebAppFirewallPolicy was updated. An RFC3339 formatted datetime string."
  value       = oci_waf_web_app_firewall_policy.this.time_updated
}

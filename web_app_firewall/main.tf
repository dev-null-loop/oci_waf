resource "oci_waf_web_app_firewall" "this" {
  backend_type               = var.backend_type
  compartment_id             = var.compartment_id
  load_balancer_id           = var.load_balancer_id
  web_app_firewall_policy_id = var.web_app_firewall_policy_id
  defined_tags               = var.defined_tags
  display_name               = var.display_name
  freeform_tags              = var.freeform_tags
  system_tags                = var.system_tags
}

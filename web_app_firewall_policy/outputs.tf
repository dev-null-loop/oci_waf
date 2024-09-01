# locals {
#   waf_policy_ids = {
#     for c in oci_waf_web_app_firewall_policy.this :
#     c.display_name => c.id
#   }
# }

# output "waf_policy_ids" {
#   value = local.waf_policy_ids
# }

resource "oci_waf_web_app_firewall_policy" "this" {
  for_each = var.waf_policy

  dynamic "actions" {
    for_each = each.value.actions_params
    iterator = rr
    content {
      dynamic "body" {
        for_each = rr.value.body_params
        iterator = bb
        content {
          text = bb.value.body_text
          type = bb.value.body_type
        }
      }

      dynamic "headers" {
        for_each = rr.value.headers_params
        iterator = cc
        content {
          name  = cc.value.header_name
          value = cc.value.header_value
        }
      }
      name = rr.value.name
      type = rr.value.type
      code = rr.value.code
    }
  }

  dynamic "request_protection" {
    for_each = each.value.protection_rules
    iterator = rr
    content {
      body_inspection_size_limit_in_bytes = "8192"
      dynamic "rules" {
        for_each = rr.value.rules
        iterator = bb
        content {
          action_name                = bb.value.action_name
          type                       = bb.value.type
          condition_language         = bb.value.condition_language
          is_body_inspection_enabled = bb.value.is_body_inspection_enabled
          name                       = bb.value.name
          dynamic "protection_capabilities" {
            for_each = bb.value.protection_capabilities
            iterator = cc
            content {
              action_name = cc.value.action_name
              key         = cc.value.key
              version     = cc.value.version
            }
          }
        }
      }
    }
  }

  dynamic "response_access_control" {
    for_each = each.value.access_control_params
    iterator = rr
    content {
      dynamic "rules" {
        for_each = rr.value.rules
        iterator = bb
        content {
          action_name        = bb.value.action_name
          condition          = bb.value.condition
          condition_language = bb.value.condition_language
          name               = bb.value.name
          type               = bb.value.type
        }
      }
    }
  }

  compartment_id = var.compartment_ids[each.value.compartment_name]
  display_name   = each.value.waf_policy_display_name
}

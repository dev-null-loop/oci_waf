resource "oci_waf_web_app_firewall_policy" "this" {
  compartment_id = var.compartment_id
  dynamic "actions" {
    for_each = var.actions != null ? var.actions : []
    content {
      name = actions.value.name
      type = actions.value.type
      dynamic "body" {
        for_each = actions.value.body[*]
        content {
          template = body.value.template
          text     = body.value.text
          type     = body.value.type
        }
      }
      code = actions.value.code
      dynamic "headers" {
        for_each = actions.value.headers != null ? actions.value.headers : []
        content {
          name  = headers.value.name
          value = headers.value.value
        }
      }
    }
  }
  defined_tags  = var.defined_tags
  display_name  = var.display_name
  freeform_tags = var.freeform_tags
  dynamic "request_access_control" {
    for_each = var.request_access_control[*]
    iterator = rac
    content {
      default_action_name = rac.value.default_action_name
      dynamic "rules" {
        for_each = rac.value.rules[*]
        content {
          action_name        = rules.value.action_name
          name               = rules.value.name
          type               = rules.value.type
          condition          = rules.value.condition
          condition_language = rules.value.condition_language
        }
      }
    }
  }
  dynamic "request_protection" {
    for_each = var.request_protection[*]
    iterator = rp
    content {
      body_inspection_size_limit_exceeded_action_name = rp.value.body_inspection_size_limit_exceeded_action_name
      body_inspection_size_limit_in_bytes             = rp.value.body_inspection_size_limit_in_bytes
      dynamic "rules" {
        for_each = rp.value.rules
        iterator = r
        content {
          action_name = r.value.action_name
          name        = r.value.name
          dynamic "protection_capabilities" {
            for_each = r.value.protection_capabilities != null ? r.value.protection_capabilities : []
            iterator = pc
            content {
              key                            = pc.value.key
              version                        = pc.value.version
              action_name                    = pc.value.action_name
              collaborative_action_threshold = pc.value.collaborative_action_threshold
              dynamic "collaborative_weights" {
                for_each = pc.value.collaborative_weights[*]
                iterator = cw
                content {
                  key    = cw.value.key
                  weight = cw.value.weight
                }
              }
              dynamic "exclusions" {
                for_each = pc.value.exclusions[*]
                content {
                  args            = exclusions.value.args
                  request_cookies = exclusions.value.request_cookies
                }
              }
            }
          }
          type                       = r.value.type
          condition                  = r.value.condition
          condition_language         = r.value.condition_language
          is_body_inspection_enabled = r.value.is_body_inspection_enabled
          dynamic "protection_capability_settings" {
            for_each = r.value.protection_capability_settings[*]
            iterator = pcs
            content {
              allowed_http_methods           = pcs.value.allowed_http_methods
              max_http_request_header_length = pcs.value.max_http_request_header_length
              max_http_request_headers       = pcs.value.max_http_request_headers
              max_number_of_arguments        = pcs.value.max_number_of_arguments
              max_single_argument_length     = pcs.value.max_single_argument_length
              max_total_argument_length      = pcs.value.max_total_argument_length
            }
          }
        }
      }
    }
  }

  dynamic "request_rate_limiting" {
    for_each = var.request_rate_limiting[*]
    iterator = rrl
    content {
      dynamic "rules" {
        for_each = rrl.value.rules != null ? rrl.value.rules : []
        content {
          action_name        = rules.value.action_name
          condition          = rules.value.condition
          condition_language = rules.value.condition_language
          dynamic "configurations" {
            for_each = rules.value.configurations[*]
            content {
              action_duration_in_seconds = configurations.value.action_duration_in_seconds
              period_in_seconds          = configurations.value.period_in_seconds
              requests_limit             = configurations.value.requests_limit
            }
          }
          name = rules.value.name
          type = rules.value.type
        }
      }
    }
  }

  dynamic "response_access_control" {
    for_each = var.response_access_control[*]
    iterator = rac
    content {
      dynamic "rules" {
        for_each = rac.value.rules[*]
        content {
          action_name        = rules.value.action_name
          name               = rules.value.name
          type               = rules.value.type
          condition          = rules.value.condition
          condition_language = rules.value.condition_language
        }
      }
    }
  }

  dynamic "response_protection" {
    for_each = var.response_protection[*]
    iterator = rr
    content {
      dynamic "rules" {
        for_each = rr.value.rules != null ? rr.value.rules : []
        content {
          action_name                = rules.value.action_name
          condition                  = rules.value.condition
          condition_language         = rules.value.condition_language
          is_body_inspection_enabled = rules.value.is_body_inspection_enabled
          name                       = rules.value.name

          dynamic "protection_capabilities" {
            for_each = rules.value.protection_capabilities != null ? rules.value.protection_capabilities : []
            iterator = pc
            content {
              action_name                    = pc.value.action_name
              collaborative_action_threshold = pc.value.collaborative_action_threshold
              key                            = pc.value.key
              version                        = pc.value.version
              dynamic "collaborative_weights" {
                for_each = pc.value.collaborative_weigths[*]
                iterator = cw
                content {
                  key    = cw.value.key
                  weight = cw.value.weight
                }
              }
              dynamic "exclusions" {
                for_each = pc.value.exclusions[*]
                content {
                  args            = exclusions.value.args
                  request_cookies = exclusions.value.request_cookies
                }
              }
            }
          }
          dynamic "protection_capability_settings" {
            for_each = rules.value.protection_capability_settings[*]
            iterator = pcs
            content {
              allowed_http_methods           = pcs.value.allowed_http_methods
              max_http_request_header_length = pcs.value.max_http_request_header_length
              max_http_request_headers       = pcs.value.max_http_request_headers
              max_number_of_arguments        = pcs.value.max_number_of_arguments
              max_single_argument_length     = pcs.value.max_single_argument_length
              max_total_argument_length      = pcs.value.max_total_argument_length
            }
          }
          type = rules.value.type
        }
      }
    }
  }

  system_tags = var.system_tags
}

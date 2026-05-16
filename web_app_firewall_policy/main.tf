resource "oci_waf_web_app_firewall_policy" "this" {
  compartment_id = var.compartment_id
  dynamic "actions" {
    for_each = var.actions
    iterator = ac
    content {
      name = ac.value.name
      type = ac.value.type
      dynamic "body" {
        for_each = ac.value.body[*]
        iterator = bo
        content {
          text     = bo.value.text
          type     = bo.value.type
          template = bo.value.template
        }
      }
      code = ac.value.code
      dynamic "headers" {
        for_each = ac.value.headers
        iterator = he
        content {
          name  = he.value.name
          value = he.value.value
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
        for_each = rac.value.rules
        iterator = ru
        content {
          action_name        = ru.value.action_name
          name               = ru.value.name
          type               = ru.value.type
          condition          = ru.value.condition
          condition_language = ru.value.condition_language
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
        iterator = ru
        content {
          action_name = ru.value.action_name
          name        = ru.value.name
          dynamic "protection_capabilities" {
            for_each = ru.value.protection_capabilities
            iterator = pc
            content {
              key                            = pc.value.key
              version                        = pc.value.version
              action_name                    = pc.value.action_name
              collaborative_action_threshold = pc.value.collaborative_action_threshold
              dynamic "collaborative_weights" {
                for_each = pc.value.collaborative_weights
                iterator = cw
                content {
                  key    = cw.value.key
                  weight = cw.value.weight
                }
              }
              dynamic "exclusions" {
                for_each = pc.value.exclusions[*]
                iterator = ex
                content {
                  args            = ex.value.args
                  request_cookies = ex.value.request_cookies
                }
              }
            }
          }
          type                       = ru.value.type
          condition                  = ru.value.condition
          condition_language         = ru.value.condition_language
          is_body_inspection_enabled = ru.value.is_body_inspection_enabled
          dynamic "protection_capability_settings" {
            for_each = ru.value.protection_capability_settings[*]
            iterator = ps
            content {
              allowed_http_methods           = ps.value.allowed_http_methods
              max_http_request_header_length = ps.value.max_http_request_header_length
              max_http_request_headers       = ps.value.max_http_request_headers
              max_number_of_arguments        = ps.value.max_number_of_arguments
              max_single_argument_length     = ps.value.max_single_argument_length
              max_total_argument_length      = ps.value.max_total_argument_length
            }
          }
        }
      }
    }
  }
  dynamic "request_rate_limiting" {
    for_each = var.request_rate_limiting[*]
    iterator = rr
    content {
      dynamic "rules" {
        for_each = rr.value.rules
        iterator = ru
        content {
          action_name = ru.value.action_name
          dynamic "configurations" {
            for_each = ru.value.configurations
            iterator = co
            content {
              period_in_seconds          = co.value.period_in_seconds
              requests_limit             = co.value.requests_limit
              action_duration_in_seconds = co.value.action_duration_in_seconds
            }
          }
          name               = ru.value.name
          type               = ru.value.type
          condition          = ru.value.condition
          condition_language = ru.value.condition_language
        }
      }
    }
  }
  dynamic "response_access_control" {
    for_each = var.response_access_control[*]
    iterator = rac
    content {
      dynamic "rules" {
        for_each = rac.value.rules
        iterator = ru
        content {
          action_name        = ru.value.action_name
          name               = ru.value.name
          type               = ru.value.type
          condition          = ru.value.condition
          condition_language = ru.value.condition_language
        }
      }
    }
  }
  dynamic "response_protection" {
    for_each = var.response_protection[*]
    iterator = rp
    content {
      dynamic "rules" {
        for_each = rp.value.rules
        iterator = ru
        content {
          action_name = ru.value.action_name
          name        = ru.value.name
          dynamic "protection_capabilities" {
            for_each = ru.value.protection_capabilities
            iterator = pc
            content {
              key                            = pc.value.key
              version                        = pc.value.version
              action_name                    = pc.value.action_name
              collaborative_action_threshold = pc.value.collaborative_action_threshold
              dynamic "collaborative_weights" {
                for_each = pc.value.collaborative_weights
                iterator = cw
                content {
                  key    = cw.value.key
                  weight = cw.value.weight
                }
              }
              dynamic "exclusions" {
                for_each = pc.value.exclusions[*]
                iterator = ex
                content {
                  args            = ex.value.args
                  request_cookies = ex.value.request_cookies
                }
              }
            }
          }
          type                       = ru.value.type
          condition                  = ru.value.condition
          condition_language         = ru.value.condition_language
          is_body_inspection_enabled = ru.value.is_body_inspection_enabled
          dynamic "protection_capability_settings" {
            for_each = ru.value.protection_capability_settings[*]
            iterator = ps
            content {
              allowed_http_methods           = ps.value.allowed_http_methods
              max_http_request_header_length = ps.value.max_http_request_header_length
              max_http_request_headers       = ps.value.max_http_request_headers
              max_number_of_arguments        = ps.value.max_number_of_arguments
              max_single_argument_length     = ps.value.max_single_argument_length
              max_total_argument_length      = ps.value.max_total_argument_length
            }
          }
        }
      }
    }
  }
  system_tags = var.system_tags
}

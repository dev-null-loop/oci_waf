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
	  text = body.value.text
	  type = body.value.type
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

  # request_rate_limiting {
  #   rules {
  #     action_name = var.web_app_firewall_policy_request_rate_limiting_rules_action_name
  #     configurations {
  #	period_in_seconds = var.web_app_firewall_policy_request_rate_limiting_rules_configurations_period_in_seconds
  #	requests_limit    = var.web_app_firewall_policy_request_rate_limiting_rules_configurations_requests_limit
  #	action_duration_in_seconds = var.web_app_firewall_policy_request_rate_limiting_rules_configurations_action_duration_in_seconds
  #     }
  #     name = var.web_app_firewall_policy_request_rate_limiting_rules_name
  #     type = var.web_app_firewall_policy_request_rate_limiting_rules_type
  #     condition          = var.web_app_firewall_policy_request_rate_limiting_rules_condition
  #     condition_language = var.web_app_firewall_policy_request_rate_limiting_rules_condition_language
  #   }
  # }

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

  # response_protection {
  #   rules {
  #     action_name = var.web_app_firewall_policy_response_protection_rules_action_name
  #     name        = var.web_app_firewall_policy_response_protection_rules_name
  #     protection_capabilities {
  #	key                            = var.web_app_firewall_policy_response_protection_rules_protection_capabilities_key
  #	version                        = var.web_app_firewall_policy_response_protection_rules_protection_capabilities_version
  #	action_name                    = var.web_app_firewall_policy_response_protection_rules_protection_capabilities_action_name
  #	collaborative_action_threshold = var.web_app_firewall_policy_response_protection_rules_protection_capabilities_collaborative_action_threshold
  #	collaborative_weights {
  #	  key    = var.web_app_firewall_policy_response_protection_rules_protection_capabilities_collaborative_weights_key
  #	  weight = var.web_app_firewall_policy_response_protection_rules_protection_capabilities_collaborative_weights_weight
  #	}
  #	exclusions {
  #	  args            = var.web_app_firewall_policy_response_protection_rules_protection_capabilities_exclusions_args
  #	  request_cookies = var.web_app_firewall_policy_response_protection_rules_protection_capabilities_exclusions_request_cookies
  #	}
  #     }
  #     type                       = var.web_app_firewall_policy_response_protection_rules_type
  #     condition                  = var.web_app_firewall_policy_response_protection_rules_condition
  #     condition_language         = var.web_app_firewall_policy_response_protection_rules_condition_language
  #     is_body_inspection_enabled = var.web_app_firewall_policy_response_protection_rules_is_body_inspection_enabled
  #     protection_capability_settings {
  #	allowed_http_methods           = var.web_app_firewall_policy_response_protection_rules_protection_capability_settings_allowed_http_methods
  #	max_http_request_header_length = var.web_app_firewall_policy_response_protection_rules_protection_capability_settings_max_http_request_header_length
  #	max_http_request_headers       = var.web_app_firewall_policy_response_protection_rules_protection_capability_settings_max_http_request_headers
  #	max_number_of_arguments        = var.web_app_firewall_policy_response_protection_rules_protection_capability_settings_max_number_of_arguments
  #	max_single_argument_length     = var.web_app_firewall_policy_response_protection_rules_protection_capability_settings_max_single_argument_length
  #	max_total_argument_length      = var.web_app_firewall_policy_response_protection_rules_protection_capability_settings_max_total_argument_length
  #     }
  #   }
  # }

  system_tags = var.system_tags
}

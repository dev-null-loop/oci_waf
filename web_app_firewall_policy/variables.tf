variable "compartment_ids" {
  type = map(string)
}

variable "waf_policy" {
  description = "Waf policy variables"

  type = map(object({
    waf_policy_display_name = string
    compartment_name        = string
    actions_params = list(object({
      body_params = list(object({
        body_text = string
        body_type = string
      }))
      headers_params = list(object({
        header_name  = string
        header_value = string
      }))
      name = string
      code = string
      type = string
    }))

    protection_rules = list(object({
      body_inspection_size_limit_in_bytes = string
      rules = list(object({
        action_name                = string
        type                       = string
        condition_language         = string
        is_body_inspection_enabled = string
        name                       = string
        protection_capabilities = list(object({
          action_name = string
          key         = string
          version     = string
        }))
      }))
    }))

    access_control_params = list(object({
      rules = list(object({
        action_name        = string
        condition          = string
        condition_language = string
        name               = string
        type               = string
      }))
    }))
  }))
}

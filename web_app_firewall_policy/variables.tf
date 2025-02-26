variable "compartment_id" {
  description = "(Required) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment."
  type        = string
}

variable "actions" {
  description = "(Optional) (Updatable) Predefined actions for use in multiple different rules. Not all actions are supported in every module. Some actions terminate further execution of modules and rules in a module and some do not. Actions names must be unique within this array. "
  type = list(object({
    body = optional(object({
      text     = optional(string)
      template = optional(string)
      type     = string
    }))
    code = optional(string)
    headers = optional(list(object({
      name  = string
      value = string
    })))
    name = string
    type = string
  }))
  default = null
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace."
  type        = map(string)
  default     = null
}

variable "display_name" {
  description = "(Optional) (Updatable) WebAppFirewallPolicy display name, can be renamed."
  type        = string
  default     = null
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only."
  type        = map(string)
  default     = {}
}

variable "request_access_control" {
  description = "(Optional) (Updatable) Module that allows inspection of HTTP request properties and to return a defined HTTP response. In this module, rules with the name 'Default Action' are not allowed, since this name is reserved for default action logs."
  type = object({
    default_action_name = string
    rules = optional(list(object({
      action_name        = string
      condition          = string
      condition_language = string
      name               = string
      type               = string
    })))
  })
  default = null
}

variable "request_protection" {
  description = "(Optional) (Updatable) Module that allows to enable OCI-managed protection capabilities for incoming HTTP requests."
  type = object({
    body_inspection_size_limit_exceeded_action_name = optional(string)
    body_inspection_size_limit_in_bytes             = number
    rules = optional(list(object({
      action_name                = string
      condition                  = optional(string)
      condition_language         = optional(string)
      is_body_inspection_enabled = optional(bool)
      name                       = string
      protection_capabilities = list(object({
        action_name                    = optional(string)
        collaborative_action_threshold = optional(string)
        collaborative_weights = optional(object({
          key    = string
          weight = number
        }))
        exclusions = optional(object({
          args = optional(list(object({
            request_cookies = optional(list(string))
            key             = string
            version         = number
          })))
        }))
        key     = number
        version = number
      }))
      protection_capability_settings = optional(object({
        allowed_http_methods           = optional(list(string))
        max_http_request_header_length = optional(number)
        max_http_request_headers       = optional(number)
        max_number_of_arguments        = optional(number)
        max_single_argument_length     = optional(number)
        max_total_argument_length      = optional(number)
        type                           = string
      }))
      type = string
    })))
  })
  default = null
}

variable "request_rate_limiting" {
  description = "(Optional) (Updatable) Module that allows inspection of HTTP connection properties and to limit requests frequency for a given key."
  type = object({
    rules = optional(list(object({
      action_name        = string
      condition          = string
      condition_language = string
      configurations = object({
        action_duration_in_seconds = optional(number)
        period_in_seconds          = number
        requests_limit             = number
      })
      name = string
      type = string
    })))
  })
  default = null
}

variable "response_access_control" {
  description = "(Optional) (Updatable) Module that allows inspection of HTTP response properties and to return a defined HTTP response."
  type = object({
    rules = optional(list(object({
      action_name        = string
      condition          = string
      condition_language = string
      name               = string
      type               = string
    })))
  })
  default = null
}

variable "response_protection" {
  description = "(Optional) (Updatable) Module that allows to enable OCI-managed protection capabilities for HTTP responses."
  type = object({
    rules = optional(list(object({
      action_name                = string
      condition                  = optional(string)
      condition_language         = optional(string)
      is_body_inspection_enabled = optional(bool)
      name                       = string
      protection_capabilities = list(object({
        action_name                    = optional(string)
        collaborative_action_threshold = optional(number)
        collaborative_weights = optional(object({
          key    = string
          weight = number
        }))
        exclusions = optional(object({
          args            = optional(list(string))
          request_cookies = optional(list(string))
        }))
        key     = string
        version = number
        protection_capability_settings = optional(object({
          allowed_http_methods           = optional(list(string))
          max_http_request_header_length = optional(number)
          max_http_request_headers       = optional(number)
          max_number_of_arguments        = optional(number)
          max_single_argument_length     = optional(number)
          max_total_argument_length      = optional(number)
        }))
      }))
      type = string
    })))
  })
  default = null
}

variable "system_tags" {
  description = "(Optional) (Updatable) Usage of system tag keys. These predefined keys are scoped to namespaces."
  type        = map(string)
  default     = null
}

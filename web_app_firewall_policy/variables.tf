variable "compartment_id" {
  description = "(Required) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment."
  type        = string
}

variable "actions" {
  description = "(Optional) (Updatable) Predefined actions for use in multiple different rules. Not all actions are supported in every module. Some actions terminate further execution of modules and rules in a module and some do not. Actions names must be unique within this array."
  type = list(object({
    name = string
    type = string
    body = optional(object({
      text     = optional(string)
      type     = string
      template = optional(string)
    }))
    code = optional(number)
    headers = optional(list(object({
      name  = optional(string)
      value = optional(string)
    })), [])
  }))
  default = []
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace. Example: `{\"foo-namespace.bar-key\": \"value\"}`"
  type        = map(string)
  default     = null
}

variable "display_name" {
  description = "(Optional) (Updatable) WebAppFirewallPolicy display name, can be renamed."
  type        = string
  default     = null
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only. Example: `{\"bar-key\": \"value\"}`"
  type        = map(string)
  default     = {}
}

variable "request_access_control" {
  description = "(Optional) (Updatable) Module that allows inspection of HTTP request properties and to return a defined HTTP response. In this module, rules with the name 'Default Action' are not allowed, since this name is reserved for default action logs."
  type = object({
    default_action_name = string
    rules = optional(list(object({
      action_name        = string
      condition          = optional(string)
      condition_language = optional(string)
      name               = string
      type               = string
    })), [])
  })
  default = null
}

variable "request_protection" {
  description = "(Optional) (Updatable) Module that allows to enable OCI-managed protection capabilities for incoming HTTP requests."
  type = object({
    body_inspection_size_limit_exceeded_action_name = optional(string)
    body_inspection_size_limit_in_bytes             = optional(number, 8192)
    rules = optional(list(object({
      action_name                = string
      condition                  = optional(string)
      condition_language         = optional(string)
      is_body_inspection_enabled = optional(bool)
      name                       = string
      protection_capabilities = list(object({
        key                            = string
        version                        = number
        action_name                    = optional(string)
        collaborative_action_threshold = optional(number)
        collaborative_weights = optional(list(object({
          key    = string
          weight = number
        })), [])
        exclusions = optional(object({
          args            = optional(list(string), [])
          request_cookies = optional(list(string), [])
        }))
      }))
      protection_capability_settings = optional(object({
        allowed_http_methods           = optional(list(string), [])
        max_http_request_header_length = optional(number, 8000)
        max_http_request_headers       = optional(number, 25)
        max_number_of_arguments        = optional(number, 255)
        max_single_argument_length     = optional(number, 400)
        max_total_argument_length      = optional(number, 64000)
      }))
      type = string
    })), [])
  })
  default = null
}

variable "request_rate_limiting" {
  description = "(Optional) (Updatable) Module that allows inspection of HTTP connection properties and to limit requests frequency for a given key."
  type = object({
    rules = optional(list(object({
      action_name        = string
      condition          = optional(string)
      condition_language = optional(string)
      configurations = list(object({
        period_in_seconds          = number
        requests_limit             = number
        action_duration_in_seconds = optional(number)
      }))
      name = string
      type = string
    })), [])
  })
  default = null
}

variable "response_access_control" {
  description = "(Optional) (Updatable) Module that allows inspection of HTTP response properties and to return a defined HTTP response."
  type = object({
    rules = optional(list(object({
      action_name        = string
      condition          = optional(string)
      condition_language = optional(string)
      name               = string
      type               = string
    })), [])
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
        key                            = string
        version                        = number
        action_name                    = optional(string)
        collaborative_action_threshold = optional(number)
        collaborative_weights = optional(list(object({
          key    = string
          weight = number
        })), [])
        exclusions = optional(object({
          args            = optional(list(string), [])
          request_cookies = optional(list(string), [])
        }))
      }))
      protection_capability_settings = optional(object({
        allowed_http_methods           = optional(list(string), [])
        max_http_request_header_length = optional(number, 8000)
        max_http_request_headers       = optional(number, 25)
        max_number_of_arguments        = optional(number, 255)
        max_single_argument_length     = optional(number, 400)
        max_total_argument_length      = optional(number, 64000)
      }))
      type = string
    })), [])
  })
  default = null
}

variable "system_tags" {
  description = "(Optional) (Updatable) Usage of system tag keys. These predefined keys are scoped to namespaces. Example: `{\"orcl-cloud.free-tier-retained\": \"true\"}`"
  type        = map(string)
  default     = null
}

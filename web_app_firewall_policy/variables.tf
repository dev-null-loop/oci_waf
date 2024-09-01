variable "actions" {
  description = "(Optional) (Updatable) Predefined actions for use in multiple different rules. Not all actions are supported in every module. Some actions terminate further execution of modules and rules in a module and some do not. Actions names must be unique within this array. "
  type = list(object({
    body = optional(object({
      text = string
      type = string
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

variable "compartment_id" {
  description = "(Required) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment."
  type        = string
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
    rules = optional(object({
      action_name        = string
      condition          = string
      condition_language = string
      name               = string
      type               = string
    }))
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
}






# * `request_rate_limiting` - (Optional) (Updatable) Module that allows inspection of HTTP connection properties and to limit requests frequency for a given key.
#	* `rules` - (Optional) (Updatable) Ordered list of RequestRateLimitingRules. Rules are executed in order of appearance in this array.
#		* `action_name` - (Required) (Updatable) References action by name from actions defined in WebAppFirewallPolicy.
#		* `condition` - (Optional) (Updatable) An expression that determines whether or not the rule action should be executed.
#		* `condition_language` - (Optional) (Updatable) The language used to parse condition from field `condition`. Available languages:
#			* **JMESPATH** an extended JMESPath language syntax.
#		* `configurations` - (Required) (Updatable) Rate Limiting Configurations. Each configuration counts requests towards its own `requestsLimit`.
#			* `action_duration_in_seconds` - (Optional) (Updatable) Duration of block action application in seconds when `requestsLimit` is reached. Optional and can be 0 (no block duration).
#			* `period_in_seconds` - (Required) (Updatable) Evaluation period in seconds.
#			* `requests_limit` - (Required) (Updatable) Requests allowed per evaluation period.
#		* `name` - (Required) (Updatable) Rule name. Must be unique within the module.
#		* `type` - (Required) (Updatable) Type of WebAppFirewallPolicyRule.

variable "response_access_control" {
  description = "(Optional) (Updatable) Module that allows inspection of HTTP response properties and to return a defined HTTP response."
  type = object({
    rules = optional(object({
      action_name        = string
      condition          = string
      condition_language = string
      name               = string
      type               = string
    }))
  })
  default = null
}

variable "response_protection" {
  description = "(Optional) (Updatable) Module that allows to enable OCI-managed protection capabilities for HTTP responses."
  default     = null
}
#	* `rules` - (Optional) (Updatable) Ordered list of ProtectionRules. Rules are executed in order of appearance in this array. ProtectionRules in this array can only use protection capabilities of RESPONSE_PROTECTION_CAPABILITY type.
#		* `action_name` - (Required) (Updatable) References action by name from actions defined in WebAppFirewallPolicy.
#		* `condition` - (Optional) (Updatable) An expression that determines whether or not the rule action should be executed.
#		* `condition_language` - (Optional) (Updatable) The language used to parse condition from field `condition`. Available languages:
#			* **JMESPATH** an extended JMESPath language syntax.
#		* `is_body_inspection_enabled` - (Optional) (Updatable) Enables/disables body inspection for this protection rule. Only Protection Rules in RequestProtection can have this option enabled. Response body inspection will be available at a later date.
#		* `name` - (Required) (Updatable) Rule name. Must be unique within the module.
#		* `protection_capabilities` - (Required) (Updatable) An ordered list that references OCI-managed protection capabilities. Referenced protection capabilities are not necessarily executed in order of appearance. Their execution order is decided at runtime for improved performance. The array cannot contain entries with the same pair of capability key and version more than once.
#			* `action_name` - (Optional) (Updatable) Override action to take if capability was triggered, defined in Protection Rule for this capability. Only actions of type CHECK are allowed.
#			* `collaborative_action_threshold` - (Optional) (Updatable) The minimum sum of weights of associated collaborative protection capabilities that have triggered which must be reached in order for _this_ capability to trigger. This field is ignored for non-collaborative capabilities.
#			* `collaborative_weights` - (Optional) (Updatable) Explicit weight values to use for associated collaborative protection capabilities.
#				* `key` - (Required) (Updatable) Unique key of collaborative capability for which weight will be overridden.
#				* `weight` - (Required) (Updatable) The value of weight to set.
#			* `exclusions` - (Optional) (Updatable) Identifies specific HTTP message parameters to exclude from inspection by a protection capability.
#				* `args` - (Optional) (Updatable) List of URL query parameter values from form-urlencoded XML, JSON, AMP, or POST payloads to exclude from inspecting. Example: If we have query parameter 'argumentName=argumentValue' and args=['argumentName'], both 'argumentName' and 'argumentValue' will not be inspected.
#				* `request_cookies` - (Optional) (Updatable) List of HTTP request cookie values (by cookie name) to exclude from inspecting. Example: If we have cookie 'cookieName=cookieValue' and requestCookies=['cookieName'], both 'cookieName' and 'cookieValue' will not be inspected.
#			* `key` - (Required) (Updatable) Unique key of referenced protection capability.
#			* `version` - (Required) (Updatable) Version of referenced protection capability.
#		* `protection_capability_settings` - (Optional) (Updatable) Settings for protection capabilities
#			* `allowed_http_methods` - (Optional) (Updatable) List of allowed HTTP methods. Each value as a RFC7230 formated token string. Used in protection capability 911100: Restrict HTTP Request Methods.
#			* `max_http_request_header_length` - (Optional) (Updatable) Maximum allowed length of headers in an HTTP request. Used in protection capability: 9200024: Limit length of request header size.
#			* `max_http_request_headers` - (Optional) (Updatable) Maximum number of headers allowed in an HTTP request. Used in protection capability 9200014: Limit Number of Request Headers.
#			* `max_number_of_arguments` - (Optional) (Updatable) Maximum number of arguments allowed. Used in protection capability 920380: Number of Arguments Limits.
#			* `max_single_argument_length` - (Optional) (Updatable) Maximum allowed length of a single argument. Used in protection capability 920370: Limit argument value length.
#			* `max_total_argument_length` - (Optional) (Updatable) Maximum allowed total length of all arguments. Used in protection capability 920390: Limit arguments total length.
#		* `type` - (Required) (Updatable) Type of WebAppFirewallPolicyRule.


variable "system_tags" {
  description = "(Optional) (Updatable) Usage of system tag keys. These predefined keys are scoped to namespaces."
  type        = map(string)
  default     = null
}

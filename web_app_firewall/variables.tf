variable "backend_type" {
  description = "(Required) Type of the WebAppFirewall, as example LOAD_BALANCER."
  type        = string
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
  description = "(Optional) (Updatable) WebAppFirewall display name, can be renamed."
  type        = string
  default     = null
}
variable "freeform_tags" {
  description = "(Optional) (Updatable) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only."
  type        = map(string)
  default     = {}
}

variable "load_balancer_id" {
  description = "(Required) LoadBalancer [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) to which the WebAppFirewallPolicy is attached to."
  type        = string
}

variable "system_tags" {
  description = "(Optional) (Updatable) Usage of system tag keys. These predefined keys are scoped to namespaces."
  type        = map(string)
  default     = null
}

variable "web_app_firewall_policy_id" {
  description = "(Required) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of WebAppFirewallPolicy, which is attached to the resource."
  type        = string
}

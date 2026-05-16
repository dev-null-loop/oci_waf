variable "addresses" {
  description = "A list of IP address prefixes in CIDR notation. To specify all addresses, use \"0.0.0.0/0\" for IPv4 and \"::/0\" for IPv6."
  type        = list(string)
  default     = []
}

variable "compartment_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment."
  type        = string
}

variable "defined_tags" {
  description = "Defined tags for this resource. Each key is predefined and scoped to a namespace. Example: `{\"foo-namespace.bar-key\": \"value\"}`"
  type        = map(string)
  default     = null
}

variable "display_name" {
  description = "NetworkAddressList display name, can be renamed."
  type        = string
  default     = null
}

variable "freeform_tags" {
  description = "Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only. Example: `{\"bar-key\": \"value\"}`"
  type        = map(string)
  default     = {}
}

variable "system_tags" {
  description = "Usage of system tag keys. These predefined keys are scoped to namespaces. Example: `{\"orcl-cloud.free-tier-retained\": \"true\"}`"
  type        = map(string)
  default     = null
}

variable "type" {
  description = "Type of NetworkAddressList."
  type        = string
}

variable "vcn_addresses" {
  description = "A list of private address prefixes, each associated with a particular VCN. To specify all addresses in a VCN, use \"0.0.0.0/0\" for IPv4 and \"::/0\" for IPv6."
  type = list(object({
    addresses = optional(string)
    vcn_id    = optional(string)
  }))
  default = []
}

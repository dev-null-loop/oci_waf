variable "addresses" {
  description = "(Required when type=ADDRESSES) (Updatable) A list of IP address prefixes in CIDR notation. To specify all addresses, use \"0.0.0.0/0\" for IPv4 and \"::/0\" for IPv6."
  type        = list(string)
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
  description = "(Optional) (Updatable) NetworkAddressList display name, can be renamed."
  type        = string
  default     = null
}
variable "freeform_tags" {
  description = "(Optional) (Updatable) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only."
  type        = map(string)
  default     = {}
}

variable "system_tags" {
  description = "(Optional) (Updatable) Usage of system tag keys. These predefined keys are scoped to namespaces."
  type        = map(string)
  default     = {}
}

variable "type" {
  description = "(Required) (Updatable) Type of NetworkAddressList."
  type        = string
}

variable "vcn_addresses" {
  description = "(Required when type=VCN_ADDRESSES) (Updatable) A list of private address prefixes, each associated with a particular VCN. To specify all addresses in a VCN, use \"0.0.0.0/0\" for IPv4 and \"::/0\" for IPv6."
}

variable "vcn_id" {
  description = "(Required when type=VCN_ADDRESSES) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN."
  type        = string
}

terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 6.8.2"
    }
  }
  required_version = ">= 1.5.7"
}

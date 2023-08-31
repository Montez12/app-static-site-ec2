variable "network_vpc_id" {
  type        = string
}

variable "network_sn_public_id" {
  type        = string
}

variable "compute_ami_id" {
  type        = string
  default     = "ami-0e38fa17744b2f6a5"
}

variable "compute_instance_type" {
  type        = string
  default     = "t2.nano"
}

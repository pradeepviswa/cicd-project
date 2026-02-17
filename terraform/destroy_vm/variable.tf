variable "vm_details" {
  description = "List of VM details to destroy"
  type = list(object({
    ami   = string
    vm_id = string
  }))
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t3.micro"
}

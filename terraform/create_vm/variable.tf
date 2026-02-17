variable "instance_ids_to_destroy" {
  description = "List of AWS instance IDs to destroy"
  type        = list(string)
  default     = []
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "vm_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}
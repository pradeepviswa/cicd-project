variable "instance_ids_to_destroy" {
  description = "List of AWS instance IDs to destroy"
  type        = list(string)
  default     = []
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "ami_id" {
  description = "Instance type"
  type        = string
}
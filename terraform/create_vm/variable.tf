variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t3.micro"
}

variable "vm_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}

variable "key_name" {
  description  = "key name already present in aws"
  type         = string
  default      = "key1"
}

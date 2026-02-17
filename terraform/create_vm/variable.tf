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
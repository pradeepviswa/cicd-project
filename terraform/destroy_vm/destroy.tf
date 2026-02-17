resource "aws_instance" "vm" {
  count = length(var.vm_details)

  # take AMI from each object
  ami           = var.vm_details[count.index].ami
  instance_type = var.instance_type

  lifecycle {
    ignore_changes = all
  }
}

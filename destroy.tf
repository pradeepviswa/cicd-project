resource "aws_instance" "vm" {
  count = length(var.instance_ids_to_destroy)

  ami           = var.ami_id
  instance_type = var.instance_type

  lifecycle {
    ignore_changes = all
  }
}
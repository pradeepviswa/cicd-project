resource "aws_instance" "vm" {
  count = length(var.instance_ids_to_destroy)
}

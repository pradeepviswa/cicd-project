
# ----------------------------
# Security Group
# ----------------------------
resource "aws_security_group" "web_sg" {
  name        = "web-security-group"
  description = "Allow dynamic ports"

  # Create rules dynamically for each port
  dynamic "ingress" {
    for_each = var.allowed_ports

    content {
      description = "Allow port ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # Allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
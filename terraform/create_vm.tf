
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


# ----------------------------
# EC2 Instance
# ----------------------------


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "new_vm" {
  count         = var.vm_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "HelloWorld-${count.index}"
  }
}

output "vm_details" {
  value = [
    for vm in aws_instance.new_vm : {
      vm_id     = vm.id
      ami       = vm.ami
      public_ip = vm.public_ip
    }
  ]
}

output "public_ips" {
  description = "Public IPs of created EC2 instances"
  value       = aws_instance.new_vm[*].public_ip
}
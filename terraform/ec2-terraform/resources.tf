resource "aws_key_pair" "ssh" {
  public_key = file(var.sshPublicKeyPath)
}


resource "aws_instance" "vm" {
  instance_type = "t2.medium"
  ami = "ami-0a5f04cdf7758e9f0"

  count = 1

  key_name = aws_key_pair.ssh.key_name

  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.allow-ssh-inbound.id,
    aws_security_group.allow-http-inbound.id,
    aws_security_group.allow-all-outbound.id
  ]
  root_block_device {
    volume_size = 30 
    volume_type = "gp2" 
  }
}


resource "aws_security_group" "allow-ssh-inbound" {
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow-http-inbound" {
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow-all-outbound" {
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "public_ip" {
  instance = aws_instance.vm[0].id
}

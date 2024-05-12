resource "aws_key_pair" "terra_key" {
  key_name   = "terra-key"
  public_key = file("terra-key.pub")
}

resource "aws_instance" "fifth_terraform_instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.terra_key.key_name
  vpc_security_group_ids = ["sg-06447045987c137f2"]
  tags = {
    Name    = "Fifth-Instance"
    Project = "Terraform-Exercise3"
  }

  provisioner "file" {
    source      = "web2b.sh"
    destination = "/tmp/web2b.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web2b.sh",
      "sudo /tmp/web2b.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("terra-key")
    host        = self.public_ip
  }

}


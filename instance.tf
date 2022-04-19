resource "aws_key_pair" "key-pair" {
  key_name   = "belikebro"
  public_key = file("belikebro.pub")
}

resource "aws_instance" "BLB-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.key-pair.key_name
  vpc_security_group_ids = [aws_security_group.BLB-SG.id]
  subnet_id              = aws_subnet.belikebro-pub-1.id
  tags = {
    Name    = "BLB-instance"
    Project = "FP"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "sudo chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("belikebro")
    host        = self.public_ip
  }
}

resource "aws_ebs_volume" "BLB_volume" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "BLB-Extra-Volume"
  }
}

resource "aws_volume_attachment" "attach_BLB_volume" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.BLB_volume.id
  instance_id = aws_instance.BLB-instance.id
}

output "public_ip" {
  value = aws_instance.BLB-instance.public_ip
}

output "private_ip" {
  value = aws_instance.BLB-instance.private_ip
}
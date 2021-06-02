resource "aws_instance" "lab" {

	ami = "ami-05f7491af5eef733a"
	instance_type = "t2.micro"
       	
	key_name = "lab-key"
	

	vpc_security_group_ids =  [aws_security_group.instance.id]

	provisioner "remote-exec" {
		inline = [
			"sudo apt update",
			"curl https://get.docker.com | sh",
			"sudo usermod -aG docker ubuntu"
		]
	}

	connection {
		type = "ssh"
		agent = true
		host = aws_instance.lab.public_ip
		user = "ubuntu"
		private_key = "${file("~/Downloads/lab-key.pem")}"
	}
}



resource "aws_security_group" "instance" {
	name = "terraform-policy"

	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	
	ingress {
		from_port = 22 
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
}



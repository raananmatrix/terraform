resource "aws_instance" "web-server" {
  count           = var.instance_count
  ami             = data.aws_ami.rhel.id
  instance_type   = var.instance_type
  security_groups = [ aws_security_group.allow_http_and_ssh.tags_all.Name ]
  key_name        = aws_key_pair.server.key_name
  tags            = {
    Name = "web-server-${count.index}"
  }
  user_data = <<EOF
#!/bin/bash
yum install httpd -y
echo "Hello!" > /var/www/html/index.html
echo $(hostname) >> /var/www/html/index.html
systemctl enable --now httpd.service
EOF
}


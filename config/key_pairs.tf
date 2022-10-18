resource "aws_key_pair" "server" {
  key_name   = "public-key"
  public_key = var.server_public_key
}


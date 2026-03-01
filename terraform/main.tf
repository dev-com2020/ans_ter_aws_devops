resource "aws_key_pair" "main" {
  key_name   = "kluczterra"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  key_name      = aws_key_pair.main.key_name  
  tags = {
    Name        = "web-${count.index}"
    Environment = "production"
    Role        = "webserver"
    ManagedBy   = "terraform"
  }
}
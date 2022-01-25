provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "ansi-vpc" {
  cidr_block = "11.0.0.0/16"
  tags = {
    Name = "ansible"
  }
}

resource "aws_subnet" "ansi-subnet" {
  vpc_id                  = aws_vpc.ansi-vpc.id
  cidr_block              = "11.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "ansible"
  }
}

resource "aws_internet_gateway" "ansi-igw" {
  vpc_id = aws_vpc.ansi-vpc.id

  tags = {
    Name = "ansible"
  }
}

resource "aws_route_table" "ansi-rt" {
  vpc_id = aws_vpc.ansi-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ansi-igw.id
  }

  tags = {
    Name = "ansible"
  }
}

resource "aws_route_table_association" "ansi-rta" {
  subnet_id      = aws_subnet.ansi-subnet.id
  route_table_id = aws_route_table.ansi-rt.id
}

resource "aws_security_group" "ansi-sg" {
  name        = "ansible"
  description = "Allow all inbound and outbound traffic"
  vpc_id      = aws_vpc.ansi-vpc.id

  ingress {
    description      = "security group for ansible instances"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ansible"
  }
}

resource "aws_instance" "ansicontroller" {
  ami                    = "ami-0851b76e8b1bce90b"
  instance_type          = "t2.micro"
  key_name               = "awspem"
  vpc_security_group_ids = [aws_security_group.ansi-sg.id]
  subnet_id              = aws_subnet.ansi-subnet.id
  tags = {
    Name = "ansicontroller"
  }
}

resource "aws_instance" "ansiworker1" {
  ami                    = "ami-0851b76e8b1bce90b"
  instance_type          = "t2.micro"
  key_name               = "awspem"
  vpc_security_group_ids = [aws_security_group.ansi-sg.id]
  subnet_id              = aws_subnet.ansi-subnet.id
  tags = {
    Name = "ansiworker1"
  }
}

resource "aws_instance" "ansiworker2" {
  ami                    = "ami-0851b76e8b1bce90b"
  instance_type          = "t2.micro"
  key_name               = "awspem"
  vpc_security_group_ids = [aws_security_group.ansi-sg.id]
  subnet_id              = aws_subnet.ansi-subnet.id
  tags = {
    Name = "ansiworker2"
  }
}


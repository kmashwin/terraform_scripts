provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "kube-vpc" {
  cidr_block = "11.0.0.0/16"
  tags = {
    Name = "kubernetes"
  }
}

resource "aws_subnet" "kube-subnet" {
  vpc_id                  = aws_vpc.kube-vpc.id
  cidr_block              = "11.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "kubernetes"
  }
}

resource "aws_internet_gateway" "kube-igw" {
  vpc_id = aws_vpc.kube-vpc.id

  tags = {
    Name = "kubernetes"
  }
}

resource "aws_route_table" "kube-rt" {
  vpc_id = aws_vpc.kube-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kube-igw.id
  }

  tags = {
    Name = "kubernetes"
  }
}

resource "aws_route_table_association" "kube-rta" {
  subnet_id      = aws_subnet.kube-subnet.id
  route_table_id = aws_route_table.kube-rt.id
}

resource "aws_security_group" "kube-sg" {
  name        = "Kubernetes"
  description = "Allow all inbound and outbound traffic"
  vpc_id      = aws_vpc.kube-vpc.id

  ingress {
    description      = "security group for kubernetes instances"
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
    Name = "kubernetes"
  }
}

resource "aws_instance" "kubemaster" {
  ami                    = "ami-0851b76e8b1bce90b"
  instance_type          = "t2.medium"
  key_name               = "awspem"
  vpc_security_group_ids = [aws_security_group.kube-sg.id]
  subnet_id              = aws_subnet.kube-subnet.id
  tags = {
    Name = "kubemaster"
  }
}

resource "aws_instance" "kubeworker1" {
  ami                    = "ami-0851b76e8b1bce90b"
  instance_type          = "t2.micro"
  key_name               = "awspem"
  vpc_security_group_ids = [aws_security_group.kube-sg.id]
  subnet_id              = aws_subnet.kube-subnet.id
  tags = {
    Name = "kubeworker1"
  }
}

resource "aws_instance" "kubeworker2" {
  ami                    = "ami-0851b76e8b1bce90b"
  instance_type          = "t2.micro"
  key_name               = "awspem"
  vpc_security_group_ids = [aws_security_group.kube-sg.id]
  subnet_id              = aws_subnet.kube-subnet.id
  tags = {
    Name = "kubeworker2"
  }
}


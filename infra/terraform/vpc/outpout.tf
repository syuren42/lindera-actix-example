output "subnet" {
  value = {
    public_a  = aws_subnet.public_a.id
    public_c  = aws_subnet.public_c.id
  }
}

output "vpc" {
  value = {
    id = aws_vpc.research-vpc.id
  }
}

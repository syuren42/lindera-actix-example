resource "aws_security_group" "lindera-api" {
  name        = "lindera-api-sg"
  description = "Allow HTTP(S) access vpc internal"
  vpc_id      =  aws_vpc.research-vpc.id
}

resource "aws_security_group_rule" "lindera-api_internal_inbound_http" {
  security_group_id = "${aws_security_group.lindera-api.id}"
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/24"]
}

resource "aws_security_group_rule" "lindera-api_outbound_all_allow" {
  security_group_id = aws_security_group.lindera-api.id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "all"
}


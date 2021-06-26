resource "aws_ecs_cluster" "cluster" {
  name = "lindera-api-cluster"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }

}
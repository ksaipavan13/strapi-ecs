resource "aws_ecs_cluster" "HelloECS" {
  name = "CSR-Strapi-app"
  tags = {
    name = "hello-world-strapi-app"
  }
}


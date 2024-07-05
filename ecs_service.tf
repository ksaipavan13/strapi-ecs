resource "aws_ecs_service" "nodeapp" {
  name                               = "strapi-app"
  launch_type                        = "FARGATE"
  platform_version                   = "LATEST"
  cluster                            = aws_ecs_cluster.HelloECS.id
  task_definition                    = aws_ecs_task_definition.HelloTD.arn
  scheduling_strategy                = "REPLICA"
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  desired_count                      = 1

  depends_on = [aws_iam_role.ecs_task_execution_role]

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.HelloSG.id]
    subnets          = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  }
}



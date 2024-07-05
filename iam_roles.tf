resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "ecsTaskExecutionRoleStrapi-${random_string.suffix.result}"
  assume_role_policy = file("${path.module}/iam-role.json")

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  ]
}

resource "aws_iam_role_policy" "ecs_task_execution_policy" {
  name   = "ECS-execution-role-policy"
  role   = aws_iam_role.ecs_task_execution_role.id
  policy = file("${path.module}/iam-policy.json")
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}


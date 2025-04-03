resource "aws_ecs_cluster" "main" {
  name = "web-app-cluster"
}

resource "aws_ecs_task_definition" "web" {
  family                   = "web-app"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  
  container_definitions = jsonencode([
    {
      name      = "web-container"
      image     = "your-docker-image-url"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

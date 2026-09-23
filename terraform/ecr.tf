resource "aws_ecr_repository" "app" {
  name                 = "capstone-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name    = "capstone-app"
    Purpose = "Docker container registry"
  }
}
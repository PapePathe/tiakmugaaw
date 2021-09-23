terraform {
  backend "remote" {
    organization = "caakmugaaw"
    workspaces {
      name = "tiakmugaaw"
    }
  }
}

resource "aws_apprunner_connection" "caakmugaaw" {
  connection_name = "caakmugaaw"
  provider_type   = "GITHUB"

  tags = {
    Name = "caakmugaaw-apprunner-connection"
  }
}

resource "aws_apprunner_service" "caakmugaaw" {
  service_name = "caakmugaaw"

  source_configuration {
    authentication_configuration {
      connection_arn = aws_apprunner_connection.caakmugaaw.arn
    }

    image_repository {
      image_configuration {
        port = var.port
      }
      image_identifier      = "public.ecr.aws/caakmugaaw/caakmugaaw:latest"
      image_repository_type = "ECR_PUBLIC"
    }
    auto_deployments_enabled = false
  }

  tags = {
    Name = "caakmugaaw-apprunner-service"
  }
}

resource "aws_apprunner_custom_domain_association" "caakmugaaw" {
  domain_name = "cmg.sn"
  service_arn = aws_apprunner_service.caakmugaaw.arn
}

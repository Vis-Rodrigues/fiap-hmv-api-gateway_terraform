resource "aws_api_gateway_rest_api" "fiap-hmv" {

  name        = var.nome
  description = var.descricao

  endpoint_configuration {
    types = [var.tipo_api_gateway]
  }
}

resource "aws_api_gateway_integration" "fiap-hmv" {
  http_method = aws_api_gateway_method.fiap-hmv.http_method
  resource_id = aws_api_gateway_resource.fiap-hmv.id
  rest_api_id = aws_api_gateway_rest_api.fiap-hmv.id
  type        = "MOCK"
}

resource "aws_api_gateway_deployment" "fiap-hmv" {
  rest_api_id = aws_api_gateway_rest_api.fiap-hmv.id

  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.fiap-hmv.id,
      aws_api_gateway_method.fiap-hmv.id,
      aws_api_gateway_integration.fiap-hmv.id,
    ]))

  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "stage" {
  deployment_id  = aws_api_gateway_deployment.fiap-hmv.id
  rest_api_id    = aws_api_gateway_rest_api.fiap-hmv.id
  stage_name     = var.stage_name

  variables = {
      teste = var.projeto
  }

  tags = {
      Projeto = var.projeto
  }
}

resource "aws_api_gateway_resource" "fiap-hmv" {
  parent_id   = aws_api_gateway_rest_api.fiap-hmv.root_resource_id
  path_part   = "fiap-hmv"
  rest_api_id = aws_api_gateway_rest_api.fiap-hmv.id
}

resource "aws_api_gateway_method" "fiap-hmv" {
  authorization = "NONE"
  http_method   = "GET"
  resource_id   = aws_api_gateway_resource.fiap-hmv.id
  rest_api_id   = aws_api_gateway_rest_api.fiap-hmv.id
}
# Control Variables
variable "create_vpc_endpoint" {
  description = "Controls if VPC endpoint for this API Gateway needs to be created or using an existing one"
  type        = bool
  default     = false
}

# API Gateway config
variable "tipo_protocolo" {
  description = "Tipo de protocolo do API Gateway"
  type        = string
  default     = "REST"
}

variable "nome" {
  description = "Nome do API Gateway"
  type        = string
  default     = "HMV"
}

variable "descricao" {
  description = "Descrição do API Gateway"
  type        = string
  default     = "API Gateway para expor as rotas dos serviços do HMV"
}

variable "tipo_api_gateway"{
  description = "Tipo de API Gateway"
  type        = string
  default     = "REGIONAL"
}

variable "stage_name"{
  description = "Nome do stage"
  type        = string
  default     = "prd"
}

variable "binary_media_types"{
  description = "Binary types accepts in this API"
  type        = list(string)
  default      = null
}

variable "minimum_compression_size"{
  description = "Minimum response size to compress for the REST API."
  default     = null
  type        = number
}

variable "api_key_source"{
  description = "The source of the API key for requests. Valid values are HEADER (default) and AUTHORIZER."
  default     =  null
  type        = string
}

# Tags Config
variable "projeto" {
  default = "FIAP-HMV"
}

/*

# ==================================================================
# Proposito: declaramos todas las variables que vamos a usar
# Autor: DH
# Fecha: 30.07.21
# Version: 1.0
# ==================================================================

#Varialbes provider
variable "access_key" {
    type = string
    default = "AKIAWB4P7DBDRNZBIMNQ"
    }
variable "secret_key" {
    type = string
    default = "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"
    }
variable "region" {
    type = string
    default = "us-east-1"
    }



variable "aws_region_id" {
    description = "la region"
    type = string
    default = "us-east-1"
}
variable "main_vpc_cidr" {
    description = "Nuestro Security Group"
    type = string
    default = "10.0.0.0/24"
}
variable "public_subnets" {
    description = "subnet con acceso a internet"
    type = string
    default = "10.0.0.128/26"
}
variable "private_subnets" {
    description = "subnet sin acceso a internet"
    type = string
    default = "10.0.0.192/26"
}
# ==================================================================

*/

variable "access_key" {
    type = string
    default = "AKIAWB4P7DBD5HMJPLP5"
    }
variable "secret_key" {
    type = string
    default = "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"
    }
variable "region" {
    type = string
    default = "us-east-1"
    }

variable "aws_region_id" {
    description = "la region"
    type = string
    default = "us-east-1"

    }

variable "main_vpc_cidr" {

    description = "Nuestro Security Group"
    type = string
    default = "10.0.0.0/24"

}

variable "public_subnets" {

    description = "subnet con acceso a internet"
    type = string
    default = "10.0.0.128/26"
}

variable "private_subnets" {

description = "subnet sin acceso a internet"
type = string
default = "10.0.0.192/26"

}
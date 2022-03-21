/*Varialbes provider*/
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

/*Variables para la pvc*/

variable "namespace" {
  type        = string
  default     = "hakuna"
}



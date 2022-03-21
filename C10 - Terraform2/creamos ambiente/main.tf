# Propósito: crear infraestructura AWS
# Autor: DH
# Fecha: 30.07.21
# Versión: 1.0
# ==================================================================
# ==================================================================

# Creamos nuestro VPC
resource "aws_vpc" "Main" { # usamos el bloque "resource", el "provider element" y una "etiqueta"
    cidr_block = var.main_vpc_cidr # le pasamos por variable el CIDR block
    que quiero que use
    instance_tenancy = "default"
    tags = {
        Name = "My_VPC_salo"
    }
}
# ==================================================================
# Creamos un Internet Gateway "Y" lo asociamos al VPC que se acaba de crear
resource "aws_internet_gateway" "IGW" { # Internet Gateway
    vpc_id = aws_vpc.Main.id # vamos a conocer el vpc_id solo cuando el VPC se haya creado
    tags = {
        Name = "IGW_salo"
    }
}
# ==================================================================
# Creamos la subnet pública
resource "aws_subnet" "public_subnets" { # creamos las subnets públicas vpc_id = aws_vpc.Main.id
    cidr_block = var.public_subnets # CIDR block para mis public subnets
    tags = {
        Name = "Public Subnet salo"
    }
}
# ==================================================================
# Creamos la subnet privada # creamos nuestras private subnets
resource "aws_subnet" "private_subnets" {
    vpc_id = aws_vpc.Main.id
    cidr_block = var.private_subnets # CIDR block para mis subnets privadas
    tags = {
        Name = "Private Subnet salo"
    }
}
# ==================================================================
# Tabla de ruteo para la subnet pública
resource "aws_route_table" "Public_RT" { # Creamos nuestro Route Table para la subnet pública
    vpc_id = aws_vpc.Main.id
    route {
        cidr_block = "0.0.0.0/0" # Declaramos el tráfico desde la subnet
        pública llega a Internet desde el Internet Gateway
        gateway_id = aws_internet_gateway.IGW.id
    }
    tags = {
        Name = "Tabla de Ruteo Pública salo"
    }
}
# ==================================================================
# Tabla de ruteo para la subnet privada
resource "aws_route_table" "Private_RT" { # Creating RT for Private Subnet
    vpc_id = aws_vpc.Main.id
    route {
        cidr_block = "0.0.0.0/0" # Tráfico proveniente desde la subnet
        privadas llegando a Internet vía NAT Gateway
        nat_gateway_id = aws_nat_gateway.NAT_GW.id
    }
    tags = {
        Name = "Tabla de Ruteo Privada salo"
    }
}
# ==================================================================
# Asociación de tabla de ruteo con la subnet pública
resource "aws_route_table_association" "Public_RT_Association" {
    subnet_id = aws_subnet.public_subnets.id
    route_table_id = aws_route_table.Public_RT.id
}
# ==================================================================
# Asociación de tabla de ruteo con la subnet privada
resource "aws_route_table_association" "Private_RT_Association" {
    subnet_id = aws_subnet.private_subnets.id
    route_table_id = aws_route_table.Private_RT.id
}
resource "aws_eip" "NAT_EIP" {
    vpc = true
    tags = {
    Name = "NAT con elastic IP salo"
    }
}
# ==================================================================
# Creación del NAT Gateway usando subnet_id y allocation_id
resource "aws_nat_gateway" "NAT_GW" {
    allocation_id = aws_eip.NAT_EIP.id
    subnet_id = aws_subnet.public_subnets.id
    subnet_id = aws_subnet.public_subnets.id
    tags = {
        Name = "NAT Gateway alocada a la subnet pública salo"
    }
}

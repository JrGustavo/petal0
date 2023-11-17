#!/bin/bash

# Agregar todos los archivos al repositorio de Git
git add .

# Hacer un commit con el mensaje "update backend"
git commit -m "update backend"

# Enviar los cambios al repositorio remoto
git push

# Establecer el sistema operativo y la arquitectura para la compilación
export GOOS=linux
export GOARCH=amd64

# Compilar el código
go build main.go

# Crear un archivo .zip con el ejecutable compilado
zip -r main.zip .  -i main

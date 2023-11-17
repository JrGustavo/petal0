#!/bin/bash

# Agregar todos los archivos al repositorio de Git
git add .

# Hacer un commit con el mensaje "update backend"
git commit -m "Update Part#2"

# Enviar los cambios al repositorio remoto
git push

# Establecer el sistema operativo y la arquitectura para la compilación
export GOOS=linux
export GOARCH=amd64

# Compilar el código
go build main.go

# Agregar el archivo ejecutable compilado al archivo zip
zip -r main.zip main
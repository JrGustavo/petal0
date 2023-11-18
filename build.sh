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
go build -o main

# Crear el archivo zip y agregar el ejecutable compilado
zip main.zip main
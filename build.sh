$ ./build.sh

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

# Verificar que el archivo main existe
if [ ! -f main.zip ]; then
  echo "El archivo main no existe."
  exit 1
fi

# Agregar el archivo ejecutable compilado al archivo zip
zip -r main.zip . -i main


# Comprobar el contenido del archivo zip
unzip main.zip




#!/bin/sh

# FUNCTIONS #
menu () {
  echo "Bienvenido al menu!"
  mostrar_opciones
  read -n 1 -p "Elija una opción:" opcion
  case $opcion in
    1) fibonacci break;;
    2) numero_invertido break;;
    3) palindromo break;;
    4) cant_lineas break;;
    5) numeros_ordenados break;;
    6) archivos_por_tipo break;;
    7) salir break;;
    *) invalido break;;
  esac
}

mostrar_opciones() {
  echo "1. Serie de Fibonacci"
  echo "2. Número invertido"
  echo "3. Palindromo"
  echo "4. Cantidad de lineas de archivo"
  echo "5. Números ordenados"
  echo "6. Archivos por tipo de directorio"
  echo "7. Salir"
}

fibonacci() {
  echo "Bienvenido a la serie Fibonacci"
}

numero_invertido() {
  echo "Bienvenido a los números invertidos"
}

cant_lineas() {
  echo "Bienvenido a la cantidad de lineas de un archivo"
}

numeros_ordenados() {
  echo "Bienvenido a los numeros ordenados"
}

archivos_por_tipo() {
  echo "Bienvenido a los archivos por tipo de un directorio"
}

salir() {
  echo "Gracias por haber usado el menu!"
  echo "Presioná cualquier tecla para cerrar la consola"
  read -n 1
  exit
}

invalido() {
  echo "Su selección es incorrecta!"
  echo "Presioná cualquier tecla para volver a intentarlo"
  read -n 1
  clear
  menu
}

# MAIN #
menu
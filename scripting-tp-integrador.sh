#!/bin/sh

# FUNCTIONS #
menu () {
  echo "Bienvenido al menu!"
  mostrar_opciones
  read -n 1 -p "Elija una opción:" opcion
  clear
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
  a=0
  b=1
  suma=0
  cantidad=$(pedir_entero)
  for i in `seq 1 $cantidad`
  do
    echo "$a"
    suma=$((a+b))
    a=$b
    b=$suma
  done
  volver_a_menu
}

numero_invertido() {
  echo "Bienvenido a los números invertidos"
  numero=$(pedir_entero)
  digito=0
  rev=""
  while [ $numero -gt 0 ]
  do
    digito=$(( $numero % 10 ))
    numero=$(( $numero / 10 ))
    rev=$( echo ${rev}${digito} )
  done
  echo "$rev"
  volver_a_menu
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

volver_a_menu() {
  read -n 1 -p "Presione cualquier tecla para volver al menu principal"
  clear
  menu
}

pedir_entero() {
  read -p "Ingrese un numero entero mayor a 0: " cantidad
  while ! [[ "$cantidad" =~ ^[1-9]+$ ]]
    do
      read -p "Por favor, ingrese un numero que sea entero y mayor a 0: " cantidad
  done
  echo "$cantidad"
}

salir() {
  echo ""
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
#!/bin/sh

# MAIN FUNCTIONS #
menu () {
  clear
  echo "Bienvenido al menu!"
  mostrar_opciones
  read -p "Elija una opción:" opcion
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
  obtener_inverso $numero
  volver_a_menu
}

palindromo() {
  echo "Bienvenido a los caracteres palindromos"
  read -p "Ingrese una cadena de caracteres: " cadena
  inverso=$(obtener_inverso $cadena)
  if [ $cadena -eq $inverso ];
  then
    echo "Es palindromo"
  else
    echo "No es palindromo"
  fi
  volver_a_menu
}

cant_lineas() {
  echo "Bienvenido a la cantidad de lineas de un archivo"
  read -p "Ingrese ruta al archivo: " archivo
  echo $(wc -l $archivo)
  volver_a_menu
}

numeros_ordenados() {
  echo "Bienvenido a los numeros ordenados"
  numeros=""
  for i in `seq 1 5`
  do
    numeros="${numeros}$(pedir_entero) "
  done
  echo $numeros | tr " " "\n" | sort -V | tr "\n" " "
  echo ""
  volver_a_menu
}

archivos_por_tipo() {
  echo "Bienvenido a los archivos por tipo de un directorio"
  read -p "Ingrese ruta al directorio: " directorio
  while [ ! -d $directorio ]
  do
    read -p "Ingrese ruta al directorio: " directorio
  done
  archivos="$(find $directorio -maxdepth 1 -type f | sed -e 's/.*\(\.[a-zA-Z0-9_-]*\)$/\1/' | sort | uniq -c)"
  directorios="$(find $directorio -mindepth 1 -maxdepth 1 -type d | wc -l)"
  echo "ARCHIVOS"
  echo $archivos
  echo "DIRECTORIOS"
  echo $directorios
  echo ""
  volver_a_menu
}

salir() {
  echo ""
  echo "Gracias $(whoami) por haber usado el menu!"
  echo "Presione enter para cerrar el programa"
  read dummy
  exit
}

invalido() {
  echo "Su selección es incorrecta!"
  echo "Presione enter para volver a intentarlo"
  read dummy
  clear
  menu
}

# HELPERS #
volver_a_menu() {
  echo "Presione enter para volver al menu"
  read dummy
  clear
  menu
}

pedir_entero() {
  read -p "Ingrese un numero entero mayor a 0: " cantidad
  while ! echo "$cantidad" | egrep -q '^\-?[1-9]+$';
  do
    read -p "Por favor, ingrese un numero que sea entero y mayor a 0: " cantidad
  done
  echo "$cantidad"
}

obtener_inverso() {
  frase=$1
  caracter=0
  rev=""
  while [ $frase -gt 0 ]
  do
    caracter=$(( $frase % 10 ))
    frase=$(( $frase / 10 ))
    rev=$( echo ${rev}${caracter} )
  done
  echo "$rev"
}

# MAIN #
menu
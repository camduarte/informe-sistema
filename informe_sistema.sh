#!/bin/bash

################################
# Crea un informe del sistema. #
################################

echo "Iniciando informe del sistema."

# Función: verificar_error
#
# Descripción:
#   Esta función verifica el código de salida del comando ejecutado previamente.
#   Si el código de salida no es cero, imprime un mensaje de error y termina
#   la ejecución del script.
#
# Uso:
#   verificar_error <comando>
#
# Ejemplo:
#   $ comando_que_podria_fallar
#   $ verificar_error "comando_que_podria_fallar"
#
verificar_error() {
  if [ $? -ne 0 ]; then
    echo "Error: Hubo un problema durante la ejecución de '$1'."
    exit 1
  fi
}

# Función: obtener_datos
#
# Descripción:
#   Obtiene datos del sistema.
#
# Uso:
#   obtener_datos
#
# Ejemplo:
#   obtener_datos
#
obtener_datos() {
  fecha=$(date "+%d-%m-%Y %H:%M:%S %Z")
  verificar_error "date"
  usuario=$(whoami)
  verificar_error "whoami"
  hostname=$(hostname)
  verificar_error "hostname"
  sistema_operativo=$(uname -o)
  verificar_error "uname -o"
  kernel=$(uname -r)
  verificar_error "uname -r"
  tipo_procesador=$(uname -p)
  verificar_error "uname -p"
  cpu=$(grep "model name" /proc/cpuinfo | head -n 1)
  verificar_error "grep"
  memoria_ram=$(free -m | awk '/Mem:/ {print $2}')
  verificar_error "free -m"
  tamano_hd=$(df -h | awk '$6=="/" {print $2}')
  verificar_error "df -h"
}

# Función: imprimir_informe 
#
# Descripción:
#   Imprime el informe con los datos del sistema.
#
# Uso:
#   imprimir_informe
#
# Ejemplo:
#   imprimir_informe
#
imprimir_informe() {
  echo
  echo "========== Informe del Sistema =========="
  echo "Fecha: ${fecha}"
  echo "Usuario: ${usuario}"
  echo "Hostname: ${hostname}"
  echo "S.O.: ${sistema_operativo}"
  echo "Kernel: ${kernel}"
  echo "Tipo de procesador: ${tipo_procesador}"
  echo "cpu: ${cpu}"
  echo "Memoria RAM: ${memoria_ram} MB"
  echo "Tamaño disco rígido: ${tamano_hd}"
  echo "========================================"
  echo
}

obtener_datos
imprimir_informe

echo "Este script está sujeto a los términos de copyleft @ 2023 Christian Ariel Modesto Duarte"
exit 0

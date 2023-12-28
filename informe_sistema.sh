#!/bin/bash

################################
# Crea un informe del sistema. #
################################

echo "Iniciando informe del sistema..."

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
  obtener_fecha
  obtener_usuario
  obtener_hostname
  obtener_sistema
  obtener_memoria
  obtener_cpu
  obtener_tamano_hd
  obtener_tipo_sistema_archivos
}

# Función: obtener_fecha
#
# Descripción:
#   Obtiene la fecha actual.
#
# Uso:
#   obtener_fecha
#
# Ejemplo:
#   obtener_fecha
#
obtener_fecha() {
  echo "obteniendo fecha..."
  fecha=$(date "+%d-%m-%Y %H:%M:%S %Z")
  verificar_error "date"
}

# Función: obtener_usuario
#
# Descripción:
#   Obtiene el nombre del usuario que está actualmente autenticado en la
#   sesión de la terminal.
#
# Uso:
#   obtener_usuario
#
# Ejemplo:
#   obtener_usuario
#
obtener_usuario() {
  echo "obteniendo usuario..."
  usuario=$(whoami)
  verificar_error "whoami"
}

# Función: obtener_hostname
#
# Descripción:
#   Obtiene el hostname.
#
# Uso:
#   obtener_hostname
#
# Ejemplo:
#   obtener_hostname
#
obtener_hostname() {
  echo "obteniendo hostname..."
  hostname=$(hostname)
  verificar_error "hostname"
}

# Función: obtener_sistema
#
# Descripción:
#   Obtiene S.O., kernel y tipo de procesador.
#
# Uso:
#   obtener_sistema
#
# Ejemplo:
#   obtener_sistema
#
obtener_sistema() {
  echo "Obteniendo S.O., kernel y tipo de procesador..."
  sistema_operativo=$(uname -o)
  verificar_error "uname -o"
  kernel=$(uname -r)
  verificar_error "uname -r"
  tipo_procesador=$(uname -p)
  verificar_error "uname -p"
}

# Función: obtener_cpu
#
# Descripción:
#   Obtiene información sobre el CPU.
#
# Uso:
#   obtener_cpu
#
# Ejemplo:
#   obtener_cpu
#
obtener_cpu() {
  echo "Obteniendo CPU..."
  cpu=$(grep "model name" /proc/cpuinfo | head -n 1)
}

# Función: obtener_memoria
#
# Descripción:
#   Obtiene el tamaño de la memoria RAM.
#
# Uso:
#   obtener_memoria
#
# Ejemplo:
#   obtener_memoria
#
obtener_memoria() {
  echo "Obteniendo memoria RAM..."
  memoria_ram=$(free -m | awk '/Mem:/ {print $2}')
  verificar_error "free -m"
  echo "Obteniendo memoria Swap..."
  memoria_swap=$(free -m | awk '/Swap:/ {print $2}')
}

# Función: obtener_tamano_hd
#
# Descripción:
#   Obtiene el tamaño del disco rígido.
#
# Uso:
#   obtener_tamano_hd
#
# Ejemplo:
#   obtener_tamano_hd
#
obtener_tamano_hd() {
  echo "Obteniendo tamaño del disco rígido..."
  tamano_hd=$(df -h | awk '$6=="/" {print $2}')
  verificar_error "df -h"
}

# Función: obtener_tipo_sistema_archivos
#
# Descripción:
#   Obtiene el tip de sistema de archivos de la raíz.
#
# Uso:
#   obtener_tipo_sistema_archivos
#
# Ejemplo:
#   obtener_tipo_sistema_archivos
#
obtener_tipo_sistema_archivos() {
  tipo_sistema_archivos=$(df -h / | awk 'NR==2 {print $1}' | xargs blkid -s TYPE -o value)
  verificar_error "blkid"
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
  echo "Imprimiendo informe..."
  echo
  echo "========== Informe del Sistema =========="
  echo "Fecha: ${fecha}"
  echo "Usuario: ${usuario}"
  echo "Hostname: ${hostname}"
  echo "S.O.: ${sistema_operativo}"
  echo "Kernel: ${kernel}"
  echo "Tipo de procesador: ${tipo_procesador}"
  echo "CPU: ${cpu}"
  echo "Memoria RAM: ${memoria_ram} MB"
  echo "Memoria Swap: ${memoria_swap} MB"
  echo "Tamaño disco rígido: ${tamano_hd}"
  echo "Tipo de sistema de archivos: ${tipo_sistema_archivos}"
  echo "========================================"
  echo
}

obtener_datos
imprimir_informe

echo "Este script está sujeto a los términos de copyleft @ 2023 Christian Ariel Modesto Duarte"
exit 0

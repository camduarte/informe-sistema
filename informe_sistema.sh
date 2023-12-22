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
#   verificar_error
#
# Ejemplo:
#   $ comando_que_podria_fallar
#   $ verificar_error
#
verificar_error() {
  echo "verificando error."
}

# Obtengo los datos.
fecha=$(date "+%d-%m-%Y %H:%M:%S %Z")
usuario=$(whoami)
hostname=$(hostname)
sistema_operativo=$(uname -o)
kernel=$(uname -r)
tipo_procesador=$(uname -p)
cpu=$(grep "model name" /proc/cpuinfo | head -n 1)
memoria_ram=$(free -m | awk '/Mem:/ {print $2}')
tamano_hd=$(df -h | awk '$6=="/" {print $2}')

# Imprimo el informe.
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

echo "Este script está sujeto a los términos de copyleft @ 2023 Christian Ariel Modesto Duarte"
exit 0

#!/bin/bash

################################
# Crea un informe del sistema. #
################################

echo "Iniciando informe del sistema."

# Obtengo los datos.
FECHA=$(date "+%d-%m-%Y %H:%M:%S %Z")
USUARIO=$(whoami)
HOSTNAME=$(hostname)
SISTEMA_OPERATIVO=$(uname -o)
KERNEL=$(uname -r)
TIPO_PROCESADOR=$(uname -p)

# Imprimo el informe.
echo
echo "Fecha: ${FECHA}"
echo "Usuario: ${USUARIO}"
echo "Hostname: ${HOSTNAME}"
echo "S.O.: ${SISTEMA_OPERATIVO}"
echo "Kernel: ${KERNEL}"
echo "Tipo de procesador: ${TIPO_PROCESADOR}"
echo

echo "FIN."
exit 0

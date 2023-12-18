#!/bin/bash

################################
# Crea un informe del sistema. #
################################

echo "Iniciando informe del sistema."

# Obtengo los datos.
FECHA=$(date "+%d-%m-%Y %H:%M:%S %Z")
USUARIO=$(whoami)
HOSTNAME=$(hostname)
KERNEL=$(uname -r)

# Imprimo el informe.
echo
echo "Fecha: ${FECHA}"
echo "Usuario: ${USUARIO}"
echo "Hostname: ${HOSTNAME}"
echo "Kernel: ${KERNEL}"
echo

echo "FIN."
exit 0

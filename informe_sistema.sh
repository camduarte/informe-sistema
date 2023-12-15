#!/bin/bash

################################
# Crea un informe del sistema. #
################################

echo "Iniciando informe del sistema."

# Obtengo los datos.
USUARIO=$(whoami)

# Imprimo el informe.
echo "Usuario: ${USUARIO}"

echo "FIN."
exit 0

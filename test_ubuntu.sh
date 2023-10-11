#!/bin/bash

# Directorio donde buscar archivos .bats
DIRECTORY_TO_SEARCH=$1

# Comprueba si se proporcionó un directorio
if [ -z "$DIRECTORY_TO_SEARCH" ]; then
  echo "Por favor proporciona un directorio."
  exit 1
fi

# Busca y ejecuta cada archivo .bats en el directorio y subdirectorios
find "$DIRECTORY_TO_SEARCH" -name '*.bats' -print0 | while IFS= read -r -d '' file; do
    echo "Ejecutando ${file}"
    echo "test for ${file}" >> Report.txt
    bats-core/bin/bats "$file" >> Report.txt
done

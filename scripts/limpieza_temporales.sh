#!/bin/bash

# Limpieza de archivos temporales
# Proyecto: ADMINISTRADOR-LINUX

RUTA="$HOME/ADMINISTRADOR-LINUX/temporales"

echo "===== LIMPIEZA DE TEMPORALES ====="

if [[ ! -d "$RUTA" ]]; then
    echo "El directorio no existe."
    exit 1
fi

for archivo in "$RUTA"/*; do
    if [[ -f "$archivo" ]]; then
        echo "Eliminando: $(basename "$archivo")"
        rm -- "$archivo"
    fi
done

echo "Limpieza finalizada correctamente."

#!/bin/bash

# Proyecto: ADMINISTRADOR-LINUX
# Script: Monitor del sistema

USUARIO=$(whoami)
EQUIPO=$(hostname)
FECHA=$(date)
SISTEMA=$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f 2)

RUTA="$HOME/ADMINISTRADOR-LINUX/reportes"
ARCHIVO="$RUTA/reporte_sistema.txt"

mostrar_informacion() {
    echo "===== REPORTE DEL SISTEMA ====="
    echo "Usuario: $USUARIO"
    echo "Equipo: $EQUIPO"
    echo "Sistema operativo: $SISTEMA"
    echo "Fecha: $FECHA"
    echo ""
    echo "===== USO DEL DISCO ====="
    df -h /
    echo ""
    echo "===== MEMORIA RAM ====="
    free -h
}

mkdir -p "$RUTA"
mostrar_informacion > "$ARCHIVO"

echo "Reporte generado correctamente."
echo "Archivo: $ARCHIVO"
